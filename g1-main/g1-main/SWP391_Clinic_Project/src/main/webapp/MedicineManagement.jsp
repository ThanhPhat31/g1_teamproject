<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>
        Doctor
    </title>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>List Patient</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets1/css/managerdoctor.css"/>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/admin">Patient Manager</a>
            <!-- Sidebar Toggle-->

            <!-- Navbar Search-->
            <form  action="searchPatient" method="post"  class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input oninput="searchPatient(this)" name="txt" class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="submit" ><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/profile">Profile</a></li>
                        <li><a class="dropdown-item" href="/change">ChangePass</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="/logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <div id="table-head">
            <main>
                <div class="container-fluid px-4">
                    <div class="card-header text-xl-left">
                        <i class="fas fa-table me-1 " ></i> 
                        Patient
                    </div>
                    <table class="table table-bordered">
                        <thead id="table-head">
                            <tr> 
                                <th class="text-center">ID</th>
                                <th class="text-center">Name Of Patient</th>
                                <th class="text-center">Date Of Birth</th>   
                                <th class="text-center">Gender</th>
                                <th class="text-center">Address</th>
                                <th class="text-center">Mail</th>
                                <th class="text-center">Phone</th>
                                <th class="text-center">Date</th>
                                <th class="text-center">Time</th>

                            </tr>
                        </thead>
                        <c:forEach items="${listPatient}" var="p">                               
                            <tbody>
                                <tr class="align-items-center"> 
                                    <td class="text-center">${p.id}</td>
                                    <td class="text-center">${p.getFullName()}</td>
                                    <td class="text-center">${p.dob}</td>    
                                    <td class="text-center">${p.gender?"FeMale":"Male"}</td>
                                    <td class="text-center">${p.address}</td>
                                    <td class="text-center">${p.mail}</td>
                                    <td class="text-center">${p.phone}</td>
                                    <td class="text-center">${p.date}</td>
                                    <td class="text-center">${p.time}</td>
                                    <td class="text-center align-middle">
                                        <div class="btn-group align-top">
                                            <a class="btn btn-sm btn-outline-secondary" onclick="confirmCancelUpdate('${ab.getPatientID()}')" href="">Update</a>
                                            <a class="btn btn-sm btn-outline-secondary" onclick="confirmCancelDelete('${ab.getPatientID()}')" href="">Delete</a>
                                        </div>

                                    </td>
                                </tr>
                            </tbody>
                        </c:forEach> 
                        <a class="btn btn-sm btn-outline-secondary" onclick="confirmCancelAdd('')" href="">Add</a>

                    </table>

                    <ul class="pagination ">
                        <li class="page-item"><a class="page-link" href="listUser?index=${tag - 1}">Previous</a></li>
                            <c:forEach  begin="1" end="${endP}" var="i">        
                            <li class="page-item ${tag == i? "active":""}"><a class="page-link" href="listUser?index=${i}">${i}</a></li>
                            </c:forEach>
                        <li class="page-item"><a class="page-link" href="listUser?index=${tag + 1}">Next</a></li>
                    </ul>
                </div>
            </main>

        </div>


        <!-- ================ -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/scripts2.js"></script>
    </body>
    <script>
                            function show(id) {
                                var option = true;
                                if (option === true) {
                                    window.location.href = 'cancelbook?sid=' + id;
                                }
                            }

                            function SearchByLastName(param) {
                                var txtSearch = param.value;
                                $.ajax({
                                    url: "/searchPatient",
                                    type: "post",
                                    data: {
                                        txt: txtSearch
                                    },
                                    success: function (data) {
                                        var row = document.getElementById("content");
                                        row.innerHTML = data;
                                    },
                                    error: function (xhr) {

                                    }
                                });
                            }
    </script>
</html>