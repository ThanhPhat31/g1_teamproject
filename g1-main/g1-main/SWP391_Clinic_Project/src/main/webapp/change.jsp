<%-- 
    Document   : signup
    Created on : Feb 3, 2023, 6:44:30 PM
    Author     : vusyl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Reset Password</title>
        <link rel="icon" type="image/x-icon" href="bodycss/img/logo-fb.png">    

        <!-- FontAwesome CSS -->
        <link rel="stylesheet" href="bodycss/css/all.min.css">
        <link rel="stylesheet" href="bodycss/css/uf-style.css">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">        
        <link href="assets1/css/style2.css" rel="stylesheet" type="text/css"/>


        <style>
            #section2, #section3 {
                display: none;
            }
        </style>
    </head>




    <body class="img" style="background-image: url(assets1/images/login.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="background">
                    <div class="row justify-content-center">
                        <div class="col-md-6 text-center mb-5">
                            <h2 class="heading-section">Reset PassWord</h2>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-md-6 col-lg-4">
                            <div class="login-wrap p-0">
                                <span style="color: red">${requestScope.mess} </span>
                                <form class="mt-4" action="change" method="post">
                                    <section id="section1" class="section">
                                        <h3 class="mb-4 text-center">Reset PassWord</h3>
                                        <div class="form-message" id="txtUserMessage"></div>
                                        <div class="form-group">   
                                            <input required="" minlength="6" type="password" name="opass" class="form-control" placeholder="Old Password">
                                            <input type="hidden" name="Account" class="form-control" value="${sessionScope.acc.account}">
                                        </div>
                                        <div class="form-message" id="txtPassMessage"></div>
                                        <div class="form-group">

                                                <input onchange="checkPass()"   required minlength="6" type="password" id="password" name="npass" class="form-control" placeholder="New Password">
                                                <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                        </div>
                                        <div class="form-message" id="txtRPassMessage"></div>
                                        <div class="form-group">
                                            <input required  minlength="6" type="password" id="repass" name="cpass" class="form-control" placeholder="Confirm Password" onchange="checkRPass()">
                                            <span toggle="#repass" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                        </div>

                                     
                                    </section>
                                    <div class="form-group d-md-flex">
                                        <div class="w-50">
                                            <a class="form-control btn btn-primary submit px-3"  id="back2" type="button" href="/profile">Back</a >
                                        </div>
                                        <div class="w-50 text-md-right">
                                            <button type="submit" class="form-control btn btn-primary submit px-3" style="font-size: 18px;">Change</button>
                                        </div>
                                    </div>


                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="Validate/validateInput.js"></script>
        <script src="assets1/js/jquery.min.js" type="text/javascript"></script>
        <script src="assets1/js/popper.js" type="text/javascript"></script>
        <script src="assets1/js/bootstrap.min.js" type="text/javascript"></script>      

        <script src="assets1/js/main.js" type="text/javascript"></script>


        <script>

                                                $(document).ready(function () {
                                                    $('#next1').click(function () {
                                                        console.log("next1()");
                                                        $('#section1').css('display', 'none');
                                                        $('#section2').css('display', 'inherit');
                                                    });
                                                    $('#next2').click(function () {
                                                        console.log("next2()");
                                                        $('#section2').css('display', 'none');
                                                        $('#section3').css('display', 'inherit');
                                                    });
                                                    $('#back1').click(function () {
                                                        console.log("back1()");
                                                        $('#section2').css('display', 'none');
                                                        $('#section1').css('display', 'inherit');
                                                    });
                                                    $('#back2').click(function () {
                                                        console.log("back2()");
                                                        $('#section3').css('display', 'none');
                                                        $('#section2').css('display', 'inherit');
                                                    });
                                                });
        </script>

    </body>




</html>