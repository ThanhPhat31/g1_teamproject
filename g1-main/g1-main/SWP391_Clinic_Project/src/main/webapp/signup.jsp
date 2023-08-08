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

        <title>Sign Up</title>
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
                            <h2 class="heading-section">Sign Up</h2>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-md-6 col-lg-4">
                            <div class="login-wrap p-0">
                                <span style="color: red">${requestScope.mess} </span>
                                <form action="signup" method="post" onsubmit="return validateForm()" id="form" class="signin-form">
                                    <section id="section1" class="section">
                                        <h3 class="mb-4 text-center">Create your account</h3>
                                        <div class="form-message" id="txtUserMessage"></div>
                                        <div class="form-group">   
                                            <input required  id="username"  type="text" name="Account" class="form-control" placeholder="Account" onchange="checkUser()" >
                                        </div>
                                        <div class="form-message" id="txtPassMessage"></div>
                                        <div class="form-group">
                                            <input onchange="checkPass()"   required minlength="6" type="password" id="password" name="Password" class="form-control" placeholder="Password">
                                            <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                        </div>
                                        <div class="form-message" id="txtRPassMessage"></div>
                                        <div class="form-group">
                                            <input required  minlength="6" type="password" id="repass" name="repass" class="form-control" placeholder="Confirm Password" onchange="checkRPass()">
                                            <span toggle="#repass" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                        </div>
                                        <div class="form-group d-md-flex">
                                            <div class="w-50"></div>
                                            <div class="w-50 text-md-right">
                                                <a id="next1" type="button" href="#">next</a>
                                            </div>
                                        </div>
                                        <div class="w-100 text-center">
                                            <label class="checkbox-primary">Already have an account!</label>
                                            <a href="/login" style="color: #fff;">Sign In</a>
                                        </div>
                                    </section>
                                    <section id="section2" class="section">
                                        <h3 class="mb-4 text-center">Just few more info</h3>
                                        <div class="form-message" id="txtFirstMessage"></div>
                                        <div class="form-group">
                                            <input required minlength="2" type="text" id="firstname" name="FirstName" class="form-control" placeholder="First Name" onchange="checkFirst()">
                                        </div>
                                        <div class="form-message" id="txtMiddleMessage"></div>
                                        <div class="form-group">
                                            <input minlength="0" type="text" id="middlename" name="MiddleName" class="form-control" placeholder="Middle Name" onchange="checkMiddle()">
                                        </div>
                                        <div class="form-message" id="txtLastMessage"></div>
                                        <div class="form-group">

                                            <input required minlength="2" type="text" id="lastname" name="LastName" class="form-control" placeholder="Last Name" onchange="checkLast()">
                                        </div>
                                        <div class="form-message" id="txtDateMessage"></div>
                                        <div class="form-group">
                                            <input required type="date" id="date"  name="Date" class="form-control" value="2010-01-01" onchange="checkDate()">
                                        </div>
                                        <div class="form-group">
                                            <select name="gender" class="form-control">
                                                <option class="form-select" value="male">Male</option>
                                                <option class="form-select" value="female">Female</option>
                                            </select>
                                        </div>
                                        <div class="form-group d-md-flex">
                                            <div class="w-50">
                                                <a  id="back1" type="button" href="#">back</a >
                                            </div>
                                            <div class="w-50 text-md-right">
                                                <a  id="next2" type="button" href="#">next</a >
                                            </div>
                                        </div>
                                        <div class="w-100 text-center">
                                            <label class="checkbox-primary">Already have an account!</label>
                                            <a href="/login" style="color: #fff;">Sign In</a>
                                        </div>
                                    </section>                                
                                    <section id="section3" class="section">
                                        <h3 class="mb-4 text-center">Almost done!</h3>
                                        <div class="form-message" id="txtAddressMessage"></div>
                                        <div class="form-group">

                                            <input required minlength="2" type="text"  id="address" name="Address" class="form-control" placeholder="Address" onchange="checkAddress()"> 
                                        </div>
                                        <div class="form-message" id="txtEmailMessage"></div>
                                        <div class="form-group">

                                            <input required type="email"  id="email" name="Mail" class="form-control" placeholder="Mail" onchange="checkEmail()">
                                        </div>
                                        <div class="form-message" id="txtPhoneMessage"></div>
                                        <div class="form-group">

                                            <input  required type="" id="phone" name="Phone" class="form-control" placeholder="Phone" onchange="checkPhone()"> 
                                        </div>
                                        <div class="form-group d-md-flex">
                                            <div class="w-50">
                                                <a  id="back2" type="button" href="#">back</a >
                                            </div>
                                            <div class="w-50 text-md-right">
                                                <button type="submit" class="form-control btn btn-primary submit px-3" style="font-size: 18px;">Sign Up</button>
                                            </div>
                                        </div>
                                        <div class="w-100 text-center">
                                            <label class="checkbox-primary">Already have an account!</label>
                                            <a href="/login" style="color: #fff;">Sign In</a>
                                        </div>
                                    </section>

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
            });
        </script>
        <script src="assets1/js/main.js" type="text/javascript"></script>

    </body>

</html>