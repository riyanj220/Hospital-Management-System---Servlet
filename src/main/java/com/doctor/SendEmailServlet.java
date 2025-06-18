package com.doctor;

import com.dao.DoctorDAO;
import com.entity.Appointment;
import com.entity.Doctor;
import com.utils.EmailUtils;
import com.dao.AppointmentDAO;
import com.db.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/send_email")
public class SendEmailServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int appointmentId = Integer.parseInt(req.getParameter("appointmentId"));
            String subject = req.getParameter("subject");
            String body = req.getParameter("body");
            String appointmentDate = req.getParameter("appointmentDate");

            AppointmentDAO dao = new AppointmentDAO(DBConnect.getCon());
            Appointment appointment = dao.getAppointmentById(appointmentId);

            if (appointment != null) {
                DoctorDAO doctorDao = new DoctorDAO(DBConnect.getCon());
                Doctor doctor = doctorDao.getDoctorById(appointment.getDoctorId());

                req.setAttribute("doctor", doctor);

                String patientEmail = appointment.getEmail();

                String emailBody = generateEmailBody(appointment, body, appointmentDate, doctor);

                boolean emailSent = EmailUtils.sendEmail(patientEmail, subject, emailBody);

                HttpSession session = req.getSession();
                if (emailSent) {
                    session.setAttribute("sucMsg", "Email sent successfully!");
                } else {
                    session.setAttribute("errorMsg", "Oops! Something went wrong while sending the email.");
                }
            } else {
                HttpSession session = req.getSession();
                session.setAttribute("errorMsg", "Appointment not found!");
            }

            resp.sendRedirect("doctor/patient.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("errorMsg", "An error occurred while processing the request.");
            resp.sendRedirect("doctor/patient.jsp");
        }
    }

    private String generateEmailBody(Appointment appointment, String body, String appointmentDate, Doctor doctor) {

        return "<html>"
                + "<body style='font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333;'>"
                + "<table style='width: 100%; background-color: #ffffff; padding: 20px;'>"
                + "<tr>"
                + "<td style='text-align: center; padding: 20px;'>"
                + "<h2 style='color: #4CAF50;'>Appointment Update</h2>"
                + "<p style='font-size: 18px;'>Dear " + appointment.getFullName() + ",</p>"
                + "<p style='font-size: 16px;'>We wanted to inform you about an update regarding your appointment.</p>"
                + "<p style='font-size: 16px;'>"+body+"</p>"
                + "<hr style='border: 1px solid #f1f1f1; margin: 20px 0;'>"
                + "<h3 style='color: #4CAF50;'>Appointment Details:</h3>"
                + "<table style='width: 100%; margin-bottom: 20px;'>"
                + "<tr><td style='padding: 10px;'><strong>Appointment Date:</strong></td><td>" + appointmentDate + "</td></tr>"
                + "<tr><td style='padding: 10px;'><strong>Doctor:</strong></td><td>" + doctor.getFullName() + "</td></tr>"
                + "<tr><td style='padding: 10px;'><strong>Doctor's Email:</strong></td><td>" + doctor.getEmail() + "</td></tr>"
                + "</table>"
                + "<p style='font-size: 14px; color: #777;'>Thank you for your cooperation and we look forward to your visit.</p>"
                + "<p style='font-size: 12px; color: #999;'>This is an automated email, please do not reply directly to this message.</p>"
                + "<hr style='border: 1px solid #f1f1f1; margin: 20px 0;'>"
                + "<p style='font-size: 12px; color: #999;'>If you have any questions or need to reschedule, feel free to contact us.</p>"
                + "</td>"
                + "</tr>"
                + "</table>"
                + "</body>"
                + "</html>";

    }
}
