<%-- 
    Document   : productDetail
    Created on : Mar 16, 2023, 11:10:33 AM
    Author     : buitr
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include  page="layout/menu.jsp"></jsp:include>
    <head>
        <title>Product Detail</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="assets1/css/detail.css" rel="stylesheet" type="text/css"/>
<link href="assets1/css/detail.css" rel="stylesheet" type="text/css"/>

    </head>
    
    <body>
            
        <section id="mainContainer">
            <div class="about" >
                <h2 style="font-size:50px;font-family:Time New Roman">${requestScope.product.productname}</h2>
                <div style="margin-top:10px;">
                    <h3 style="margin-bottom: 20px; color: chocolate"><a style="font-size: calc; color:#32CD32 ">Details:</a> ${requestScope.product.productname}, ${requestScope.product.description} </h3>
                    <img src="bodycss/img/${requestScope.product.image}.jpg" style="width:370px;height:400px;"></img>
                </div>
                <div style="font-size:20px;color:#556B2F;line-height:2em;">Price:<span style="color: crimson;font-size: 30px;">${requestScope.product.price}</span> </div>

                <div> 
                    <form method="post" action="ProductDetail" >
                        <label style="margin-top:20px;font-size:20px;color:#556B2F;line-height:2em;">
                            <input type="text" name="productid" value="${requestScope.product.productid}" style="display: none"/>
                            Choose Quantity:</label> <input style="width: 80px;" type="number" name="quantity" value="1" /> 
                        <br><p>  
                        <h3><button type="submit">Add to Cart</button> </h3>
                    </form>
                </div>
            </div>
        </section>
        <link rel="stylesheet" type="text/css" href="assets1/css/style.css" />
    </body>
</html>
