<%-- 
    Document   : updateproduct
    Created on : Feb 12, 2023, 9:04:08 PM
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
        <form method="post" action="update">
            <label>ID<input value="${st.productid}" type="text" name="productid" readonly></label>
            <br>
            <label>Price<input value="${st.price}" type="text" id="s_id" name="price" ></label>
            <br>
            <label>Description<input value="${st.description}" type="text" id="s_name" name="description"></label>
            <br>
            <label>Image<input value="${st.image}" type="text" id="s_birthday" name="image" ></label><!-- comment -->
            <br>
            <label>ProductName<input value="${st.productname}" type="text" id="s_birthday" name="productname" ></label><!-- comment -->
            <br>
            <label>Quantity<input value="${st.quantity}" type="text" id="s_birthday" name="quantity" ></label><!-- comment -->
            <br>
            <input type="submit" value="Update" >       
            <br>
            <button ><a href="/Product" style="text-decoration: none;">Return Product List</a></button><!-- comment -->

        </form>
    </body>
</html>
