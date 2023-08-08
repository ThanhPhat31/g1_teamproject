<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bodycss/css/product.css" rel="stylesheet" type="text/css"/>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="assets1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets1/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="assets1/css/style.css" />
        <link rel="stylesheet" type="text/css" href="bodycss/css/product.css">
        <style>
            .a.active{
                color: green;
                font-weight: bold;
                .colPro-sidebar{
                    margin-top: 100px;

                }
                .products{
                    padding-left: 0px;
                }

            }
        </style>
    </head>
    <jsp:include  page="layout/menu.jsp"></jsp:include>
        <body>
            <div style="display: flex">
                <div class="colPro-sidebar" id="filter-mb">
                    <div class="colPro-sb-search-form">
                        <form action="search" method="post">			
                            <div class="input-group">
                                <input type="text"  name="txt" placeholder="Tìm kiếm..." name="p">
                                <span class="input-group-btn">
                                    <button type="submit" class="btnType1"><i class="fa fa-search" aria-hidden="true"></i></button>
                                </span>
                            </div>
                        </form>
                    </div>
                    <div class="sort-by">
                        <h2>
                            Tìm theo
                        </h2>
                    </div>

                    <div class="sidebar-sort">
                        <h3 class="accordion active">Loại</h3>
                        <div class="panel" style="max-height: 350px;">
                            <ul class="no-bullets filter-vendor clearfix">

                                <li>
                                    <label data-filter="Áp Tròng" class="filter-vendor__item ap-trong">
                                        <a name="price-filter" value="" href="ListProductByCategory0">Gọng Kính</a>
                                    </label>
                                </li>	

                                <li>
                                    <label data-filter="Gọng Kính" class="filter-vendor__item gong-kinh">
                                        <a name="price-filter" value="" href="ListProductByCategory1">Áp Tròng</a>
                                    </label>
                                </li>				
                            </ul>
                        </div>
                    </div>

                    <div class="sidebar-sort">
                        <button class="accordion active">Khoảng giá</button>
                        <div class="panel" style="max-height: 310px;">
                            <ul class="no-bullets filter-price clearfix">
                                <li>
                                    <label>
                                        <a name="price-filter" value="" href="ListProductByPrice?minprice=0&maxprice=100000">Nhỏ hơn 100,000₫</a>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <a name="price-filter" value="" href="ListProductByPrice?minprice=100000&maxprice=200000">Từ 100,000₫ - 200,000₫</a>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <a name="price-filter" value="" href="ListProductByPrice?minprice=200000&maxprice=300000">Từ 200,000₫ - 300,000₫</a>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <a name="price-filter" value="" href="ListProductByPrice?minprice=300000&maxprice=400000">Từ 300,000₫ - 400,000₫</a>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <a name="price-filter" value="" href="ListProductByPrice?minprice=400000&maxprice=500000">Từ 400,000₫ - 500,000₫</a>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <a name="price-filter" value="" href="ListProductByPrice?minprice=500000&maxprice=1000000">Lớn hơn 500,000₫</a>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <form action="action">
                        <select style="height: 30px; width:195px;"  onchange="location = this.value">
                            <option style="text-align: center;" value="">Select sort</option>
                            <option ${type == 1?"selected":""} value="ListUpController">Giá tăng dần</option>
                        <option ${type == 2?"selected":""} value="ListDownController">Giá giảm dần</option>
                        <option ${type == 3?"selected":""} value="ListProductByNameASC">Tên sản phẩm từ A-Z</option>
                    </select>
                    <br/>
                </form>
            </div> 

            <section id="mainContainer" style="background: none">
                <div class="about">
                    <div class="products">
                        <c:forEach items="${listProductP}" var="p" >
                            <ul>
                                <li>
                                    <div class="product" style="background: none">
                                        <div class="imgbox">
                                            <img src="bodycss/img/${p.image}.jpg"alt=""/>
                                        </div>
                                        <div class="details">
                                            <h2>${p.productname} </h2>
                                            <span style="color: black">Quantity:${p.quantity}</span>
                                            <div class="price"> ${p.price}</div>
                                            <a href="ProductDetail?pid=${p.productid}&price=${p.price}" style="color: blue"> See Detail </a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </c:forEach>
                    </div>  
                </div>
        </div>
    </section>
    <script src="assets1/js/jquery-3.2.1.min.js"></script>
    <script src="assets1/js/popper.min.js"></script>
    <script src="assets1/js/bootstrap.min.js"></script>
    <script src="assets1/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets1/plugins/scroll-nav/js/jquery.easing.min.js"></script>    
    <script src="assets1/plugins/scroll-nav/js/scrolling-nav.js"></script>
    <script src="assets1/js/script.js"></script>
    <jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>
