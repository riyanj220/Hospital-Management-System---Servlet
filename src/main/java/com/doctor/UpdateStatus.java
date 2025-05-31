package com.doctor;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.AppointmentDAO;
import com.db.DBConnect;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {

    interface Command {
        void execute();
    }

    public static class Comment {
        private int id;
        private int did;
        private String comment;
        private AppointmentDAO dao;
        private boolean success;

        public Comment(int id, int did, String comment, AppointmentDAO dao) {
            this.id = id;
            this.did = did;
            this.comment = comment;
            this.dao = dao;
        }

        public void update() {
            System.out.println("Updating comment...");
            success = dao.updateCommentStatus(id, did, comment);
        }

        public boolean isSuccessful() {
            return success;
        }
    }

    public static class UpdateCommentCommand implements Command {
        private Comment comment;

        public UpdateCommentCommand(Comment comment) {
            this.comment = comment;
        }

        @Override
        public void execute() {
            comment.update();
        }

        public boolean wasSuccessful() {
            return comment.isSuccessful();
        }
    }

    public static class CommentBroker {
        private List<Command> commandList = new ArrayList<>();

        public void takeCommand(Command command) {
            commandList.add(command);
        }

        public void placeCommands() {
            for (Command command : commandList) {
                command.execute();
            }
            commandList.clear();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            int did = Integer.parseInt(req.getParameter("did"));
            String comm = req.getParameter("comm");

            AppointmentDAO dao = new AppointmentDAO(DBConnect.getCon());
            HttpSession session = req.getSession();

            Comment comment = new Comment(id, did, comm, dao);
            UpdateCommentCommand updateCommand = new UpdateCommentCommand(comment);

            CommentBroker broker = new CommentBroker();
            broker.takeCommand(updateCommand);
            broker.placeCommands();

            if (updateCommand.wasSuccessful()) {
                session.setAttribute("sucMsg", "Comment updated successfully!");
            } else {
                session.setAttribute("errorMsg", "Oops! Something went wrong");
            }

            resp.sendRedirect("doctor/patient.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
