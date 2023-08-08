<%-- 
    Document   : admin-new-add
    Created on : 26-Feb-2023, 19:24:08
    Author     : phat3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       
        <link rel="icon" type="image/x-icon" href="assets1/images/favicon.jpg">
        <link rel="shortcut icon" href="assets1/images/fav.jpg">
        <link rel="stylesheet" href="assets1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets1/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.theme.default.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add service</title>
    </head>
    <body>

        <div class="container">

            <div class="card h-100">
                <form action="adminAddService" method="get">
                    <div class="card-body">
                        <div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mb-2 text-primary">Add Service</h6>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="form-group">
                                    <label for="title">Service Name</label>
                                    <input type="text" id="name" name="name"  class="form-control"  placeholder="">
                                </div>
                            </div>                             
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="form-group">
                                    <label for="date">Description</label>
                                    <input type="text" id="description" name="description"  class="form-control"  placeholder="">
                                </div>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="form-group">
                                    <label for="author">Content</label>
                                    <input type="text" id="content" name="content"  class="form-control"  placeholder="">
                                </div>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="form-group">
                                    <label for="Image">Image</label>
                                    <div><img src="" width="400px" height="200px"></div>
                                    <input type="file" id="file2" name="image" class="form-control" placeholder="">
                                </div>
                            </div>
                        </div>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="text-xl-right">
                                    <button type="submit" id="submit" name="submit" class="btn btn-primary">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
