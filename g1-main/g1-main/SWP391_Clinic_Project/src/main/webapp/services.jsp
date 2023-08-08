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
        <title> Services</title>

        <link rel="shortcut icon" href="assets1/images/fav.jpg">
        <link rel="stylesheet" href="assets1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets1/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="assets1/css/style.css" />
    </head>
    <jsp:include page="layout/menu.jsp"></jsp:include>
    <jsp:include page="layout/banner.jsp"></jsp:include>
        <body>
        <c:forEach items="${listService}" var="s" >
            <div class="col-sm-5">
                <div class="">
                    <a href="newsdetail?sid=${o.id}"><img src="assets1/news/${s.image}" alt="MẮT MỜ ĐỘT NGỘT, CHỚ XEM THƯỜNG"></a>
                </div>
            </div>
            <ul>

                <li>
                    <h2> ${s.name}<br><span style="color: black">${s.description}</span></h2>
                    <div class="price"> ${s.content}</div>
                </li>
            </ul>
        </c:forEach>
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

