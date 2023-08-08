<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Services</title>
        <link rel="icon" type="image/x-icon" href="bodycss/img/logo-fb.png">
        <!-- boostrap here -->
        <link rel="stylesheet" href="assets1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets1/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="assets1/css/style.css" />
    </head>
    <body>
        <jsp:include page="layout/menu.jsp"></jsp:include>

            <div class="container" style="background-image: url('bodycss/img/headerimg.jpg'); width: 100%; height: 300px">
                <div class='col-sm-12' style="padding: 105px">
                    <h1 style="text-align: center">Service</h1>
                </div>

            <c:forEach items="listService" var="list">
                <div class="container">
                    <div id="blog" class="form-control-lg">               
                        <div class="container">
                            <div class="col">
                                <div class="col-md-auto">
                                    <div class="blog-singe ">
                                        <div class="col-sm-8 blog-content-tab">
                                            <h2>${s.name}</h2>
                                            <p><small>Description: ${s.description}</small></p>
                                            <br>
                                        </div>
                                        <div class="col-sm-8 blog-content-tab">${s.content}</div>
                                    </div>
                                </div>                      
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

    </body>

</html>
