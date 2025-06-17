package com.utils;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

@SuppressWarnings("ALL")
public class EmailUtils {

    public static boolean sendEmail(String to, String subject, String body) {
        final String username = "riyanjamil220@gmail.com";
        final String password = "otjk qhvd pcvf mnkt";

        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);

            message.setContent(body, "text/html");

            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
