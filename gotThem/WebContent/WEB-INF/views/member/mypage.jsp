<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Mypage</title>
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
</head>
<style>
.middle {
	overflow: hidden;
	width: 900px;
	margin: 0 auto;
	background: transparent;
}

a {
	color: #000;
}

ul {
	list-style: none;
}

.btn-gradient {
	background-color: #5989e5;
	background-image: -webkit-gradient(linear, left top, right top, from(#5989e5),
		to(#37cfdc));
	background-image: linear-gradient(to right, #5989e5, #37cfdc);
	border: none !important;
	text-transform: uppercase;
	color: #fff;
	overflow: hidden;
	position: relative;
	z-index: 1;
	-webkit-transition: all 0.3s !important;
	transition: all 0.3s !important;
}
</style>
<body>
	<header>
		<%@include file="../../../nav.jsp"%>
	</header>


	<div style="padding-top: 30px;">
		<div class="middle">
			<div class="row col-md-3" style="margin-right:0px; width:30%">
				<!-- Page Content -->
				<div class="btn-gradient"
					style="margin-top: 80px; border: solid 3px #EB5E28; width: 200px; height: 500px; margin-bottom: 30px;">

					<p><h4 style="text-align: center;">마이페이지</h4>
					</p>


						<ul class="list">

							<li><a href="#tab-1" data-toggle="tab"><h5>
										<strong>회원 정보</strong>
									</h5></a></li>
							<li><a href="#tab-2" data-toggle="tab">회원정보 수정</a></li>
							<li><a href="#tab-3" data-toggle="tab">비밀번호 변경</a></li>
							<li><a href="#tab-4" data-toggle="tab">회원 탈퇴</a></li>
						</ul>
						<ul class="list">
							<li><a href="#"><h5>
										<strong>구매 정보</strong>
									</h5></a></li>
							<li><a href="#">찾아갈 상품</a></li>
							<li><a href="#">구매한 상품</a></li>
						</ul>
				</div>
			</div>

			<div class="col-md-7" style="margin: 0px; padding: 0px;">
				<!-- Main Content -->
				<div class="main-content"
					style="border: solid 3px #EB5E28; width: 600px; height: 500px; margin-bottom: 30px;">
					<div class="tab-content">
						<div class="tab-pane fade show active" id="tab-1"></div>
						<div class="tab-pane fade" id="tab-2"></div>
						<div class="tab-pane fade" id="tab-3"></div>
						<div class="tab-pane fade" id="tab-4"></div>
						<div class="tab-pane fade" id="tabE">
							<p>Okay, last one E</p>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="footer-demo section-dark">
		<div class="container">
			<nav class="pull-left">
				<ul>

					<li><a href="http://www.creative-tim.com"> Creative Tim </a></li>
					<li><a href="http://blog.creative-tim.com"> Blog </a></li>
					<li><a href="http://www.creative-tim.com/product/rubik">
							Licenses </a></li>
				</ul>
			</nav>
			<div class="copyright pull-right">
				&copy; 2015, made with <i class="fa fa-heart heart"></i> by Creative
				Tim
			</div>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/mainTemplate/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/mainTemplate/js/jquery.easeScroll.js"></script>
	<script src="resources/mainTemplate/sweetalert/dist/sweetalert.min.js"></script>
	<script src="resources/mainTemplate/js/stisla.js"></script>
	<script>
		$.get("mypageMemberInfo.gt", function(data) {
			$('#tab-1').html(data);
		});
	</script>
	<script>
		$.get("mypageMemberModi.gt", function(data) {
			$('#tab-2').html(data);
		});
	</script>
	<script>
		$.get("passCheck.gt", function(data) {
			$('#tab-3').html(data);
		});
	</script>
	<script>
		$.get("mypageMemberDel.gt", function(data) {
			$('#tab-4').html(data);
		});
	</script>

</body>

</html>
