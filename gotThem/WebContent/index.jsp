<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%String getId= (String)session.getAttribute("id");%>
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
</head>
<body>
<input type="hidden"  name="uri" value="<%request.getRequestURI();%>">
<header>
<%@include file="nav.jsp" %>
</header> 

	<section id="cvssearch" class="newsletter bg-gray">
		<div class="container text-center">
			<h2>지금 맛있고 간단한 식사를 위해 검색해보세요</h2>
			<p class="lead">검색버튼으로 근처 편의점의 재고 조회가 가능합니다.</p>
			<div class="form-holder">
				<form id="newsletterForm" action="#">
					<div class="form-group">
						<input type="text" name="email" id="email"
							placeholder="원하는 단어를 검색해보세요 (ex. 강남역 삼각김밥)">
						<button type="submit" class="btn btn-primary btn-gradient submit">검색</button>
					</div>
				</form>
			</div>
		</div>
	</section>

	<section id="about-us">
		<div class="container">
			<h2>저희와 제휴 하고 싶으신가요?</h2>
			<div class="row">
				<p class="lead col-lg-10">There are many variations of passages
					of Lorem Ipsum available, but the majority have suffered alteration
					in some form, by injected humour, or randomised words which don't
					look even slightly believable. If you are going to use a passage of
					Lorem Ipsum, you need to be sure there isn't anything embarrassing
					hidden in the middle of text. or randomised words which don't look
					even slightly believable.</p>
			</div>
			<a href="storeIndex.st" class="btn btn-primary btn-shadow btn-gradient">Discover
				More</a>
		</div>
	</section>

	<div id="scrollTop">
		<div class="d-flex align-items-center justify-content-end">
			<i class="fa fa-long-arrow-up"></i>To Top
		</div>
	</div>
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
