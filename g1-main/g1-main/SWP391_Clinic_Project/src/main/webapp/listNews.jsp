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
                <li>
                    <a href="/listUser">
                        <i class='bx bxs-group' ></i>
                        <span class="text">User Management</span>
                    </a>
                </li>
                <li class="active">
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
        <!--        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
                     Navbar Brand
                    <a class="navbar-brand ps-3" href="adminView.jsp">News Management</a>
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
                </nav>-->

        <div id="table-head">
            <main>
                <div class="container-fluid px-4">
                    <div class="card-header text-xl-left">
                        <i class="fas fa-table me-1 " ></i> 
                        News
                    </div>
                    <table class="table table-bordered">
                        <thead id="table-head">
                            <tr>
                                <th class="text-center">ID</th>                                        
                                <th class="text-center">Category</th>
                                <th class="text-center">Title</th>                                       
                                <th class="text-center">Content</th>
                                <th class="text-center">Date</th>
                                <th class="text-center">Author</th>
                                <th class="img-thumbnail">Image 1</th>
                                <th class="img-thumbnail">Image 2</th>
                            </tr>
                        </thead>
                        <c:forEach items="${listP}" var="p">                               
                            <tbody>
                                <tr class="align-items-center">
                                    <td class="text-center">${p.id}</td>                                        
                                    <td class="text-center">${p.category}</td>
                                    <td class="text-center">${p.title}</td>                                       
                                    <td class="text-center">${p.content}</td>
                                    <td class="text-center">${p.date}</td>
                                    <td class="text-center">${p.author}</td>  
                                    <td class="text-center"><img src="assets1/news/${p.image1}" width="400px" height="200px"></td>
                                    <td class="text-center"><img src="assets1/news/${p.image2}" width="400px" height="200px"></td>
                                    <td class="text-center align-middle">
                                        <div class="btn-group align-top">

                                            <a class="btn btn-sm btn-outline-secondary" href="updateNews?nid=${p.id}">Update</a>
                                            <a class="btn btn-sm btn-outline-secondary" href="deleteNews?nid=${p.id}"  onclick="show()">Delete</a>                                          
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </c:forEach> 

                    </table>
                    <a class="btn btn-sm btn-outline-secondary" href="admin-new-add.jsp">Add</a>
                    <ul class="pagination ">
                        <li class="page-item"><a class="page-link" href="listnews?index=${tag - 1}">Previous</a></li>
                            <c:forEach  begin="1" end="${endP}" var="i">        
                            <li class="page-item ${tag == i? "active":""}"><a class="page-link" href="listnews?index=${i}">${i}</a></li>
                            </c:forEach>
                        <li class="page-item"><a class="page-link" href="listnews?index=${tag + 1}">Next</a></li>
                    </ul>               
            </main>

        </div>

    </section>
    <!-- ================ -->
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
                                                    window.alert("Delete success");
                                                    if (option === true) {
                                                        window.location.href = 'deleteNews?nid=' + id;
                                                    }

                                                }
</script>
</html>
