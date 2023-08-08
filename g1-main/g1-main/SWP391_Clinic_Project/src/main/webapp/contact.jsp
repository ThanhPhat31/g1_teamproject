<%-- 
Document   : home
Created on : Jan 31, 2023, 1:00:27 PM
Author     : vusyl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Contact</title>

        <link rel="shortcut icon" href="assets1/images/fav.jpg">
        <link rel="stylesheet" href="assets1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets1/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="assets1/css/style.css" />
    </head>
    <body>
        <jsp:include page="layout/menu.jsp"></jsp:include>
        <form action="contact" method="post">
                <section id="contact_us" class="contact-us-single">
                    <div class="row no-margin">
                        <div class="col-sm-6 no-padding">
                          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d119207.97010750875!2d105.83566692783202!3d20.982650955605212!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab9eb81e4f33%3A0xb8bd43325479032c!2sTam%20Anh%20Hospital!5e0!3m2!1sen!2s!4v1678637081962!5m2!1sen!2s" width="800" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                        <div  class="col-sm-6 cop-ck">
                            <h2 >Contact</h2>
                            <div class="row cf-ro">
                                <div  class="col-sm-3"><label>Enter Name :</label></div>
                                <div class="col-sm-8"><input required="" type="text" placeholder="Enter Name" name="name" class="form-control input-sm"  ></div>
                            </div>
                            <div  class="row cf-ro">
                                <div  class="col-sm-3"><label>Email Mail :</label></div>
                                <div class="col-sm-8"><input required="" type="text" name="email" placeholder="Enter Email Address" class="form-control input-sm"  ></div>
                            </div>
                            <div  class="row cf-ro">
                                <div  class="col-sm-3"><label>Mobile Number:</label></div>
                                <div class="col-sm-8"><input required="" type="text" name="phone" placeholder="Enter Mobile Number" class="form-control input-sm"  ></div>
                            </div>
                            <div  class="row cf-ro">
                                <div  class="col-sm-3"><label>Enter  Message:</label></div>
                                <div class="col-sm-8">
                                    <textarea name="mess" required="" rows="5" placeholder="Enter Your Message" class="form-control input-sm"></textarea>
                                </div>
                            </div>
                            <div  class="row cf-ro">
                                <div  class="col-sm-3"><label></label></div>
                                <div class="col-sm-8">
                                    <button class="btn btn-success btn-sm">Send Message</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </form>
        <jsp:include page="layout/footer.jsp"></jsp:include>



    </body>
</html>
