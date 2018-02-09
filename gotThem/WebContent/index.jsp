<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
  <link rel="stylesheet" href="resources/slidertemplate/tether/tether.min.css">
  <link rel="stylesheet" href="resources/slidertemplate/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/slidertemplate/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="resources/slidertemplate/theme/css/style.css">
  <link rel="stylesheet" href="resources/slidertemplate/mobirise/css/mbr-additional.css" type="text/css">
</head>
<body>
	<!-- navbar-->
	<header class="header">
		<nav class="navbar navbar-expand-lg fixed-top">
			<a href="/gotthem/index.jsp" class="navbar-brand">Got Them!</a>
			<button type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation"
				class="navbar-toggler navbar-toggler-right">
				<span></span><span></span><span></span>
			</button>
			<div id="navbarSupportedContent" class="collapse navbar-collapse">
				<ul
					class="navbar-nav ml-auto align-items-start align-items-lg-center">
					<li class="nav-item"><a href="#about-us"
						class="nav-link link-scroll">Got them?</a></li>
					<li class="nav-item"><a href="#features"
						class="nav-link link-scroll">Notice</a></li>
					<li class="nav-item"><a href="#testimonials"
						class="nav-link link-scroll">Event</a></li>
					<li class="nav-item"><a href="text.html" class="nav-link">Question</a></li>
				</ul>
				<div class="navbar-text">
					<!-- Button trigger modal-->
					<a href="join.gt" data-target="#exampleModal"
						class="btn btn-primary navbar-btn btn-shadow btn-gradient">Sign
						Up</a> <a href="#" data-toggle="modal" data-target="#exampleModal"
						class="btn btn-primary navbar-btn btn-shadow btn-gradient">Login</a>
				</div>
			</div>
		</nav>
	</header>
	
	<section class="carousel slide cid-qIWOeW23YU" data-interval="false"
		id="slider1-t">
		<div class="full-screen">
			<div class="mbr-slider slide carousel" data-pause="true"
				data-keyboard="false" data-ride="false" data-interval="false">
				<ol class="carousel-indicators">
					<li data-app-prevent-settings="" data-target="#slider1-t"
						class=" active" data-slide-to="0"></li>
					<li data-app-prevent-settings="" data-target="#slider1-t"
						data-slide-to="1"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item slider-fullscreen-image active"
						data-bg-video-slide="false"
						style="background-image: url(assets/images/1.jpg);">
						<div class="container container-slide">
							<div class="image_wrapper">
								<div class="mbr-overlay"></div>
								<img src="assets/images/1.jpg">
								<div class="carousel-caption justify-content-center">
									<div class="col-10 align-center">
										<h2 class="mbr-fonts-style display-1">FULL SCREEN SLIDER</h2>
										<p class="lead mbr-text mbr-fonts-style display-5">Choose
											from the large selection of latest pre-made blocks -
											jumbotrons, hero images, parallax scrolling, video
											backgrounds, hamburger menu, sticky header and more.</p>
										<div class="mbr-section-btn" buttons="0">
											<a class="btn  btn-success display-4"
												href="https://mobirise.com">FOR WINDOWS</a> <a
												class="btn  btn-white-outline display-4"
												href="https://mobirise.com">FOR MAC</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item slider-fullscreen-image"
						data-bg-video-slide="https://www.youtube.com/watch?v=fwkKc6M60-0">
						<div class="mbr-overlay"></div>
						<div class="container container-slide">
							<div class="image_wrapper">
								<img src="assets/images/2.jpg" style="opacity: 0;">
								<div class="carousel-caption justify-content-center">
									<div class="col-10 align-left">
										<h2 class="mbr-fonts-style display-1">VIDEO SLIDE</h2>
										<p class="lead mbr-text mbr-fonts-style display-5">Slide
											with youtube video background and color overlay. Title and
											text are aligned to the left.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

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
			<a href="storeIndex.ow" class="btn btn-primary btn-shadow btn-gradient">Discover
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js">
		
	</script>
	<script src="resources/landy/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/landy/vendor/jquery.cookie/jquery.cookie.js">
		
	</script>
	<script src="resources/landy/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="resources/landy/js/front.js"></script>
	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID.-->
	<!---->
	  <script src="resources/slidertemplate/popper/popper.min.js"></script>
  	  <script src="resources/slidertemplate/tether/tether.min.js"></script>
      <script src="resources/slidertemplate/bootstrap/js/bootstrap.min.js"></script>
      <script src="resources/slidertemplate/ytplayer/jquery.mb.ytplayer.min.js"></script>
      <script src="resources/slidertemplate/vimeoplayer/jquery.mb.vimeo_player.js"></script>
      <script src="resources/slidertemplate/bootstrapcarouselswipe/bootstrap-carousel-swipe.js"></script>
      <script src="resources/slidertemplate/smoothscroll/smooth-scroll.js"></script>
      <script src="resources/slidertemplate/theme/js/script.js"></script>
      <script src="resources/slidertemplate/slidervideo/script.js"></script>
=======
<%String getId=(String)session.getAttribute("id");%>
<%-- <%String uri = request.getRequestURI(); System.out.println(uri);%> --%>
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
			<a href="storeIndex.ow" class="btn btn-primary btn-shadow btn-gradient">Discover
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
>>>>>>> branch 'chanhee' of https://github.com/KangSeokhyung/gotthem.git
</body>
</html>
