package com.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.DoctorDAO;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {

    public static class DoctorBuilder {
        public Doctor prepareDoctor(String fullName, String dob, String qualification,
                                    String spec, String email, String mobno, String password) {

            System.out.println("DoctorBuilder: Building Doctor object step-by-step");

            return new Doctor(fullName, dob, qualification, spec, email, mobno, password);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String fullName = req.getParameter("fullname");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String spec = req.getParameter("spec");
            String email = req.getParameter("email");
            String mobno = req.getParameter("mobno");
            String password = req.getParameter("password");

            DoctorBuilder builder = new DoctorBuilder();
            Doctor d = builder.prepareDoctor(fullName, dob, qualification, spec, email, mobno, password);

            DoctorDAO dao = new DoctorDAO(DBConnect.getCon());
            HttpSession session = req.getSession();

            if (dao.registerDoctor(d)) {
                session.setAttribute("sucMsg", "Doctor added successfully!");
                resp.sendRedirect("admin/doctor.jsp");
            } else {
                session.setAttribute("errorMsg", "Oops something went wrong!");
                resp.sendRedirect("admin/doctor.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
