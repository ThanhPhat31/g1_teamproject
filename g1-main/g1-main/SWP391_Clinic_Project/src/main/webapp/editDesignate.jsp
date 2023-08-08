<%-- 
    Document   : editprofile
    Created on : Feb 12, 2023, 9:50:29 PM
    Author     : vusyl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="entity.Designate"%>
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


        <form method="post" action="editDesignate">
            <div class="container">
                <div class="row gutters">
                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="account-settings">
                                    <div class="user-profile">
                                        <div class="user-avatar">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin">
                                        </div>
                                        <h5 class="user-name"></h5>
                                        <h6 class="user-email"></h6>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${st}" var="p">            
                        <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                            <div class="card h-100">
                                <div class="card-body">
                                    <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <h6 class="mb-2 text-primary">Personal Details</h6>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="fullName">CaseID</label>
                                                <input type="text" value="${p.getCase().getCaseID()}" class="form-control" name="CaseID" readonly placeholder="Enter full name">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="fullName">DesignateID</label>
                                                <input type="text" value="${p.getDesignateID()}" class="form-control" name="DesignateID" readonly placeholder="Enter full name">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="fullName">Doctor Name</label>
                                                <input type="text" value="${p.getCase().getDoctor().getFullName()}" class="form-control" name="productid" readonly placeholder="Enter full name">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="fullName">Patient Name</label>
                                                <input input value="${p.getCase().getPatient().getFullName()}" type="text" id="s_id" name="firstname"  readonly class="form-control"  placeholder="Enter full name">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="fullName">Date</label>
                                                <input input value="${p.getCase().getDate()}" type="text" id="s_id" name="middlename" readonly class="form-control"  placeholder="">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="fullName">Time</label>
                                                <input input value="${p.getCase().getTime()}" type="text" id="s_id" name="lastname" readonly class="form-control"  placeholder="">
                                            </div>
                                        </div> 
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="fullName">Designate Name</label>
                                                <input input value="${p.name}" type="text" id="s_id" name="doB" readonly class="form-control"  placeholder="">
                                            </div>
                                        </div>



                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="eMail">Description</label>
                                                <input re accept=""value="${p.description}" type="text" id="s_id" name="description"  class="form-control"  placeholder="">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="eMail">Result</label>
                                                <input required="" value="${p.result}" type="text" id="s_id" name="result"  class="form-control"  placeholder="">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="eMail">Status</label>
                                                <input input value="${p.getStrStatus()}" type="text" id="s_id" name="status" readonly=""  class="form-control"  placeholder="">
                                            </div>
                                        </div>


                                    </div>

                                    <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="text-right">
                                                <button type="button" id="submit" name="submit" class="btn btn-primary"><a href="/designate" style="text-decoration: none;">Return</a></button><!-- comment -->
                                                <button type="submit" id="submit" name="submit" onclick="return confirm('Are you sure you want to update designate?')" value="true" class="btn btn-primary">Update</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </form>

    </body>
   
</html>
