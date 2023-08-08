<%-- 
    Document   : booking
    Created on : Feb 22, 2023, 4:32:26 PM
    Author     : vusyl
--%>

<%@page import="com.dao.CaseDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                box-shadow: none;
            }
            .hidden {
                display: none;
            }

            #add_booking{
                box-shadow: none;
                width: 100%;
                height: 36px;
                font-size: 14px;
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
        <script type="text/javascript">
            function checkDate() {
                var regex = /^(?=.{10}$)(?:[2-9]\d\d\d|(?:1[89]|2[0-2])\d\d)-(?:0[13578]|1[02])-(?:0[1-9]|[12]\d|3[01])$|(?:[2-9]\d\d\d|(?:1[89]|2[0-2])\d\d)-(?:0[469]|11)-(?:0[1-9]|[12]\d|30)$|(?:[2-9]\d\d\d|(?:1[89]|2[0-2])\d\d)-02-(?:0[1-9]|1\d|2[0-8])$/;
                var date = document.getElementById('checkin-date').value;
                var today = new Date().toISOString().slice(0, 10);
                if (regex.test(date) && date >= today) {
                    var birthday = new Date(date); // Khởi tạo một đối tượng
                    if (Date.now() > birthday.getTime()) { // tính theo mili giây 
                        document.getElementById("txtDateMessage").innerHTML = "Check-in must be greater than or equal to today's date";
                    } else {
                        document.getElementById("txtDateMessage").innerHTML = "";
                    }
                    console.log(ageDiffMs);
                    console.log(ageDate);
                    console.log(age);
                } else {
                    document.getElementById("txtDateMessage").innerHTML = "Dates must be in the format yyyy-mm-dd and should be greater than or equal to today's date";
                }
            }

        </script>
    </head>
    <jsp:include page="layout/menu.jsp"></jsp:include>
        <body>
            <div class="container">
                <div class="row">

                    <div class="col-md-12">
                        <div class="layout">

                            <div class="row">
                                <div class="col-sm-11">
                                    <i class="fas fa-table me-1 " ></i> 
                                    Booking History
                                </div>                            
                                <div class="col-sm-1">
                                    <button id="add_booking" class="btn">Add</button></div>
                            </div>
                            <div class="table-wrapper-scroll-y my-custom-scrollbar">
                                <table class="table table-bordered mb-0 ${hidden}">                            
                                <thead id="table-head">
                                    <tr>
                                        <th class="text-center" colspan="2">Booking</th>
                                        <th class="text-center" colspan="2">Appointment</th>
                                        <th class="text-center" colspan="3">Doctor</th>
                                        <th class="text-center" rowspan="2">Status</th>
                                        <th class="text-center" rowspan="2">Actions</th>
                                    </tr>
                                    <tr>
                                        <th class="text-center">Date</th>
                                        <th class="text-center">Time</th> 
                                        <th class="text-center">Date</th>
                                        <th class="text-center">Time</th>
                                        <th class="text-center">Name</th> 
                                        <th class="text-center">Email</th>
                                        <th class="text-center">Department</th>
                                    </tr>
                                </thead>
                                <tbody>  
                                <c:forEach items="${listC}" var="p"> 
                                    <tr class="align-items-center">   
                                        <td class="text-center">${p.booking_date}</td>                                       
                                        <td class="text-center">${p.booking_time}</td> 
                                        <td class="text-center">${p.appointment_date}</td> 
                                        <td class="text-center">${p.appointment_time}</td>                                       
                                        <td class="text-center">${p.getDoctor().getFullName()}</td> 
                                        <td class="text-center">${p.getDoctor().getMail()}</td>                                       
                                        <td class="text-center">${p.getDoctor().getDepartment()}</td> 
                                        <td class="text-center">${p.getStatus()}</td>
                                        <td>
                                            <button onclick="confirmCancel('${p.iD}')" class="btn btn-primary">Cancel</button>
                                        </td>
                                    </tr>
                                </c:forEach> 
                                </tbody>
                            </table>
                            <span style="color: red; margin: 10px auto; font-size: 16px;">${mess} </span>
                        </div>                        
                    </div> 
                </div>                
            </div>
        </div>
        <!--booking modal-->
        <div class="modal modal-background" id="booking_modal" style="background-color: #b3b2b261">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitle">New booking</h5>
                        <button type="button" class="btn-close close-modal" data-bs-dismiss="modal" aria-label="Close"></button>                        
                    </div>
                    <form action="booking" method="post">
                        <div class="modal-body">                            
                            <div class="elem-group inlined">
                                <label for="checkin-date">Appointment date</label>                                
                                <input type="date" id="checkin-date" class="form-select" name="date" required="" onchange="checkDate()">
                            </div>
                            <div class="elem-group inlined">
                                <label for="checkin-time">Appointment time</label>
                                <div style="color: red" class="form-message" id="txtTimeMessage"></div>
                                <select id="checkin-time" class="form-select" name="time" required placeholder="--Please choose an time--">
                                    <option value="07:00">07:00</option>
                                    <option value="08:00">08:00</option>
                                    <option value="09:00">09:00</option>
                                    <option value="10:00">10:00</option>
                                    <option value="11:00">11:00</option>
                                    <option value="13:00">13:00</option>
                                    <option value="14:00">14:00</option>
                                    <option value="15:00">15:00</option>
                                    <option value="16:00">16:00</option>
                                    <option value="17:00">17:00</option>
                                </select>
                            </div>
                            <div class="elem-group">
                                <select id="room-selection" class="form-select" name="doctor" style="margin: 5px;">
                                    <option value="-1">Select doctor</option>
                                    <c:forEach items="${doctor}" var="p"> 
                                        <option value="${p.getDoctorID()}">${p.getFullName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <input type="hidden" name="PatientID" value="${listPatient.getPatientID()}"/>
                            <div style="color: red" class="form-message" id="txtDateMessage"></div>
                        </div>
                        <div class="modal-footer">                            
                            <button type="submit" class="btn btn-primary">Booking</button>
                            <button type="button" class="btn btn-secondary close-modal"><a href="" style="color: white">Close</a></button>                        
                        </div>
                    </form>
                </div>
            </div> 
        </div> 
        <jsp:include page="layout/footer.jsp"></jsp:include>        
    </body>
    <script>
        function confirmCancel(id) {
            if (confirm("Are you sure you want to cancel this reservation?")) {
                window.location.href = 'cancelbook?sid=' + id;
            }
        }
        $(document).ready(function () {
            $("#add_booking").click(function () {
                $("#booking_modal").css("display", "block");
                //console.log("medicine modal!");
            });

            $(".close-modal").click(function () {
                $("#booking_modal").css("display", "none");
                //console.log("designate modal!");
            });
        });
    </script>
</html>
