<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Mypage</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="resources/mypages/vendor/bootstrap/css/bootstrap.min.css">

<!-- theme stylesheet-->
<link rel="stylesheet" href="resources/landy/css/style.default.css"
	id="theme-stylesheet">

<style type="text/css">
.sidebar1 {
	background: #F17153;
	/* For browsers that do not support gradients */
	background: -webkit-linear-gradient(#F17153, #F58D63, #f1ab53);
	/* For Safari 5.1 to 6.0 */
	background: -o-linear-gradient(#F17153, #F58D63, #f1ab53);
	/* For Opera 11.1 to 12.0 */
	background: -moz-linear-gradient(#F17153, #F58D63, #f1ab53);
	/* For Firefox 3.6 to 15 */
	background: linear-gradient(#F17153, #F58D63, #f1ab53);
	/* Standard syntax */
	padding: 0px;
	min-height: 100%;
}

.logo {
	max-height: 130px;
}

.logo>img {
	margin-top: 30px;
	padding: 3px;
	border: 3px solid white;
	border-radius: 100%;
}

.list {
	color: #fff;
	list-style: none;
	padding-left: 0px;
}

.list>li>a {
	color: black;
	list-style: none;
	padding-left: 0px;
}

.list::first-line {
	color: rgba(255, 255, 255, 0.5);
}

.list>li, .list>h5 {
	padding: 5px 0px 5px 40px;
}

.list>li:hover {
	background-color: rgba(255, 255, 255, 0.2);
	border-left: 5px solid white;
	color: white;
	font-weight: bolder;
	padding-left: 35px;
}

.list>li>a:hover {
	color: white;
	font-weight: bolder;
}

.main-content {
	text-align: center;
}

.user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad
{margin-top:20px;
}

.mypa{
	padding-top: 30px;
	padding-left: 15px;
}


</style>

</head>

<body>

	<header>
		<%@include file="../../../nav.jsp"%>
	</header>

	<!-- Page Content -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 col-sm-4 col-xs-0 sidebar1">
				<h4 class="mypa">
					<strong>마이페이지</strong>
				</h4>
				<br>
				<div class="left-navigation">
					<ul class="list">
						<li><a href="#tab-1" data-toggle="tab"><h5><strong>회원 정보</strong></h5></a></li>
						<li><a href="#tab-2" data-toggle="tab">회원정보 수정</a></li>
						<li><a href="#">회원 탈퇴</a></li>
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
			<div class="col-md-10 col-sm-8 main-content">
				<div class="tab-content">
				<div class="tab-pane fade show active" id="tab-1"></div>
				<div class="tab-pane fade" id="tab-2"></div>
				<div class="tab-pane fade" id="tabC">
					<p>and C</p>
				</div>
				<div class="tab-pane fade" id="tabD">
					<p>...D</p>
				</div>
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
		$.get("./mypageMemberInfo.gt", function(data) {
			$('#tab-1').html(data);
		});
	</script>
	<script>
		$.get("./mypageMemberMode.gt", function(data) {
			$('#tab-2').html(data);
		});
	</script>

</body>

</html>
