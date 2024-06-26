<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDAO" %>
<%@ page import="com.db.DBConnect" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Index Page</title>
    <%@include file="../component/allcss.jsp"%>

    <style type = "text/css">
        body {
            background: url('../img/admin_dashboard.jpg') no-repeat center center fixed;
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
            background-color: navy; /* Set card background color to light green */
            border: 4px solid white;
        }

        .point-card .card-body {
            color: white; /* Set text color to black */
        }

        .point-card .card-body i {
            color: white; /* Set icon color to black */
        }

        .dashboard-heading {
            background-color: navy;; 
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
    <%@include file="navbar.jsp"%>

    <c:if test ="${empty adminObj}">
        <c:redirect url="../admin_login.jsp"></c:redirect>
    </c:if>

    <div class="d-flex justify-content-center">
        <p class="text-center fs-3 dashboard-heading">Admin Dashboard</p>
    </div>
    
    <div class="container dashboard-container">
        <c:if test="${not empty errorMsg}">
            <p class="fs-3 text-center text-danger">${errorMsg}</p>
            <c:remove var="errorMsg" scope="session" />
        </c:if>
        
        <c:if test="${not empty sucMsg}">
            <div class="fs-3 text-center text-success" role="alert"> ${sucMsg}</div>
            <c:remove var="sucMsg" scope="session" />
        </c:if>

        
        <% DoctorDAO dao = new DoctorDAO(DBConnect.getCon());%>

        <div class="row">
            <div class="col-md-4">
                <div class="card point-card">
                    <div class="card-body text-center "> <i class="fas fa-user-md fa-3x"></i> <br> <p class="fs-4 text-center">
                        Doctors <br><%=dao.countDoctor()%>
                    </p>
                    </div>
                </div>
            </div>

            
            <div class="col-md-4">
                <div class="card point-card">
                    <div class="card-body text-center "> <i class="fas fa-user-circle fa-3x"></i><br> <p class="fs-4 text-center">
                        Users <br><%=dao.countUsers()%>
                    </p>
                    </div>
                </div>
            </div>

            
            <div class="col-md-4">
                <div class="card point-card">
                    <div class="card-body text-center "> <i class="far fa-calendar-check fa-3x"></i><br> <p class="fs-4 text-center">
                        Total Appointments <br><%=dao.countAppointment()%>
                        </p>
                    </div>
                 
                </div>
            </div>

            
            <div class="col-md-4 mt-2">
                <div class="card point-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <div class="card-body text-center ">
                        <i class="fa-solid fa-notes-medical fa-3x"></i><br> <p class="fs-4 text-center">
                        Specialist <br><%=dao.countSpecialist()%>
                        </p>
                    </div>
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
          
            <form action ="../addSpecialist" method="post">
                <div class = "form-group">
                    <label>Enter specialist name: </label>  <input type = "text" name="specName" class="form-control"> 
                </div>
                <div class = "text-center mt-3">
                    <button type ="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
    
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
    </body>
</html>