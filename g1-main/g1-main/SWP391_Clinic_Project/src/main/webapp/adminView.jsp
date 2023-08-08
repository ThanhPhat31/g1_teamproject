<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin</title>
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="assets1/css/style1.css">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets1/css/managerdoctor.css"/>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

    </head>
    <body>


        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="/admin" class="brand">
                <i class='bx bxs-smile'></i>
                <span class="text">Admin</span>
            </a>
            <ul class="side-menu top">
                <li class="active">
                    <a href="/admin">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="/listUser">
                        <i class='bx bxs-group' ></i>
                        <span class="text">User Management</span>
                    </a>
                </li>
                <li>
                    <a href="/listnews">
                        <i class='bx bxs-doughnut-chart' ></i>
                        <span class="text">News Management</span>
                    </a>
                </li>
                <li>
                    <a href="/adminService">
                        <i class='bx bxs-message-dots' ></i>
                        <span class="text">Service Management</span>
                    </a>
                </li>
                <li>
                    <a href="/listProduct">
                        <i class='bx bxs-dollar-circle' ></i>
                        <span class="text">Product Management</span>
                    </a>
                </li>
               

                <li>
                    <a href="/designateManagement">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Designate Management</span>
                    </a>
                </li>

                <li>
                    <a href="/medicine">
                        <i class='bx bxs-cog' ></i>
                        <span class="text">Medicine Management </span>
                    </a>
                </li>
            </ul>
            <ul class="side-menu">
                <li>
                    <a href="/message">
                        <i class='bx bxs-cog' ></i>
                        <span class="text">Message</span>
                    </a>
                </li>
                <li>
                    <a href="/logout" class="logout">
                        <i class='bx bxs-log-out-circle' ></i>
                        <span class="text">Logout</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- SIDEBAR -->



        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>

                <form action="#">
                    <div class="form-input">
                        <input type="search" placeholder="Search...">
                        <button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
                    </div>
                </form>
                <input type="checkbox" id="switch-mode" hidden>
                <label for="switch-mode" class="switch-mode"></label>
                <!--			<a href="#" class="notification">
                                                <i class='bx bxs-bell' ></i>
                                                <span class="num">8</span>
                                        </a>-->
                <c:if test="${sessionScope.acc.role == 1}">
                    <a href="/profile" class="profile">
                        <img src="assets1/news/${sessionScope.acc.getImage()}">
                    </a>
                </c:if>
            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Dashboard</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a class="active" href="/admin">Dashboard</a>
                            </li>


                        </ul>
                    </div>
                    <!--				<a href="#" class="btn-download">
                                                            <i class='bx bxs-cloud-download' ></i>
                                                            <span class="text">Download PDF</span>
                                                    </a>-->
                </div>

                <ul class="box-info">
                    <li>
                        <i class='bx bxs-group' ></i>
                        <span class="text">
                            <h3>${requestScope.totalAcc}</h3>
                            <p>User</p>
                        </span>
                    </li>
                    <li>
                        <i class='bx bxs-smile' ></i>
                        <span class="text">
                            <h3>${requestScope.totalDoc}</h3>
                            <p>Doctor</p>
                        </span>
                    </li>
                    <li>
                        <i class='bx bxs-dollar-circle' ></i>
                        <span class="text">
                            <h3>${requestScope.totalPro}</h3>
                            <p>Product</p>
                        </span>
                    </li>
                </ul>


                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>User</h3>                     
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>User</th>
                                    <th>Date of birth</th>
                                    <th>Account</th>
                                </tr>
                            </thead>
                            <c:forEach items="${listP}" var="p">
                                <tbody>
                                    <tr>
                                        <td>
                                            <img src="assets1/news/${p.image}">
                                            <p>${p.firstName} ${p.middleName} ${p.lastName}</p>
                                        </td>
                                        <td>${p.doB}</td>
                                        <td>${p.account}</td>
                                        <!--                                    <td><span class="status completed">Completed</span></td>-->
                                    </tr>

                                </tbody>
                            </c:forEach>
                        </table>
                        <ul class="pagination ">
                            <li class="page-item"><a class="page-link" href="admin?index=${tag - 1}">Previous</a></li>
                                <c:forEach  begin="1" end="${endP}" var="i">        
                                <li class="page-item ${tag == i? "active":""}"><a class="page-link" href="admin?index=${i}">${i}</a></li>
                                </c:forEach>
                            <li class="page-item"><a class="page-link" href="admin?index=${tag + 1}">Next</a></li>
                        </ul> 
                    </div>
                <!--				<div class="todo">
                                                        <div class="head">
                                                                <h3>Todos</h3>
                                                                <i class='bx bx-plus' ></i>
                                                                <i class='bx bx-filter' ></i>
                                                        </div>
                                                        <ul class="todo-list">
                                                                <li class="completed">
                                                                        <p>Todo List</p>
                                                                        <i class='bx bx-dots-vertical-rounded' ></i>
                                                                </li>
                                                                <li class="completed">
                                                                        <p>Todo List</p>
                                                                        <i class='bx bx-dots-vertical-rounded' ></i>
                                                                </li>
                                                                <li class="not-completed">
                                                                        <p>Todo List</p>
                                                                        <i class='bx bx-dots-vertical-rounded' ></i>
                                                                </li>
                                                                <li class="completed">
                                                                        <p>Todo List</p>
                                                                        <i class='bx bx-dots-vertical-rounded' ></i>
                                                                </li>
                                                                <li class="not-completed">
                                                                        <p>Todo List</p>
                                                                        <i class='bx bx-dots-vertical-rounded' ></i>
                                                                </li>
                                                        </ul>
                                                </div>-->
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


        <script src="assets1/js/script3.js"></script>
    </body>
    <!--    <body class="sb-nav-fixed">
            <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
                 Navbar Brand
                <a class="navbar-brand ps-3" href="#">Admin</a>
                 Sidebar Toggle
    
                 Navbar Search
                <form  action="searchbook" method="post"  class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                    <div class="input-group">
                        <input name="txt" class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                        <button class="btn btn-primary" id="btnNavbarSearch" type="submit" ><i class="fas fa-search"></i></button>
                    </div>
                </form>
                 Navbar
                <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/profile">Profile</a></li>
                            <li><a class="dropdown-item" href="/change">ChangePass</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="/logout">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div id="layoutSidenav">
                <div id="layoutSidenav_nav">
                    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                        <div class="sb-sidenav-menu">
                            <div class="nav">
                                <div class="sb-sidenav-menu-heading">Core</div>
                                <a class="nav-link" href="/listUser">
                                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                    User Management
                                </a>
                                <div class="sb-sidenav-menu-heading">Interface</div>
                                <a class="nav-link" href="/listnews">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    News Management
                                </a>
                                <a class="nav-link" href="/adminService">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    Service Management
                                </a>
                                <a class="nav-link" href="/patientList">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    Patient Management
                                </a>
    
                                <div class="sb-sidenav-menu-heading">Examination</div>
                                <a class="nav-link" href="/designate">
                                    <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                    Designated List
                                </a>
                                <a class="nav-link" href="/normalbooking">
                                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                    Medical Waiting List
                                </a>
                                <a class="nav-link" href="/designateManagement">
                                    <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>                               
                                    Designate Management
                                </a>
                                <a class="nav-link" href="/medicine">
                                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                    Medicine Management 
                                </a>
    
                                <a class="nav-link" href="/message">
                                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                    Message
                                </a>
                            </div>
                        </div>
    
                    </nav>
                </div>
    
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/scripts2.js"></script>
    </body>-->

</html>
