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
<link rel="stylesheet" type="text/css"
	href="resources/stlogin/css/my-login.css">
<style>
@media screen and (min-width: 768px) {
	.my-login-page .card-wrapper1 {
		width: 400px;
	}
}
</style>
</head>
<body>
		</div>
	</div>
	<body class="my-login-page">
		<section>
			<div class="container">
				<div class="row justify-content-md-center">
					<div class="box">
						<div class="brand">
							<img src="resources/stlogin/img/logo.jpg">
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<div class="card-wrapper1">
									<div class="card fat">
										<div class="card-body" style="margin-bottom: 19px;">
											<h4 class="card-title">
												<strong>사장님 로그인</strong>
											</h4>
											<form method="POST">
												<div class="form-group">
													<input id="text"
														type="text" class="form-control" name="sto_id" value=""
														required autofocus placeholder="아이디">
												</div>
												<div class="form-group">
													<input id="password"
														type="password" class="form-control" name="sto_pw"
														required data-eye placeholder="비밀번호">
												</div>
												<div class="form-group no-margin">
													<button type="submit" class="btn btn-primary btn-block">
														Login</button>
												</div>
												<div class="margin-top20 text-center">
													아이디나 비밀번호를 잊으셨나요? <br>
													<a href="findId.st">아이디</a>/<a href="findPw.st">비밀번호</a>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="card-wrapper1">
									<div class="card fat" style="padding-top: 25px; padding-bottom: 20px;">
										<h4 class="card-title">
											<strong>아직 GOTTHEM 식구가<br>아니신가요?
											</strong>
										</h4>
										<h6 class="card-description" style="font-family:나눔고딕;">
											제휴 신청 버튼을 눌러 가입합니다. 지정된 양식을 쓰고 제출버튼을 누르면 끝! 
											마지막으로 관리자의 최종 승인이 나면 GOT THEM의 제휴 가맹점이 됩니다.<br><br><br>
											제휴신청 후 일정기간 승인 대기상태가됩니다.<br> 제휴신청 회원가입을 해 주시면 담당자가 검토후 연락을 드리겠습니다.<br>
											<br><br></strong>
											<br>
										</h6>
										<input type="button" class="btn btn-primary btn-block"
											value="제휴신청하기" onclick="location='join.st'">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br><br>
				<div align="center">
				<input type="button" value="고객 사이트로" class="btn btn-primary" onclick="location='index.gt'">
				</div>
			</div>
		</section>

	<script src="resources/indexTemplate/js/jquery-3.2.1.slim.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/indexTemplate/js/bootstrap.min.js"></script>
	<script src="resources/indexTemplate/js/owl.carousel.min.js"></script>
	<script src="resources/indexTemplate/js/jquery.waypoints.min.js"></script>
	<script src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script>
	<script src="resources/indexTemplate/js/main.js"></script>

</body>
</html>