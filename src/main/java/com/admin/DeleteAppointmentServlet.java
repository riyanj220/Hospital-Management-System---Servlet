package com.admin;

import com.dao.AppointmentDAO;
import com.db.DBConnect;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteAppointment")
public class DeleteAppointmentServlet extends HttpServlet {

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int appointmentId = Integer.parseInt(request.getParameter("id"));

        AppointmentDAO dao = new AppointmentDAO(DBConnect.getCon());

        boolean isDeleted = dao.deleteAppointment(appointmentId);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (isDeleted) {
            response.getWriter().write("{\"success\": true}");
        } else {
            response.getWriter().write("{\"success\": false}");
        }
    }
}
