<%-- 
Document   : menu
Created on : Feb 3, 2023, 9:42:47 PM
Author     : vusyl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="assets1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets1/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.theme.default.css">
        <link href="../assets1/css/style1.css" rel="stylesheet" type="text/css"/>
        <style>
            .dropbtn {

                background-color: white;
                color: white;
                text-transform: uppercase;
                padding-bottom: 17px;
                font-size: 16px;
                border: none;
                cursor: pointer;
            }

            /*            .dropdown {
                            position: relative;
                            display: inline-block;
                        }*/

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .dropdown:hover .dropdown-content {
                display: block;
            }

            profile-nav{
                vertical-align: middle;
                text-align: left;
                padding: 0 !important;
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
                color: black;
            }
            .profile-info>h5:hover{
/*                text-decoration: underline;*/
            }
            
            #menu>ul>li{
                padding: 28px 12px !important;
            }
            
            a#navbarDropdown {
                padding: 0px;
                margin-left: 20px;
            }
            .profile-nav>.profile-drop>li{
                float: left !important;
                padding: 0px !important;
            }
            .profile-nav>.profile-drop{
                padding: 0;
            }
            .profile-nav>.profile-drop>li>a{
                width: 100% !important;
            }
            
        </style>
    </head>
    <body>

        <header id="menu-jk">
            <div id="nav-head" class="header-nav">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-1 col-md-1 no-padding col-sm-12 nav-img">
                            <img id="logo" src="../assets1/images/logo2.jpg" alt="Eye Clinic" style="margin: 0px;"/>                         
                        </div>
                        <div id="menu" class="col-lg-11 col-md-9 d-none d-md-block nav-item">
                            <ul>  
                                <c:choose>
                                    <c:when test="${sessionScope.acc == null}">
                                        <li>  <a href="/login" class="">Login</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="nav-item dropdown profile-nav" style="padding:15px 0 !important;">
                                        <a class="nav-link row dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">                       
                                            <div class="" style="display: inline-flex">
                                                <div class="profile-pic">    
                                                    <img src="assets1/news/${acc.getImage()}" alt="${acc.getFullName()}"/>
                                                </div>
                                                <div class="profile-info">
                                                    <span>${acc.getStrRole()}</span> 
                                                    <h5>${acc.middleName} ${acc.lastName}</h5>  
                                                </div>
                                            </div>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-end dropdown-content profile-drop" aria-labelledby="navbarDropdown">
                                            <li><a class="dropdown-item" href="/profile">Profile</a></li>
                                            <li><a class="dropdown-item" href="/historyPatient">Medical History</a></li>
                                            <li><a class="dropdown-item" href="/logout">Logout <i class="fa fa-sign-out" aria-hidden="true" style="float: right; padding: 5px 0px;"></i></a></li>
                                        </ul>
                                    </li>
                                    </c:otherwise>
                                </c:choose>
                                <li><a href="/contact">Contact Us</a></li>     
                                <c:if test="${sessionScope.acc.role == null}">
                                    <li>  <a href="/login">Booking</a></li>
                                    </c:if> 
                                    <c:if test="${sessionScope.acc.role eq '3'}">
                                    <li>  <a href="/booking">Booking</a></li>
                                </c:if>
                                    <c:if test="${sessionScope.acc.role == null}">
                                    <li>  <a href="/login">Cart</a></li>
                                    </c:if> 
                                    <c:if test="${sessionScope.acc.role eq '3'}">
                                    <li>  <a href="/Cart">Cart</a></li>
                                </c:if>
                                    <c:if test="${sessionScope.acc.role == null}">
                                    <li>  <a href="/login">Product</a></li>
                                    </c:if> 
                                    <c:if test="${sessionScope.acc.role eq '3'}">
                                    <li>  <a href="/Product">Product</a></li>
                                </c:if>
                                <li><a href="/serviceList">Services</a></li>
                                <li><a href="/news">News</a></li>
                                <li><a href="aboutus.jsp">About Us</a></li>
                                <li><a href="/home">Home</a></li>  
                            </ul>
                        </div>
                    </div>

                </div>
            </div>

        </header>
    </body>
    <script src="assets1/js/jquery-3.2.1.min.js"></script>
    <script src="assets1/js/popper.min.js"></script>
    <script src="assets1/js/bootstrap.min.js"></script>
    <script src="assets1/js/script.js"></script>    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script>
        $("#navbarDropdown").toggle(this.attr('value', 'no'));
    </script>
</html>
