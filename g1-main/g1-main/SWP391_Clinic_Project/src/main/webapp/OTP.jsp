<%-- 
Document   : login
Created on : Feb 3, 2023, 6:32:29 PM
Author     : vusyl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Login</title>
        <link rel="icon" type="image/x-icon" href="bodycss/img/logo-fb.png">  

        <!-- Bootstrap CSS -->
        <link href="assets1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- FontAwesome CSS -->
        <link rel="stylesheet" href="bodycss/css/all.min.css">
        <link rel="stylesheet" href="bodycss/css/uf-style.css">              
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">        
        <link href="assets1/css/style2.css" rel="stylesheet" type="text/css"/>

        <script type="text/javascript">
            function checkAllData() {

                isValidLastname = checklastname();
                isValidAddress = checkpass();
                isValid =
                        isValidLastname &&
                        isValidAddress;
                errorMessage = document.getElementById("txtError");
                if (isValid == true) {
//                    alert("Thanks, Update Profile Sucessful!");
                    return true;
                } else if (isValid == false) {
//                    alert("Please Enter Full information!");
                    return false;
                }
                return false;
            }
        </script>

    </head>

    <body class="img js-fullheight" style="background-image: url(assets1/images/login.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">OTP</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <!--                        <h3 class="mb-4 text-center"></h3>-->
                            <span style="color: red">${requestScope.mess} </span>
                            <form action="otp" method="post" onsubmit="return checkAllData()" class="signin-form">
                                <div class="form-group">
                                    <input minlength="5" type="number"  name="otp"  id="username" class="form-control" placeholder="OTP" required>
                                    <small style="color: red" class="form-message" id="txtOTPMessage"></small>
                                </div>

                                 <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3" style="font-size: 18px;">Enter OTP</button>
                                </div>
                               
                                
                            </form>
                          
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="assets1/js/jquery.min.js" type="text/javascript"></script>
        <script src="assets1/js/popper.js" type="text/javascript"></script>
        <script src="assets1/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets1/js/main.js" type="text/javascript"></script>
        <script>
                                $(".toggle-password").click(function () {
                                    console.log("toggle-pass");
                                    $(this).toggleClass("fa-eye fa-eye-slash");
                                    var input = $($(this).attr("toggle"));
                                    if (input.attr("type") == "password") {
                                        input.attr("type", "text");
                                    } else {
                                        input.attr("type", "password");
                                    }
                                });
        </script>
    </body>


</html>
