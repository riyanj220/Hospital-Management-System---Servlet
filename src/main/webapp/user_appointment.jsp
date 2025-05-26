<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="java.util.List"%>
<%@ page import="com.dao.SpecialistDAO" %>
<%@ page import="com.entity.Specialist" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDAO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Appointment</title>
    <%@ include file="../component/allcss.jsp" %>

    <style>
        .point-card {
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.15);
            border-radius: 12px;
        }

        .appointment-form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
        }

        .appointment-form h3 {
            text-align: center;
            font-weight: bold;
            margin-bottom: 25px;
            color: #343a40;
        }

        .form-control, select, textarea {
            border-radius: 8px !important;
        }

        .btn-confirm {
            border-radius: 8px;
            padding: 10px;
            font-weight: 500;
        }

        .left-image {
            max-width: 100%;
            height: 650px;
        }

        @media (max-width: 768px) {
            .appointment-form {
                margin-top: 30px;
            }
        }
    </style>
</head>
<body>
<%@include file="../component/navbar.jsp"%>
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

<div class="container-fluid p-5 bg-light">
    <div class="row align-items-center">
        <div class="col-md-6 text-center">
            <img src="img/doct.jpg" alt="Appointment" class="left-image">
        </div>
        <div class="col-md-6">
            <div class="appointment-form">
                <h3>User Appointment</h3>

                <form class="row g-3" action="addAppointment" method="post">
                    <input type="hidden" name="userid" value="${userObj.id}">

                    <div class="col-md-6">
                        <label>Full Name</label>
                        <input type="text" name="fullname" class="form-control" required />
                    </div>
                    <div class="col-md-6">
                        <label>Gender</label>
                        <select name="gender" class="form-control" required>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                    </div>

                    <div class="col-md-6">
                        <label>Age</label>
                        <input type="number" name="age" class="form-control" required />
                    </div>
                    <div class="col-md-6">
                        <label>Appointment Date</label>
                        <input type="date" name="appoint_date" class="form-control" required />
                    </div>

                    <div class="col-md-6">
                        <label>Email</label>
                        <input type="email" name="email" class="form-control" required />
                    </div>
                    <div class="col-md-6">
                        <label>Phone No.</label>
                        <input type="number" maxlength="10" name="phno" class="form-control" required />
                    </div>

                    <div class="col-md-6">
                        <label>Disease</label>
                        <input type="text" name="diseases" class="form-control" required />
                    </div>
                    <div class="col-md-6">
                        <label>Doctor</label>
                        <select name="doct" class="form-control" required>
                            <option value="">--select--</option>
                            <%
                                DoctorDAO dao = new DoctorDAO(DBConnect.getCon());
                                List<Doctor> list = dao.getAllDoctor();
                                for(Doctor d : list) {
                            %>
                                <option value="<%= d.getId() %>">
                                    <%= d.getFullName() %> (<%= d.getSpecialist() %>)
                                </option>
                            <% } %>
                        </select>
                    </div>

                    <div class="col-md-12">
                        <label>Full Address</label>
                        <textarea name="address" class="form-control" rows="3" required></textarea>
                    </div>

                    <c:if test="${not empty userObj}">
                        <div class="col-md-12 text-center">
                            <button class="btn btn-primary btn-confirm col-md-6">Confirm</button>
                        </div>
                    </c:if>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
