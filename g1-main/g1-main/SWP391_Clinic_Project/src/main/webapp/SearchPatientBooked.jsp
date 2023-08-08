<%-- 
    Document   : SearchNormalBook
    Created on : Mar 4, 2023, 7:41:42 PM
    Author     : vusyl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Clinic Eye FPT</title>
        <link rel="icon" type="image/x-icon" href="assets1/images/favicon.jpg">
        <link rel="shortcut icon" href="assets1/images/fav.jpg">
        <link rel="stylesheet" href="assets1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets1/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.theme.default.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <style>
            .hm-gradient {
                background-image: linear-gradient(to top, #f3e7e9 0%, #e3eeff 99%, #e3eeff 100%);
            }
            .darken-grey-text {
                color: #2E2E2E;
            }
            .input-group.md-form.form-sm.form-2 input {
                border: 1px solid #bdbdbd;
                border-top-left-radius: 0.25rem;
                border-bottom-left-radius: 0.25rem;
            }
            .input-group.md-form.form-sm.form-2 input.purple-border {
                border: 1px solid #9e9e9e;
            }
            .input-group.md-form.form-sm.form-2 input {
                border: 1px solid #bdbdbd;
                border-top-left-radius: 0.25rem;
                border-bottom-left-radius: 0.25rem;
                width: 75%; /* Adjust this value as needed */
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }
            .form-2 .input-group-addon {
                border: 1px solid #ba68c8;
            }
            .danger-text {
                color: #ff3547;
            }
            .success-text {
                color: #00C851;
            }
            .table-bordered.red-border, .table-bordered.red-border th, .table-bordered.red-border td {
                border: 1px solid #ff3547!important;
            }
            .table.table-bordered th {
                text-align: center;
            }
        </style>
    </head>
    <body class="hm-gradient">

        <main>

            <!--MDB Tables-->
            <div class="container mt-4">


                <form action="searchPatientBooked" method="post">
                    <div class="card mb-4">
                        <div class="card-body">
                            <!-- Grid row -->
                            <div class="row">
                                <!-- Grid column -->
                                <div class="col-md-12">
                                    <h2 class="pt-3 pb-4 text-center font-bold font-up deep-purple-text">Search Patient Booked</h2>

                                    <div class="input-group md-form form-sm form-2 pl-0">
                                        <input class="form-control my-0 py-1 pl-3 purple-border" type="text" name="txtSearch"placeholder="Search something here..." aria-label="Search">
                                        <button class="btn btn-primary" id="btnNavbarSearch" type="submit" ><i class="fas fa-search"></i></button>
                                    </div>
                                </div>
                                <!-- Grid column -->

                                <!-- Grid row -->
                                <!--Table-->
                                <div class="table-responsive" style="margin: 0 15px;">
                                    <table class="table table-striped table-hover table-bordered w-auto">
                                        <!--Table head-->
                                        <thead>
                                            <tr>
                                                <th colspan="2" style="width: 15%">Booking</th>
                                                <th colspan="2" style="width: 15%">Appointment</th>
                                                <th colspan="4" style="width: 50%">Patient</th>
                                                <th style="width: 13%">Doctor</th>
                                                <th rowspan="2" style="width: 7%"></th>
                                            </tr>
                                            <tr>
                                                <th>Date</th>
                                                <th>Time</th>
                                                <th>Date</th>
                                                <th>Time</th>
                                                <th style="width: 35%">Name</th><!-- comment -->
                                                <th style="width: 10%">Gender</th>
                                                <th style="width: 35%">Gmail</th>
                                                <th style="width: 20%">Phone</th>
                                                <th>Name</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listbooked}" var="bk">
                                                <tr>
                                                    <th>${bk.getBooking_date()}</th>
                                                    <td>${bk.getBooking_time()}</td>
                                                    <td>${bk.getAppointment_date()}</td>
                                                    <td>${bk.getAppointment_time()}</td>
                                                    <td>${bk.getPatient().getFullName()}</td>
                                                    <td class="text-center">
                                                        <c:choose>
                                                            <c:when test="${bk.getPatient().getGender() == true}">
                                                                <p style="color: red">Male</p>
                                                            </c:when>

                                                            <c:otherwise>
                                                                <p style="color: blue">Female</p>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>       
                                                    <td>${bk.getPatient().getMail()}</td>
                                                    <td>${bk.getPatient().getPhone()}</td>
                                                    <td>${bk.getDoctor().getFullName()}</td>
                                                    <td class="text-center align-middle">
                                                        <div class="btn-group align-top">
                                                            <a class="btn btn-sm btn-outline-secondary" onclick="confirmCancelAdd('${bk.getiD()}')" href="#">Add</a>
                                                        </div>
                                                    </td>                  
                                                </tr>

                                            </c:forEach> 
                                        </tbody>
                                        <!--Table body-->
                                    </table>
                                </div>
                            </div>
                            <!--Table-->
                            <a class="btn btn-sm btn-outline-secondary" href="/listbooking">Return</a>
                            <a class="btn btn-sm btn-outline-secondary" href="/searchPatient">Go to medical waiting list</a>
                            <span style="color: red">${requestScope.messPatient} </span>
                        </div>
                    </div>

                </form>
                <input type="hidden" name="date" class="form-control" >
                <input type="hidden" name="time" class="form-control" >


                <!--Bottom Table UI-->
                
            </div>


            <hr class="my-4">



            </div>
            <!--MDB Tables-->

        </main>

    </body>
    <script>

        function confirmCancelAdd(id) {
            if (confirm("Are you sure you want to add?")) {
                window.location.href = 'updateboooked?sid=' + id;
            }
        }
    </script>
</html>
