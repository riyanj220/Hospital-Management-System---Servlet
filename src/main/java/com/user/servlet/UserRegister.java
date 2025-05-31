package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

    abstract class AbstractUser {
        protected String email;
        public abstract boolean isNil();
        public abstract String getEmail();
    }

    class RealUser extends AbstractUser {
        public RealUser(String email) {
            this.email = email;
        }

        @Override
        public boolean isNil() {
            return false;
        }

        @Override
        public String getEmail() {
            return email;
        }
    }

    class NullUser extends AbstractUser {
        @Override
        public boolean isNil() {
            return true;
        }

        @Override
        public String getEmail() {
            return "Email Not Available";
        }
    }

    class UserFactory {
        public AbstractUser getUser(String email) {
            if (email == null || email.trim().isEmpty()) {
                return new NullUser();
            }
            return new RealUser(email);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String fullName = req.getParameter("full_name");
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            UserFactory userFactory = new UserFactory();
            AbstractUser user = userFactory.getUser(email);

            HttpSession session = req.getSession();

            if (user.isNil()) {
                session.setAttribute("errorMsg", "Invalid or missing email!");
                resp.sendRedirect("signup.jsp");
                return;
            }

            User u = new User(fullName, email, password);
            UserDAO dao = new UserDAO(DBConnect.getCon());

            boolean f = dao.register(u);

            if (f) {
                session.setAttribute("sucMsg", "Registered Successfully!");
            } else {
                session.setAttribute("errorMsg", "Something went wrong!");
            }
            resp.sendRedirect("signup.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
