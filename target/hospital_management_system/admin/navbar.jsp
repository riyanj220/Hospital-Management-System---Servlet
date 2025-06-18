<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

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
    display: flex;
    align-items: center;
  }

  .navbar-brand i {
    font-size: 1.6rem;
    margin-right: 8px;
    margin-left: 1rem;
  }

  .nav-label {
    font-weight: bold;
    font-size: 1.1rem;
    margin-left: 6px;
  }

  .navbar-nav .nav-link {
    color: white !important;
    margin-right: 15px;
    font-size: 1.05rem;
    display: flex;
    align-items: center;
    gap: 6px;
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
    font-size: 1.05rem;
  }

  .dropdown-toggle i {
    font-size: 1.2rem;
    margin-right: 5px;
  }

  .btn.dropdown-toggle {
    border: none;
    background-color: white !important;
    color: black !important;
    border-radius: 8px;
    padding: 6px 12px;
  }

  .btn.dropdown-toggle:hover {
    background-color: #f8f9fa !important;
    color: black !important;
  }
</style>

<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">
      <i class="fas fa-clinic-medical"></i> MEDI HOME
    </a>

    <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
      aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="doctor.jsp">
            <i class="fa-solid fa-user-doctor fa-xl"></i>
            <span class="nav-label">Doctors</span>
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="patient.jsp">
            <i class="fa-solid fa-hospital-user fa-xl"></i>
            <span class="nav-label">Patients</span>
          </a>
        </li>

        <li class="nav-item dropdown">
          <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fas fa-user-shield"></i>
            <span class="nav-label">Admin</span>
          </button>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
