<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.SpecialistDAO" %>
<%@ page import="com.entity.Specialist" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDAO" %>
<%@ page import="com.entity.Doctor" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Doctor</title>
    <%@include file="../component/allcss.jsp"%>

    <style>
        body {
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .card {
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.08);
            border-radius: 10px;
            padding: 25px 30px;
            background-color: #fff;
        }

        .form-label {
            font-weight: 500;
            margin-bottom: 5px;
        }

        .form-control {
            border-radius: 8px;
        }

        .btn-primary {
            border-radius: 8px;
            font-weight: 500;
            padding: 10px;
        }

        .page-wrapper {
            padding-top: 40px;
        }
    </style>
</head>
<body>

<%@include file="navbar.jsp"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    DoctorDAO dao2 = new DoctorDAO(DBConnect.getCon());
    Doctor d = dao2.getDoctorById(id);
%>

<div class="container page-wrapper">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">

                <h3 class="text-center mb-4 fw-bold">Edit Doctor Details</h3>

                <c:if test="${not empty errorMsg}">
                    <div class="alert alert-danger text-center">${errorMsg}</div>
                    <c:remove var="errorMsg" scope="session"/>
                </c:if>

                <c:if test="${not empty sucMsg}">
                    <div class="alert alert-success text-center">${sucMsg}</div>
                    <c:remove var="sucMsg" scope="session"/>
                </c:if>

                <form action="../updateDoctor" method="post">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="fullname" class="form-control" required value="<%=d.getFullName()%>">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Date of Birth</label>
                        <input type="date" name="dob" class="form-control" required value="<%=d.getDob()%>">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Qualification</label>
                        <input type="text" name="qualification" class="form-control" required value="<%=d.getQualification()%>">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Specialization</label>
                        <select name="spec" class="form-control" required>
                            <option selected><%=d.getSpecialist()%></option>
                            <%
                                SpecialistDAO dao = new SpecialistDAO(DBConnect.getCon());
                                List<Specialist> list = dao.getAllSpecialist();
                                for (Specialist s : list) {
                            %>
                                <option><%=s.getSpecialistName()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required value="<%=d.getEmail()%>">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Mobile No.</label>
                        <input type="text" name="mobno" class="form-control" required value="<%=d.getMobNo()%>">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="text" name="password" class="form-control" required value="<%=d.getPassword()%>">
                    </div>

                    <input type="hidden" name="id" value="<%=d.getId()%>">

                    <button type="submit" class="btn btn-primary col-12 mt-2">Update</button>
                </form>

            </div>
        </div>
    </div>
</div>

</body>
</html>
