<%-- 
    Document   : index
    Created on : Nov 8, 2022, 10:35:11 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="assets/images/Logo_Đại_học_FPT.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rubik:400,400i,500,500i,700,700i" rel="stylesheet">
<link href="assets/css/theme.css" rel="stylesheet">
<!-- Begin tracking codes here, including ShareThis/Analytics -->
    
<!-- End tracking codes here, including ShareThis/Analytics -->
</head>
<body class="layout-default">
<!-- Begin Menu Navigation
================================================== -->
<header class="navbar navbar-toggleable-md navbar-light bg-white fixed-top mediumnavigation">
<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarsWow" aria-controls="navbarsWow" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
<div class="container">
	<!-- Begin Logo -->
	<a class="navbar-brand" href="index.html">
	<img style="height: 59px; width: 129px;" src="assets/images/Logo_Đại_học_FPT.png" alt="Affiliates - Free Bootstrap Template">
	</a>
	<!-- End Logo -->
	<!-- Begin Menu -->
	<div class="collapse navbar-collapse" id="navbarsWow">
		<!-- Begin Menu -->
		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
			<a class="nav-link" href="index.html">Home</a>
			</li>
			<li class="nav-item">
			<a class="nav-link" href="https://daihoc.fpt.edu.vn/en/why-fptu/">About</a>
			</li>
			<li class="nav-item">
			<a class="nav-link" href="https://daihoc.fpt.edu.vn/en/contact/">Contact</a>
			</li>
			<li class="nav-item">
			<a target="_blank" class="nav-link highlight" href="https://apps.apple.com/app/id1527723314">Download</a>
			</li>
		</ul>
		<!-- End Menu -->
	</div>
</div>
</header>
<!-- End Menu Navigation
================================================== -->
<div class="site-content">
	<!-- Home Jumbotron
    ================================================== -->
	<section class="intro">
	<div class="wrapintro">
		<h1>FPT University Academic Portal</h1>
		<h2 class="lead">Do differently to do well !</h2>
		<a target="_blank" href="https://daihoc.fpt.edu.vn/en/news/" class="btn">News</a>
	</div>
	</section>
	<!-- Container
    ================================================== -->
	<div class="container">
		<div class="main-content">
			<!-- Featured
            ================================================== -->
			<section class="featured-posts">
			<div class="section-title">
				<h2><span>Login</span></h2>
			</div>
			<div class="row listfeaturedtag">
				<!-- begin post -->
				<div class="col-sm-6">
					<div class="card">
						<div class="row">
							<div class="col-md-5 wrapthumbnail">
								<a href="single.html">
								<div class="thumbnail" style="background-image:url(assets/images/left.png);">
								</div>
								</a>
							</div>
							<div class="col-md-7">
								<div class="card-block">
									<h2 class="card-title"><a href="#">Parent</a></h2>
                                                                        <table class="card-title">
                                                                            <tr>
                                                                                <td>Account</td>
                                                                                <td><input type="text" name="acc1" value=""></td>
                                                                                
                                                                            </tr>
                                                                            <tr>
                                                                                <td>Password</td>
                                                                                <td><input type="text" name="pass1" value=""></td>
                                                                            </tr>
                                                                            
                                                                        </table> 
									<input style="color: blue; background-color: white; font-weight: bold" class="btn" type="submit" value="Log in" name="login">
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end post -->
				<!-- begin post -->
				<div class="col-sm-6">
					<div class="card">
						<div class="row">
							<div class="col-md-5 wrapthumbnail">
								<a href="single.html">
								<div class="thumbnail" style="background-image:url(assets/images/right.png);">
								</div>
								</a>
							</div>
							<div class="col-md-7">
								<div class="card-block">
                                                                    <form action="login" method="get">
                                                                        <h2 class="card-title"><a href="#">Student, Lecturer FPT-Uni</a></h2>
                                                                        <table class="card-title">
                                                                            <tr>
                                                                                <td>Account</td>
                                                                                <td><input type="text" name="acc"></td>
                                                                                
                                                                            </tr>
                                                                            <tr>
                                                                                <td>Password</td>
                                                                                <td><input type="password" name="pass"></td>
                                                                            </tr>
                                                           
                                                                        </table> 
                                                                        <input style="color: blue; background-color: white; font-weight: bold" class="btn" type="submit" value="Log in" name="login">
                                                                        <p style="color: red">${message}</p>
                                                                    </form>
									
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end post -->
			</div>
			</section>
			<!-- Posts Index
        ================================================== -->
			<section class="recent-posts row">
			<div class="col-sm-4">
				<div class="sidebar">
					
					
				</div>
			</div>
			<div class="col-sm-8">
				
					
					
					
					
				
			</div>
			</section>
		</div>
	</div>
	<!-- /.container -->
	
	
	<!-- Begin Footer
    ================================================== -->
	<footer class="footer">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="footer-widget">
					<a href="contact.html">
					<img src="assets/images/logo-footer.png" alt="logo footer">
					</a>
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="footer-widget textwidget">
					<h4 class="title">Download</h4>
					<br>
					<a href="https://apps.apple.com/app/id1527723314">
                                            <img src="https://upload.wikimedia.org/wikipedia/commons/5/5d/Available_on_the_App_Store_%28black%29.png" style="width: 200px; height: 60px;" alt="apple-store">
					</a>
					<a href="https://apps.play.com/store/apps/details?id=com.fuct">
                                            <img src="https://www.fcsok.org/wp-content/uploads/2020/04/get-it-on-google-play-badge.png" style="width: 200px; height: 60px;" alt="apple-store">
					</a>
				</div>
			</div>
		</div>
		<div class="copyright">
			<p class="pull-left" style="margin-left: 300px;">
				© Powered by Thanh Quang
			</p>
			
			<div class="clearfix">
			</div>
		</div>
	</div>
	</footer>
	<!-- End Footer
    ================================================== -->
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
</html>
