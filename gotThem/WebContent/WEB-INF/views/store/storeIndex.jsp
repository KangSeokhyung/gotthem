<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>Startup UI Kit - Free Sample</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="resources/ownerindex/images/favicon.ico">
		<link rel="stylesheet" href="resources/ownerindex/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" href="resources/ownerindex/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/ownerindex/css/style.css">
		<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i|Montserrat:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	</head>
	<body>
		
		<section class="cover-1 text-center">
			<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
				<div class="container">
					<a class="navbar-brand" href="#">Got them</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse pull-xs-right justify-content-end" id="navbarSupportedContent">
						<ul class="navbar-nav mt-2 mt-md-0">
							<li class="nav-item">
								<a class="nav-link" href="#">알림사항</a>
							</li>					
							<li class="nav-item">
								<a class="nav-link" href="#">점포관리</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">재고관리</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">회사소개</a>
							</li>
							<li class="nav-item">
								<a class="btn btn-outline-white btn-outline" href="#">사장님 로그인</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
			<div class="cover-container pb-5">
				<div class="cover-inner container">
		 <div class="row marketing">
        <div class="col-lg-6">
          <h1 class="jumbotron-heading">지금 <strong>Got them에</strong> 점포를	<strong>등록하세요</strong></h1>
			<p class="lead">A collection of coded HTML and CSS elements to help your build your startup website. Clean design, fully responsive and based on Bootstrap 4.</p>
        </div>

        <div class="col-lg-6">
         <div class="container">
                <div class="col-xs-12 mx-auto">
                    <div class="card border-secondary">
                        <div class="card-header">
 
                        </div>
                        <div class="card-body">
                            <form class="form" action="login.st" method="post" role="form" autocomplete="off">
                                <div class="form-group">
                                    <label for="inputName">Name</label>
                                    <input type="text" class="form-control" id="inputName" placeholder="full name">
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3">Email</label>
                                    <input type="email" class="form-control" id="inputEmail3" placeholder="email@gmail.com" required="">
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword3">Password</label>
                                    <input type="password" class="form-control" id="inputPassword3" placeholder="password" title="At least 6 characters with letters and numbers" required="">
                                </div>
                                <div class="form-group">
                                    <label for="inputVerify3">Verify</label>
                                    <input type="password" class="form-control" id="inputVerify3" placeholder="password (again)" required="">
                                </div>
                                <div class="form-group">
                                	<a href="test.st">test</a>
                                    <button type="submit" class="btn btn-success btn-lg float-right">Register</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--/row-->
        </div>
        <!--/col-->
   		</div>
		</div>
      </div>
</section>

		<footer class="footer-3">
			<div class="container-fluid">
				<div class="divider"></div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-6 text-center text-md-left mt-2 mb-3 pt-1">
						<p>Copyright &copy; YourStartup. All rights reserved.</p>
					</div>
					<div class="col-md-6 text-center text-md-right mb-4">
						<ul class="social">
							<li><a href="#" title="Facebook" class="fa fa-facebook"></a></li>
							<li><a href="#" title="Twitter" class="fa fa-twitter"></a></li>
							<li><a href="#" title="Google+" class="fa fa-google"></a></li>
							<li><a href="#" title="Dribbble" class="fa fa-dribbble"></a></li>
							<li><a href="#" title="Instagram" class="fa fa-instagram"></a></li>
							<div class="clear"></div>
						</ul>
					</div>
				</div>
			</div>
		</footer>
		
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
		<script src="resources/ownerindex/bootstrap/js/bootstrap.min.js"></script>

	</body>
</html>
