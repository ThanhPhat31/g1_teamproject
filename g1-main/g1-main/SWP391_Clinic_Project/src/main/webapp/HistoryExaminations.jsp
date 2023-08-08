<%-- 
    Document   : HistoryExaminations
    Created on : Mar 4, 2023, 3:41:07 PM
    Author     : vusyl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="c" scope="request" class="com.dao.CaseDAO" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets1/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <style>
            .layout{
                padding: 50px 20px 0px 0px;
            }
            iv.elem-group {
                margin: 20px 0;
            }

            div.elem-group.inlined {
                width: 49%;
                display: inline-block;
                float: left;
                margin-left: 1%;
            }

            label {
                display: block;
                font-family: 'Nanum Gothic';
                padding-bottom: 10px;
                font-size: 1.25em;
            }

            input, select, textarea {
                border-radius: 2px;
                border: 2px solid #777;
                box-sizing: border-box;
                font-size: 1.25em;
                font-family: 'Nanum Gothic';
                width: 100%;
                padding: 10px;
            }

            div.elem-group.inlined input {
                width: 95%;
                display: inline-block;
            }

            textarea {
                height: 250px;
            }

            hr {
                border: 1px dotted #ccc;
            }

            button {
                height: 50px;
                background: orange;
                border: none;
                color: white;
                font-size: 1.25em;
                font-family: 'Nanum Gothic';
                border-radius: 4px;
                cursor: pointer;
            }


            .table td, .table th{
                vertical-align: middle !important;
            }
            .my-custom-scrollbar {
                position: relative;
                max-height: 500px;
                min-height: 400px;
                overflow: auto;
                margin-bottom: 20px;
            }
            .table-wrapper-scroll-y {
                display: block;
            }
        </style>
    </head>
    <body>
        <jsp:include page="layout/menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="layout">
                            <h5>
                                <i class="fas fa-table me-1 " ></i> 
                               Medical History
                            </h5>
                            <div class="table-wrapper-scroll-y my-custom-scrollbar">
                                <table class="table table-bordered table-striped mb-0">

                                    <thead id="table-head">
                                        <tr>
                                            <th class="text-center">Doctor</th> 
                                            <th class="text-center">Email</th>  
                                            <th class="text-center">Date</th>
                                            <th class="text-center">Time</th>
                                            <th class="text-center">Status</th> 
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach  items="${listC}" var="p"> 
                                        <tr class="align-items-center">        
                                            <td class="text-center">${p.getDoctor().getFullName()}</td>  
                                            <td class="text-center">${p.getDoctor().getMail()}</td>  
                                            <td class="text-center">${p.date}</td>                                       
                                            <td class="text-center">${p.time}</td> 
                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${p.status == 'Doing'}">
                                                        <p style="color: red">Doing</p>
                                                    </c:when>
                                                    <c:when test="${p.status == 'Assigning'}">
                                                        <p style="color: blue">Assigning</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p style="color: green">Finished</p>
                                                    </c:otherwise>
                                                </c:choose></td> 
                                            <td class="text-center">
                                                <form class="form-control-sm" action="doctor" method="post">
                                                    <input type="hidden" name="caseID" value="${p.getCaseID()}"/>
                                                    <button class="btn" type="submit" >See detail</button>
                                                </form>
                                            </td> 
                                        </tr>
                                    </c:forEach> 
                                </tbody>

                            </table>
                        </div> 
                    </div>
                </div>
            </div> 
        </div>
        <script>

        </script>
        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>
</html>
