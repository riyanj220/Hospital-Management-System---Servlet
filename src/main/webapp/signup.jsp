<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Registration</title>
    <%@include file="../component/allcss.jsp"%>

    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f0f2f5;
        }

        .signup-page {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .signup-wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .signup-card {
            background: #fff;
            padding: 30px 25px;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .signup-card h3 {
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

        .signup-footer {
            margin-top: 15px;
            text-align: center;
        }

        .signup-footer a {
            text-decoration: none;
            font-weight: 500;
        }
    </style>
</head>

<body>
    <div class="signup-page">
        <%@include file="../component/navbar.jsp"%>

                <!-- Flash Message -->
                <c:if test="${not empty sucMsg || not empty errorMsg}">
                  <div id="flashMessage" class="text-center" style="
                      background-color: #e2e3e5;
                      color: <c:out value='${not empty sucMsg ? "#198754" : "#dc3545"}'/>;
                      font-weight: 600;
                      font-size: 17px;
                      padding: 16px 12px;  /* Increased padding */
                      margin-bottom: 20px;
                      border-bottom: 1px solid #ccc;
                    ">
                    <c:out value="${sucMsg}" />
                    <c:out value="${errorMsg}" />
                  </div>

                  <!-- Remove messages from session -->
                  <c:remove var="sucMsg" scope="session" />
                  <c:remove var="errorMsg" scope="session" />

                  <!-- Auto-hide script -->
                  <script>
                    setTimeout(() => {
                      const flash = document.getElementById("flashMessage");
                      if (flash) {
                        flash.style.transition = "opacity 0.5s ease-out";
                        flash.style.opacity = 0;
                        setTimeout(() => flash.remove(), 500);
                      }
                    }, 4000); // 4 seconds
                  </script>
                </c:if>


        <div class="signup-wrapper">
            <div class="signup-card">
                <h3>User Register</h3>

                <form action="user_register" method="post">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="full_name" class="form-control" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email address</label>
                        <input type="email" name="email" class="form-control" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required />
                    </div>

                    <button type="submit" class="btn btn-primary col-12">Register</button>
                </form>

                <div class="signup-footer mt-3">
                    Already have an account?
                    <a href="user_login.jsp" class="text-primary">Login here</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
