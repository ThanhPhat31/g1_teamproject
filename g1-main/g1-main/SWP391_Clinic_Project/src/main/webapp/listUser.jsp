<%@page import="entity.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                <li>
                    <a href="/admin">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">Dashboard</span>
                    </a>
                </li>
                <li  class="active">
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
                    <a href="/patientList">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Patient Management</span>
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
                <c:if test="${sessionScope.acc.role == 1}">
                    <a href="/profile" class="profile">
                        <img src="assets1/news/${sessionScope.acc.getImage()}">
                    </a>
                </c:if>
            </nav>

            <!-- NAVBAR -->
            <!--        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
                         Navbar Brand
                        <a class="navbar-brand ps-3" href="adminView.jsp">User Management</a>
                         Sidebar Tog gle
            
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
                    </nav>-->          
            <div id="table-head">
                <main>
                    <div class="container-fluid px-4">
                        <div class="card-header text-xl-left">
                            <i class="fas fa-table me-1 " ></i> 
                            User
                        </div>
                        <table class="table table-bordered">
                            <thead id="table-head">
                                <tr>
                                    <th class="text-center">ID</th>                                        
                                    <th class="text-center">Name Of user</th>
                                    <th class="text-center">Date of birth</th>   
                                    <th class="text-center">Gender</th>
                                    <th class="text-center">Address</th>
                                    <th class="text-center">Mail</th>
                                    <th class="text-center">Phone</th>
                                    <th class="text-center">Account</th>
                                    <th class="text-center">Password</th>
                                    <th class="text-center">Role</th>
                                    <th class="text-center">Image</th>
                                </tr>
                            </thead>
                            <c:forEach items="${listP}" var="p">                               
                                <tbody>
                                    <tr class="align-items-center">
                                        <td class="text-center">${p.profileID}</td>                                        
                                        <td class="text-center">${p.firstName} ${p.middleName} ${p.lastName}</td>
                                        <td class="text-center">${p.doB}</td>    
                                        <td class="text-center">${p.gender?"Male":"Female"}</td>
                                        <td class="text-center">${p.address}</td>
                                        <td class="text-center">${p.mail}</td>
                                        <td class="text-center">${p.phone}</td>
                                        <td class="text-center">${p.account}</td>
                                        <td class="text-center">${p.password}</td>                                    
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${p.role == '0'}">
                                                    <p style="color: red">Admin</p>
                                                </c:when>
                                                <c:when test="${p.role == '1'}">
                                                    <p style="color: yellow">Doctor</p>
                                                </c:when>
                                                <c:when test="${p.role == '2'}">
                                                    <p style="color: green">Staff</p>
                                                </c:when>      
                                                    <c:when test="${p.role == '3'}">
                                                    <p style="color: blueviolet">User</p>
                                                </c:when> 
                                            </c:choose>
                                        </td>
                                        <td class="text-center"><img src="assets1/news/${p.image}" class="rounded-circle" width="150px" height="150px" alt="Avatar"></td>    
                                        <td class="text-center align-middle">
                                            <div class="btn-group align-top">

                                                <a class="btn btn-sm btn-outline-primary" href="adminUpdate?id=${p.profileID}">Update</a>
                                                <a class="btn btn-sm btn-outline-secondary " type="submit" href="adminDeleteUser?sid=${p.profileID}" onclick="show()">Delete</a>                                       
                                            </div>

                                        </td>
                                    </tr>
                                </tbody>
                            </c:forEach> 

                        </table> 
                        <a class="btn btn-sm btn-outline-warning " type="submit" href="/addUser" >Add</a>
                        <!--                    <a href="addUser.jsp" class="btn btn-sm btn-outline-secondary "  type="button" data-toggle="modal" data-target="#user-form-modal">Add new User</a>-->


                        <!-- Modal Add-->


                        <!--End Modal Add-->



                        <ul class="pagination ">
                            <li class="page-item"><a class="page-link" href="listUser?index=${tag - 1}">Previous</a></li>
                                <c:forEach  begin="1" end="${endP}" var="i">        
                                <li class="page-item ${tag == i? "active":""}"><a class="page-link" href="listUser?index=${i}">${i}</a></li>
                                </c:forEach>
                            <li class="page-item"><a class="page-link" href="listUser?index=${tag + 1}">Next</a></li>
                        </ul>               
                </main>

            </div>
        </section>

        <!-- ================ -->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>   
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/scripts2.js"></script>
        <script src="assets1/js/script3.js"></script>
    </body>
    <script>
                                                    function show(id) {

                                                        if (option === true) {
                                                            window.location.href = 'adminDeleteUser?sid=' + id;
                                                        }

                                                    }
    </script>
</html>
