package com.admin;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.entity.User;
import com.google.gson.Gson;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/getUsers")
public class GetUsersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        UserDAO dao = new UserDAO(DBConnect.getCon());
        List<User> users = dao.getAllUsers();

        Gson gson = new Gson();
        String usersJson = gson.toJson(users);

        response.getWriter().write(usersJson);
    }
}
