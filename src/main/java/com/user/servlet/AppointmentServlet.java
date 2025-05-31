package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet {

    interface AppointmentService {
        boolean addAppointment(Appointment appointment);
    }

    interface AdvancedAppointmentService {
        boolean addAppointmentToDB(Appointment appointment);
    }

    static class AppointmentDAOAdapter implements AdvancedAppointmentService {

        private AppointmentDAO dao;

        public AppointmentDAOAdapter(AppointmentDAO dao) {
            this.dao = dao;
        }

        @Override
        public boolean addAppointmentToDB(Appointment appointment) {
            return dao.addAppointment(appointment);
        }
    }

    static class AppointmentServiceAdapter implements AppointmentService {

        private AdvancedAppointmentService advancedService;

        public AppointmentServiceAdapter(String serviceType, AppointmentDAO dao) {
            if ("DB".equalsIgnoreCase(serviceType)) {
                this.advancedService = new AppointmentDAOAdapter(dao);
            }

        }

        @Override
        public boolean addAppointment(Appointment appointment) {
            return advancedService.addAppointmentToDB(appointment);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int userId = Integer.parseInt(req.getParameter("userid"));
        String fullname = req.getParameter("fullname");
        String gender = req.getParameter("gender");
        String age = req.getParameter("age");
        String appoint_date = req.getParameter("appoint_date");
        String email = req.getParameter("email");
        String phno = req.getParameter("phno");
        String diseases = req.getParameter("diseases");
        int doctor_id = Integer.parseInt(req.getParameter("doct"));
        String address = req.getParameter("address");

        Appointment ap = new Appointment(userId, fullname, gender, age, appoint_date, email, phno, diseases, doctor_id, address, "Pending");

        AppointmentDAO dao = new AppointmentDAO(DBConnect.getCon());
        AppointmentService service = new AppointmentServiceAdapter("DB", dao);

        HttpSession session = req.getSession();

        if (service.addAppointment(ap)) {
            session.setAttribute("sucMsg", "Appointment Booked successfully!");
            resp.sendRedirect("user_appointment.jsp");
        } else {
            session.setAttribute("errorMsg", "Oops Something went wrong!");
            resp.sendRedirect("user_appointment.jsp");
        }
    }
}
