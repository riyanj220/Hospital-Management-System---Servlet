<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="../component/allcss.jsp"%>
</head>
<body>

    <c:if test="${empty doctObj}">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>
    <%@include file="navbar.jsp"%>
    
</body>
</html>