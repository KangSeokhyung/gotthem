<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="shortcut icon" href="resources/ownerindex/images/favicon.ico">
<link rel="stylesheet"
	href="resources/ownerindex/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="resources/ownerindex/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/ownerindex/css/style.css">
<link
	href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i|Montserrat:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Lato:100italic,100,300italic,300,400italic,400,700italic,700,900italic,900"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="resources/stlogin/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="resources/stlogin/css/styles.css" />
</head>
<body>
	<header>
		<%@include file="storeNav.jsp"%>
	</header>
	<section class="container login-form">
		<section>
			<form method="post" action="<c:url value="/login.st" />" role="login">
				<img src="resources/stlogin/images/logo.png" alt="" class="img-responsive" />

				<div class="form-group">
					<input type="text" name="sto_id" required class="form-control"
						placeholder="Enter email or nickname" /> <span
						class="glyphicon glyphicon-user"></span>
				</div>

				<div class="form-group">
					<input type="password" name="sto_pw" required
						class="form-control" placeholder="Enter password" /> <span
						class="glyphicon glyphicon-lock"></span>
				</div>

				<button type="submit" name="go" class="btn btn-primary btn-block">Login
					Now</button>

				<a href="#">Reset password</a> or <a href="#">create account</a>
			</form>
		</section>
	</section>


	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script src="resources/ownerindex/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>