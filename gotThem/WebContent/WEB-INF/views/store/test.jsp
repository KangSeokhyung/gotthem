<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="utf-8">
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
<link rel="stylesheet" href="resources/landy/css/style.default.css"
	id="theme-stylesheet">
<style>
@media( max-width: 640px ) {
	#tickets,
	#tickets thead,
	#tickets tbody,
	#tickets tr,
	#tickets th,
	#tickets td {
		display: block;
	}

	#tickets tr {
		border-bottom: 1px solid #ddd;
	}

	#tickets th,
	#tickets td {
		border-top: none;
		border-bottom: none;
	}
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
			<c:set var="sessionCheck"
						value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
			<c:choose>
				<c:when test="${sessionCheck eq null}">
			<a href="login.st">GOT THEM</a>
			</c:when>
				<c:otherwise>
					<a href="stock.st?pageNo=1" class="mb-2 d-block probootstrap-logo">GOTTHEM</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

<table id="tickets" class="table">
	<tr>
		<th nowrap>입장권</th>
		<td>테마파크만 입장하고 놀이기구를 이용하지 않을 경우 최적입니다.</td>
		<td nowrap>20,000원</td>
	</tr>
	<tr>
		<th nowrap>자유이용권</th>
		<td>폐장시간까지 모든 기구를 자유롭게 이용합니다.</td>
		<td nowrap>40,000원</td>
	</tr>
	<tr>
		<th nowrap>야간 자유이용권</th>
		<td>오후 5시 이후 입장해 폐장시간까지 모든 기구를 자유롭게 이용합니다.</td>
		<td nowrap>30,000원</td>
	</tr>
</table>
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