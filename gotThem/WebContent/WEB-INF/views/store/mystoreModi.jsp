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
<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/main.css">
<link href="https://fonts.googleapis.com/css?family=Work+Sans"
	rel="stylesheet">
<link rel="stylesheet" href="resources/indexTemplate/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/icomoon.css">
<link rel="stylesheet" href="resources/indexTemplate/css/animate.css">
<link rel="stylesheet" href="resources/indexTemplate/css/style.css">
<link rel="stylesheet" href="resources/landy/css/style.default.css" id="theme-stylesheet">
<link rel="stylesheet" href="resources/landy/css/custom.css">
</head>
</head>
<body>

	<aside class="probootstrap-aside js-probootstrap-aside">
		<a href="#"
			class="probootstrap-close-menu js-probootstrap-close-menu d-md-none"><span
			class="oi oi-arrow-left"></span> Close</a>
		<div class="probootstrap-site-logo probootstrap-animate"
			data-animate-effect="fadeInLeft">

			<a href="storeIndex.st" class="mb-2 d-block probootstrap-logo">GOTTHEM</a>
			<p class="mb-0">
				제휴 사이트 
			</p>
		</div>
		<div class="probootstrap-overflow">
			<nav class="probootstrap-nav">
				<ul>
					<li class="probootstrap-animate"
						data-animate-effect="fadeInLeft"><a href="/storeIndex">Got them?</a></li>
					<li class="probootstrap-animate active" data-animate-effect="fadeInLeft"><a
						href="mystore.st">점포관리</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="stock.st">재고관리</a></li>
				<c:set var="sessionCheck"
					value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
				<c:choose>
					<c:when test="${sessionCheck eq null}">
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="login.st">로그인</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="join.st">제휴맺기</a></li>
					</c:when>
					<c:otherwise>
						<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a href="logout.gt" class="nav-link">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="index.gt">고객 사이트</a></li>
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
	
	
	
	
	
	<!--Main content code to be written here -->
	<br>
	<div style="border-top: 5px solid gray; border-bottom: 5px solid gray;">
			<form action="memberModi.gt" method="POST">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3>회원 정보 수정</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class=" col-md-12 col-lg-12 " align="center">
							<input type="hidden" name="mem_id" value="${memberInfo.mem_id}"/>
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td><span>회원 아이디:</span></td>
											<td>${memberInfo.mem_id}</td>
										</tr>
										<tr>
											<td><span>이름:</span></td>
											<td><input style="width: 100%" type="text"
												name="mem_name" value="${memberInfo.mem_name}"></td>
										</tr>
										<tr>
											<td><span>이메일:</span></td>
											<td><input style="width: 100%" type="text"
												name="mem_email" value="${memberInfo.mem_email}"></td>

										</tr>
										<tr>
											<td><span>전화번호:</span></td>
											<td><input style="width: 100%" type="text"
												name="mem_phone" value="${memberInfo.mem_phone}"></td>
										</tr>
										<tr>
											<td><span>가입일:</span></td>
											<td>${memberInfo.mem_regdate}</td>
										</tr>
										<tr>
											<td><span>우편번호:</span></td>
											<td><input style="width: 100%" type="text"
												name="mem_post" value="${mem_post}"></td>
										</tr>
										<tr>
											<td><span>주소:</span></td>
											<td><input style="width: 100%" type="text"
												name="mem_address1" value="${mem_address1}"><br>
												<input style="width: 100%" type="text" name="mem_address2"
												value="${mem_address2}"></td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel-footer"></div>
						<button class="btn-success" type="submit">완료</button>
						<button class="btn-danger" onclick="reset()">취소</button>
						<button class="btn-blue" onclick="history.go(-1)">뒤로가기</button>
				</div>
			</form>

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