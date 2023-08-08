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
                    <h1>Subject Fee</h1>
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
                <h2>Edit course</h2>
                <form action="TFPCadmin" method="post">
                    <table >
                        <tr>
                            <td>SubjectID</td>
                            <td><input type="text" name="sbID"> <input type="submit" name="delete" value="Delete"></td>
                        </tr>  
                        <tr>
                            <td>Update subject ID </td>
                            <td><input type="text" name="sbIDEdit"></td>
                        </tr>  
                        <tr>
                            <td>Update subject Name</td>
                            <td><input type="text" name="sbNameEdit"></td>
                        </tr>  
                        <tr>
                            <td>Update Number Credits</td>
                            <td><input type="text" name="nbCrEdit"></td>
                        </tr>  
                        <tr>
                            <td>Update Fee</td>
                            <td><input type="text" name="feeEdit"></td>
                        </tr>  
                        <tr>
                            <td>Update Fee International</td>
                            <td><input type="text" name="feeInterEdit"></td>
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
