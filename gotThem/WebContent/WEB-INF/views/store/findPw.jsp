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
.btn-success:hover,
.btn-success:focus,
.btn-success:active,
.btn-success.active,
.open .dropdown-toggle.btn-success{
color:#fff;
background-color:#178277;
border-color:#178277;
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
    	<h3>사장님 비밀번호를 잊으셨나요?</h3>&nbsp;<br>
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">비밀번호 찾기</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" action="<c:url value='/findPw.st' />"method="post">
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
			    		<input class="btn btn-lg btn-success btn-block colorGreen" type="submit" value="아이디 찾기">
			    		 <span style="padding-top:10px;color:blue;">※ 정보를 입력하시면 임시비밀번호를 발급해드립니다</span>
			    	</fieldset>
			      	</form>
			    </div>
			</div>
			<h3><a href="findId.st">아이디를 잊으셨어요?</a></h3>
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
   			}else if(msg=='6'){
   				str="입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.";
   			}
   			if(str!=null)
   				alert(str);
   		}
   	});
	</script>

</body>
</html>