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
        <title>Doctor Page</title>
        <link rel="icon" type="image/x-icon" href="assets1/images/favicon.jpg">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets1/css/managerdoctor.css"/>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <style>
            .my-custom-scrollbar {
                position: relative;
                height: 320px;
                overflow: auto;
                margin-bottom: 20px;
            }
            .table-wrapper-scroll-y {
                display: block;
            }
            .card-header{
            }
            profile-nav{
                vertical-align: middle;
                text-align: left;
            }
            .profile-pic{
                vertical-align: middle;
                padding: 8px;
            }
            .profile-pic>img{
                width: 35px;
                height: 35px;
                border-radius: 50%;
                vertical-align: middle;
            }
            .profile-info{
                display: inline-block;                
            }
            .profile-info>span{
                font-size: 12px;
            }
            .profile-info>h5{
                font-size: 16px;
                color: white;
            }
            .profile-info>h5:hover{
                text-decoration: underline;
            }
            
        </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/doctor">Page Manage Doctor</a>
            <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"></div>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    
                    <a class="nav-link row dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">                       
                        <div class="profile-nav" style="display: inline-flex">
                            <div class="profile-pic">    
                                <img src="assets1/news/${acc.getImage()}" alt="${acc.getFullName()}"/>
                            </div>
                            <div class="profile-info">
                                <span>${acc.getStrRole()}</span> 
                                <h5>${acc.middleName} ${acc.lastName}</h5>  
                            </div>
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/profile">Profile</a></li>
                        <li><a class="dropdown-item" href="/home">Home Page</a></li>
                        <li class="hide-btn"><a class="dropdown-item" href="/doctor">Doctor Page</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="/logout">Logout <i class="fa fa-sign-out" aria-hidden="true" style="float: right; padding: 5px 0px;"></i></a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
                    <div class="card-header text-center">
                        <i class="fa fa-tasks" aria-hidden="true"></i> 
                        Examination Cases
                    </div>
                    <div class="table-wrapper-scroll-y my-custom-scrollbar" style="max-height: 100%; height: 100%;">
                        <table class="table table-bordered table-striped mb-0" id="case_list" style="background-color: white">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Patient name</th>
                                    <th>Time</th>
                                    <th>Status</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c" items="${listC}">
                                    <tr>
                                        <td>${c.getCaseID()}</td>
                                        <td>${c.patient.getFullName()}</td>
                                        <td>${c.getTime()}</td>
                                        <td>${c.getStatus()}</td>
                                        <td>
                                            <form action="doctor" method="POST">
                                                <button class="btn btn-sm btn-outline-secondary " type="submit" name="kham">Edit</button>
                                                <input type="text" name="caseID" value="${c.getCaseID()}" style="display: none"/>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <div class="card-header text-center">
                            <i class="fas fa-table me-1 " ></i> 
                            Patients with appointment
                        </div>
                        <div class="table-wrapper-scroll-y my-custom-scrollbar">
                            <table class="table table-bordered" id="first_list">
                                <thead>
                                    <tr>                     
                                        <th class="text-center">Fullname</th>
                                        <th class="text-center">Date of birth</th>   
                                        <th class="text-center">Email</th>
                                        <th class="text-center">Time</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listB}" var="pb"> 
                                        <tr class="align-items-center">        
                                            <td class="text-center">${pb.patient.getFullName()}</td>
                                            <td class="text-center">${pb.patient.getFormatDoB()}</td>
                                            <td class="text-center">${pb.patient.getMail()}</td>
                                            <td class="text-center">${pb.appointment_time}</td>
                                            <td class="text-center align-middle">
                                                <div class="btn-group align-top">
                                                    <form method="POST">                                                    
                                                        <input type="text" name="patientID" value="${pb.patient.getPatientID()}" style="display: none"/>
                                                        <input type="text" name="bookingID" value="${pb.getiD()}" style="display: none"/>
                                                        <input type="text" name="type" value="1" style="display: none"/>
                                                        <button class="btn btn-sm btn-outline-secondary " type="submit" name="kham" formaction="/newcase?action=add">Examination</button>
                                                        <button class="btn btn-sm btn-outline-secondary " type="submit" formaction="/newcase?action=report">Report</button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>

                                    </c:forEach> 
                                </tbody>
                            </table>
                        </div>
                        <div class="card-header text-center">
                            <i class="fas fa-table me-1 " ></i> 
                            Patients in queue
                        </div>
                        <div class="table-wrapper-scroll-y my-custom-scrollbar">
                            <table class="table table-bordered" id="normal_list">
                                <thead>
                                    <tr>
                                        <th class="text-center">Fullname</th>      
                                        <th class="text-center">Date of birth</th>      
                                        <th class="text-center">Email</th>
                                        <th class="text-center">Time</th> 
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listN}" var="pn">                             

                                        <tr class="align-items-center">        
                                            <td class="text-center">${pn.patient.getFullName()}</td>
                                            <td class="text-center">${pn.patient.getFormatDoB()}</td>
                                            <td class="text-center">${pn.patient.getMail()}</td>
                                            <td class="text-center">${pn.time}</td>

                                            <td class="text-center align-middle">
                                                <div class="btn-group align-top">
                                                    <form method="POST">
                                                        <input type="text" name="patientID" value="${pn.patient.getPatientID()}" style="display: none"/>
                                                        <input type="text" name="bookingID" value="${pn.getiD()}" style="display: none"/>
                                                        <input type="text" name="type" value="2" style="display: none"/>
                                                        <button class="btn btn-sm btn-outline-secondary " type="submit" name="kham" formaction="/newcase?action=add">Examination</button>
                                                        <button class="btn btn-sm btn-outline-secondary " type="submit" formaction="/newcase?action=report">Report</button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach> 
                                </tbody>
                            </table>
                        </div> 
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        
    <script>
        function show(id) {
            var option = confirm('Are you sure to delete');
            if (option === true) {
                window.location.href = 'deletelist?sid=' + id;
            }

        }
    </script>

</html>
