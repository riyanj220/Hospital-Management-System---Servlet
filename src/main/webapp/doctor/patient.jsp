<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<%@ page import="com.entity.Appointment" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.dao.AppointmentDAO" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Details</title>
    <%@include file="../component/allcss.jsp"%>
    <style type = "text/css">
        .point-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
        }

    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <!-- Flash Message -->
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

    <c:if test="${empty doctObj}">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>


    <div class="container p-3">
        <div class="row">
            <div class="col-md-12">
                <div class="card point-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">Patient Details</p>

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
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>

                            <tbody>

                                <%
                                    Doctor d = (Doctor)session.getAttribute("doctObj");
                                    AppointmentDAO dao = new AppointmentDAO(DBConnect.getCon());
                                    List <Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());

                                    for(Appointment ap:list)
                                    {%>

                                        <tr>
                                            <th><%=ap.getFullName()%></th>
                                            <td><%=ap.getGender()%></td>
                                            <td><%=ap.getAge()%></td>
                                            <td><%=ap.getAppoinDate()%></td>
                                            <td><%=ap.getEmail()%></td>
                                            <td><%=ap.getPhNo()%></td>
                                            <td><%=ap.getDiseases()%></td>
                                            <td><%=ap.getStatus()%></td>
                                            <td>

                                                <%
                                                    if("Pending".equals(ap.getStatus()))
                                                    {%>
                                                        <a href="comment.jsp?id=<%=ap.getId()%>" class="btn btn-success btn-sm">Comment</a>
                                                    <%}
                                                    else
                                                    {%>
                                                        <a href="comment.jsp?id=<%=ap.getId()%>" class="btn btn-success btn-sm disabled">Comment</a>
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
        </div>
    </div>

</body>
</html>