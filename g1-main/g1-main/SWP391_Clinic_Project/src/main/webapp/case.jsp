<%-- 
    Document   : case
    Created on : Feb 19, 2023, 3:00:17 PM
    Author     : ThangDT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="deDAO" class="com.dao.designateDAO"  scope="request"/>
<jsp:useBean id="meDAO" class="com.dao.medicineDAO" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Case Detail</title>
        <link rel="icon" type="image/x-icon" href="assets1/images/favicon.jpg">
        <link rel="shortcut icon" href="assets1/images/fav.jpg">
        <link rel="stylesheet" href="assets1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets1/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="assets1/css/style.css" />
        <link href="bodycss/css/case.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets1/css/managerdoctor.css"/>
        <link rel="stylesheet" href="assets1/css/case.css"/>
        <script src="bodycss/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            .my-custom-scrollbar {
                position: relative;
                max-height: 180px;
                min-height: 60px;
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
            .show-btn{
                display: none;
            }
        </style>
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" style="color: white">Case Detail</a>
            <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"></div>
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
                        <li class="show-btn"><a class="dropdown-item" href="/historyPatient">Medical History</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="/logout">Logout <i class="fa fa-sign-out" aria-hidden="true" style="float: right; padding: 5px 0px;"></i></a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="container" style="margin-top: 30px;">
            <div class="row">
                <div class="col-sm-8">
                    <h5>Patient information</h5>
                    <table class="table">
                        <tr>
                            <td colspan="3">Full Name: ${patient.getFullName()}</td>                            
                        </tr>
                        <tr>
                            <td colspan="2">Date of birth: ${patient.getFormatDoB()}</td>
                            <td>Gender: ${patient.getGender()?"Male":"Female"}</td>
                        </tr>
                        <tr>
                            <td colspan="3">Address: ${patient.getAddress()}</td>
                        </tr>
                        <tr>                            
                            <td colspan="2">Email: ${patient.getMail()}</td>
                            <td>Phone: ${patient.getPhone()}</td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-4">
                    <h5>Doctor information</h5>
                    <table class="table">
                        <tr>
                            <td>Doctor: ${doctor.getFullName()}</td>
                        </tr>
                        <tr>
                            <td>Email: ${doctor.getMail()}</td>
                        </tr>
                        <tr>
                            <td>Position: ${doctor.getPosition()}</td>
                        </tr>
                        <tr>
                            <td>Department: ${doctor.getDepartment()}</td>
                        </tr>
                    </table>
                </div>

            </div>



            <div class="row">
                <div class="col-sm-6">
                    <h5>Examination detail</h5>
                    <form method="POST">
                        <table class="table">
                            <tr>
                                <td>Case ID: ${ck.getCaseID()}</td>
                                <td>Date: ${ck.getDate()}</td>
                                <td>Time: ${ck.getTime()}</td>
                                <td>Status: ${ck.getStatus()}</td>
                            </tr>   
                            <tr>
                                <td colspan="4" >Diagnose:<textarea class="form-control textarea-vertical" name="description" >${ck.getDescription()}</textarea></td>
                            </tr>
                            <tr>
                                <td colspan="4" >Conclusion:<textarea class="form-control textarea-vertical" name="result" >${ck.getResult()}</textarea></td>
                            </tr>
                        </table>
                        <input type="text" name="caseID" value="${ck.getCaseID()}" style="display: none"/>
                        <table class="table hide-btn">
                            <tr>
                                <td><button type="submit" formaction="/case?action=save" class="btn btn-secondary" style="width: 100%" ${isCF?"disabled":""}>SAVE</button></td>
                                <td><button type="submit" formaction="/case?action=edit" class="btn btn-secondary" style="width: 100%" ${isCF?"":"disabled"}>EDIT</button></td>
                                <td><button type="submit" formaction="/case?action=finish" class="btn btn-secondary" style="width: 100%" ${isCF?"disabled":""}>FINISH</button></td>
                                <td><button type="submit" formaction="/case?action=close" class="btn btn-secondary" style="width: 100%" ${isCF?"disabled":""}>CLOSE</button></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="col-sm-6">
                    <div class="row">
                        <div class="col-sm-11"><h5>Designate List</h5></div>
                        <div class="col-sm-1">
                            <button id="add_designate" class="hide-btn" title="Add Designate" style="width: 100%"><i class="fa fa-plus" aria-hidden="true"></i></i></button>
                        </div>
                        <div class="col-sm-12">
                            <div class="table-wrapper-scroll-y my-custom-scrollbar">
                                <table class="table table-hover table-bordered mb-0">
                                    <thead class="thead-light">
                                        <tr>
                                            <th>Name</th>
                                            <th>Status</th>
                                            <th>Description</th>                                        
                                            <th>Result</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach  var="de" items="${listDe}">
                                            <tr>
                                                <td>${de.getName()}</td>
                                                <td>${de.getStrStatus()}</td>
                                                <td>${de.getDescription()}</td>
                                                <td>${de.getResult()}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-sm-11"><h5>Prescription</h5></div>
                        <div class="col-sm-1">
                            <button id="add_medicine" class="hide-btn" title="Add Medicine" style="width: 100%"><i class="fa fa-plus" aria-hidden="true"></i></button> 
                        </div>
                        <div class="col-sm-12">
                            <div class="table-wrapper-scroll-y my-custom-scrollbar"> 
                                <table class="table table-hover table-bordered mb-0">
                                    <thead class="thead-light">
                                        <tr>
                                            <th>Name</th>
                                            <th>Quantity</th>
                                            <th>Description</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach  var="me" items="${listMe}">
                                            <tr>
                                                <td>${me.getName()}</td>
                                                <td>${me.getQuantity()}</td>
                                                <td>${me.getDescription()}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <!--designate modal-->
        <div class="modal modal-background" id="designate_modal" style="background-color: #b3b2b261">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="/new_designate" method="POST">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalTitle">Add New Designate</h5>
                            <button type="button" class="btn-close close-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <label>Select designate</label>
                            <input type="text" name="caseID" value="${ck.getCaseID()}" style="display: none"/>                                
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text">Name</label>
                                </div>
                                <select class="form-select" name="desiganteID">
                                    <c:forEach var="dl" items="${listDl}">
                                        <option value="${dl.getDesignateID()}" class="color-red"  ${deDAO.checkSelectDesignate(ck.getCaseID(), dl.getDesignateID())?"":"disabled"}>${dl.getName()}</option>
                                    </c:forEach> 
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Add</button>
                            <button type="button" class="btn btn-secondary close-modal"><a href="">Close</a></button>                        
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--medicine modal-->
        <div class="modal modal-background" id="medicine_modal" style="background-color: #b3b2b261">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="/new_medicine" method="POST">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalTitle">Add New Medicine</h5>
                            <button type="button" class="btn-close close-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <label>Select designate</label>
                            <input type="text" name="caseID" value="${ck.getCaseID()}" style="display: none"/>                               
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text">Name</label>
                                </div>
                                <select class="form-select" name="medicineID">
                                    <c:forEach var="ml" items="${listMl}">
                                        <option value="${ml.getMedicineID()}" class="color-red" ${meDAO.checkSelectMedicine(ck.getCaseID(), ml.getMedicineID())?"":"disabled"} >${ml.getName()}</option>
                                    </c:forEach> 
                                </select>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text">Quantity</label>
                                </div>
                                <input min="1" max="20" type="number" name="quantity" class="form-control" value="1"/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Add</button>
                            <button type="button" class="btn btn-secondary close-modal"><a href="">Close</a></button>                        
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script>
            $(document).ready(function () {
                if (${checkRole}) {
                    console.log(${checkRole});
                    $(".hide-btn").css("display", "none");
                    $('input[type="text"], textarea').attr('readonly', 'readonly');
                    $(".show-btn").css("display", "inherit");
                } else {
                    console.log(${checkRole});
                    //$(".hide-btn").css("display", "table");
                }

                if ($('.color-red').prop('disabled')) {
                    $('.color-red:disabled').css("color", "red");
                }

                $("#add_designate").click(function () {
                    $("#designate_modal").css("display", "block");
                    console.log("designate modal!");
                });

                $("#add_medicine").click(function () {
                    $("#medicine_modal").css("display", "block");
                    console.log("medicine modal!");
                });

                $(".close-modal").click(function () {
                    $("#designate_modal").css("display", "none");
                    $("#medicine_modal").css("display", "none");
                    console.log("designate modal!");
                });
            });
        </script>
    </body>
</html>
