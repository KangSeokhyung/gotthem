<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Aside - Free HTML5 Bootstrap 4 Template by uicookies.com</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/main.css">
<link rel="stylesheet" href="resources/mainTemplate/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="resources/mainTemplate/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/mainTemplate/sweetalert/dist/sweetalert.css">
<link rel="stylesheet" href="resources/mainTemplate/css/stisla.css">
</head>
<body>
	<header class="header">
		<%@include file="../../../nav.jsp" %>
	</header>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-0 p-b-30">
				<form class="login100-form validate-form"
					action="<c:url value='/login.gt' />" method="post">
					<div class="text-center p-t-55 p-b-30">
						<span class="txt1"> Login </span>
					</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="mem_id" placeholder="ID">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-20"
						data-validate="Please enter password">
						<span class="btn-show-pass"> <i class="fa fa fa-eye"></i>
						</span> <input class="input100" type="password" name="mem_pw"
							placeholder="PASSWORD"> <span class="focus-input100"></span>
					</div>
					
					<c:set var="errMsg" value="${errMsg}"/>
					<c:if test="${errMsg ne null}">
					<div>
						<span class="text-center txt1" style="color:red; ">${errMsg}</span>
					</div>
					</c:if>

					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">Login</button>
					</div>

					<div class="flex-col-c p-t-120">
						<span class="txt2 p-b-10">아이디나 패스워드를 잊으셨나요?</span> <a href="#"
							class="txt3 bo1 hov1">여기를 눌러 찾아보세요</a><br> <span
							class="txt2 p-b-10">아직 아이디가 없으신가요?</span> <a href="#"
							class="txt3 bo1 hov1">여기를 눌러 가입해보세요</a>
					</div>

				</form>
			</div>
		</div>
	</div>
	<script src="resources/mainTemplate/js/jquery.min.js"></script>
	<script src="resources/mainTemplate/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/mainTemplate/js/jquery.easeScroll.js"></script>
	<script src="resources/mainTemplate/sweetalert/dist/sweetalert.min.js"></script>
	<script src="resources/mainTemplate/js/stisla.js"></script>
</body>
</html>