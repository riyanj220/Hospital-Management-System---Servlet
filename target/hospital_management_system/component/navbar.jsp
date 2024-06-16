<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<style>
  .navbar-nav.ms-auto {
            margin-right: 15px; /* Adjust the value as needed */
        }
</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">
      <a class="navbar-brand" href="index.jsp"><i class="fas fa-clinic-medical"></i> MEDI HOME</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

          <c:if test="${empty userObj}">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="user_login.jsp"><i class="fa-solid fa-user"></i> User</a>
              </li>
              <!-- <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="user_appointment.jsp"><i class="fa-solid fa-calendar-check"></i> Appointment</a>
              </li> -->
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="doctor_login.jsp"><i class="fa-solid fa-user-doctor"></i> Doctor</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="admin_login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Admin</a>
              </li>
          </c:if>
          
          <c:if test="${not empty userObj}">

            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#"><i class="fa-solid fa-calendar-check"></i> View Appointment</a>
            </li>        

            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="user_appointment.jsp"><i class="fa-regular fa-calendar-check"></i> Book Appointment</a>
            </li>

            <div class="dropdown active">
              <button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class ="fa-solid fa-circle-user"></i> ${userObj.fullName}
              </button>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Change password</a></li>
                <li><a class="dropdown-item" href="userLogout">Logout</a></li>
              </ul>
            </div>

          </c:if>

        </ul>
      </div>
    </div>
  </nav>