<%-- 
    Document   : profle
    Created on : Feb 5, 2023, 11:52:21 AM
    Author     : vusyl
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" type="image/x-icon" href="assets1/images/favicon.jpg">
        <link rel="shortcut icon" href="assets1/images/fav.jpg">
        <link rel="stylesheet" href="assets1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets1/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.theme.default.css">
        <link rel="stylesheet" href="assets1/css/profile.css"/>
        <style>
            input {
                /*Ẩn boder trên, phải và trái*/
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: hidden;
                margin: 0;
                padding: 0;

                color:white;

            }
        </style>
    </head>
    <body>       
        <jsp:include page="layout/menu.jsp"></jsp:include>
        <%
            Account listP = (Account) request.getAttribute("listP");
            Boolean gender = listP.getGender();
        %>


        <input type="hidden" name="account" class="form-control" value="${sessionScope.acc.account}">
        <div class="container">
            <div class="main-body">

                <!-- Breadcrumb -->

                <!-- /Breadcrumb -->

                <div class="row gutters-sm">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="assets1/news/${listP.image}" alt="Admin" class="rounded-circle" width="150">
                                    <div class="mt-3">
                                        <h4>${listP.firstName}  ${listP.middleName}  ${listP.lastName}</h4>

                                        <p class="text-secondary mb-1">Full Stack Developer</p>
                                        <p class="text-muted font-size-sm"> ${listP.address}</p>
                                        <button class="btn btn-primary">Follow</button>
                                        <button class="btn btn-outline-primary">Message</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-8">
                        <div class="card mb-3">

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Full Name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        ${listP.firstName}  ${listP.middleName}  ${listP.lastName}
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        ${listP.mail}
                                    </div>
                                </div>
                                <hr>   
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Gender</h6>
                                    </div>
                                    <div>
                                        <input class="col-sm-9 text-secondary" type="txt" name="gender" <%if (gender == true) { %> value="Male" <% } else {%> value="FeMale" <%};%> readonly="">
                                    </div>
                                </div>


                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Phone</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        ${listP.phone}
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Birthday</h6>

                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        ${listP.doB}
                                    </div>
                                </div>

                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Address</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        ${listP.address}
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <a class="btn btn-primary " href="editprofile?sid=${listP.profileID}">Edit</a>
                                        <a class="btn btn-primary " href="/change" class="">Change PassWord</a>       
                                    </div>
                                </div>
                            </div>

                        </div>




                    </div>
                </div>

            </div>
        </div>

        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>
</html>
