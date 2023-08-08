<%-- 
    Document   : addUser
    Created on : Mar 16, 2023, 12:07:41 AM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bodycss/css/bootstrap.min.css">
        <!-- FontAwesome CSS -->
        <link rel="stylesheet" href="bodycss/css/all.min.css">
        <link rel="stylesheet" href="bodycss/css/uf-style.css">
        <link rel="icon" type="image/x-icon" href="bodycss/img/logo.jpg">

        
        <script type="text/javascript">
            var patt_email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            var patt_phone = /^0[1-9]\d{8,10}$/;
            var s_birthday = document.getElementById("date").value;
            const x = new Date(s_birthday);
            const y = new Date();
            if (s_birthday != "") {
                if (x.getTime() > y.getTime()) {
                    let time = y.getMonth() + "/" + y.getDate() + "/" + y.getFullYear();
//                    arrError.push("Student birthday cannot greater than " + time);
                    document.getElementById("txtDateMessage").innerHTML = ("Student birthday cannot greater than" + time);
                }
            }

            function checkUser() {
                Ln = document.getElementById("username").value;
                document.getElementById("txtUserMessage").innerHTML =
                        Ln.trim() == "" ? "UserName can't be empty" : "";
                return  Ln != "";
            }
            function checkPass() {
                Ln = document.getElementById("password").value;
                document.getElementById("txtPassMessage").innerHTML =
                        Ln.trim() == "" ? "Password can't be empty" : "";
                return  Ln != "";
            }
            function checkRPass() {
                Ln = document.getElementById("repass").value;
                document.getElementById("txtRPassMessage").innerHTML =
                        Ln.trim() == "" ? "Confirm Pass can't be empty" : "";
                return  Ln != "";
            }

            function checkaddress() {
                Ad = document.getElementById("address").value;
                document.getElementById("txtAddressMessage").innerHTML =
                        Ad.trim() == "" ? "Address can't be empty" : "";
                return Ad != "";
            }
            function checkDate() {
                const x = new Date(s_birthday);
                const y = new Date();
                if (x.getTime > y.getTime()) {
                    let time = y.getMonth() + "/" + y.getDate() + "/" + y.getFullYear();
                    document.getElementById("txtDateMessage").innerHTML = ("Student birthday cannot greater than" + time);
                } else {
                    Ln = document.getElementById("date").value;
                    document.getElementById("txtDateMessage").innerHTML =
                            Ln.trim() == "" ? "Date can't be empty" : "";
                    return  Ln != "";
                }
            }
            function checkEmail() {
                email = document.getElementById("email").value;
                document.getElementById("txtEmailMessage").innerHTML =
                        (patt_email.test(email) == false) ? "Email is invalid" : "";
                return patt_email.test(email);
            }
//
            function checkF() {
                Ln = document.getElementById("firstname").value;
                document.getElementById("txtname").innerHTML =
                        Ln.trim() == "" ? "First Name can't be empty" : "";
                return  Ln != "";
            }
            function checkM() {
                Ln = document.getElementById("middlename").value;
                document.getElementById("txtfname").innerHTML =
                        Ln.trim() == "" ? "Middle Name can't be empty" : "";
                return  Ln != "";
            }
            function checkL() {
                Ln = document.getElementById("lastname").value;
                document.getElementById("txtlastname").innerHTML =
                        Ln.trim() == "" ? "Last Name can't be empty" : "";
                return  Ln != "";
            }

            function checkPhone() {
                phone = document.getElementById("phone").value;
                document.getElementById("txtPhoneMessage").innerHTML =
                        (patt_phone.test(phone) == false) ? "Phone is invalid" : "";
                return patt_phone.test(phone);
            }

            function checkRole() {
                Ln = document.getElementById("role").value;
                document.getElementById("txtRole").innerHTML =
                        Ln.trim() == "" ? "Role can't be empty" : "";
                return  Ln != "";
            }
            
            function checkAllData() {

                isValidUser = checkUser();
                isValidPass = checkPass();
                isValidRPass = checkRPass();
                isValidEmail = checkEmail();
                isValidPhone = checkPhone();
                isValidAddress = checkaddress();
                isValidDate = checkDate();
                isValidf = checkF();
                isValidm = checkM();
                isValidl = checkL();
                isValidRole = checkRole();
                isValid =
                        isValidUser &&
                        isValidPass &&
                        isValidEmail &&
                        isValidPhone &&
                        isValidAddress &&
                        isValidDate &&
                        isValidf &&
                        isValidm &&
                        isValidl &&
                        isValidRole &&
                        isValidRPass;
                errorMessage = document.getElementById("txtError");
                if (isValid == true) {
                    return true;
                } else if (isValid == false) {
                    return false;
                }
                return false;
            }
        </script>
        
        
        
        
        <style>

	</style>
    </head>
    <body>
        
        <div class="uf-form-signin">
            <div class="text-center">
<!--                <a href="https://uifresh.net/"><img src="bodycss/img/logo-fb.png" alt="" width="100" height="100"></a>-->
                <h1 class="text-white h3">Add User</h1>
                <span style="color: red">${requestScope.mess} </span>
            </div>
            <form class="mt-4" action="addUser" method="post" onsubmit="return checkAllData()" id="form-1">
<!--                <div class="form-message" id="txtUserMessage"></div>
                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-user"></span>
                    <input minlength="5" id="username"  type="text" name="Account" class="form-control" placeholder="Username or Email address">
                </div>-->


<!--                <div class="form-message" id="txtPassMessage"></div>
                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-lock"></span>
                    <input minlength="6"  type="password" id="password" name="Password" class="form-control" placeholder="Password">
                </div>-->

<!--                <div class="form-message" id="txtRPassMessage"></div>
                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-lock"></span>
                    <input minlength="6" type="password" id="repass"name="repass" class="form-control" placeholder="Password">
                </div>-->

                <div class="form-message" id="txtname"></div>
                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-user"></span>
                    <input minlength="2" type="text" id="firstname" name="FirstName" class="form-control" placeholder="First Name">
                </div>

                <div class="form-message" id="txtfname"></div>
                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-user"></span>
                    <input minlength="2" type="text" id="middlename" name="MiddleName" class="form-control" placeholder="Middle Name">
                </div>




                <div class="form-message" id="txtlastname"></div>
                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-user"></span>
                    <input minlength="2" type="text" id="lastname" name="LastName" class="form-control" placeholder="Last Name">
                </div>
                
                <div class="form-message" id="txtDateMessage"></div>
                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-calendar"></span>
                    <input type="date" id="date"  name="Date" class="form-control" placeholder="Date">
                </div>
                <div class="form-message" id="txtAddressMessage"></div>
                
                
                
                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-genderless"></span>
                    <input type="radio" name="gender" value="Male" style="margin-left: 20px" checked> Male
                    <input type="radio" name="gender" value="FeMale" style="margin-left: 20px"> FeMale 
                </div>



                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-address-card"></span>
                    <input minlength="2" type="text"  id="address" name="Address" class="form-control" placeholder="Address">
                </div> 
                <div class="form-message" id="txtEmailMessage"></div>
                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-envelope"></span>
                    <input type="email"  id="email" name="Mail" class="form-control" placeholder="Mail">
                    <div class="form-error"></div>
                </div> 
                <div class="form-message" id="txtPhoneMessage"></div>
                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-phone"></span>
                    <input minlength="10" type="tel"id="phone" name="Phone" class="form-control" placeholder="Phone">
                </div>
                
                <div class="form-message" id="txtUserMessage"></div>
                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-user"></span>
                    <input minlength="5" id="username"  type="text" name="Account" class="form-control" placeholder="Username ">
                </div>

                <div class="form-message" id="txtPassMessage"></div>
                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-lock"></span>
                    <input minlength="6"  type="text" id="password" name="Password" class="form-control" placeholder="Password">
                </div>
                
                <div class="form-message" id="txtRole"></div>
                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-user"></span>
                    <input minlength="1" type="text" id="role" name="Rolea" class="form-control" placeholder="Role">
                </div>
                <div class="input-group uf-input-group input-group-lg mb-3">
                    <span class="input-group-text fa fa-image"></span>
                    <input name="Image" class="form-control" type="file">
                </div>
                
                
                
<!--                <span style="color: #000">${requestScope.error} </span>-->
                <div class="d-grid mb-4">
                    <button type="submit" class="btn uf-btn-primary btn-lg">Create</button>

                </div>
            </form>
        </div>






        <script src="bodycss/js/popper.min.js"></script>
        <script src="bodycss/js/bootstrap.min.js"></script>
        </form>
        </div>
    </body>
</html>