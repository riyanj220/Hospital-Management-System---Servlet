<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDAO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard</title>
    <%@include file="../component/allcss.jsp"%>

    <style>
        body {
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        .dashboard-container {
            padding-top: 50px;
            padding-bottom: 20px;
        }

        .dashboard-heading {
            background: linear-gradient(to right, #0d6efd, #5a8dee);
            color: white;
            padding: 14px 36px;
            border-radius: 50px;
            font-size: 22px;
            font-weight: 600;
            margin: 0 auto 25px;
            max-width: 68rem;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            letter-spacing: 0.5px;
            transition: background 0.3s ease;
        }

        .dashboard-heading:hover {
            background: linear-gradient(to right, #167bff, #76aaff);
        }

        .info-card {
            background: linear-gradient(135deg, #fefefe, #f0f0f0);
            border-left: 5px solid #0d6efd;
            border-radius: 16px;
            padding: 25px 20px;
            text-align: center;
            color: #333;
            font-weight: 500;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            margin-bottom: 1.5rem;
        }

        .info-card:hover {
            transform: translateY(-4px);
            background: linear-gradient(135deg, #ffffff, #f8f8f8);
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.12);
        }

        .info-card i {
            font-size: 28px;
            margin-bottom: 10px;
        }

        /* Modal Enhancements */
        .modal-content {
            border-radius: 12px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }

        .modal-header {
            background: linear-gradient(to right, #0d6efd, #5a8dee);
            color: white;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        .modal-title {
            font-weight: 600;
        }

        .btn-close {
            filter: brightness(0) invert(1);
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <c:if test="${empty adminObj}">
        <c:redirect url="../admin_login.jsp" />
    </c:if>

    <div class="dashboard-container container" >
        <div class="text-center">
            <div class="dashboard-heading" style="margin-bottom: 100px;">Admin Dashboard</div>
        </div>

        <c:if test="${not empty errorMsg}">
            <p class="fs-4 text-center text-danger">${errorMsg}</p>
            <c:remove var="errorMsg" scope="session" />
        </c:if>

        <c:if test="${not empty sucMsg}">
            <div class="fs-4 text-center text-success">${sucMsg}</div>
            <c:remove var="sucMsg" scope="session" />
        </c:if>

        <% DoctorDAO dao = new DoctorDAO(DBConnect.getCon()); %>

        <div class="row justify-content-center" style="margin-bottom: 100px;">
            <div class="col-md-3">
                <div class="info-card">
                    <i class="fas fa-user-md text-primary"></i>
                    <h6>Doctors</h6>
                    <h4><%=dao.countDoctor()%></h4>
                </div>
            </div>

            <div class="col-md-3">
                <div class="info-card">
                    <i class="fas fa-user-circle text-success"></i>
                    <h6>Users</h6>
                    <h4><%=dao.countUsers()%></h4>
                </div>
            </div>

            <div class="col-md-3">
                <div class="info-card">
                    <i class="far fa-calendar-check text-info"></i>
                    <h6>Total Appointments</h6>
                    <h4><%=dao.countAppointment()%></h4>
                </div>
            </div>

            <div class="col-md-3">
                <div class="info-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <i class="fa-solid fa-notes-medical text-danger"></i>
                    <h6>Specialist</h6>
                    <h4><%=dao.countSpecialist()%></h4>
                </div>
            </div>
        </div>

        <!-- Static Cards -->
        <div class="row mt-4">
            <div class="col-md-4 mb-4">
                <div class="info-card">
                    <i class="fas fa-lightbulb text-warning fa-2x mb-2"></i>
                    <h6>System Insights</h6>
                    <p>Monitor system activity and performance. View logs, metrics, and real-time updates for better control.</p>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="info-card">
                    <i class="fas fa-user-shield text-secondary fa-2x mb-2"></i>
                    <h6>Security Alerts</h6>
                    <p>Ensure data protection by keeping credentials safe and reviewing access logs regularly.</p>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="info-card">
                    <i class="fas fa-cogs text-info fa-2x mb-2"></i>
                    <h6>System Settings</h6>
                    <p>Configure global preferences, manage backups, and control overall admin-level functionalities.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <form action="../addSpecialist" method="post">
                        <div class="form-group">
                            <label>Enter specialist name:</label>
                            <input type="text" name="specName" class="form-control" required>
                        </div>
                        <div class="text-center mt-3">
                            <button type="submit" class="btn btn-primary">Add</button>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
