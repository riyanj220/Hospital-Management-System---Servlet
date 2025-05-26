<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Index Page</title>
    <%@include file="../component/allcss.jsp"%>

    <style>
        .point-card {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }
        .point-card:hover {
            transform: translateY(-5px);
        }
        .point-card img {
            border-radius: 8px;
            margin-bottom: 15px;
            transition: transform 0.3s ease;
        }
        .point-card:hover img {
            transform: scale(1.03);
        }
        .custom-image {
            position: relative;
            top: -42px;
            width: 115%;
        }
    </style>
</head>
<body>

<%@include file="../component/navbar.jsp"%>

<!-- Carousel -->
<div id="carouselExampleIndicators" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/img2.jpg" class="d-block w-100" alt="..." height="500px">
    </div>
    <div class="carousel-item">
      <img src="img/img3.jpg" class="d-block w-100" alt="..." height="500px">
    </div>
    <div class="carousel-item">
      <img src="img/img4.jpg" class="d-block w-100" alt="..." height="500px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- Hero Section -->
<section class="py-5 text-center">
  <div class="container">
    <h1 class="display-5 fw-bold">Welcome to MediHome</h1>
    <p class="lead text-muted">
      We bring compassionate care, cutting-edge technology, and expert staff together to ensure your health and well-being.
    </p>
        <a href="<c:choose>
                <c:when test='${not empty userObj}'>user_appointment.jsp</c:when>
                <c:otherwise>user_login.jsp</c:otherwise>
             </c:choose>"
             class="btn btn-success btn-lg mt-3">
            Book Appointment
        </a>
  </div>
</section>

<!-- Key Features Section -->
<section class="py-5 bg-light">
  <div class="container">
    <h2 class="text-center mb-5 fw-bold">Key Features Of Our Hospital</h2>
    <div class="row g-4">
      <div class="col-md-3">
        <div class="card h-100 text-center shadow-sm">
          <div class="card-body">
            <i class="fas fa-shield-alt fa-2x text-primary mb-3"></i>
            <h5 class="fw-bold">100% Safety</h5>
            <p class="small">State-of-the-art security ensures complete patient and staff protection.</p>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="card h-100 text-center shadow-sm">
          <div class="card-body">
            <i class="fas fa-leaf fa-2x text-success mb-3"></i>
            <h5 class="fw-bold">Clean Environment</h5>
            <p class="small">Sterile surroundings, clean air, and hygiene protocols for safe recovery.</p>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="card h-100 text-center shadow-sm">
          <div class="card-body">
            <i class="fas fa-user-md fa-2x text-info mb-3"></i>
            <h5 class="fw-bold">Friendly Doctors</h5>
            <p class="small">Skilled professionals who treat patients with empathy and excellence.</p>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="card h-100 text-center shadow-sm">
          <div class="card-body">
            <i class="fas fa-cogs fa-2x text-warning mb-3"></i>
            <h5 class="fw-bold">Resource Allocation</h5>
            <p class="small">Smart scheduling and logistics to avoid delays and maximize care.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Why Choose Us Section -->
<section class="py-5 text-center bg-white">
  <div class="container">
    <h2 class="fw-bold mb-4">Why Choose MediHome?</h2>
    <p class="text-muted mb-5">More than just a hospital — we’re your partner in lifelong care.</p>
    <div class="row g-4">
      <div class="col-md-4">
        <i class="fas fa-award fa-2x text-primary mb-2"></i>
        <h5 class="fw-bold">Award-Winning Care</h5>
        <p class="small">Recognized for clinical excellence and innovation.</p>
      </div>
      <div class="col-md-4">
        <i class="fas fa-heartbeat fa-2x text-danger mb-2"></i>
        <h5 class="fw-bold">24/7 Emergency</h5>
        <p class="small">Immediate care with the latest tech and expert staff.</p>
      </div>
      <div class="col-md-4">
        <i class="fas fa-users fa-2x text-success mb-2"></i>
        <h5 class="fw-bold">Community-Focused</h5>
        <p class="small">We believe in building long-term relationships with our patients.</p>
      </div>
    </div>
  </div>
</section>

<!-- Our Team Section -->
<section class="container py-5">
  <p class="text-center fs-2 fw-bold mb-4">Meet Our Dedicated Team</p>
  <div class="row g-4 text-center">
    <div class="col-md-3">
      <div class="card point-card">
        <div class="card-body">
          <img src="img/team1.jpg" width="220px" height="300px" />
          <p class="fw-bold fs-5 mt-2">Samuan Simi</p>
          <p class="fs-7">(CEO and Chairman)</p>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card point-card">
        <div class="card-body">
          <img src="img/team2.jpg" width="220px" height="300px" />
          <p class="fw-bold fs-5 mt-2">Dr. Riyan J</p>
          <p class="fs-7">(Chief Doctor)</p>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card point-card">
        <div class="card-body">
          <img src="img/team3.jpg" width="220px" height="300px" />
          <p class="fw-bold fs-5 mt-2">Dr. Nuise Paule</p>
          <p class="fs-7">(Chief Doctor)</p>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card point-card">
        <div class="card-body">
          <img src="img/team4.jpg" width="220px" height="300px" />
          <p class="fw-bold fs-5 mt-2">Dr. Mathew Samuel</p>
          <p class="fs-7">(Chief Doctor)</p>
        </div>
      </div>
    </div>
  </div>
</section>

<%@include file="../component/footer.jsp"%>

</body>
</html>
