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
<link href="https://fonts.googleapis.com/css?family=Work+Sans"
	rel="stylesheet">
<link rel="stylesheet"
	href="resources/indexTemplate/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/indexTemplate/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="resources/indexTemplate/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/indexTemplate/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/icomoon.css">
<link rel="stylesheet" href="resources/indexTemplate/css/animate.css">
<link rel="stylesheet" href="resources/indexTemplate/css/style.css">

</head>
<body>

<aside class="probootstrap-aside js-probootstrap-aside">
		<a href="#"
			class="probootstrap-close-menu js-probootstrap-close-menu d-md-none"><span
			class="oi oi-arrow-left"></span> Close</a>
		<div class="probootstrap-site-logo probootstrap-animate"
			data-animate-effect="fadeInLeft">

			<a href="/gotThem" class="mb-2 d-block probootstrap-logo">GOTTHEM</a>
			<p class="mb-0">
				편의점 재고 검색 사이트 
			</p>
		</div>
		<div class="probootstrap-overflow">
			<nav class="probootstrap-nav">
				<ul>
					<li class="probootstrap-animate"
						data-animate-effect="fadeInLeft"><a href="/gotThem">검색하기</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="#">Got Them?</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="#">공지사항</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="#">이벤트</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="login.gt">로그인</a></li>
					<li class="probootstrap-animate active" data-animate-effect="fadeInLeft"><a
						href="join.gt">가입하기</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="storeIndex.st">제휴페이지</a></li>
				</ul>
			</nav>
			<footer class="probootstrap-aside-footer probootstrap-animate"
				data-animate-effect="fadeInLeft">
				<p>
					&copy; 2018 <a href="/gotThem" target="_blank">스탑없으 X Got Them</a>.
					<br> All Rights Reserved.
				</p>
			</footer>
		</div>
	</aside>


	<main role="main" class="probootstrap-main js-probootstrap-main">
	<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="index.html">Aside</a></a>
		</div>
	</div>

		<div class="container-login100 " >				
			<div class="wrap-login100 p-t-0 p-b-30 col-xs-8">
				<form class="login100-form validate-form" action="joinSccess.gt" method="post">
					<input type="hidden" id="duplicate" value="N">
					<input type="hidden" id="pwdConfirm" value="N">

					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" id="mem_id" name="mem_id"
							placeholder="아이디 입력"> <span class="focus-input100"></span>
						<input type="button" id="btn1" class="btn btn-sm btn-success" value="중복확인" onclick="duplCheck();">
					</div>
					<div id="idcheck">여기에 가능하다고 들어옴</div>
					<div class="wrap-input100 validate-input m-b-20" data-validate = "Please enter password">
						<span class="btn-show-pass">
							<i class="fa fa fa-eye"></i>
						</span>
						<input class="input100" type="password" id="mem_pw" name="mem_pw" placeholder="패스워드 입력">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-20" data-validate = "Please enter password">
						<span class="btn-show-pass">
							<i class="fa fa fa-eye"></i>
						</span>
						<input class="input100" type="password" id="mem_pw2" name="mem_pw2" placeholder="한번 더 입력하세요">
						<span class="focus-input100"></span>
					</div>
					<div id="pwdCheckMsg"></div>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="mem_name"
							placeholder="회원 이름을 입력하세요"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="email" name="mem_email"
							placeholder="이메일을 입력하세요"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="mem_phone"
							placeholder="전화번호를 입력하세요"> <span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn">
					<button  onclick="sample6_execDaumPostcode()">
					우편번호 찾기</button></div>
						<br>
					<div class="wrap-input100 validate-input m-b-20" >
						<input type="text" class="input100" name="mem_post" id="mem_post" placeholder="우편번호"> 
						<input type="text" class="input100" name="mem_address1" id="mem_address1" placeholder="주소"> 
						<input type="text" class="input100" name="mem_address2" id="mem_address2" placeholder="상세주소">
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="submit()">가입하기</button>
						<button class="login100-form-btn" onclick="history.back()">뒤로가기</button>
					</div>
				</form>
			</div>
		</div>

	<div class="container-fluid d-md-none">
		<div class="row">
			<div class="col-md-12">
				<ul class="list-unstyled d-flex probootstrap-aside-social">
					<li><a href="#" class="p-2"><span class="icon-twitter"></span></a></li>
					<li><a href="#" class="p-2"><span class="icon-instagram"></span></a></li>
					<li><a href="#" class="p-2"><span class="icon-dribbble"></span></a></li>
				</ul>
				<p>
					&copy; 2017 <a href="https://uicookies.com/" target="_blank">uiCookies:Aside</a>.
					<br> All Rights Reserved. Designed by <a
						href="https://uicookies.com/" target="_blank">uicookies.com</a>
				</p>
			</div>
		</div>
	</div>

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