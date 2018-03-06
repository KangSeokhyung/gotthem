<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ID / PW 찾기</title>
	<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/main.css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="resources/mainTemplate/css/styles-merged.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/custom.css">
</head>
<body>
<header>
<%@include file="../../../nav.jsp" %>
</header>  
	<div class="limiter">
		<div class="container-login100" style="padding:20px;">
		
			<div class="wrap-login100 p-t-0 p-b-30 col-md-6 col-sm-12" style="padding:20px">
				<form class="login100-form validate-form" action="<c:url value='/findID.gt' />" method="post">
					<div class="text-center p-t-55 p-b-30">
						<span class="txt1">
							ID 찾기
						</span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16" >
						<input class="input100" type="text" name="mem_email" placeholder="가입할 때 입력하셨던 EMAIL을 입력하세요" autofocus="autofocus">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-20" data-validate = "Please enter password">
						<input class="input100" type="text" name="mem_name" placeholder="이름을 입력하세요">
						<span class="focus-input100"></span>
					</div>
					
					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">
							ID 찾기
						</button>
					</div>
				</form>
			</div>
			
			<div class="wrap-login100 p-t-0 p-b-30 col-md-6 col-sm-12" style="padding:20px">
				<form class="login100-form validate-form" action="<c:url value='/findPW.gt' />"method="post">
					<div class="text-center p-t-55 p-b-30">
						<span class="txt1">
							PW 찾기
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-16" >
						<input class="input100" type="text" name="mem_id" placeholder="아이디를 입력하세요" >
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-20" data-validate = "Please enter password">
						<span class="btn-show-pass">
							<i class="fa fa fa-eye"></i>
						</span>
						<input class="input100" type="text" name="mem_email" placeholder="가입할 때 입력하셨던 EMAIL을 입력하세요">
						<span class="focus-input100"></span>
					</div>
					
					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">
							PW 찾기
						</button>
					</div>
				</form>
				
			</div>
		</div>
	</div>
	
	<c:if test="${resultMsg ne null }">
		<c:choose>
			<c:when test="${resultMsg eq '1' }">
				<script>
				alert("귀하의 이메일 주소로 해당 이메일로 가입된 아이디를 발송 하였습니다.");
				</script>
			</c:when>
			<c:when test="${resultMsg eq '2' }">
				<script>
				alert("정보를 정확히 입력해주세요");
				</script>
			</c:when>
			<c:when test="${resultMsg eq '3' }">
				<script>
				alert("귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
				</script>
			</c:when>
			<c:when test="${resultMsg eq '4' }">
				<script>
				alert("귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
				</script>
			</c:when>
			<c:when test="${resultMsg eq '5' }">
				<script>
				alert("정보를 입력해주세요");
				</script>
			</c:when>
		</c:choose>	
	</c:if>


</body>
</html>