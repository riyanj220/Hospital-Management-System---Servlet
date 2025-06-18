<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<%@ page import="com.entity.Appointment" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.dao.AppointmentDAO" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Details</title>
    <%@include file="../component/allcss.jsp"%>
    <style type = "text/css">
        .point-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
        }

        /* Add some padding and smooth transition effects */
        .btn-action {
            padding: 8px 15px;
            font-size: 14px;
            border-radius: 8px;
            transition: all 0.3s ease-in-out;
        }

        /* Hover effect for buttons */
        .btn-action:hover {
            transform: translateY(-3px);
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Disabled buttons */
        .btn-action.disabled {
            cursor: not-allowed;
            opacity: 0.6;
        }

        /* Button icons spacing */
        .btn-action i {
            margin-right: 5px;
        }

        /* Custom success button color */
        .btn-success {
            background: linear-gradient(145deg, #6dbf66, #5a9f55);
            border: none;
        }

        /* Custom info button color */
        .btn-info {
            background: linear-gradient(145deg, #4bb9ff, #3387d6);
            border: none;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <!-- Flash Message -->
    <c:if test="${not empty sucMsg || not empty errorMsg}">
        <div id="flashMessage" class="text-center" style="
            background-color: #e2e3e5;
            color: <c:out value='${not empty sucMsg ? "#198754" : "#dc3545"}'/>;
            font-weight: 600;
            font-size: 17px;
            padding: 16px 12px;
            margin-bottom: 20px;
            border-bottom: 1px solid #ccc;
        ">
            <c:out value="${sucMsg}" />
            <c:out value="${errorMsg}" />
        </div>
        <c:remove var="sucMsg" scope="session" />
        <c:remove var="errorMsg" scope="session" />

        <script>
            setTimeout(() => {
                const flash = document.getElementById("flashMessage");
                if (flash) {
                    flash.style.transition = "opacity 0.5s ease-out";
                    flash.style.opacity = 0;
                    setTimeout(() => flash.remove(), 500);
                }
            }, 4000);
        </script>
    </c:if>

    <c:if test="${empty doctObj}">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-12">
                <div class="card point-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">Patient Details</p>

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Age</th>
                                    <th scope="col">Appointment Date</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Mobile No.</th>
                                    <th scope="col">Disease</th>
                                    <th scope="col">Status</th>
                                    <th scope="col" style="text-align: center;">Action</th>
                                </tr>
                            </thead>

                            <tbody>

                                <%
                                    Doctor d = (Doctor)session.getAttribute("doctObj");
                                    AppointmentDAO dao = new AppointmentDAO(DBConnect.getCon());
                                    List <Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());

                                    for(Appointment ap:list)
                                    {%>

                                        <tr>
                                            <th><%=ap.getFullName()%></th>
                                            <td><%=ap.getGender()%></td>
                                            <td><%=ap.getAge()%></td>
                                            <td ><%=ap.getAppoinDate()%></td>
                                            <td><%=ap.getEmail()%></td>
                                            <td><%=ap.getPhNo()%></td>
                                            <td><%=ap.getDiseases()%></td>
                                            <td><%=ap.getStatus()%></td>
                                            <td>
                                                <% if ("Pending".equals(ap.getStatus())) { %>
                                                    <a href="comment.jsp?id=<%= ap.getId() %>" class="btn btn-success btn-sm btn-action">
                                                        <i class="bi bi-chat-left-text"></i> Comment
                                                    </a>

                                                    <button type="button" class="btn btn-info btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#emailModal<%= ap.getId() %>">
                                                        <i class="bi bi-envelope"></i> Email
                                                    </button>
                                                <% } else { %>
                                                    <a href="comment.jsp?id=<%= ap.getId() %>" class="btn btn-success btn-sm btn-action disabled">
                                                        <i class="bi bi-chat-left-text"></i> Comment
                                                    </a>

                                                    <button class="btn btn-info btn-sm btn-action disabled">
                                                        <i class="bi bi-envelope"></i> Email
                                                    </button>
                                                <% } %>
                                            </td>
                                        </tr>

                                         <!-- Modal for Sending Email -->
                                        <div class="modal fade" id="emailModal<%= ap.getId() %>" tabindex="-1" role="dialog" aria-labelledby="emailModalLabel<%= ap.getId() %>" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="emailModalLabel<%= ap.getId() %>">Send Email to <%= ap.getFullName() %></h5>
                                                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="../send_email" method="POST">
                                                            <input type="hidden" name="appointmentId" value="<%= ap.getId() %>">
                                                            <input type="hidden" name="appointmentDate" value="<%= ap.getAppoinDate() %>">
                                                            <!-- Use EL to access doctor object -->
                                                            <input type="hidden" name="doctorName" value="${doctor != null ? doctor.fullName : 'Unknown Doctor'}">
                                                            <input type="hidden" name="doctorEmail" value="${doctor != null ? doctor.email : 'Unknown Email'}">
                                                            <div class="form-group">
                                                                <label for="emailSubject">Subject</label>
                                                                <input type="text" class="form-control" id="emailSubject" name="subject" required>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="emailBody">Message</label>
                                                                <textarea class="form-control" id="emailBody" name="body" rows="5" required></textarea>
                                                            </div>
                                                            <div class="form-group d-flex justify-content-center mt-4">
                                                                <button type="submit" class="btn btn-primary">Send Email</button>
                                                            </div>
                                                        </form>


                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JS (Bootstrap 5) for modal functionality -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
