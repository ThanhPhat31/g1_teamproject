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
                        <h2 class="heading-section">Welcome to Eye Clinic</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <!--                        <h3 class="mb-4 text-center"></h3>-->
                            <span style="color: red">${requestScope.mess} </span>
                            <form action="login" method="post" onsubmit="return checkAllData()" class="signin-form">
                                <div class="form-group">
                                    <input minlength="5" type="text" name="Account" id="username" class="form-control" placeholder="Username" required>
                                </div>
                                <div class="form-group">
                                    <input id="password-field" minlength="6" type="password" name="Password" class="form-control" placeholder="Password" required>
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3" style="font-size: 18px;">Sign In</button>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-50">
                                        <label class="checkbox-wrap checkbox-primary">Remember Me
                                            <input type="checkbox" checked>
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="w-50 text-md-right">
                                        <a href="/forgot" style="color: #fff">Forgot Password</a>
                                    </div>
                                </div>
                                <div class="w-100 text-center">
                                    <label class="checkbox-primary">Don't have an account?</label>
                                    <a href="/signup" style="color: #fff;">Sign Up</a>
                                </div>
                            </form>
                            <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
                            <div class="social d-flex text-center">
                                <a href="#" class="px-2 py-2 mr-md-1 rounded" title="Login with Facebook"><i class="fab fa-facebook-f"></i></a>
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/AccessGoogle/login-google&response_type=code
                                   &client_id=352140522561-vpmetjr6bjce1vod9b0cppihhbcgdesh.apps.googleusercontent.com&approval_prompt=force" class="px-2 py-2 ml-md-1 rounded" title="Login with Google"><i class="fab fa-google"></i></a>
                            </div>
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
            $(".toggle-password").click(function() {
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
