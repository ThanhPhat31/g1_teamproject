<%@page import="entity.Account"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thanh Toán</title>
        <!-- Font roboto -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <!-- Icon fontanwesome -->
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
        <!-- Reset css & grid sytem -->
        <link rel="stylesheet" href="./assets1/css/library.css">
        <!-- Owl Slider css -->
        <link rel="stylesheet" href="assets1/owlCarousel/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="assets1/owlCarousel/assets/owl.theme.default.min.css">
        <!-- Layout -->
        <link rel="stylesheet" href="./assets1/css/common.css">
        <!-- index -->
        <link rel="stylesheet" type="text/css" href="./assets1/css/pay.css">
        <!-- Jquery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Owl caroucel Js-->
        <script src="assets/owlCarousel/owl.carousel.min.js"></script>
        
        <script>
            function myfunction() {

                var address2 = document.getElementById("address2").value;
                let check = window.confirm("check lai thong tin dat hang");
                if (!check) {
                window.location.href = "CheckOut?address2=" + address2;
                }
            }
        </script>
    </head>

        <body>
                <jsp:include  page="layout/menu.jsp"></jsp:include>

            <div class="main">
                <div class="grid wide">
                    <div class="row">
                        <div class="col l-7 m-12 s-12">
                            <div class="pay-information">

                                <div class="pay__heading">Thông tin thanh toán</div>
                                <form action="checkout" method="post">
                                    <div class="form-group">
                                        <label for="account" class="form-label">Họ Tên *</label>
                                        <input  type="text" value="${acc.firstName} ${acc.middleName} ${acc.lastName}" class="form-control" readonly="">
                                </div>
                                <div class="form-group">
                                    <label for="account" class="form-label">Địa chỉ nhận hàng *</label>
                                    <input id="address2" name="address2" type="text" class="form-control"required="required">
                                    <span class="form-message"></span>

                                </div>
                                <div class="form-group">
                                    <label for="account" class="form-label">Số điện thoại *</label>
                                    <input  type="text" value="${acc.phone}" class="form-control"readonly="">
                                    <span class="form-message"></span>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col l-5 m-12 s-12">
                        <div class="pay-order">
                            <div class="pay__heading">Đơn hàng của bạn</div>
                            <c:set value="${sessionScope.cart}" var="o"/>
                            <c:forEach items="${o.items}" var="i">

                                <div class="pay-info">
                                    <div class="main__pay-text">
                                        ${i.product.productname}</div>
                                    <div class="main__pay-price">
                                        ${i.quantity*i.price} ₫
                                    </div>
                                </div>

                            </c:forEach>
                            <div class="pay-info">
                                <div class="main__pay-text special">
                                    Giao hàng
                                </div>
                                <div class="main__pay-text">
                                    Giao hàng miễn phí
                                </div>
                            </div>
                            <div class="pay-info">
                                <div class="main__pay-text special">
                                    VAT
                                </div>
                                <div class="main__pay-text">
                                    10%
                                </div>


                            </div>
                            <div class="pay-info">
                                <div class="main__pay-text special">
                                    Tổng thành tiền</div>
                                <div class="main__pay-price">
                                    ${o.getTotalMoney()+o.getTotalMoney()*0.1} ₫
                                </div>
                            </div>
                            <div class="btn btn--default"><a onclick="myfunction()" href="#">Đặt hàng</a></div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div>
        </div>
        <script src="./assets1/js/commonscript.js"></script>
        <link rel="stylesheet" type="text/css" href="assets1/css/style.css" />
    </body>

</html>
