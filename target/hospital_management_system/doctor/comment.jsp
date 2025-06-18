<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page import="com.dao.AppointmentDAO" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.entity.Appointment" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Patient Comment</title>
    <%@ include file="../component/allcss.jsp" %>

    <style>
        .point-card {
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
            border-radius: 16px;
            border: none;
            padding: 30px;
        }

        .backImg {
            background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)),
            url("../img/user_appoint_banner.jpg");
            height: 20vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
        }

        .form-label {
            font-weight: 500;
            color: #333;
        }

        .form-control[readonly] {
            background-color: #f5f5f5;
        }

        textarea.form-control {
            resize: none;
            border-radius: 8px;
        }

        .submit-btn {
            border-radius: 8px;
            padding: 10px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
    </style>
</head>
<body>

<c:if test="${empty doctObj}">
    <c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<%@include file="navbar.jsp"%>

<div class="container-fluid backImg d-flex align-items-center justify-content-center">

</div>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card point-card">
                <div class="card-body">
                    <h4 class="text-center mb-4">Patient Comment</h4>

                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        AppointmentDAO dao = new AppointmentDAO(DBConnect.getCon());
                        Appointment ap = dao.getAppointmentById(id);
                    %>

                    <form class="row g-3" action="../updateStatus" method="post">
                        <div class="col-md-6">
                            <label class="form-label">Patient Name</label>
                            <input type="text" readonly value="<%=ap.getFullName()%>" class="form-control">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Age</label>
                            <input type="text" readonly value="<%=ap.getAge()%>" class="form-control">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Mobile No.</label>
                            <input type="text" readonly value="<%=ap.getPhNo()%>" class="form-control">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Disease</label>
                            <input type="text" readonly value="<%=ap.getDiseases()%>" class="form-control">
                        </div>

                        <div class="col-md-12">
                            <label class="form-label">Comment</label>
                            <textarea name="comm" required rows="4" class="form-control" placeholder="Write your observations or treatment notes..."></textarea>
                        </div>

                        <input type="hidden" name="id" value="<%=ap.getId()%>">
                        <input type="hidden" name="did" value="<%=ap.getDoctorId()%>">

                        <div class="col-md-12 text-center mt-3">
                            <button class="btn btn-success w-50 submit-btn">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
