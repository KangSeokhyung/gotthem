<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Mypage</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="resources/mypages/vendor/bootstrap/css/bootstrap.min.css">

<!-- theme stylesheet-->
<link rel="stylesheet" href="resources/landy/css/style.default.css"
	id="theme-stylesheet">
	
<!-- custom stylesheet CSS -->	
<link rel="stylesheet"
	href="resources/mypages/css/mypage.css">

</head>

<body>

	<header>
		<%@include file="../../../nav.jsp"%>
	</header>

	
	<div class="container-fluid">
		<div class="row">
		
			<!-- Page Content -->
			<div class="col-md-2 col-sm-4 sidebar1">
				<h4 class="mypa">
					<strong>마이페이지</strong>
				</h4>
				<br>
				<div class="left-navigation">
					<ul class="list">
						<li><a href="#tab-1" data-toggle="tab"><h5><strong>회원 정보</strong></h5></a></li>
						<li><a href="#tab-2" data-toggle="tab">회원정보 수정</a></li>
						<li><a href="#tab-3" data-toggle="tab">비밀번호 변경</a></li>
						<li><a href="#tab-4" data-toggle="tab">회원 탈퇴</a></li>
					</ul>
					<ul class="list">
						<li><a href="#"><h5><strong>구매 정보</strong></h5></a></li>
						<li><a href="#">찾아갈 상품</a></li>
						<li><a href="#">구매한 상품</a></li>
					</ul>
				</div>
			</div>
			
			<!-- Main Content -->
			<div class="col-md-10 col-sm-8 main-content">
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

	<!-- Footer -->
	<footer class="py-5 bg-dark"
		style="position: absolute; width: 100%; left: 0px; bottom: -200px;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; 스탑없으 팀의
				Gotthem프로젝트   &nbsp;&nbsp;&nbsp;&nbsp;   고생해주신 팀원 : 강석형, 권도용, 김성우, 김채윤, 이찬희</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="resources/landy/vendor/bootstrap/js/bootstrap.min.js"></script>
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
