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
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card"> 
                    <div class="card-body">
                        <p class="fs-3 text-center">Edit Doctor Details</p>

                        <c:if test="${not empty errorMsg}">
                            <p class="fs-3 text-center text-danger">${errorMsg}</p> 
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        
                        <c:if test="${not empty sucMsg}">
                            <div class="fs-3 text-center text-success" role="alert">${sucMsg}

                            </div> 
                            <c:remove var="sucMsg" scope="session" />
                        </c:if>

                        <%
                            int id = Integer.parseInt(request.getParameter("id"));
                            DoctorDAO dao2 =new DoctorDAO(DBConnect.getCon());
                            Doctor d = dao2.getDoctorById(id);
                        %>

                        <form action="../updateDoctor" method="post">
                            <div class="mb-3">
                                <label class="form-Label ">Full name</label> <input type="text" required name="fullname" class="form-control" value="<%=d.getFullName() %>">
                            </div>
                        
                            <div class="mb-3">
                                <label class="form-label">Date of birth</label> <input type="date" value="<%=d.getDob() %>" required name="dob" class="form-control">
                            </div>

                            
                            <div class="mb-3">
                                <label class="form-label">Qualification</label> <input required value="<%=d.getQualification() %>"  name="qualification" type="text" class="form-control">
                            </div>
                                
                            <div class="mb-3">
                                <label class="form-label"> Specialization</label> <select name="spec" required class="form-control">
                                <option><%=d.getSpecialist() %></option> 
                                
                                <% SpecialistDAO dao = new SpecialistDAO(DBConnect.getCon());
                                    List<Specialist> list=dao.getAllSpecialist();

                                    for(Specialist s :list)
                                    {%>
                                        <option><%=s.getSpecialistName()%></option>
                                    <%}
                                %>
                                
                                
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-Label ">Email</label> <input type="text" value="<%=d.getEmail() %>" required name="email" class="form-control" >
                            </div>

                            <div class="mb-3">
                                <label class="form-Label ">Mobile No.</label> <input type="text" required name="mobno" class="form-control" value="<%=d.getMobNo() %>">
                            </div>

                            <div class="mb-3">
                                <label class="form-Label ">Password</label> <input required name="password" type="text" class="form-control" value="<%=d.getPassword() %>">
                            </div>
                            
                            <input type ="hidden" name="id" value="<%=d.getId()%>">

                            <button type="submit" class="btn btn-primary col-md-12">Update</button>
                        </form>
                    </div>
                </div>
            </div>

            
            
        </div>
    </div>

</body>
</html>