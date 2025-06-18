<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.List" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDAO" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.dao.AppointmentDAO" %>
<%@ page import="com.dao.DoctorDAO" %>
<%@ page import="com.entity.Appointment" %>
<%@ page import="com.entity.Doctor" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View appointment</title>
    <%@include file="../component/allcss.jsp"%>

    <style type = "text/css">
        .point-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
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
            width: 400px; 
            height: auto; 
        }

    </style>
    
</head>
<body>
    <%@include file="../component/navbar.jsp"%>

    <c:if test="${empty userObj}">
        <c:redirect url="user_login.jsp"></c:redirect>
    </c:if>

    <div class="container-fulid backImg p-5">
        <p class="text-center fs-2 text-white"></p> 
    </div>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-9">
                <div class="card point-card">
                    <div class="card-body">
                        <p class="fs-4 fw-bold text-center text-success">Appointment List</p>
    
                        <table class="table">
                            <thead>
                                <tr>
                                    
                                    <th scope="col">Full Name</th> 
                                    <th scope="col">Gender</th> 
                                    <th scope="col">Age</th>
                                    <th scope="col">Appointment Date</th> 
                                    <th scope="col">Disease</th> 
                                    <th scope="col">Doctor Name</th> 
                                    <th scope="col">Visit Status</th>

                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    User user =(User) session.getAttribute("userObj");
                                    AppointmentDAO dao = new AppointmentDAO(DBConnect.getCon());

                                    DoctorDAO dao2 = new DoctorDAO(DBConnect.getCon());

                                    List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());

                                    for(Appointment ap:list)
                                    {Doctor d = dao2.getDoctorById(ap.getDoctorId());
                                        
                                        %>
                                        <tr>
                                            <th><%=ap.getFullName()%></th>
                                            <td><%=ap.getGender()%></td>
                                            <td><%=ap.getAge()%></td>
                                            <td><%=ap.getAppoinDate()%></td>
                                            <td><%=ap.getDiseases()%></td>
                                            <td><%=d.getFullName()%></td>
                                            <td>
                                                <% 
                                                    if("Pending".equals(ap.getStatus())) {%>
                                                        
                                                        <a href ="#" class="btn btn-sm btn-warning">Pending</a>

                                                    <%}else{%>

                                                        <%=ap.getStatus() %>

                                                    <%}
                                                %>
                                            </td>
                                        </tr>
                                    <%}

                                %>

                                

                            </tbody>
                        </table>
                    
                    </div>
                </div>
            </div>

            <div class ="col-md-3 p-3">
                <img class="small-img" alt="" src="img/view_appointment.jpg">
            </div>
        </div>
    </div>
        

</body>
</html>
    