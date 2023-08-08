<%-- 
    Document   : 
    Created on : 22-Feb-2023, 22:45:47
    Author     : phat3
--%>

<%@page import="entity.Account"%>
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
        <title>Update user</title>
    </head>
    <body>
        <%
            Account accounts = (Account) request.getAttribute("accounts");
            boolean check_gender = accounts.getGender();
        %>

        <form action="adminUpdate" method="post">
            <div class="container">
                <div class="">
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <h6 class="mb-2 text-primary">Update user</h6>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="fullName">ID</label>
                                        <input type="text" value="${accounts.profileID}" class="form-control" name="profileid" readonly placeholder="">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="fullName">First Name</label>
                                        <input input value="${accounts.firstName}" type="text" id="s_id" name="firstname"  class="form-control"  placeholder="">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="fullName">Middle Name</label>
                                        <input input value="${accounts.middleName}" type="text" id="s_id" name="middlename"  class="form-control"  placeholder="">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="fullName">Last Name</label>
                                        <input input value="${accounts.lastName}" type="text" id="s_id" name="lastname"  class="form-control"  placeholder="">
                                    </div>
                                </div> 
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="fullName">Birthday</label>
                                        <input input value="${accounts.doB}" type="text" id="s_id" name="doB"  class="form-control"  placeholder="">
                                    </div>
                                </div>

                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <label for="fullName">Gender</label>
                                    <div class="form-group">

                                        <input type="radio" name="gender" <% if (check_gender == true) %> checked="" <%;%> value="Male" style="margin-left: 20px" > Male
                                        <input type="radio" name="gender" <% if (check_gender == false) %> checked="" <%;%> value="FeMale" style="margin-left: 20px"> FeMale 
                                    </div>
                                </div>


                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="eMail">Address</label>
                                        <input input value="${accounts.address}" type="text" id="s_id" name="Address"  class="form-control"  placeholder="">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="eMail">Mail</label>
                                        <input input value="${accounts.mail}" type="text" id="s_id" name="Mail"  class="form-control"  placeholder="">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <input input value="${accounts.phone}" type="text" id="s_id" name="Phone"  class="form-control"  placeholder="">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="phone">Account</label>
                                        <input input value="${accounts.account}" type="text" id="account" name="Account"  class="form-control"  placeholder="">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="phone">Password</label>
                                        <input input value="${accounts.password}" type="text" id="password" name="Password"  class="form-control"  placeholder="">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="phone">Role</label>
                                        <input input value="${accounts.role}" type="text" id="role" name="Role"  class="form-control"  placeholder="">
                                    </div>
                                </div>
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="form-group">
                                        <label for="Image">Image</label>
                                        <div><img src="assets1/news/${accounts.image}" width="400px" height="200px"></div>
                                        <input type="file" id="file2" name="Image" class="form-control" placeholder="">
                                    </div>
                                </div>

                            </div>

                            <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="text-right">
                                        <button type="submit" id="submit" name="submit" class="btn btn-primary"><a href="/listUser" style="text-decoration: none; color: white" >Back</a></button>
                                        <button type="submit" id="submit" name="submit" class="btn btn-primary">Update</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </form>

    </body>
</html>
