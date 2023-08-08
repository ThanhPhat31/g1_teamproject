<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Forgot Password</title>
        <link rel="stylesheet" href="bodycss/css/all.min.css">
        <link rel="stylesheet" href="bodycss/css/uf-style.css">              
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">        
        <link href="assets1/css/style2.css" rel="stylesheet" type="text/css"/>
        <link
            href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
            rel='stylesheet'>
        <link href='' rel='stylesheet'>
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>

            .section {
                color: #fff;
            }

            .padding-bottom-3x {
                padding-bottom: 72px !important
            }

            .form-control{
                background: transparent;
                color: #fff;
                text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4);
            }
            .form-control:focus{
                background: transparent;
                color: #fff;
                text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4);
            }

            .btn {
                font-size: 13px
            }
            .text-muted {
                color: aqua!important;
            }
            text-primary {
                color: #fbceb5!important;
            }
        </style>
    </head>
    <body class="img" style="background-image: url(assets1/images/login.jpg);">
        <div class="container padding-bottom-3x mb-2 mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <div class="section">
                        <h2>Forgot your password?</h2>
                        <p>Change your password in three easy steps. This will help you
                            to secure your password!</p>
                        <ol class="list-unstyled">
                            <li><span class="text-primary text-medium">1. </span>Enter
                                your email address below.</li>
                            <li><span class="text-primary text-medium">2. </span>Our
                                system will send you an OTP to your email</li>
                            <li><span class="text-primary text-medium">3. </span>Enter the OTP on the 
                                next page</li>
                        </ol>
                    </div>
                    <form class=" mt-4 section" action="forgot" method="POST">
                        <div class="card-body">
                            <span style="color: red">${requestScope.mess} </span>
                            <div class="form-group">

                                <label for="email-for-pass">Enter your email address</label>
                                <div class="form-message" id="txtEmailMessage"></div>
                                <input onchange="checkEmail()"
                                       class="form-control" type="text" name="email" id="email-for-pass" required=""><small
                                       class="form-text text-muted">Enter the registered email address . Then we'll
                                    email a OTP to this address.</small>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button class="btn btn-success" type="submit">Get New
                                Password</button>
                            <!--						<button  class="btn btn-danger" type="submit">Back to
                                                                                    Login</button>-->
                            <a href="/login" class="btn btn-danger">Back to
                                Login</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="Validate/validateInput.js"></script>
        <script src="assets1/js/jquery.min.js" type="text/javascript"></script>
        <script src="assets1/js/popper.js" type="text/javascript"></script>
        <script src="assets1/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets1/js/main.js" type="text/javascript"></script>
    </body>
</html>
