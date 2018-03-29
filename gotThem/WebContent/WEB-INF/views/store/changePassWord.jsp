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
<link rel="stylesheet" href="resources/indexTemplate/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/icomoon.css">
<link rel="stylesheet" href="resources/indexTemplate/css/animate.css">
<link rel="stylesheet" href="resources/indexTemplate/css/style.css">
<link rel="stylesheet" href="resources/landy/css/style.default.css" id="theme-stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<style>
body{
font-size:18px !important;
font-family:나눔스퀘어라운드 !important;
}
.btn{
font-size:16px !important;
font-family:나눔스퀘어라운드 !important;
}
a{
text-decoration: none;
color: #000000;
}
a:hover{color:#1FAD9F;text-decoration:underline}
.mama{
margin-top:130px;
}
.form-control {
    width: 100%;
    height:50px;
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
    border: 1px solid #1FAD9F;
    background: #1FAD9F;
    hover:
}
.btn-success{
border-radius:4px;
margin:1px;
padding: 0.6rem 1rem;
align:center;
}
.btn-success:hover,
.btn-success:focus,
.btn-success:active,
.btn-success.active,
.open .dropdown-toggle.btn-success{
color:#fff;
background-color:#178277;
border-color:#178277;
}
header {
    padding-bottom: 0px;
}
</style>
</head>
<body>

	<header>
		<%@include file="nav.jsp"%>
	</header>

<div class="container mama">
    <div class="row vertical-offset-100" >
    	<div class="col-md-5 col-md-offset-4">
    	<h3>사장님 비밀번호 변경하러 오셨어요?</h3>&nbsp;<br>
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h4><strong>비밀번호 변경</strong></h4>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" action="<c:url value='/passWordChange.st' />"method="post">
                    <fieldset>
			    	  	<div class="form-group mBottom0px">
			    	  	<span>현재 비밀번호</span>
			    		    <input class="form-control" placeholder="현재 비밀번호를 입력해주세요." name="mem_pw" type="password">
			    		</div>
			    		<div class="form-group">
			    		</div>
			    		<div class="form-group mBottom0px">
			    			<span>새로운 비밀번호</span>
			    			<input class="form-control" placeholder="새로운 비밀번호를 입력해주세요." name="new_pw1" type="password" value="">
			    		</div>
			    		<div class="form-group">
			    		</div>
			    		<div class="form-group mBottom0px">
			    			<input class="form-control" placeholder="다시 한번 입력해주세요." name="new_pw2" type="password" value="">
			    		</div>
			    		<div class="form-group">
			    		</div>
			    		<input class="btn btn-success colorGreen" type="submit" value="변경하기">
			    		<input class="btn btn-success colorGreen" type="button" onclick="history.back()" value="취소하기">
			    		 <span style="padding-top:10px;color:blue;">※ 사장님~ 비밀번호 유출에 주의해주세요</span>
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>

	<script src="resources/indexTemplate/js/jquery-3.2.1.slim.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/indexTemplate/js/bootstrap.min.js"></script>
	<script src="resources/indexTemplate/js/owl.carousel.min.js"></script>
	<script src="resources/indexTemplate/js/jquery.waypoints.min.js"></script>
	<script src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script>
	<script src="resources/indexTemplate/js/main.js"></script>
	<script>
	$().ready(function(){
   		var msg= '${resultMsg}';
   		var str;
   		if(msg!=null){
   			if(msg=='1'){
   				str="귀하의 이메일 주소로 해당 이메일로 가입된 아이디를 발송 하였습니다.";
   			}else if(msg=='2'){
   				str="정보를 정확히 입력해주세요";
   			}else if(msg=='3'){
   				str="귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.";
   			}else if(msg=='4'){
   				str="귀하의 이메일로 가입된 아이디가 존재하지 않습니다.";
   			}else if(msg=='5'){
   				str="정보를 입력해주세요";
   			}
   			if(str!=null)
   				alert(str);
   		}
   	});
	$().ready(function(){
   		var msg= '${resultMsg}';
   		var str;
   		if(msg!=null){
   			if(msg=='fail1'){
   				str="현재 비밀번호가 맞지 않습니다. 다시 확인해주세요";
   			}else if(msg=='fail2'){
   				str="새로운 비밀번호를 정확히 입력하여 주세요";
   			}else if(msg=='fail3'){
   				str="비밀번호 변경이 실패하였습니다";
   			}else if(msg=='success'){
   				str="비밀번호 변경이 성공하였습니다.";
   			}
   			if(str!=null)
   				alert(str);
   		}
   	});
	</script>

</body>
</html>