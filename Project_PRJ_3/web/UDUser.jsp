<%-- 
    Document   : TuitionFee
    Created on : Oct 29, 2022, 9:52:41 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="assets/images/Logo_Đại_học_FPT.png">
        <title>FPT-University</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Rubik:400,400i,500,500i,700,700i" rel="stylesheet">
        <link href="assets/css/theme.css" rel="stylesheet">
    </head>
    <body>
    <body class="layout-default">
        <!-- Begin Menu Navigation
        ================================================== -->
        <header class="navbar navbar-toggleable-md navbar-light bg-white fixed-top mediumnavigation">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarsWow" aria-controls="navbarsWow" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="container">
                <!-- Begin Logo -->
                <a class="navbar-brand" href="#">
                    <h1>User System</h1>
                </a>
                <!-- End Logo -->
                <!-- Begin Menu -->
                <div class="collapse navbar-collapse" id="navbarsWow">
                    <!-- Begin Menu -->
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link highlight" href="WebUniAdmin.jsp" >Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link highlight" href="index.html">Log out</a>
                        </li>
                    </ul>
                    <!-- End Menu -->
                </div>
            </div>
        </header>
        <!-- End Menu Navigation
        ================================================== -->
        <div class="site-content">


            <!-- Container
        ================================================== -->
            <div class="container">
                <h2>Edit user</h2>
                <form action="listuser" method="post">
                    <table >
                        <tr>
                            <td>UserID</td>
                            <td>
                                <select name="userID">
                                    <c:forEach items="${listU}" var="item">
                                        <option value="${item.getUserID()}">${item.getUserID()}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>  
                        <tr>
                            <td>Update User ID </td>
                            <td><input type="text" name="userIDEdit"></td>
                        </tr>  
                        <tr>
                            <td>Update User Name</td>
                            <td><input type="text" name="userNameEdit"></td>
                        </tr>  
                        <tr>
                            <td>Update Gender</td>
                            <td>
                                <input id="0" type="radio" name="genderEdit" value="0" checked><label for="0">Female</label>
                                <input id="1" type="radio" name="genderEdit" value="1" checked><label for="1">Male</label>
                            </td>
                        </tr>  
                        <tr>
                            <td>Update Email</td>
                            <td><input type="text" name="emailEdit"></td>
                        </tr>  
                        <tr>
                            <td>Update PassWord</td>
                            <td><input type="text" name="passEdit"></td>
                        </tr>  
                        <tr>
                            <td>Update DOB</td>
                            <td><input type="date" name="dobEdit"></td>
                        </tr>  
                        <tr>
                            <td>Update Number Phone</td>
                            <td><input type="text" name="numberPhoneEdit"></td>
                        </tr>  

                        <tr>
                            <td>Update Role</td>
                            <td>
                                <select name="roleEdit">
                                    <option value="Admin">Admin</option>
                                    <option value="Student">Student</option>
                                    <option value="Teacher">Teacher</option>
                                </select>
                            </td>
                        </tr>  

                        <tr>
                            <td>Update Programming</td>
                            <td>
                                <select name="programmingEdit">
                                    <c:forEach items="${listP}" var="item">
                                        <option value="${item.getProgrammingID()}">${item.getProgrammingID()}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>  
                        <tr>
                            <td>Update Status</td>
                            <td>
                                <input id="0" type="radio" name="statusEdit" value="0" checked><label for="0">Non active</label>
                                <input id="1" type="radio" name="statusEdit" value="1" checked><label for="1">Active</label>

                            </td>
                        </tr>  


                    </table><br>
                    <input type="submit" name="update" value="Update"> 

                </form>


            </div>
            <!-- /.container -->



        </div>


        <!-- JavaScript
        ================================================== -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
        <script src="assets/js/masonry.pkgd.min.js"></script>
        <script src="assets/js/theme.js"></script>
    </body>
</body>
</html>
