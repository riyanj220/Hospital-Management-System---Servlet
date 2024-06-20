<style>
    .custom-admin-button {
    background-color: white !important;
    color: black !important;
    border-radius: 8px;
    padding: 5px 10px;
    margin-top: 5px;
}

.custom-admin-button:hover {
    background-color: #f8f9fa !important;
    color: black !important;
    text-decoration: none;
}
</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <i class="fas fa-clinic-medical"></i> Home
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"> 
                    <a class="nav-link active" href="index.jsp">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
            </ul> -->
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"> 
                    <a class="nav-link active" href="doctor.jsp"> 
                        <i class="fa-solid fa-user-doctor"></i> Doctors
                    </a>
                </li>
                <li class="nav-item"> 
                    <a class="nav-link active" href="patient.jsp">
                        <i class="fa-solid fa-hospital-user"></i> Patients
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle custom-admin-button" href="#" id="dropdownMenuButton1" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        Admin
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
