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
    <title>Index Page</title>
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

    <div class="container-fluid p-3"> 
        <div class="row">
            <div class="col-md-4">
                <div class="card paint-card shadow-sm">
                    <div class="card-body">
                        <h4 class="text-center mb-4 fw-bold">Add Doctor</h4>

                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger text-center py-2">${errorMsg}</div>
                            <c:remove var="errorMsg" scope="session"/>
                        </c:if>

                        <c:if test="${not empty sucMsg}">
                            <div class="alert alert-success text-center py-2">${sucMsg}</div>
                            <c:remove var="sucMsg" scope="session"/>
                        </c:if>

                        <form action="../addDoctor" method="post">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" name="fullname" class="form-control" required />
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Date of Birth</label>
                                <input type="date" name="dob" class="form-control" required />
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Qualification</label>
                                <input type="text" name="qualification" class="form-control" required />
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Specialization</label>
                                <select name="spec" class="form-control" required>
                                    <option disabled selected>--select--</option>
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
                                <input type="email" name="email" class="form-control" required />
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Mobile No.</label>
                                <input type="text" name="mobno" class="form-control" required />
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" required />
                            </div>

                            <button type="submit" class="btn btn-primary col-12">Submit</button>
                        </form>
                    </div>
                </div>
            </div>


            
            <div class="col-md-8">
                <div class="card paint-card"> 
                    <div class="card-body">
                        <p class="fs-3 text-center">Doctor Details</p> 
                        <table class="table">
                            <thead> 
                                <tr>
                                    <th scope="col">Full Name</th> 
                                    <th scope="col">Date of birth</th> 
                                    <th scope="col">Qualification</th> 
                                    <th scope="col">Specialization</th> 
                                    <th scope="col">Email</th> 
                                    <th scope="col">Mobile No.</th> 
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    DoctorDAO dao2 = new DoctorDAO(DBConnect.getCon());
                                    List<Doctor> list2  = dao2.getAllDoctor();

                                    for(Doctor d:list2)
                                    {%>

                                        <tr>
                                            <td>    
                                                <%=d.getFullName() %>
                                            </td>
                                            <td>
                                                <%=d.getDob() %>
                                            </td>
                                            <td>
                                                <%=d.getQualification() %>
                                            </td>
                                            <td>
                                                <%=d.getSpecialist() %>
                                            </td>
                                            <td>
                                                <%=d.getEmail() %>
                                            </td>
                                            <td>
                                                <%=d.getMobNo() %>
                                            </td>
                                            <td>
                                                <a href ="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-primary">Edit</a>
                                                <a href ="../deleteDoctor?id=<%=d.getId()%>" class="btn btn-sm btn-danger">Delete</a>
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