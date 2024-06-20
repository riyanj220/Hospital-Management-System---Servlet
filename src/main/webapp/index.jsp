<!-- <%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%> -->

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
            margin-bottom: 20px;
        }
        .custom-image {
            position: relative;
            top: -42px;
            width: 115%; /* Make the image smaller, adjust percentage as needed */
        }
    </style>

</head>
<body>

    <%@include file="../component/navbar.jsp"%>

    <!-- <% 
      Connection con = DBConnect.getCon(); 
          if (con != null) {
              out.println("Connection successful: " + con);
          } else {
              out.println("Failed to establish connection.");
            }
    %> -->

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


    <div class ="container p-3">
        <p class="text-center fs-2" style="margin-top: 15px; font-weight: bold;">Key Features Of Our Hospital</p>

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
                                <p>Ensuring a spotless environment: gleaming surfaces and pure air to safeguard patient health and recovery</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class = "card point-card">
                            <div class="card-body">
                                <p class ="fs-5">Friendly Doctors</p>
                                <p>
                                  Empowering care: warm hearts and skilled hands comforting every patient thats the pleasure.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class = "card point-card">
                            <div class="card-body">
                                <p class ="fs-5">Resource Allocation</p>
                                <p>Efficiency in action: seamless resource management maximizes care without waste or delay.</p>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

            <div class ="col-md-4">
                <img alt="" src = "img/img7.jpg" class="custom-image">
            </div>


        </div>
    </div>
    <hr>

    <div class ="container p-2">
      <p class ="text-center fs-2" style="font-weight: bold;"> Our Team </p>

      <div class ="row">

        <div class ="col-md-3">
          <div class ="card point-card">
            <div class ="card-body text-center">
              <img src ="img/team1.jpg" width="220px" height="300px">
              <p class ="fw-bold fs-5"> Samuan Simi</p>
              <p class ="fs-7"> (CEO and Chairman)</p>
            </div>
          </div>
        </div>

        <div class ="col-md-3">
          <div class ="card point-card">
            <div class ="card-body text-center">
              <img src ="img/team2.jpg" width="220px" height="300px">
              <p class ="fw-bold fs-5"> Dr. Riyan J</p>
              <p class ="fs-7"> (Cheif Doctor)</p>
            </div>
          </div>
        </div>

        <div class ="col-md-3">
          <div class ="card point-card">
            <div class ="card-body text-center">
              <img src ="img/team3.jpg" width="220px" height="300px">
              <p class ="fw-bold fs-5"> Dr. Nuise Paule</p>
              <p class ="fs-7"> (Cheif Doctor)</p>
            </div>
          </div>
        </div>

        <div class ="col-md-3">
          <div class ="card point-card">
            <div class ="card-body text-center">
              <img src ="img/team4.jpg" width="220px" height="300px">
              <p class ="fw-bold fs-5"> Dr. Mathew Samuel</p>
              <p class ="fs-7"> (Cheif Doctor)</p>
            </div>
          </div>
        </div>


      </div>

    </div>
    

    <%@include file="../component/footer.jsp"%>
</body>
</html>
