<%-- 
    Document   : news
    Created on : Feb 5, 2023, 7:07:16 PM
    Author     : ThangDT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News Page</title>
        <link rel="icon" type="image/x-icon" href="bodycss/img/logo-fb.png">
        <!-- boostrap here -->
        <link rel="stylesheet" href="assets1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets1/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="assets1/css/style.css" />
    </head>
    <body style="background-color: white !important">
        <!-- ################# Header Starts Here#######################--->
        <jsp:include page="layout/menu.jsp"></jsp:include>

            <div class="grid" style="background-image: url('bodycss/img/headerimg.jpg'); width: 100%; height: 300px">
                <div class='col-sm-12' style="padding: 105px">
                    <h1 style="text-align: center">News</h1>
                </div>

            </div>

            <div class="container" style="margin-top: 20px">
                <div class="row">
                    <div class="col-sm-9">
                    <c:forEach  items="${listNews}" var="o">
                        <div class="row">
                            <div class="col-sm-5">
                                <div >
                                    <a href="newsdetail?sid=${o.id}"><img src="assets1/news/${o.image1}" alt="MẮT MỜ ĐỘT NGỘT, CHỚ XEM THƯỜNG"></a>
                                </div>
                            </div>
                            <div class="col-sm-7 ">
                                <div class="">
                                    <h2>
                                        <a href="newsdetail?sid=${o.id}">${o.title}</a>
                                    </h2>
                                </div>
                                <div class="">
                                    Ngày: ${o.date} đăng bởi: ${o.author}
                                </div>
                                <a href="newsdetail?sid=${o.id}">Xem thêm</a>
                            </div>
                        </div>
                    </c:forEach>    

                    <div class="row">
                        <div class="col-sm-12">
                            <form action="news" method="post">
                            <c:forEach var="i" items="" begin="1" end="${endPage}">
                                <input type="submit" value="${i}" name="index"/>                                
                            </c:forEach>   
                            </form>                           
                        </div>                            
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="row">
                        <div class="col-sm-12">
                            <form action="news" method="POST">
                                <input type="text" name="searchTitle" value="${searchTitle}"/>
                                <input type="submit" value="search"/>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <span class="col-sm-12"><h6>CATEGORIES</h6></span>
                        <div class="col-sm-12">
                            <ul style="list-style-type:none;">
                                <li>somethings</li>
                                <li>somethings</li>
                                <li>somethings</li>
                                <li>somethings</li>

                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- ################# Footer Starts Here#######################--->
        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>
</html>
