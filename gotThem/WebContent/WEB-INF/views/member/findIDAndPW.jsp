<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ID / PW 찾기</title>
	<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/main.css">
	 <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="resources/landy/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="resources/landy/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom Font Icons CSS-->
    <link rel="stylesheet" href="resources/landy/css/landy-iconfont.css">
    <!-- Google fonts - Open Sans-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
    <!-- owl carousel-->
    <link rel="stylesheet" href="resources/landy/vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="resources/landy/vendor/owl.carousel/assets/owl.theme.default.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="resources/landy/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="resources/landy/css/custom.css">
</head>
<body>
<header>
<%@include file="../../../nav.jsp" %>
</header>  
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-0 p-b-30 col-md-6 col-sm-12" style="width:25%;" >
				<form class="login100-form validate-form" action="<c:url value='/findID.gt' />"method="post">
					<div class="text-center p-t-55 p-b-30">
						<span class="txt1">
							ID 찾기
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-16" >
						<input class="input100" type="text" name="mem_email" placeholder="가입할 때 입력하셨던 EMAIL을 입력하세요" autofocus="autofocus">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-20" data-validate = "Please enter password">
						<span class="btn-show-pass">
							<i class="fa fa fa-eye"></i>
						</span>
						<input class="input100" type="text" name="mem_name" placeholder="이름을 입력하세요">
						<span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">
							ID 찾기
						</button>
					</div>
				</form>
				
			</div>
			<div class="wrap-login100 p-t-0 p-b-30 col-md-6 col-sm-12">
				<form class="login100-form validate-form" action="<c:url value='/findPW.gt' />"method="post">
					<div class="text-center p-t-55 p-b-30">
						<span class="txt1">
							PW 찾기
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-16" >
						<input class="input100" type="text" name="mem_id" placeholder="아이디를 입력하세요" >
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-20" data-validate = "Please enter password">
						<span class="btn-show-pass">
							<i class="fa fa fa-eye"></i>
						</span>
						<input class="input100" type="text" name="mem_email" placeholder="가입할 때 입력하셨던 EMAIL을 입력하세요">
						<span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">
							PW 찾기
						</button>
					</div>
				</form>
				
			</div>
		</div>
	</div>
	
	
<!--===============================================================================================-->
	<script src="../../../resources/Login_v7/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../../../resources/Login_v7/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../../../resources/Login_v7/vendor/bootstrap/js/popper.js"></script>
	<script src="../../../resources/Login_v7/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../../../resources/Login_v7/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../../../resources/Login_v7/vendor/daterangepicker/moment.min.js"></script>
	<script src="../../../resources/Login_v7/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../../../resources/Login_v7/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="../../../resources/Login_v7/js/main.js"></script>
	
	<script>
		$(document).ready(function() {
			alert();
		});
	</script>

</body>
</html>