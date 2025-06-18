<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page import="com.dao.AppointmentDAO" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="java.util.List"%>
<%@ page import="com.dao.DoctorDAO" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.entity.Appointment" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Details</title>

    <%@ include file="../component/allcss.jsp" %>
    <style type="text/css">
        .point-card {
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
        }

    </style>

</head>
<body>
    <%@include file="navbar.jsp"%>

    
    <div class="col-md-12">
        <div class="card point-card"> 
            <div class="card-body">
                <p class="fs-3 text-center fw-bold">Patients Details</p>
                
                <table class="table">
                    <thead> 
                        <tr>
            
                            <th scope="col">Full Name</th> 
                            <th scope="col">Gender</th> 
                            <th scope="col">Age</th>
                            <th scope="col">Appointment Date</th> 
                            <th scope="col">Email</th> 
                            <th scope="col">Mobile No.</th> 
                            <th scope="col">Disease</th> 
                            <th scope="col">Doctor Name</th> 
                            <th scope="col">Address</th> 
                            <th scope="col">Status</th>
            
                        </tr>
                    </thead>

                    <tbody>

                        <%
                            AppointmentDAO dao = new AppointmentDAO(DBConnect.getCon());
                            List <Appointment> list = dao.getAllAppointment();
                            
                            DoctorDAO dao2 = new DoctorDAO(DBConnect.getCon());

                            
                            for(Appointment ap:list)
                            {
                                Doctor d = dao2.getDoctorById(ap.getDoctorId());
                            %>
                                <tr>
                                    <th><%=ap.getFullName()%></th>
                                    <td><%=ap.getGender()%></td>
                                    <td><%=ap.getAge()%></td>
                                    <td><%=ap.getAppoinDate()%></td>
                                    <td><%=ap.getEmail()%></td>
                                    <td><%=ap.getPhNo()%></td>
                                    <td><%=ap.getDiseases()%></td>
                                    <td><%=d.getFullName()%></td>
                                    <td><%=ap.getAddress()%></td>
                                    <td><%=ap.getStatus()%></td>
                                </tr>
                            <%
                            }
                        %>

                        
                    </tbody>

                </table>

            </div>
        </div>
    </div>
    
</body>
</html>