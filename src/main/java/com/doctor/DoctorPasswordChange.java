package com.doctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDAO;
import com.db.DBConnect;

@WebServlet("/doctChangePassword")
public class DoctorPasswordChange extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        int uid = Integer.parseInt(req.getParameter("uid"));
        String oldPassword = req.getParameter("oldPassword"); 
        String newPassword = req.getParameter("newPassword"); 

        DoctorDAO dao = new DoctorDAO(DBConnect.getCon());

        HttpSession session = req.getSession();

        if(dao.checkOldPassword(uid, oldPassword))
        {
            if(dao.changePassword(uid, newPassword))
            {
                session.setAttribute("sucMsg", "Password changed successfully!");
                resp.sendRedirect("doctor/edit_profile.jsp");
            }
            else{
                session.setAttribute("errorMsg","Something went wrong!");
                resp.sendRedirect("doctor/edit_profile.jsp");
            }
        }
        else{
            session.setAttribute("errorMsg","Incorrect Old Password!");
            resp.sendRedirect("doctor/edit_profile.jsp");
        }
        

    }
}
