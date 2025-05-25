<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<head>


<style>
  .navbar {
    background: linear-gradient(to right, #4e73df, #1cc88a);
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    padding-top: 12px;
    padding-bottom: 12px;
    min-height: 70px;
  }

  .navbar-brand {
    font-weight: bold;
    font-size: 1.6rem;
    color: white !important;
  }

  .navbar-brand i {
      font-size: 1.6rem; /* Icon size in brand */
      margin-right: 8px;
      margin-left:1rem;
  }

  .nav-label {
    font-weight: bold;
    font-size: 1.1rem; /* Increase as needed */
    margin-left: 6px;   /* spacing between icon and text */
  }

  .navbar-nav .nav-link {
    color: white !important;
    margin-right: 15px;
    transition: all 0.3s ease-in-out;
  }

  .navbar-nav .nav-link:hover {
    color: #f8f9fc !important;
    transform: translateY(-2px);
  }

  .dropdown-menu {
    border-radius: 8px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
  }

  .dropdown-toggle {
    font-weight: 500;
  }

  .btn.dropdown-toggle {
    border: none;
  }

  .nav-button {
    margin-left: 10px;
  }
</style>

</head>

<script src="http://localhost:35729/livereload.js?snipver=1"></script>
<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">
      <i class="fas fa-clinic-medical me-2"></i>MEDI HOME
    </a>

    <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

        <!-- Show when user is NOT logged in -->
        <c:if test="${empty userObj}">
          <li class="nav-item">
            <a class="nav-link" href="user_login.jsp">
              <i class="fa-solid fa-user fa-xl"></i>
              <span class="nav-label">User</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="doctor_login.jsp">
              <i class="fa-solid fa-user-doctor fa-xl"></i>
              <span class="nav-label">Doctor</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="admin_login.jsp">
              <i class="fa-solid fa-right-to-bracket fa-xl"></i>
              <span class="nav-label">Admin</span>
            </a>
          </li>
        </c:if>

        <!-- Show when user IS logged in -->
        <c:if test="${not empty userObj}">
          <li class="nav-item">
            <a class="nav-link" href="view_appointment.jsp">
              <i class="fa-solid fa-calendar-check fa-xl"></i>
              <span class="nav-label">View Appointment</span>
            </a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="user_appointment.jsp">
              <i class="fa-regular fa-calendar-check fa-xl"></i>
              <span class="nav-label">Book Appointment</span>
            </a>
          </li>

          <li class="nav-item dropdown">
            <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown">
              <i class="fa-solid fa-circle-user fa-xl"></i>
              <span class="nav-label">${userObj.fullName}</span>
            </button>

            <!-- ⛔️ No changes made to this dropdown menu as per your request -->
            <ul class="dropdown-menu dropdown-menu-end">
              <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
              <li><a class="dropdown-item" href="userLogout">Logout</a></li>
            </ul>
          </li>
        </c:if>

      </ul>
    </div>
  </div>
</nav>

