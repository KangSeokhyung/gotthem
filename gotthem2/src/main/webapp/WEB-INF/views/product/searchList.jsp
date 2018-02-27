<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Landy: Bootstrap 4 landing page template by
	Bootstrapious.com</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="resources/landy/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="resources/landy/vendor/font-awesome/css/font-awesome.min.css">
<!-- Custom Font Icons CSS-->
<link rel="stylesheet" href="resources/landy/css/landy-iconfont.css">
<!-- Google fonts - Open Sans-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
<!-- owl carousel-->
<link rel="stylesheet"
	href="resources/landy/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet"
	href="resources/landy/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="resources/landy/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="resources/landy/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="favicon.png">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<title>Got Them?</title>
<style type="text/css">
	table { border: 1px solid #ddd; width: 100%; }
</style>
</head>
<body>
	<!-- Header -->
	<header>
		<%@include file="../nav.jsp" %>
	</header>
	
	<section id="cvssearch" class="newsletter bg-gray">
		<div class="container text-center">
			<p class="lead">지도API</p>
			<div class="row">
			</div>
		</div>
	</section>

	<section id="about-us">
		<div class="container">
			<h2>리스트출력란</h2>
			<div class="row">
				<table>
					<colgroup>
						<col width="25%" />
						<col width="25%" />
						<col width="20%" />
						<col width="30%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">매장이미지</th>
							<th scope="col">매장이름</th>
							<th scope="col">상품명</th>
							<th scope="col">매장주소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${searchList }">
						<tr>
							<th><a href="storeDetail.gt?mem_no=${list.mem_no }"><img src="${list.pro_img}"></a></th>
							<td><a href="storeDetail.gt?mem_no=${list.mem_no }">${list.sto_name }</a></td>
							<td>${list.pro_name }</td>
							<td>${list.mem_address }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	
	<!-- Footer -->
	<footer class="main-footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<a href="#" class="brand">Landy</a>
					<ul class="contact-info list-unstyled">
						<li><a href="mailto:sales@landy.com">Sales@Landy.com</a></li>
						<li><a href="tel:123456789">+00 123 456 789</a></li>
					</ul>
					<ul class="social-icons list-inline">
						<li class="list-inline-item"><a href="#" target="_blank"
							title="Facebook"><i class="fa fa-facebook"></i></a></li>
						<li class="list-inline-item"><a href="#" target="_blank"
							title="Twitter"><i class="fa fa-twitter"></i></a></li>
						<li class="list-inline-item"><a href="#" target="_blank"
							title="Instagram"><i class="fa fa-instagram"></i></a></li>
						<li class="list-inline-item"><a href="#" target="_blank"
							title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6">
					<h5>Selected Cases</h5>
					<ul class="links list-unstyled">
						<li><a href="#">Guess Conntect</a></li>
						<li><a href="#">Postly</a></li>
						<li><a href="#">Iris Vor Arnim</a></li>
						<li><a href="#">Yapital</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6">
					<h5>Selected Cases</h5>
					<ul class="links list-unstyled">
						<li><a href="#">Guess Conntect</a></li>
						<li><a href="#">Postly</a></li>
						<li><a href="#">Iris Vor Arnim</a></li>
						<li><a href="#">Yapital</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6">
					<h5>Selected Cases</h5>
					<ul class="links list-unstyled">
						<li><a href="#">Guess Conntect</a></li>
						<li><a href="#">Postly</a></li>
						<li><a href="#">Iris Vor Arnim</a></li>
						<li><a href="#">Yapital</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="copyrights">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<p>&copy; 2017 Landy.com. All rights reserved.</p>
					</div>
					<div class="col-md-5 text-right">
						<p>
							Template By <a href="https://bootstrapious.com/" class="external">Bootstrapious</a>
						</p>
						<!-- Please do not remove the backlink to Bootstrapious unless you support us at http://bootstrapious.com/donate. It is part of the license conditions. Thanks for understanding :) -->
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Javascript files-->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="resources/landy/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/landy/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="resources/landy/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="resources/landy/js/front.js"></script> 
</body>
</html>