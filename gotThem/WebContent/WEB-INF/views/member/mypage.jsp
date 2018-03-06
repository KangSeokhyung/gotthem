<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Mypage</title>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="resources/mainTemplate/css/styles-merged.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/custom.css">
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

div{
border:1px solid blue;
}


</style>
<body>
	<header>
		<%@include file="../../../nav.jsp"%>
	</header>


	<div style="padding-top: 80px;">
		<div class="middle">
			<!-- Page Content -->
			<div class="col-md-3 col-sm-3" style="height:100vh;">
				<h3 style="text-align:center;">마이페이지</h3>
				<br>
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

			<div class="col-md-9 col-sm-9">
				<!-- Main Content -->

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

	

	<!-- Bootstrap core JavaScript -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>

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
