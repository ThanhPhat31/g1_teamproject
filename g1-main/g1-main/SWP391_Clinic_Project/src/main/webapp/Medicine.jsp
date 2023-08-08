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
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="assets1/css/style1.css">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets1/css/managerdoctor.css"/>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>


        <link rel="stylesheet" href="assets1/css/bootstrap.min.css">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>


        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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

                <li class="active">
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
            <div id="table-head">
                <main>
                    <div class="container-fluid px-4">
                        <div class="card-header text-xl-left">
                            <i class="fas fa-table me-1 " ></i> 
                            Medicine Management
                        </div>
                        <table class="table table-bordered">
                            <thead id="table-head">
                                <tr> 
                                    <th class="text-center">DesignateID</th>
                                    <th class="text-center">Name</th>
                                    <th class="text-center">Price</th>   
                                    <th class="text-center">Actios</th>   

                                </tr>
                            </thead>
                            <c:forEach items="${listmedicine}" var="lmm" varStatus="status">
                                <tr>
                                    <td>${lmm.getMedicineID()}</td>
                                    <td>${lmm.getName()}</td>
                                    <td>${lmm.getDescription()}</td>
                                    <td>
                                        <button type="button" class="btn btn-success group-btn" data-toggle="modal" data-target="#update${status.index}">
                                            Update
                                        </button>
                                        <button onclick="confirmDeleteMedicine('${lmm.getMedicineID()}')" class="btn btn-success group-btn">Delete</button>
                                        <!-- Modal dialog để update medicine -->
                                        <div class="modal fade" id="update${status.index}" tabindex="-1" role="dialog" aria-labelledby="myUpdate${status.index}">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title" id="myUpdate${status.index}">Medicine</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <form method="post" action="medicine">
                                                        <div class="modal-body">
                                                            <input type="hidden" name="uid" value="${lmm.getMedicineID()}">
                                                            <input type="text" id="s_name" name="nameUpdate" value="${lmm.getName()}" class="form-control" placeholder="Name">
                                                            <input type="text" id="s_description" name="descriptionUpdate" value="${lmm.getDescription()}" class="form-control" placeholder="Description">
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <input type="submit" name="update" class="btn btn-success" value="Update">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <!--Add-->



                            <!-- Button trigger modal-->


                            <!--Modal: modalConfirmDelete-->
                            <div class="modal fade" id="modalConfirmDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-sm modal-notify modal-danger" role="document">
                                    <!--Content-->
                                    <div class="modal-content text-center">
                                        <!--Header-->
                                        <div class="modal-header d-flex justify-content-center">
                                            <p class="heading">Are you sure?</p>
                                        </div>

                                        <!--Body-->
                                        <div class="modal-body">

                                            <i class="fas fa-times fa-4x animated rotateIn"></i>

                                        </div>

                                        <!--Footer-->
                                        <div class="modal-footer flex-center">
                                            <a href="" class="btn  btn-outline-danger">Yes</a>
                                            <a type="button" class="btn  btn-danger waves-effect" data-dismiss="modal">No</a>
                                        </div>
                                    </div>
                                    <!--/.Content-->
                                </div>
                            </div>
                            <!--Modal: modalConfirmDelete-->    





                        </table>
                        <button type="button" class="btn btn-success group-btn" data-toggle="modal" data-target="#add">
                            Add Medicine
                        </button>
                        <!-- Modal -->
                        <form action="medicine" method="post">
                            <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myAdd">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="myAdd">Medicine</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <input  type="text" id="s_id" name="name"  class="form-control"  placeholder="Name">
                                            <input  type="text" id="s_id" name="description"  class="form-control"  placeholder="Description">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <input type="submit" name="update" class="btn btn-success" value="Add">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!--                    Update-->
                        <div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myUpdate">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="myUpdate">Medicine</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form method="post" action="medicine">
                                        <div class="modal-body">
                                            <c:forEach items="${stUpdate}" var="stU">
                                                <input type="text" id="s_id" name="id" value="${stU.getMedicineID()}" class="form-control" placeholder="ID">
                                                <input type="text" id="s_name" name="name" value="${stU.getName()}" class="form-control" placeholder="Name">
                                                <input type="text" id="s_description" name="description" value="${stU.getDescription()}" class="form-control" placeholder="Description">
                                            </c:forEach>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <input type="submit" name="update" class="btn btn-success" value="Add">
                                        </div>
                                    </form>
                                </div>



                            </div>
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
                                            function confirmDeleteMedicine(id) {
                                                if (confirm("Are you sure you want to delete?")) {
                                                    window.location.href = 'medicine?sid=' + id;

                                                }
                                            }
    </script>
</html>