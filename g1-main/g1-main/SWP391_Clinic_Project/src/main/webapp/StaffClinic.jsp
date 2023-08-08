<%-- 
    Document   : StaffClinic
    Created on : Mar 16, 2023, 10:20:06 PM
    Author     : vusyl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="assets1/css/style1.css">
    </head>
    <body>
    <body>


        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="/staff" class="brand">
                <i class='bx bxs-smile'></i>
                <span class="text">Staff</span>
            </a>
            <ul class="side-menu top">


                <li>
                    <a href="/normalbooking">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Medical Waiting List</span>
                    </a>
                </li>
                <li>
                    <a href="/listbooking">
                        <i class='bx bxs-cog' ></i>
                        <span class="text">List Booking </span>
                    </a>
                </li>
                <li>
                    <a href="/designate">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Designated List</span>
                    </a>
                </li>

            </ul>
            <ul class="side-menu">

                <li>
                    <a href="/logout" class="logout">
                        <i class='bx bxs-log-out-circle' ></i>
                        <span class="text">Logout</span>
                    </a>
                </li>
            </ul>
        </section>
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>

                <form action="#">
                    <div class="form-input">
                        <input type="search" placeholder="Search...">
                        <button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
                    </div>
                </form>
                <input type="checkbox" id="switch-mode" hidden>
                <label for="switch-mode" class="switch-mode"></label>
                <a href="/profile" class="profile">
                    <img src="assets1/images/favicon.jpg">
                </a>               
            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main>


                <ul class="box-info">

                    <li>
                        <i class='bx bxs-calendar-check'></i>
                        <span class="text">
                            <h3>17</h3>
                            <p>Scheduled Patients</p>

                        </span>
                    </li>

                    <li>
                        <i class='bx bxs-group' ></i>
                        <span class="text">
                            <h3>2834</h3>
                            <p>Patient Normal</p>
                        </span>
                    </li>
                    <li>
                        <i class='bx bxs-dollar-circle' ></i>
                        <span class="text">
                            <h3>15</h3>
                            <p>Total Patient Waiting</p>
                        </span>
                    </li>
                </ul>


                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Patient</h3>
                            <i class='bx bx-search' ></i>
                            <i class='bx bx-filter' ></i>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Patient</th>
                                    <th>Date of birth</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <img src="assets1/images/login.jpg">
                                        <p>John Doe</p>
                                    </td>
                                    <td>01-10-2021</td>
                                    <td><span class="status completed">Completed</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="img/people.png">
                                        <p>John Doe</p>
                                    </td>
                                    <td>01-10-2021</td>
                                    <td><span class="status pending">Pending</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="img/people.png">
                                        <p>John Doe</p>
                                    </td>
                                    <td>01-10-2021</td>
                                    <td><span class="status process">Process</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="img/people.png">
                                        <p>John Doe</p>
                                    </td>
                                    <td>01-10-2021</td>
                                    <td><span class="status pending">Pending</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="img/people.png">
                                        <p>John Doe</p>
                                    </td>
                                    <td>01-10-2021</td>
                                    <td><span class="status completed">Completed</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


        <script src="assets1/js/script3.js"></script>


        




    </body>
</body>
</html>
