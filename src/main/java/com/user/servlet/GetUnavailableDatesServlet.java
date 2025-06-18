package com.user.servlet;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.google.gson.Gson;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;

@WebServlet("/getUnavailableDates")
public class GetUnavailableDatesServlet extends HttpServlet {

    public GetUnavailableDatesServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));

        try {
            AppointmentDAO appointmentDAO = new AppointmentDAO(DBConnect.getCon());
            List<String> unavailableDates = appointmentDAO.getUnavailableDatesForDoctor(doctorId);

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();

            Gson gson = new Gson();

            String json = gson.toJson(Collections.singletonMap("unavailableDates", unavailableDates));
            out.write(json);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}