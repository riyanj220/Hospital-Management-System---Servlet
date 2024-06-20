<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDAO" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.entity.Doctor" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard</title>
    <%@include file="../component/allcss.jsp"%>

    <style type = "text/css">
        body {
            background: url('../img/doctor_index.jpg') no-repeat center center fixed;
            background-size: 100% 100%;
            margin: 0; /* Remove default body margin */
            padding: 0; /* Remove default body padding */
        }
        .container {
            padding-top: 150px; /* Add padding to move content down */
        }

        .point-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
            background-color: orange; /* Set card background color to light green */
            border: 4px solid white;
        }

        .point-card .card-body {
            color: white; /* Set text color to black */
        }

        .point-card .card-body i {
            color: white; /* Set icon color to black */
        }

        .dashboard-heading {
            background-color: orange;; 
            padding: 10px;
            border-radius: 10px; 
            display: inline-block;
            margin: 0 auto; 
            width: fit-content; 
            text-align: center;
            margin-top: 50px;
            border: 4px solid white;
            color: white;
        }
        .dashboard-container {
            padding-top: 100px;
        }
    </style>

</head>
<body>

    <c:if test="${empty doctObj}">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>
    <%@include file="navbar.jsp"%>

    <div class="d-flex justify-content-center">
        <p class="text-center fs-3 dashboard-heading">Doctor Dashboard</p>
    </div>
    <% 
        Doctor d = (Doctor)session.getAttribute("doctObj");
        DoctorDAO dao = new DoctorDAO(DBConnect.getCon());
    %>

    <div class="container dashboard-container ">
        <div class="row">
            <div class="col-md-4 offset-md-2">
                <div class="card point-card">
                    <div class="card-body text-center"> 
                        <i class="fas fa-user-md fa-3x"></i>
                        <br> 
                    
                        <p class="fs-4 text-center"> 
                            Total Doctors <br><%=dao.countDoctor()%>
                        </p>
                
                    </div>
                </div>
            </div>

            
            <div class="col-md-4">
                <div class="card point-card">
                    <div class="card-body text-center "> 
                        <i class="far fa-calendar-check fa-3x"></i><br> 
                        <p class="fs-4 text-center">
                            Total Appointments <br> <%=dao.countAppointmentByDoctorId(d.getId())%>
                        </p>
                
                    </div>
                </div>
            </div>

        </div>
    </div>

</body>
</html>