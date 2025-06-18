<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Change Password</title>
    <%@include file="../component/allcss.jsp"%>

    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f0f2f5;
        }

        .change-page {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .change-wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .change-card {
            background: #fff;
            padding: 30px 25px;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 420px;
        }

        .change-card h3 {
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
    </style>
</head>

<body>
    <div class="change-page">
        <%@include file="../component/navbar.jsp"%>

        <c:if test="${empty userObj}">
            <c:redirect url="user_login.jsp" />
        </c:if>

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

        <div class="change-wrapper">
            <div class="change-card">
                <h3>Change Password</h3>

                <form action="changePassword" method="post">
                    <div class="mb-3">
                        <label class="form-label">Enter Old Password</label>
                        <input type="password" name="oldPassword" class="form-control" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Enter New Password</label>
                        <input type="password" name="newPassword" class="form-control" required />
                    </div>

                    <input type="hidden" name="uid" value="${userObj.id}" />

                    <button type="submit" class="btn btn-primary col-12">Confirm</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
