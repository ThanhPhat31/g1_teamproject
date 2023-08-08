<%-- 
Document   : home
Created on : Jan 31, 2023, 1:00:27 PM
Author     : vusyl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Home Page</title>
        <link rel="icon" type="image/x-icon" href="assets1/images/favicon.jpg">
        <link rel="shortcut icon" href="assets1/images/fav.jpg">
        <link rel="stylesheet" href="assets1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets1/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="assets1/css/style.css" />
        <style>
            .our-team {
                padding: 30px 50px !important;
                background-color: #FBFBFB;
            }
            .h-300{
                height: 500px;
            }
            main{
                overflow: auto;
            }
            #carouselExampleIndicators>h4{
/*                color: white;
                position: absolute;
                top: 50%;
                left: 50%;*/
            }
        </style>
    </head>

    <body>

        <!-- ################# Header Starts Here#######################--->
        <jsp:include page="layout/menu.jsp"></jsp:include>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100 h-300" src="assets1/images/slider/istockphoto-1128172382-1024x1024.jpg" alt=""/>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 h-300" src="assets1/images/slider/istockphoto-1134712489-612x612.jpg" alt=""/>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 h-300" src="assets1/images/slider/slider_3.jpg" alt=""/>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                <h4 style=" position:absolute;top: 40%;width: 100%;font-size: 66px;text-align: center;color: rgb(26, 26, 26, 0.8)">Welcome to Eye Clinic</h4>
                
            </div>
            
            <div class="main">
                <div id="blog" class="blog">
                    <section class="our-team">
                        <div class="row session-title">
                            <h2>News</h2>
                            <!--                <p>We can talk for a long time about advantages of our Dental clinic before other medical treatment facilities.-->
                            <!--                    But you can read the following facts in order to make sure of all pluses of our clinic:</p>-->
                        </div>
                        <div class="container">                  
                            <div class="row team-row">
                            <c:forEach items="${requestScope.news}" var="nn">   
                                <div class="col-md-3 col-sm-6">
                                    <div class="single-usr" style="width: 16rem;">
                                        <img class="card-img-top" src="assets1/news/${nn.image1}" alt="Card image cap"  width="50px" height="250px">
                                        <div class="card-body">
                                            <h5 class="card-title">${nn.title}</h5>
                                            <p class="card-text">Ngày: ${nn.date} đăng bởi: ${nn.author}</p>
                                            <a href="newsdetail?sid=${nn.id}" class="   ">Read More</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>

                </section>
            </div>

            <!-- ######## Blog End ####### -->

            <!--  ************************* Gallery Starts Here ************************** -->
            <div id="gallery" class="gallery">    
                <div class="container">
                    <div class="row">


                        <div class="gallery-filter d-none d-sm-block">
                            <h2 class="">All Service</h2>
                        </div>
                        <br/>


                        <c:forEach items="${service}" var="s">
                            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
                                <img src="assets1/news/${s.image}" class="img-responsive">
                            </div>
                        </c:forEach>
                    </div>
                </div>


            </div>
            <!-- ######## Gallery End ####### -->


            <!-- ################# Our Team Starts Here#######################--->
            <section class="our-team">
                <div class="container">
                    <div class="inner-title row">
                        <h2>Our Team</h2>
                        <p>Take a look at our Team</p>
                    </div>
                    <div class="row team-row">
                        <c:forEach items="${profileDoc}" var="pd">
                            <div class="col-md-3 col-sm-6">
                                <div class="single-usr">
                                    <img src="assets1/news/${pd.image}" alt="" width="50px" height="250px">
                                    <div class="det-o">
                                        <h4> ${pd.firstName}  ${pd.middleName}  ${pd.lastName}</h4>                                   
                                        <i>${pd.position}</i>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>                 
                    </div>
                </div>

            </section>       


            <!--  ************************* Contact Us Starts Here ************************** -->



            <!-- ################# Footer Starts Here#######################--->

        </div>

        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>

    <script src="assets1/js/jquery-3.2.1.min.js"></script>
    <script src="assets1/js/popper.min.js"></script>
    <script src="assets1/js/bootstrap.min.js"></script>
    <script src="assets1/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets1/plugins/scroll-nav/js/jquery.easing.min.js"></script>    
    <script src="assets1/plugins/scroll-nav/js/scrolling-nav.js"></script>
    <script src="assets1/js/script.js"></script>



</html>
