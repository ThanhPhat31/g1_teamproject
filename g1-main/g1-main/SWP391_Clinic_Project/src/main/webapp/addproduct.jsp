<%-- 
    Document   : addproduct
    Created on : Feb 12, 2023, 8:35:56 PM
    Author     : vusyl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <span style="color: red">${requestScope.mess} </span>
        <form method="post" action="create">
            <label>Price<input type="text" id="s_price" name="price" ></label>
            <br>
            <label>Description<input type="text" id="s_description" name="description"></label>
            <br>
            <label>Image<input type="text" id="s_image" name="image" ></label><!-- comment -->
            <br>
            <label>ProductName<input type="text" id="s_productname" name="productname" ></label><!-- comment -->
             <br>
            <label>Quantity<input type="text" id="s_quantity" name="quantity" ></label><!-- comment -->
             <br>
            <label>Catertory<input type="text" id="s_category" name="category" ></label><!-- comment -->
             <br>
            <input type="submit" value="Submit" >    
             <br>
            <button ><a href="/listProduct" style="text-decoration: none;">Return Product List</a></button><!-- comment -->

        </form>
    </body>
</html>
