<%-- 
    Document   : editprofile
    Created on : Feb 12, 2023, 9:50:29 PM
    Author     : vusyl
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
        <title>JSP Page</title>

        <style>
            body {
                margin: 0;

                color: #2e323c;
                background: #f5f6fa;
                position: relative;
                height: 100%;
            }
            .form-message{
                margin: 0;
                padding: 0;
                text-align: center;
            }
            .form-message{
                color: red;
            }
            .account-settings .user-profile {
                margin: 0 0 1rem 0;
                padding-bottom: 1rem;
                text-align: center;
            }
            .account-settings .user-profile .user-avatar {
                margin: 0 0 1rem 0;
            }
            .account-settings .user-profile .user-avatar img {
                width: 90px;
                height: 90px;
                -webkit-border-radius: 100px;
                -moz-border-radius: 100px;
                border-radius: 100px;
            }
            .account-settings .user-profile h5.user-name {
                margin: 0 0 0.5rem 0;
            }
            .account-settings .user-profile h6.user-email {
                margin: 0;
                font-size: 0.8rem;
                font-weight: 400;
                color: #9fa8b9;
            }
            .account-settings .about {
                margin: 2rem 0 0 0;
                text-align: center;
            }
            .account-settings .about h5 {
                margin: 0 0 15px 0;
                color: #007ae1;
            }
            .account-settings .about p {
                font-size: 0.825rem;
            }
            .form-control {
                border: 1px solid #cfd1d8;
                -webkit-border-radius: 2px;
                -moz-border-radius: 2px;
                border-radius: 2px;
                font-size: .825rem;
                background: #ffffff;
                color: #2e323c;
            }

            .card {
                background: #ffffff;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                border: 0;
                margin-bottom: 1rem;
            }

        </style>
    </head>
    <body>
        <%
            Account st = (Account) request.getAttribute("st");
            boolean check_gender = st.getGender();
        %>
        <jsp:include page="layout/menu.jsp"></jsp:include>
            <form method="post" action="editprofile" onsubmit="return validateForm()" id="form">
                <div class="container">
                    <div class="row gutters">
                        <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                            <div class="card h-100">
                                <div class="card-body">
                                    <div class="account-settings">
                                        <div class="user-profile">
                                            <div class="user-avatar">
                                                <img src="assets1/news/${st.image}" alt="Maxwell Admin">
                                        </div>
                                        <h5 class="user-name">${st.firstName}  ${st.middleName}  ${st.lastName}</h5>
                                        <h6 class="user-email">${st.mail}</h6>
                                        <input type="file" name="avatar" value="${st.image}">`
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <h6 class="mb-2 text-primary">Personal Details</h6>
                                    </div>
                                    <input  value="${st.profileID}" type="text" id="s_id" name="profileid"  class="form-control" hidden="" placeholder="Enter full name">
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-message" id="txtFirstMessage"></div>
                                        <div class="form-group">
                                            <label for="fullName">First Name</label>
                                            <input onchange="checkFirst()" value="${st.firstName}" type="text" id="firstname" name="firstname"  class="form-control"  placeholder="Enter full name">

                                        </div>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-message" id="txtMiddleMessage"></div>
                                        <div class="form-group">
                                            <label for="fullName">Middle Name</label>
                                            <input onchange="checkMiddle()" value="${st.middleName}" type="text" id="middlename" name="middlename"  class="form-control"  placeholder="">

                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-message" id="txtLastMessage"></div>
                                        <div class="form-group">
                                            <label for="fullName">Last Name</label>
                                            <input onchange="checkLast()"  value="${st.lastName}" type="text" id="lastname" name="lastname"  class="form-control"  placeholder="">

                                        </div>
                                    </div> 
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="fullName">Birthday</label>
                                            <input  value="${st.doB}" type="text" id="s_id" name="doB"  class="form-control"  placeholder="">
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
                                            <input input value="${st.address}" type="text" id="s_id" name="Address"  class="form-control"  placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="eMail">Mail</label>
                                            <input input value="${st.mail}" type="text" id="s_id" name="Mail"  class="form-control"  placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="phone">Phone</label>
                                            <input input value="${st.phone}" type="text" id="s_id" name="Phone"  class="form-control"  placeholder="">
                                        </div>
                                    </div>

                                </div>

                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                            <button type="button" id="submit" name="submit" class="btn btn-primary"><a href="/profile" style="text-decoration: none;">Return</a></button><!-- comment -->
                                            <button type="submit" id="submit" name="submit" onclick="return confirm('Are you sure you want to update profile?')" value="true" class="btn btn-primary">Update</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <jsp:include page="layout/footer.jsp"></jsp:include>
        <script src="Validate/validateInput.js"></script>
    </body>


</html>
