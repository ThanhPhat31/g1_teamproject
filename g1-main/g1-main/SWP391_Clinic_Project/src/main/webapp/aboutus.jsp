<%-- 
    Document   : menu
    Created on : Feb 3, 2023, 9:42:47 PM
    Author     : vusyl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> Free Single page Hospital Website Template | Smarteyeapps.com</title>

        <link rel="shortcut icon" href="assets1/images/fav.jpg">
        <link rel="stylesheet" href="assets1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets1/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets1/plugins/slider/css/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="assets1/css/style.css" />
    </head>
    <body>
        <jsp:include page="layout/menu.jsp"></jsp:include>
        <section id="about_us" class="with-medical">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <img src="assets1/images/why.jpg" alt="">
                    </div>
                    <div class="col-lg-6 col-md-12 txtr">
                        <h4>Why choos Health Care with <br>
                            <span>Medical Hospital</span>   
                        </h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer neque libero, pulvinar et elementum quis, facilisis eu ante. Mauris non placerat sapien. Pellentesque tempor arcu non odio scelerisque ullamcorper. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam varius eros consequat auctor gravida. Fusce tristique lacus at urna sollicitudin pulvinar. Suspendisse hendrerit ultrices mauris.</p>
                        <p>Ut ultricies lacus a rutrum mollis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed porta dolor quis felis pulvinar dignissim. Etiam nisl ligula, ullamcorper non metus vitae, maximus efficitur mi. Vivamus ut ex ullamcorper, scelerisque lacus nec, commodo dui. Proin massa urna, volutpat vel augue eget, iaculis tristique dui. </p>
                    </div>

                </div>
            </div>
        </section>
        <div  class="slider container-fluid">
            <ul id="slider">
                <li data-active="1" data-background="assets1/image/slider/slider_1.jpg">
                    <div class="slider-layer">
                        <div class="container">
                            <h1 class="animated  fadeInRightBig ">Best Free Clinic.<br> Website Template.</h1>
                            <p class="animated  fadeInLeftBig">Therefore do not be anxious about tomorrow, for tomorrow will be anxious for itself.<br> Sufficient for the day is its own trouble.</p>
                            <span class="animated  fadeInLeftBig ">Matthew 6:34</span>
                            <div class="animated fadeInUpBig buttn-row">
                                <div class="btn">Read more</div>
                                <div class="btn">Donate Now</div>
                            </div>
                        </div>
                    </div>

                </li>
                <li data-active="0" data-background="assets1/images/slider/slider_1.jpg">
                    <div class="slider-layer">
                        <div class="container">
                            <h1 class="animated  slideInDown ">You are in the Right Place <br> at the Right Time</h1>
                            <p class="animated  zoomInLeft ">Therefore do not be anxious about tomorrow, for tomorrow will be anxious for itself.<br> Sufficient for the day is its own trouble.</p>
                            <span class="animated  slideInUp ">Matthew 6:34</span>
                            <div class="buttn-row animated  zoomInLeft">
                                <div class="btn">Read more</div>
                                <div class="btn">Donate Now</div>
                            </div>
                        </div>
                    </div>
                </li>

            </ul>
        </div><!--########## Slider Ends Here ##########-->
        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>
    <script src="assets1/js/jquery-3.2.1.min.js"></script>
    <script src="assets1/js/popper.min.js"></script>
    <script src="assets1/js/bootstrap.min.js"></script>
    <script src="assets1/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets1/plugins/scroll-nav/js/jquery.easing.min.js"></script>    
    <script src="assets1/plugins/scroll-nav/js/scrolling-nav.js"></script>
    <script src="assets1/js/script.js"></script>
</html>

 