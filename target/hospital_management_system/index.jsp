<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Index Page</title>
    <%@include file="../component/allcss.jsp"%>

    <style type = "text/css">
        .point-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>

</head>
<body>

    <%@include file="../component/navbar.jsp"%>

    <div id="carouselExampleIndicators" class="carousel slide">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>

        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="img/img1.jpg" class="d-block w-100" alt="..." height="500px">
          </div>
          <div class="carousel-item">
            <img src="img/img2.jpg" class="d-block w-100" alt="..." height="500px">
          </div>
          <div class="carousel-item">
            <img src="img/img3.jpg" class="d-block w-100" alt="..." height="500px">
          </div>
          <div class="carousel-item">
            <img src="img/img4.jpg" class="d-block w-100" alt="..." height="500px">
          </div>
          <div class="carousel-item">
            <img src="img/img5.jpg" class="d-block w-100" alt="..." height="500px">
          </div>
          <div class="carousel-item">
            <img src="img/img6.jpg" class="d-block w-100" alt="..." height="500px">
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


    <div class ="container p-3">
        <p class="text-center fs-2">Key features of our hospital</p>

        <div class="row">
            <div class = "col-md-8 p-5">
                <div class="row">
                    <div class="col-md-6">
                        <div class = "card point-card">
                            <div class="card-body">
                                <p class ="fs-5">100% Safety</p>
                                <p>Ensuring the safety of our patients and staff with state-of-the-art security measures around the clock.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class = "card point-card">
                            <div class="card-body">
                                <p class ="fs-5">Clean Environment</p>
                                <p>Ensuring a pristine environment: Where every surface gleams and every breath is pure, safeguarding patient health and recovery.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class = "card point-card">
                            <div class="card-body">
                                <p class ="fs-5">Friendly Doctors</p>
                                <p>Empowering care through warm hearts and skilled hands: Where every patient encounter feels like a comforting embrace in the journey to health.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class = "card point-card">
                            <div class="card-body">
                                <p class ="fs-5">Resource Allocation</p>
                                <p>In the heartbeat of efficiency, resources are orchestrated seamlessly, maximizing care without waste or delay.</p>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

            <div class ="col-md-4">
                <img alt="" src = "img/img7.jpg">
            </div>


        </div>
    </div>
    
</body>
</html>
