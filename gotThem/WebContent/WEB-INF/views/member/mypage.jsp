<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Mypage</title>
<link href="resources/mainTemplate/bootstrap3/css/bootstrap.css"
	rel="stylesheet" />
<link href="resources/mainTemplate/assets/css/ct-paper.css"
	rel="stylesheet" />
<link href="resources/mainTemplate/assets/css/demo.css" rel="stylesheet" />
<link href="resources/mainTemplate/assets/css/examples.css"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
	
	
	
	
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
ul{
   list-style:none;
   }
</style>
<body>
	<header>
		<%@include file="../../../nav.jsp"%>
	</header>
	<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
	<div class="container">
		<a class="navbar-brand" href="storeIndex.st">점포관리시스템</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div
			class="collapse navbar-collapse pull-xs-right justify-content-end"
			id="navbarSupportedContent">
			<ul class="navbar-nav mt-2 mt-md-0">
				<li class="nav-item"><a class="nav-link" href="#">알림사항</a></li>
				<li class="nav-item"><a class="nav-link" href="mystore.st">점포관리</a></li>
				<li class="nav-item"><a class="nav-link" href="stock.st">재고관리</a></li>
				<li class="nav-item"><a class="nav-link" href="#">회사소개</a></li>
				<c:set var="sessionCheck"
					value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
				<c:choose>
					<c:when test="${sessionCheck eq null}">
						<strong><li class="nav-item"><a
							class="nav-link" href="login.st">사장님
								로그인</a></li></strong>
						<strong><li class="nav-item"><a href="join.st"
								class="nav-link">제휴하기</a></li></strong>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a href="logout.st"
								class="nav-link">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>

	<div style="padding-top: 30px; background:#66615;">
		<div class="middle" >
			<div class="row col-md-3 col-sm-12">

				<!-- Page Content -->
				<div style="border: solid 3px #EB5E28; width: 200px; height:500px; margin-bottom:30px;">
					<h4 style="text-align:center;">
						<strong>마이페이지</strong>
					</h4>
					<div class="left-navigation">
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
			</div>

			<div class="row col-md-9">
				<!-- Main Content -->
				<div class="main-content" style="margin-left:30px; border: solid 3px #EB5E28; width: 670px; height:500px; margin-bottom:30px;">
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
