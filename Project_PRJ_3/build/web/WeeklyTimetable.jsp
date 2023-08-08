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
                    <h1>Week Timetable</h1>
                </a>
                <!-- End Logo -->
                <!-- Begin Menu -->
                <div class="collapse navbar-collapse" id="navbarsWow">
                    <!-- Begin Menu -->
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link highlight" href="WebUni.jsp" >Home</a>
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
                <form action="schedule" method="post">
                    <h2>Activities for ${account}</h2>
                    <strong>From:</strong> <input type="date" name="from"> <strong>To:</strong> <input type="date" name="to">
                    <input type="submit" name="choose" value="Choose"><br><br>
                    <table border="1" style="width: 100%">
                        <tr>
                            <td style="font-weight: bold">Date</td>
                            <td style="font-weight: bold">Slot</td>
                            <td style="font-weight: bold">Subject</td>
                            <td style="font-weight: bold">Time</td>
                            <td style="font-weight: bold">Room</td>
                            <td style="font-weight: bold">Status</td>

                        </tr>  
                        <c:forEach items="${listSch}" var="item">
                            <tr>
                                <td>${item.getDate()} (${item.getWeekday()})</td>
                                <td>${item.getLevel()}</td>
                                <td>${item.getSubID()}</td>
                                <td>${item.getTime()}</td>
                                <td>${item.getRoom()}</td>
                                <c:if test="${item.getStatus()=='1'}">
                                    <td style="color: green">Attended</td>
                                </c:if>
                                <c:if test="${item.getStatus()=='0'}">
                                    <td style="color: red">Absent</td>
                                </c:if>
                                <c:if test="${item.getStatus()=='2'}">
                                    <td style="color: black">Not yet</td>
                                </c:if>
                                
                            </tr>
                        </c:forEach>
                    </table>



                    <br>
                                        <strong>Note:</strong> These activities do not include extra-curriculum activities, such as club activities ...<br>
                                        Rooms starting with AL belong to the Alpha building. Ex: AL...<br>
                                        Rooms starting with BE belong to the Beta building. Ex: BE,..<br>
                                        Rooms starting with G belong to the Gamma building. Ex: G201,...<br>
                                        R gymnasiums in the Vovinam training ground.<br>
                                        Rooms starting with DE belong to the Delta building. Ex: DE,..<br>
                                        Little UK (LUK) is on the 5th floor of Delta building<br>
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
