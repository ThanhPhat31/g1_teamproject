<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!-- https://cocoshop.vn/ -->
    <!-- http://mauweb.monamedia.net/vanihome/ -->

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Giỏ hàng</title>
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
        <link rel="stylesheet" type="text/css" href="./assets1/css/cart.css">
        <!-- Jquery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Owl caroucel Js-->
        <script src="assets1/owlCarousel/owl.carousel.min.js"></script>
        
    </head>

    <body>
        <jsp:include  page="layout/menu.jsp"></jsp:include>

            <div class="main">
                <div class="grid wide">
                    <div class="main__notify">
                        <div class="main__notify-icon">
                            <i class="fas fa-check"></i>
                            <!-- <i class="fas fa-times"></i> -->
                        </div>
                        <div class="main__notify-text">Giỏ hàng đã được cập nhật.</div>
                    </div>
                    <div class="row">
                        <div class="col l-8 m-12 s-12">
                            <div class="main__cart">
                                <div class="row title">
                                    <div class="col l-1 m-1 s-0">No</div>
                                    <div class="col l-4 m-4 s-8">Sản phẩm</div>
                                    <div class="col l-2 m-2 s-0">Giá</div>
                                    <div class="col l-2 m-2 s-0">Số lượng</div>
                                    <div class="col l-2 m-2 s-4">Tổng</div>
                                    <div class="col l-1 m-1 s-0">Xóa</div>
                                </div>
                            <c:set value="${sessionScope.cart}" var="o"/>
                            <c:set value="0" var="t"/>
                            <c:forEach items="${o.items}" var="i">
                                <c:set var="t" value="${t+1}"/>
                                <div class="row item">
                                    <div class="col l-1 m-1 s-0">
                                        <h2>${t}</h2>
                                    </div>
                                    <div class="col l-4 m-4 s-8">
                                        <div class="main__cart-product">
                                            <img src="bodycss/img/${i.product.image}.jpg">
                                            <div class="name">${i.product.productname}</div>
                                        </div>
                                    </div>
                                    <div class="col l-2 m-2 s-0">
                                        <div class="main__cart-price">${i.product.price}</div>
                                    </div>
                                    <div class="col l-2 m-2 s-0">
                                        <div class="buttons_added">
<!--                                            <a href="Process?num=-1&id=${i.product.productid}" ><button style="height: 25px;">-</button></a>                                               -->
                                            <input style="text-align: center; height: 25px;width: 30px;font-size: 1.4rem;" type="text"  readonly value="${i.quantity}"  /> 
<!--                                            <a  href="Process?num=1&id=${i.product.productid}" ><button style="height: 25px;">+</button></a>                                                    -->
                                        </div>
                                    </div>
                                    <div class="col l-2 m-2 s-4">
                                        <div class="main__cart-price">${i.price}</div>
                                    </div>
                                    <div class="col l-1 m-1 s-0">
                                        <form action="Process" method="post">
                                            <span class="main__cart-icon">
                                                <input type="hidden" name="id" value="${i.product.productid}"/>
                                                <input type="submit" value="X" style="background: white" />
                                            </span>
                                        </form>
                                    </div>
                                </div>

                            </c:forEach>

                            <div class="btn btn--default">
                                <a href="Product">Cập nhật giỏ hàng</a>
                            </div>

                        </div>


                    </div>

                    <div class="col l-4 m-12 s-12">
                        <div class="main__pay">
                            <div class="main__pay-title">Tổng số lượng</div>
                            <div class="pay-info">
                                <div class="main__pay-text">
                                    Tổng phụ</div>
                                <div class="main__pay-price">
                                    ${o.getTotalMoney()} ₫
                                </div>
                            </div>
                            <div class="pay-info">
                                <div class="main__pay-text">
                                    Giao hàng
                                </div>
                                <div class="main__pay-text">
                                    Giao hàng miễn phí
                                </div>

                            </div>
                            <div class="pay-info">
                                <div class="main__pay-text">
                                    VAT
                                </div>
                                <div class="main__pay-text">
                                    10%
                                </div>
                            </div>
                            <div class="pay-info">
                                <div class="main__pay-text">
                                    Tổng thành tiền</div>
                                <div class="main__pay-price">
                                    ${o.getTotalMoney()+o.getTotalMoney()*0.1} ₫
                                </div>
                            </div>
                            <a href="pay.jsp" class="btn btn--default orange">Tiến hành thanh toán</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
        </div>
        <script src="./assets1/js/commonscript.js"></script>
        <script type="text/javascript">
            function Minus() {
                var quantity = document.getElementById("quantity").value;
                quantity--;
                document.getElementById("quantity").setAttribute('value', quantity);
            }
            function Plus() {
                var quantity = document.getElementById("quantity").value;
                quantity++;
                document.getElementById("quantity").setAttribute('value', quantity);
            }

        </script>
        <link rel="stylesheet" type="text/css" href="assets1/css/style.css" />
    </body>

</html>