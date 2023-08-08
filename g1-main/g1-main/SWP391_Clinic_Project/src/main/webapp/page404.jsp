<%-- 
    Document   : page404
    Created on : Mar 18, 2023, 6:57:01 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>404</title>
        <link rel="icon" type=".../image/x-icon" href="assets1/images/favicon.jpg">
    </head>
    <body>
        <div class="notfound">
            <div class="notfound-404">
                <h1>404</h1>
            </div>
            <h2>Something went wrong</h2>
            <p>The page you are looking for might have been removed had its name changed or is temporarily unavailable. <a href="/home">Return to homepage.</a></p>
        </div>
        <style>
            .notfound {
                text-align: center;
                position: absolute;
                left: 50%;
                top: 50%;
                -webkit-transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%);
            }

            .notfound .notfound-404 {
                position: relative;
                height: 220px;
            }

            .notfound .notfound-404 h1 {
                font-family: 'Kanit', sans-serif;
                position: absolute;
                left: 50%;
                top: 50%;
                -webkit-transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%);
                font-size: 186px;
                font-weight: 200;
                margin: 0px;
                background: linear-gradient(130deg, #ffa34f, #ff6f68);
                color: transparent;
                -webkit-background-clip: text;
                background-clip: text;
                text-transform: uppercase;
            }

            .notfound h2 {
                font-family: 'Kanit', sans-serif;
                font-size: 33px;
                font-weight: 200;
                text-transform: uppercase;
                margin-top: 20px;
                margin-bottom: 25px;
                letter-spacing: 3px;
            }

            .notfound p {
                width: 70%;
                font-family: 'Kanit', sans-serif;
                font-size: 16px;
                font-weight: 200;
                margin: 20px auto;
            }

            .notfound a {
                font-family: 'Kanit', sans-serif;
                color: #ff6f68;
                font-weight: 200;
                text-decoration: none;
                border-bottom: 1px dashed #ff6f68;
                border-radius: 2px;
            }
        </style>
    </body>
</html>
