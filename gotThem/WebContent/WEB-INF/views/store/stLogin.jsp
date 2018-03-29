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
.btn{font-size:16px;}
.card-wrapper1{border:1px solid #b9b9b9; border-radius:4px;}
.fat{height:500px;}

@media screen and (min-width: 768px) {
	.my-login-page .card-wrapper1 {
		width: 400px;
	}
}
body {font-family:나눔스퀘어라운드;}
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
							<img src="resources/image/indexLOGO.PNG" height="120px">
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<div class="card-wrapper1">
									<div class="card fat">
										<div class="card-body" style="margin-bottom: 19px;"><br>
											<h4 class="card-title">
												<strong>사장님 로그인</strong>
											</h4><br>
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
												</div><br>
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
										<div class="card-body">
										<h4 class="card-title">
											<strong>GOTTHEM 식구가 아니신가요?
											</strong>
										</h4>
										
										<div class="card-description" style="font-family:나눔스퀘어라운드; font-size:20px;">
											<span><strong>&nbsp;&nbsp;제휴신청 방법!</strong></span><br>
											<ol style="font-family:나눔바른펜; font-size:18px;">
												<li>하단의 제휴신청 버튼 클릭</li>
												<li>지정된 양식을 작성하고 제휴 회원가입 신청</li>
												<li>담당자 검토 후 신청 사장님과의 연락 및 미팅</li>
												<li>담당자의 승인이 끝나면 제휴 가입 끝!</li>
											</ol>
											
										</div>
										<span style="color:red; font-size:16px; word-break:keep-all;">
										※ 제휴 신청 후 일정기간 승인대기상태가 되어 사이트 이용이 제한됩니다.${reMsg}</span>
										</div>
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
	<script type="text/javascript">
	
	//join
	$().ready(function(){
   		var msg= '${reMsg}';
   		var str;
   		console.log(msg);
   		if(msg!=null){
   			if(msg==1)
   				str="회원가입을 축하합니다!\n지금 회원님은 승인 대기상태 입니다.\n승인까지는 2~5영업일이 소요됩니다.";
   				
   			if(str!=null)
   				alert(str);
   		}
   	});
	
	//delete
	$().ready(function(){
   		var msg= '${resultMsg}';
   		var str;
   		console.log(msg);
   		if(msg!=null){
   			if(msg=='DelSuccess')
   				str="제휴해지가 정상적으로 처리되었습니다.\n이용해주셔서 감사합니다.";
   				
   			if(str!=null)
   				alert(str);
   		}
   	});
	</script>

</body>
</html>