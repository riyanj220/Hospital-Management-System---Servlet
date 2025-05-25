<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<%@ page import="com.dao.SpecialistDAO, com.entity.Specialist, com.db.DBConnect, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <%@include file="../component/allcss.jsp"%>

    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f0f2f5;
        }

        .profile-page {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .profile-wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 40px;
            flex-wrap: wrap;
            padding: 60px 15px;
        }

        .profile-card {
            background: #fff;
            padding: 30px 25px;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 430px;
        }

        .profile-card h3 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: bold;
            color: #343a40;
        }

        .form-control {
            border-radius: 8px;
        }

        .btn-primary {
            border-radius: 8px;
            padding: 10px;
            font-weight: 500;
        }

        /* Flash Message */
        #flashMessage {
            text-align: center;
            font-weight: 600;
            font-size: 17px;
            padding: 16px 12px;
            margin-bottom: 20px;
            border-bottom: 1px solid #ccc;
            background-color: #e2e3e5;
        }
    </style>
</head>

<body>
<div class="profile-page">
    <%@include file="navbar.jsp"%>

    <c:if test="${empty doctObj}">
        <c:redirect url="../doctor_login.jsp"/>
    </c:if>

    <!-- Flash Message -->
    <c:if test="${not empty sucMsg || not empty errorMsg || not empty sucMsgd || not empty errorMsgd}">
        <div id="flashMessage" style="color: <c:out value='${not empty sucMsg || not empty sucMsgd ? "#198754" : "#dc3545"}'/>;">
            <c:out value="${sucMsg}" />
            <c:out value="${errorMsg}" />
            <c:out value="${sucMsgd}" />
            <c:out value="${errorMsgd}" />
        </div>

        <c:remove var="sucMsg" scope="session" />
        <c:remove var="errorMsg" scope="session" />
        <c:remove var="sucMsgd" scope="session" />
        <c:remove var="errorMsgd" scope="session" />

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

    <div class="profile-wrapper">

        <!-- Change Password -->
        <div class="profile-card">
            <h3>Change Password</h3>
            <form action="../doctChangePassword" method="post">
                <div class="mb-3">
                    <label class="form-label">Enter Old Password</label>
                    <input type="password" name="oldPassword" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Enter New Password</label>
                    <input type="password" name="newPassword" class="form-control" required />
                </div>

                <input type="hidden" name="uid" value="${doctObj.id}" />
                <button type="submit" class="btn btn-primary col-12">Confirm</button>
            </form>
        </div>

        <!-- Edit Profile -->
        <div class="profile-card">
            <h3>Edit Profile</h3>
            <form action="../doctorUpdateProfile" method="post">
                <div class="mb-3">
                    <label class="form-label">Full name</label>
                    <input type="text" name="fullname" class="form-control" value="${doctObj.fullName}" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Date of Birth</label>
                    <input type="date" name="dob" class="form-control" value="${doctObj.dob}" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Qualification</label>
                    <input type="text" name="qualification" class="form-control" value="${doctObj.qualification}" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Specialization</label>
                    <select name="spec" class="form-control" required>
                        <option>${doctObj.specialist}</option>
                        <%
                            SpecialistDAO dao = new SpecialistDAO(DBConnect.getCon());
                            List<Specialist> list = dao.getAllSpecialist();
                            for(Specialist s : list) {
                        %>
                            <option><%= s.getSpecialistName() %></option>
                        <% } %>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" value="${doctObj.email}" readonly />
                </div>

                <div class="mb-3">
                    <label class="form-label">Mobile No.</label>
                    <input type="text" name="mobno" class="form-control" value="${doctObj.mobNo}" required />
                </div>

                <input type="hidden" name="id" value="${doctObj.id}" />
                <button type="submit" class="btn btn-primary col-12">Update</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
