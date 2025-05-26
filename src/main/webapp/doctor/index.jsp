<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDAO" %>
<%@ page import="com.entity.Doctor" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Dashboard</title>
    <%@include file="../component/allcss.jsp"%>

    <style>
        body {
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            overflow:hidden;
        }

        .dashboard-container {
            min-height: calc(100vh - 60px);
            padding-top: 40px;
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
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
            letter-spacing: 0.5px;
            transition: background 0.3s ease;
            max-width:68rem;
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
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            margin-bottom:1.5rem;
        }

        .info-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 14px 28px rgba(0,0,0,0.12);
            background: linear-gradient(135deg, #ffffff, #f8f8f8);
        }

        .point-card {
            background-color: white;
            border: none;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .point-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0,0,0,0.15);
        }

        .point-card .card-body {
            padding: 30px 20px;
        }

        .point-card .card-body i {
            color: #0d6efd;
            font-size: 36px;
            margin-bottom: 10px;
        }

        .point-card .card-body h4 {
            font-weight: bold;
            margin-top: 10px;
        }

        .point-card .card-body p {
            font-size: 18px;
            margin-bottom: 0;
        }
    </style>
</head>
<body>

    <c:if test="${empty doctObj}">
        <c:redirect url="../doctor_login.jsp" />
    </c:if>

    <%@include file="navbar.jsp"%>

    <div class="dashboard-container container">

        <div class="text-center ">
            <div class="dashboard-heading">Doctor Dashboard</div>
        </div>

        <%
            Doctor d = (Doctor)session.getAttribute("doctObj");
            DoctorDAO dao = new DoctorDAO(DBConnect.getCon());
        %>

        <!-- Welcome Info -->
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="info-card">
                    <h5>Welcome back, <%=d.getFullName()%>!</h5>
                    <p>Your dashboard provides a quick overview of your medical activities.</p>
                    <p>Use the navigation bar to manage appointments, view patients, or update your profile.</p>
                </div>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="row justify-content-center">
            <div class="col-md-4 mb-4">
                <div class="info-card border-start border-4 border-primary">
                    <i class="fas fa-user-md text-primary fa-2x mb-2"></i>
                    <h6>Total Doctors</h6>
                    <h4><%=dao.countDoctor()%></h4>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="info-card border-start border-4 border-primary">
                    <i class="far fa-calendar-check text-primary fa-2x mb-2"></i>
                    <h6>Total Appointments</h6>
                    <h4><%=dao.countAppointmentByDoctorId(d.getId())%></h4>
                </div>
            </div>
        </div>

        <!-- Static Cards -->
        <div class="row mt-4">
            <div class="col-md-4 mb-4">
                <div class="info-card">
                    <i class="fas fa-lightbulb text-primary fa-2x mb-2"></i>
                    <h6>Upcoming Features</h6>
                    <p>More analytics, patient reports, and messaging tools coming soon to improve your workflow.</p>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="info-card">
                    <i class="fas fa-stethoscope text-success fa-2x mb-2"></i>
                    <h6>Quick Tip</h6>
                    <p>Update your availability regularly to help patients schedule faster and reduce missed appointments.</p>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="info-card">
                    <i class="fas fa-headset text-danger fa-2x mb-2"></i>
                    <h6>Support & Help</h6>
                    <p>Need help? Contact support or visit the FAQ section under the Help tab for instant assistance.</p>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
