package com.doctor;

import com.dao.DoctorDAO;
import com.db.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

abstract class PasswordChangeHandler {
    protected PasswordChangeHandler next;

    public void setNext(PasswordChangeHandler next) {
        this.next = next;
    }

    public void handle(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        boolean proceed = process(req, resp);
        if (proceed && next != null) {
            next.handle(req, resp);
        }
    }

    protected abstract boolean process(HttpServletRequest req, HttpServletResponse resp) throws Exception;
}

class OldPasswordValidator extends PasswordChangeHandler {
    @Override
    protected boolean process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int uid = Integer.parseInt(req.getParameter("uid"));
        String oldPassword = req.getParameter("oldPassword");

        DoctorDAO dao = new DoctorDAO(DBConnect.getCon());
        HttpSession session = req.getSession();

        if (!dao.checkOldPassword(uid, oldPassword)) {
            session.setAttribute("errorMsg", "Incorrect Old Password!");
            resp.sendRedirect("doctor/edit_profile.jsp");
            return false;
        }
        return true;
    }
}

class PasswordUpdater extends PasswordChangeHandler {
    @Override
    protected boolean process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int uid = Integer.parseInt(req.getParameter("uid"));
        String newPassword = req.getParameter("newPassword");

        DoctorDAO dao = new DoctorDAO(DBConnect.getCon());
        HttpSession session = req.getSession();

        if (!dao.changePassword(uid, newPassword)) {
            session.setAttribute("errorMsg", "Something went wrong!");
            resp.sendRedirect("doctor/edit_profile.jsp");
            return false;
        }
        return true;
    }
}

class SuccessResponseHandler extends PasswordChangeHandler {
    @Override
    protected boolean process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        HttpSession session = req.getSession();
        session.setAttribute("sucMsg", "Password changed successfully!");
        resp.sendRedirect("doctor/edit_profile.jsp");
        return false;
    }
}

@WebServlet("/doctChangePassword")
public class DoctorPasswordChange extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PasswordChangeHandler validator = new OldPasswordValidator();
        PasswordChangeHandler updater = new PasswordUpdater();
        PasswordChangeHandler success = new SuccessResponseHandler();

        validator.setNext(updater);
        updater.setNext(success);

        try {
            validator.handle(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsg", "Internal server error!");
            resp.sendRedirect("doctor/edit_profile.jsp");
        }
    }
}
