package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.entity.User;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {

    interface UserType {
        void showRole();
    }

    public static class AdminUser extends User implements UserType {
        @Override
        public void showRole() {
//            System.out.println("Inside AdminUser::showRole() — I'm ADMIN");
        }
    }

    public static class DoctorUser extends User implements UserType {
        @Override
        public void showRole() {
            System.out.println("Inside DoctorUser::showRole() — I'm DOCTOR");
        }
    }

    static class UserFactory {
        public UserType getUser(String userType) {
            if (userType == null) {
                return null;
            }

            if (userType.equalsIgnoreCase("ADMIN")) {
                return new AdminUser();
            } else if (userType.equalsIgnoreCase("DOCTOR")) {
                return new DoctorUser();
            }

            return null;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            HttpSession session = req.getSession();

            if ("riyanjamil220@gmail.com".equals(email) && "admin".equals(password)) {
                UserFactory factory = new UserFactory();
                UserType adminUser = factory.getUser("ADMIN");

                adminUser.showRole();

                session.setAttribute("adminObj", adminUser);
                resp.sendRedirect("admin/index.jsp");
            } else {
                session.setAttribute("errorMsg", "Invalid email or password!");
                resp.sendRedirect("admin_login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
