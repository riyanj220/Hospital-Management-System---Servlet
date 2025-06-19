package com.admin;

import com.dao.UserDAO;
import com.db.DBConnect;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        
        UserDAO dao = new UserDAO(DBConnect.getCon());
        boolean isDeleted = dao.deleteUser(userId);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (isDeleted) {
            response.getWriter().write("{\"success\": true}");
        } else {
            response.getWriter().write("{\"success\": false}");
        }
    }
}