<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ID / PW 찾기</title>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="resources/mainTemplate/css/styles-merged.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/custom.css">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<style>
.mama{
margin-top:130px;
}
.form-control {
    width: 100%;
    margin:auto;
}
input[type="submit"].btn-block, input[type="reset"].btn-block, input[type="button"].btn-block {
    width: 100%;
    margin:auto;
}
.formform {
	width: 100%;
    margin:auto;
    display: block;
    height: 34px;
    padding: 6px 0px;
    font-size: 14px;
    line-height: 1.428571429;
    background-color: #fff;
    background-image: none;
}
.mBottom0px{
margin-bottom:0px;
}

.colorGreen{
	background:#286090;
    border: 1px solid #2866AB;
    background: #2866AB;
    hover:
}
input:hover{
	color:#000080;
}
.btn-success:hover,
.btn-success:focus,
.btn-success:active,
.btn-success.active,
.open .dropdown-toggle.btn-success{
color:#fff;
background-color:#337ab7;
border-color:#337ab7;
}

</style>
</head>
<body>
<header>
<%@include file="../../../nav.jsp" %>
</header> 

<div class="container mama">
    <div class="row vertical-offset-100" >
    <h3 style="text-align:center;">아이디 비밀번호가 기억이 나지 않나요? E-Mail로 보내드릴께요</h3>
    <hr>
    	<div class="col-md-5 col-md-offset-3">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">아이디 찾기</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" action="<c:url value='/findID.gt' />" method="post">
                    <fieldset>
			    	  	<div class="form-group mBottom0px">
			    		    <input class="form-control" placeholder="E-mail을 입력하세요" name="mem_email" type="text">
			    		</div>
			    		<div class="form-group">
			    		    <span class="formform">가입 시 입력한 E-mail 을 입력하세요</span>
			    		</div>
			    		<div class="form-group mBottom0px">
			    			<input class="form-control" placeholder="이름을 입력하세요" name="mem_name" type="text" value="">
			    		</div>
			    		<div class="form-group">
			    		    <span class="formform">이름을 입력하세요</span>
			    		</div>
			    		<input class="btn btn-lg btn-success btn-block colorGreen blueHover" type="submit" value="아이디 찾기">
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
<div class="container">
    <div class="row vertical-offset-100">
    	<hr>
    	</div>
    	</div>
<div class="container">
    <div class="row vertical-offset-100">
    	<div class="col-md-5 col-md-offset-3">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">패스워드 찾기</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" action="<c:url value='/findPW.gt' />"method="post">
                    <fieldset>
			    	  	<div class="form-group mBottom0px">
			    		    <input class="form-control" placeholder="E-mail을 입력하세요" name="mem_email" type="text">
			    		</div>
			    		<div class="form-group">
			    		    <span class="formform">가입 시 입력한 E-mail 을 입력하세요</span>
			    		</div>
			    		<div class="form-group mBottom0px">
			    			<input class="form-control" placeholder="아이디를 입력하세요" name="mem_id" type="text" value="">
			    		</div>
			    		<div class="form-group">
			    		    <span class="formform">아이디를 입력하세요</span>
			    		</div>
			    		<input class="btn btn-lg btn-success btn-block colorGreen" type="submit" value="비밀번호 찾기">
			    	</fieldset>
			      	</form>
			    </div>
			</div>
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

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>


</html>