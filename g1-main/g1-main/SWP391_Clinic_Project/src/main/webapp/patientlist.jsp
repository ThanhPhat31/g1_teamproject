<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>
        Doctor
    </title>
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
                <li class="active">
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
        <section id="content">
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

            <div id="table-head">
                <main>
                    <div class="container-fluid px-4">
                        <div class="card-header text-xl-left">
                            <i class="fas fa-table me-1 " ></i> 
                            Patient
                        </div>
                        <table class="table table-bordered">
                            <thead id="table-head">
                                <tr> 
                                    <th class="text-center">ID</th>
                                    <th class="text-center">Name Of Patient</th>
                                    <th class="text-center">Date Of Birth</th>   
                                    <th class="text-center">Gender</th>
                                    <th class="text-center">Address</th>
                                    <th class="text-center">Mail</th>
                                    <th class="text-center">Phone</th>
                                    <th class="text-center">Date</th>
                                    <th class="text-center">Time</th>

                                </tr>
                            </thead>
                            <c:forEach items="${listPatient}" var="p">                               
                                <tbody>
                                    <tr class="align-items-center"> 
                                        <td class="text-center">${p.id}</td>
                                        <td class="text-center">${p.getFullName()}</td>
                                        <td class="text-center">${p.dob}</td>    
                                        <td class="text-center">${p.gender?"FeMale":"Male"}</td>
                                        <td class="text-center">${p.address}</td>
                                        <td class="text-center">${p.mail}</td>
                                        <td class="text-center">${p.phone}</td>
                                        <td class="text-center">${p.date}</td>
                                        <td class="text-center">${p.time}</td>
                                        </td>
                                    </tr>
                                </tbody>
                            </c:forEach> 


                        </table>

                        <ul class="pagination ">
                            <li class="page-item"><a class="page-link" href="listUser?index=${tag - 1}">Previous</a></li>
                                <c:forEach  begin="1" end="${endP}" var="i">        
                                <li class="page-item ${tag == i? "active":""}"><a class="page-link" href="listUser?index=${i}">${i}</a></li>
                                </c:forEach>
                            <li class="page-item"><a class="page-link" href="listUser?index=${tag + 1}">Next</a></li>
                        </ul>
                    </div>
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
        <script src="js/scripts3.js"></script>
    </body>
    <script>
        function show(id) {
            var option = true;
            if (option === true) {
                window.location.href = 'cancelbook?sid=' + id;
            }
        }

        function SearchByLastName(param) {
            var txtSearch = param.value;
            $.ajax({
                url: "/searchPatient",
                type: "post",
                data: {
                    txt: txtSearch
                },
                success: function (data) {
                    var row = document.getElementById("content");
                    row.innerHTML = data;
                },
                error: function (xhr) {

                }
            });
        }
    </script>
</html>
