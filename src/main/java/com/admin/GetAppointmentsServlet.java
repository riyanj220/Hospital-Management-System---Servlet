package com.admin;

import com.dao.AppointmentDAO;
import com.dao.DoctorDAO;
import com.db.DBConnect;
import com.entity.Appointment;
import com.entity.Doctor;
import com.google.gson.Gson;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/getAppointments")
public class GetAppointmentsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        AppointmentDAO dao = new AppointmentDAO(DBConnect.getCon());
        List<Appointment> appointments = dao.getAllAppointment();

        for (Appointment appointment : appointments) {
            DoctorDAO doctorDao = new DoctorDAO(DBConnect.getCon());
            Doctor doctor = doctorDao.getDoctorById(appointment.getDoctorId());
            if (doctor != null) {
                appointment.setDoctorName(doctor.getFullName());
            } else {
                appointment.setDoctorName("Unknown Doctor");
            }
        }

        // Convert the list of appointments to JSON
        Gson gson = new Gson();
        String appointmentsJson = gson.toJson(appointments);

        // Send the JSON response
        response.getWriter().write(appointmentsJson);
    }
}

