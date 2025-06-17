package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.AppointmentDAO;
import com.dao.DoctorDAO;
import com.db.DBConnect;
import com.entity.Appointment;
import com.utils.EmailUtils;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet {

    interface AppointmentService {
        boolean addAppointment(Appointment appointment);
    }

    interface AdvancedAppointmentService {
        boolean addAppointmentToDB(Appointment appointment);
    }

    static class AppointmentDAOAdapter implements AdvancedAppointmentService {

        private final AppointmentDAO dao;

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

        // Fetch doctor's name from the DoctorDAO based on doctor_id
        DoctorDAO doctorDAO = new DoctorDAO(DBConnect.getCon());
        String doctorName = doctorDAO.getDoctorNameById(doctor_id);

        // If the doctor name is not found, set it to "Unknown"
        if (doctorName == null) {
            doctorName = "Unknown";
        }

        Appointment ap = new Appointment(userId, fullname, gender, age, appoint_date, email, phno, diseases, doctor_id, address, "Pending");

        AppointmentDAO dao = new AppointmentDAO(DBConnect.getCon());
        AppointmentService service = new AppointmentServiceAdapter("DB", dao);

        HttpSession session = req.getSession();

        // Adding the appointment to the database
        if (service.addAppointment(ap)) {
            // Send confirmation email with doctor's name
            String subject = "Appointment Confirmation";
            String body = "<html>"
                    + "<body style='font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333;'>"
                    + "<table style='width: 100%; background-color: #ffffff; padding: 20px;'>"
                    + "<tr>"
                    + "<td style='text-align: center; padding: 20px;'>"
                    + "<h2 style='color: #4CAF50;'>Your Appointment is Confirmed!</h2>"
                    + "<p style='font-size: 18px;'>Dear " + fullname + ",</p>"
                    + "<p style='font-size: 16px;'>Your appointment has been successfully booked for <strong>" + appoint_date + "</strong> with Dr. <strong>" + doctorName + "</strong>.</p>"
                    + "<hr style='border: 1px solid #f1f1f1; margin: 20px 0;'>"
                    + "<h3 style='color: #4CAF50;'>Appointment Details:</h3>"
                    + "<table style='width: 100%; margin-bottom: 20px;'>"
                    + "<tr><td style='padding: 10px;'><strong>Full Name:</strong></td><td>" + fullname + "</td></tr>"
                    + "<tr><td style='padding: 10px;'><strong>Gender:</strong></td><td>" + gender + "</td></tr>"
                    + "<tr><td style='padding: 10px;'><strong>Age:</strong></td><td>" + age + "</td></tr>"
                    + "<tr><td style='padding: 10px;'><strong>Phone:</strong></td><td>" + phno + "</td></tr>"
                    + "<tr><td style='padding: 10px;'><strong>Disease:</strong></td><td>" + diseases + "</td></tr>"
                    + "<tr><td style='padding: 10px;'><strong>Address:</strong></td><td>" + address + "</td></tr>"
                    + "</table>"
                    + "<p style='font-size: 14px; color: #777;'>Thank you for choosing us. We look forward to seeing you soon!</p>"
                    + "<p style='font-size: 12px; color: #999;'>If you have any questions or need to reschedule, feel free to contact us.</p>"
                    + "<hr style='border: 1px solid #f1f1f1; margin: 20px 0;'>"
                    + "<p style='font-size: 12px; color: #999;'>This is an automated email, please do not reply directly to this message.</p>"
                    + "</td>"
                    + "</tr>"
                    + "</table>"
                    + "</body>"
                    + "</html>";

            boolean emailSent = EmailUtils.sendEmail(email, subject, body);

            if (emailSent) {
                session.setAttribute("sucMsg", "Appointment Booked successfully and confirmation email sent!");
            } else {
                session.setAttribute("errorMsg", "Appointment Booked successfully, but email couldn't be sent.");
            }
            resp.sendRedirect("user_appointment.jsp");
        }
    }
}
