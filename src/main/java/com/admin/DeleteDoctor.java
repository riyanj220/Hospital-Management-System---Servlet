package com.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDAO;
import com.db.DBConnect;

@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        DoctorDAO dao = new DoctorDAO(DBConnect.getCon());
            HttpSession session = req.getSession();

            if(dao.deleteDoctor(id))
            {
                session.setAttribute("sucMsg", "Doctor deleted successfully!");
                resp.sendRedirect("admin/doctor.jsp");
            }
            else{
                session.setAttribute("errorMsg", "Oops something went wrong!");
                resp.sendRedirect("admin/doctor.jsp");
            }
    }
    
}
