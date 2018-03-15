<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>편의점 재고 검색 포털 Got them</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css?family=Work+Sans"
	rel="stylesheet">
<link rel="stylesheet" href="resources/indexTemplate/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/icomoon.css">
<link rel="stylesheet" href="resources/indexTemplate/css/animate.css">
<link rel="stylesheet" href="resources/indexTemplate/css/style.css">
<link rel="stylesheet" type="text/css" href="resources/stlogin/css/my-login.css">
<style>
.mouse .sidebar, .twide .sidebar {
    position: absolute;
    top: 0px;
    bottom: 0px;
    left: 0px;
    display: inline-block;
    width: 332px;
}
.sidebar {
    background-color: #0072C6;
}
</style>
</head>
<body>

	<header>
		<%@include file="nav.jsp"%>
	</header>

	<main role="main" class="probootstrap-main js-probootstrap-main">
		<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="storeIndex.st">Aside</a></a>
		</div>
	</div>
		<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<img src="resources/stlogin/img/logo.jpg">
					</div>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">점주 로그인</h4>
							<form method="POST">
							 
								<div class="form-group">
									<label for="sto_id">아이디</label>

									<input id="text" type="text" class="form-control" name="sto_id" value="" required autofocus>
								</div>

								<div class="form-group">
									<label for="password">비밀번호
									</label>
									<input id="password" type="password" class="form-control" name="sto_pw" required data-eye>
								</div>


								<div class="form-group no-margin">
									<button type="submit" class="btn btn-primary btn-block">
										Login
									</button>
								</div>
								<div class="margin-top20 text-center">
									아직 가맹점이 아니신가요? <a href="join.st">가맹 신청페이지로</a>
								</div>
								<div class="margin-top20 text-center">
									아이디나 비밀번호를 잊으셨나요? <a href="findId.st">아이디</a>/<a href="findPw.st">비밀번호</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
 
		
		<!-- 	<div id="loginbox" class="container">
			<div class="container col-sm-6 center-block">
			<img src="resources/mainTemplate/img/logo.png" alt="" width=300px; />
			</div>
			<div class="container col-sm-6 center-block">
			<form method="post" action="" role="login">
				<div>
					<label>Username</label>
					<input type="text" name="sto_id" required class="form-control" />
				</div>
				
				<div>
					<label>Password</label>
					<input type="password" name="sto_pw" required class="form-control" />
				</div>
			
				<section>
					<button type="submit" name="go" class="btn btn-block">Sign In</button>
					<p><a href="findIDAndPW.gt">Forgot your password ?</a></p>
					<p><a href="join.st">Create account</a></p>
				</section>
			</form>
			</div>
		</div> -->

	</main>

	<script src="resources/indexTemplate/js/jquery-3.2.1.slim.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/indexTemplate/js/bootstrap.min.js"></script>
	<script src="resources/indexTemplate/js/owl.carousel.min.js"></script>
	<script src="resources/indexTemplate/js/jquery.waypoints.min.js"></script>
	<script src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script>
	<script src="resources/indexTemplate/js/main.js"></script>

</body>
</html>