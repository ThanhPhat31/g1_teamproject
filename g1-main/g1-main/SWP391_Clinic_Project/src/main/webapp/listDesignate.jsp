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
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets1/css/managerdoctor.css"/>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="assets1/css/style1.css">
        <style>
            .my-custom-scrollbar {
                position: relative;
                max-height: 600px;
                min-height: 60px;
                overflow: auto;
                margin-bottom: 10px;
            }
            .table-wrapper-scroll-y {
                display: block;
            }
        </style>
    </head>
    <body>       
        <section id="sidebar">
            <a href="/staff" class="brand">
                <i class='bx bxs-smile'></i>
                <span class="text">Staff</span>
            </a>
            <ul class="side-menu top">


                <li>
                    <a href="/normalbooking">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Medical Waiting List</span>
                    </a>
                </li>
               
                <li>
                    <a href="/listbooking">
                        <i class='bx bxs-cog' ></i>
                        <span class="text">List Booking </span>
                    </a>
                </li>
                 <li>
                    <a href="/designate">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Designated List</span>
                    </a>
                </li>
            </ul>
            <ul class="side-menu">

                <li>
                    <a href="/logout" class="logout">
                        <i class='bx bxs-log-out-circle' ></i>
                        <span class="text">Logout</span>
                    </a>
                </li>
            </ul>
        </section>
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
                <a href="/profile" class="profile">
                     <img src="assets1/images/favicon.jpg">
                </a>               
            </nav>

            <div id="table-head">
                <main>
                    <div class="container-fluid px-4">
                        <div class="card-header text-xl-left">
                            <i class="fas fa-table me-1 " ></i> 
                            Designated List
                        </div>
                        <div class="table-wrapper-scroll-y my-custom-scrollbar">
                        <table class="table table-bordered">
                            <thead id="table-head">
                                <tr>
                                    <th class="text-center">Case ID</th>                                        
                                    <th class="text-center">Doctor Name</th>
                                    <th class="text-center">Patient Name</th>   
                                    <th class="text-center">Date</th>
                                    <th class="text-center">Time</th>
                                    <th class="text-center">Designate Name</th>
                                    <th class="text-center">Description</th>
                                    <th class="text-center">Result</th>

                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <c:forEach items="${listDesignate}" var="p">                               
                                <tbody>
                                    <tr class="align-items-center">
                                        <td class="text-center">${p.getCase().getCaseID()}</td>
                                        <td class="text-center">${p.getCase().getDoctor().getFullName()}</td>                                        
                                        <td class="text-center">${p.getCase().getPatient().getFullName()}</td>
                                        <td class="text-center">${p.getCase().getDate()}</td>    
                                        <td class="text-center">${p.getCase().getTime()}</td>                                      
                                        <td class="text-center">${p.name}</td>
                                        <td class="text-center">${p.description}</td>
                                        <td class="text-center">${p.result}</td>

                                        <td class="text-center align-middle">
                                            <div class="btn-group align-top">

                                                <a class="btn btn-sm btn-outline-secondary"  href="editDesignate?cid=${p.getCase().getCaseID()}&pid=${p.getDesignateID()}">Update</a>

                                            </div>

                                        </td>

                                    </tr>
                                </tbody>
                            </c:forEach> 

                        </table> 
                        </div>
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
    </body>

</html>
