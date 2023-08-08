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
            .input-group.md-form.form-sm.form-2 input[type=text]:focus:not([readonly]).purple-border {
                border: 1px solid #ba68c8;
                box-shadow: none;
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


                <form action="searchPatient" method="post">
                    <div class="card mb-4">
                        <div class="card-body">
                            <!-- Grid row -->
                            <div class="row">
                                <!-- Grid column -->
                                <div class="col-md-12">
                                    <h2 class="pt-3 pb-4 text-center font-bold font-up deep-purple-text">Search Information Patient</h2>

                                    <div class="input-group md-form form-sm form-2 pl-0">
                                        <input class="form-control my-0 py-1 pl-3 purple-border" type="text" name="txtSearch"placeholder="Search something here..." aria-label="Search">
                                        <button class="btn btn-primary" id="btnNavbarSearch" type="submit" ><i class="fas fa-search"></i></button>
                                    </div>
                                </div>
                                <!-- Grid column -->
                            </div>
                            <!-- Grid row -->
                            <!--Table-->


                            <table class="table table-striped">
                                <!--Table head-->
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Birthday</th>
                                        <th>Gender</th>
                                        <th>Address</th>
                                        <th>Mail</th><!-- comment -->
                                        <th>Phone</th>

                                    </tr>
                                </thead>


                                <c:forEach items="${listPatient}" var="ab">

                                    <tbody>
                                        <tr>
                                            <th>${ab.getProfileID()}</th>
                                            <td>${ab.getFullName()}</td>
                                            <td>${ab.getFormatDoB()}</td>
                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${ab.getGender() == true}">
                                                        <p style="color: red">Male</p>
                                                    </c:when>

                                                    <c:otherwise>
                                                        <p style="color: blue">Female</p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td> 

                                            <td>${ab.getAddress()}</td>
                                            <td>${ab.getMail()}</td>
                                            <td>${ab.getPhone()}</td>
                                            <td class="text-center align-middle">
                                                <div class="btn-group align-top">

                                                    <a class="btn btn-sm btn-outline-secondary" onclick="confirmCancelAdd('${ab.getPatientID()}')" href="#">Add</a>

                                                </div>

                                            </td>


                                        </tr>

                                    </tbody>

                                </c:forEach>

                                <!--Table body-->
                            </table>
                            <!--Table-->
                            <a class="btn btn-sm btn-outline-secondary"   href="/normalbooking">Return </a>

                            <a class="btn btn-sm btn-outline-secondary" onclick="confirmCancel('')" href="#">Add New Account Patient</a>
                            <span style="color: red">${requestScope.messPatient} </span>
                        </div>
                    </div>

                </form>


                <!--Bottom Table UI-->
                <div class="d-flex justify-content-center">
                    <!--Pagination -->
                    <nav class="my-4 pt-2">
                        <ul class="pagination pagination-circle pg-blue mb-0">
                            <!--First-->
                            <li class="page-item disabled clearfix d-none d-md-block"><a class="page-link">First</a></li>
                            <!--Arrow left-->
                            <li class="page-item disabled">
                                <a class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <!--Numbers-->
                            <c:forEach begin="1" end="${endP}" var="i">
                                <li class="page-item"><a href="searchPatient?index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>
                                
                                <c:forEach begin="1" end="${endPageSearch}" var="i">
                                <li class="page-item">
                                    <form action="searchPatient" method="post">
                                        <input type="hidden" name="indexS" value="${i}" />
                                        <button type="submit" class="page-link">${i}</button>
                                    </form>
                                </li>
                            </c:forEach>
                            <!--Arrow right-->
                            <li class="page-item">
                                <a class="page-link" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                            <!--First-->
                            <li class="page-item clearfix d-none d-md-block"><a class="page-link">Last</a></li>
                        </ul>
                    </nav>
                    <!--/Pagination -->
                </div>
                <!--Bottom Table UI-->
            </div>


            <hr class="my-4">



            </div>
            <!--MDB Tables-->

        </main>

    </body>
    <script>
        function confirmCancel() {
            if (confirm("Are you sure you want to add new patient?")) {
                window.location.href = 'signup';
            }
        }
        function confirmCancelAdd(id) {
            if (confirm("Are you sure you want to add?")) {
                window.location.href = 'AddnewBook?sid=' + id;
            }
        }
    </script>
</html>
