<%-- 
    Document   : banner
    Created on : Feb 10, 2023, 9:26:44 PM
    Author     : vusyl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Page</title>
        <style>
            h1{
                padding-top: 50px;

                text-align: center;
            }
            


            .search-wrapper {
                position: absolute;
                transform: translate(-50%, -50%);
                top:50%;
                left:50%;
            }
            .search-wrapper.active {
            }

            .search-wrapper .input-holder {
                height: 70px;
                width:70px;
                overflow: hidden;
                background: rgba(255,255,255,0);
                border-radius:6px;
                position: relative;
                transition: all 0.3s ease-in-out;
            }
            .search-wrapper.active .input-holder {
                width:450px;
                border-radius: 50px;
                background: rgba(0,0,0,0.5);
                transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
            }
            .search-wrapper .input-holder .search-input {
                width:100%;
                height: 50px;
                padding:0px 70px 0 20px;
                opacity: 0;
                position: absolute;
                top:0px;
                left:0px;
                background: transparent;
                box-sizing: border-box;
                border:none;
                outline:none;
                font-family:"Open Sans", Arial, Verdana;
                font-size: 16px;
                font-weight: 400;
                line-height: 20px;
                color:#FFF;
                transform: translate(0, 60px);
                transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);
                transition-delay: 0.3s;
            }
            .search-wrapper.active .input-holder .search-input {
                opacity: 1;
                transform: translate(0, 10px);
            }
            .search-wrapper .input-holder .search-icon {
                width:70px;
                height:70px;
                border:none;
                border-radius:6px;
                background: #FFF;
                padding:0px;
                outline:none;
                position: relative;
                z-index: 2;
                float:right;
                cursor: pointer;
                transition: all 0.3s ease-in-out;
            }
            .search-wrapper.active .input-holder .search-icon {
                width: 50px;
                height:50px;
                margin: 10px;
                border-radius: 30px;
            }
            .search-wrapper .input-holder .search-icon span {
                width:22px;
                height:22px;
                display: inline-block;
                vertical-align: middle;
                position:relative;
                transform: rotate(45deg);
                transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);
            }
            .search-wrapper.active .input-holder .search-icon span {
                transform: rotate(-45deg);
            }
            .search-wrapper .input-holder .search-icon span::before, .search-wrapper .input-holder .search-icon span::after {
                position: absolute;
                content:'';
            }
            .search-wrapper .input-holder .search-icon span::before {
                width: 4px;
                height: 11px;
                left: 9px;
                top: 18px;
                border-radius: 2px;
                background: #FE5F55;
            }
            .search-wrapper .input-holder .search-icon span::after {
                width: 14px;
                height: 14px;
                left: 0px;
                top: 0px;
                border-radius: 16px;
                border: 4px solid #FE5F55;
            }
            .search-wrapper .close {
                position: absolute;
                z-index: 1;
                top:24px;
                right:20px;
                width:25px;
                height:25px;
                cursor: pointer;
                transform: rotate(-180deg);
                transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
                transition-delay: 0.2s;
            }
            .search-wrapper.active .close {
                right:-50px;
                transform: rotate(45deg);
                transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
                transition-delay: 0.5s;
            }
            .search-wrapper .close::before, .search-wrapper .close::after {
                position:absolute;
                content:'';
                background: #FE5F55;
                border-radius: 2px;
            }
            .search-wrapper .close::before {
                width: 5px;
                height: 25px;
                left: 10px;
                top: 0px;
            }
            .search-wrapper .close::after {
                width: 25px;
                height: 5px;
                left: 0px;
                top: 10px;
            }
        </style>
    </head>
    <body>
        <div id="carouselExampleIndicators" class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            </ol>

            <!-- carousel content -->
            <div class="carousel">
                <!-- first slide -->
                <div class="carousel-item active">
                    <img class="d-block w-100" src="../assets1/images/img_banner/sc1.jpg" alt="First slide">
                    <div class="carousel-caption d-md-block">


                    </div>
                </div>

                <!-- second slide -->
                <div class="carousel-item">
                    <img class="d-block w-100" src="../assets1/images/img_banner/sc2.jpg" alt="Second slide">

                </div>

                <!-- third slide -->
                <div class="carousel-item">
                    <img class="d-block w-100" src="../assets1/images/img_banner/sc3.jpg" alt="Third slide">


                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="../assets1/images/img_banner/sc4.jpg" alt="Third slide">


                </div>
            </div>

            <!-- controls -->
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <h1>CÁC DỊCH VỤ</h1>
        <br>
        <span>Với hơn 25 năm phục vụ, đội ngũ Y Bác sĩ lâu năm dày dặn kinh nghiệm, công tác tại các bệnh viện đầu ngành tại Hà Nội,
            thái độ phục vụ ân cần chu đáo,
            Khám mắt SWP391_G1 tự tin mình là một địa chỉ uy tín và là lựa chọn đúng đắn cho mọi nhu cầu về chăm sóc mắt của Bạn!</span>
        <jsp:include page="../layout/search.jsp"></jsp:include>  
       
       
        
    </body>

</html>
