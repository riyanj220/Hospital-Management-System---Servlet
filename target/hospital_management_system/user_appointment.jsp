<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="com.dao.SpecialistDAO" %>
<%@ page import="com.entity.Specialist" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDAO" %>
<%@ page import="com.entity.Doctor" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Appointment</title>
    <%@ include file="../component/allcss.jsp" %>
    
    <style type="text/css">
        .point-card {
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
        }

        
        .backImg {
            background: Linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
            url("img/user_appoint_banner.jpg");
            height: 35vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
            
        }
        .small-img {
            width: 600px; 
            height: auto; 
        }
    </style>
</head>
<body>
    <%@include file="../component/navbar.jsp"%>

    <div class="container-fulid backImg p-5"> 
        <p class="text-center fs-2 text-white"></p> 
    </div>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 p-5">
                <img class="small-img" alt="" src="img/doct.jpg">
            </div>

            
            <div class="col-md-6">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="text-center fs-3">User Appointment</p> 
                        
                        <c:if test="${not empty errorMsg}">
                            <p class="fs-4 text-center text-danger">${errorMsg}</p> 
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty sucMsg}">
                            <p class="fs-4 text-center text-success">${sucMsg}</p> 
                            <c:remove var="sucMsg" scope="session" /> 
                        </c:if>


                        
                        <form class="row g-3" action="addAppointment" method="post">

                            <input type="hidden" name="userid" value="${userObj.id}">

                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-Label">Full Name</label> <input required type="text" class="form-control" name="fullname">
                            </div>


                            <div class="col-md-6">
                                <label>Gender</label> <select class="form-control" name="gender" required>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div>

                            
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Age</label> <input required type="number" class="form-control" name="age">
                            </div>

                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Appointment Date</label> <input type="date" class="form-control" required name="appoint_date">
                            </div>

                            
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-Label"> Email</label> <input required type="email" class="form-control" name="email">
                            </div>

                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-Label ">Phone No.</label> <input maxlength="10" required type="number" class="form-control" name="phno">
                            </div>

                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-Label ">Disease</label> <input required type="text" class="form-control" name="diseases">
                            </div>

                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">Doctor</label> 
                                <select required class="form-control" name="doct">
                                    <option value="">--select--</option>

                                    <%DoctorDAO dao = new DoctorDAO(DBConnect.getCon());
                                        List<Doctor>list = dao.getAllDoctor();

                                        for(Doctor d : list)
                                        {%>
                                            <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist() %>)</option>
                                        <%}
                                    %>

                                    
                                </select>
                            </div>

                            
                            <div class="col-md-12">
                                <label>Full Address</label>
                                <textarea required name="address" class="form-control" rows="3" cols=""></textarea>
                            </div>

                            <!-- <c:if test="${empty userObj}">
                                <a href="ulogin.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
                            </c:if> -->
                                
                            <c:if test="${not empty userObj }">
                                <button class="col-md-6 offset-md-3 btn btn-primary">Confirm</button> 
                            </c:if>
                                
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
                    

</body>
</html>
