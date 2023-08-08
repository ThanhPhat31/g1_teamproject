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
        <title>Message</title>
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



                <div class="card mb-4">
                    <div class="card-body">
                        <!-- Grid row -->
                        <div class="row">
                            <!-- Grid column -->
                            <div class="col-md-12">
                                <h2 class="pt-3 pb-4 text-center font-bold font-up deep-purple-text">Content Message Of Patient</h2>


                            </div>
                            <!-- Grid column -->
                        </div>
                        <!-- Grid row -->
                        <!--Table-->


                        <table class="table table-striped">
                            <!--Table head-->
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Name</th>
                                    <th>Mail</th>
                                    <th>Phone</th>
                                    <th>Message</th><!-- comment -->
                                  

                                </tr>
                            </thead>


                            <c:forEach items="${listContact}" var="ct">

                                <tbody>
                                    <tr>
                                        <td>${ct.getDate()}</td>
                                        <td>${ct.getTime()}</td>
                                        <th>${ct.getName()}</th>
                                        <td>${ct.getMail()}</td>
                                        <td>${ct.getPhone()}</td>
                                        <td>${ct.getMess()}</td>

                                    </tr>

                                </tbody>

                            </c:forEach>

                            <!--Table body-->
                        </table>
                        <!--Table-->

                        <span style="color: red">${requestScope.messPatient} </span>
                    </div>
                </div>

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
                            <li class="page-item active"><a class="page-link">1</a></li>
                            <li class="page-item"><a class="page-link">2</a></li>
                            <li class="page-item"><a class="page-link">3</a></li>
                            <li class="page-item"><a class="page-link">4</a></li>
                            <li class="page-item"><a class="page-link">5</a></li>
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
</html>
