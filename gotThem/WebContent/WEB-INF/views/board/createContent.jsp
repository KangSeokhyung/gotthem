<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="resources/mainTemplate/css/styles-merged.css">
<link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
<link rel="stylesheet" href="resources/mainTemplate/css/custom.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<style type="text/css">
#releatedField { position: absolute; width: 63%; }
#releatedField a { color: #66615b; text-decoration: none; }
.buttonBackgroundColor{
background-color:#fe490f;
}
.buttonBackgroundColor:hover{
background-color:#ff990f;
color:#fff;
}
.probootstrap-section.probootstrap-bg:before {
    position: absolute;
    content: "";
    background: rgba(255, 255, 255, 0.6);
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: -1;
}
.colorCyan{
color:#2fb1bd !important;
}
.btn.btn-primary {
    border: 2px solid #2fb1bd;
    background: #2fb1bd;
    color: #fff;
}
.btn.btn-primary:hover {
	border: 2px solid #1fffff;
    background: #1fffff;
    color: #fff;
}
.probootstrap-footer.probootstrap-bg {
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    padding: 2em 0;
    position: relative;
    color: rgba(255,255,255,.9);
}
#marginChg { 
	padding-bottom: 10px; 
	margin-top: 340px; 
	background: none;
	-webkit-box-shadow: none;
	box-shadow: none;
}
#btnColor { background: #fa2848; }
body{
color:#000;
}
.fontSize{
font-size:18px;
}

</style>  
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="resources/mainTemplate/js/scripts.min.js"></script>
<script src="resources/mainTemplate/js/main.min.js"></script>
<script src="resources/mainTemplate/js/custom.js"></script>

</head>
<body>
<!-- START: header -->
<%@include file="../../../nav.jsp" %>
<!-- END: header --><body>
<div class = "container">
	<div class="wrapper">
		<form action="createContent.gt" method="post" class="form-signin">       
		    <h2 class="form-signin-heading" style="margin-top:120px;">공지사항 글 등록</h2>
			  <hr class="colorgraph"><br>
			  <script>
			  window.onload = function () {
				  var today = new Date();
				  var dd = today.getDate();
				  var mm = today.getMonth()+1; //January is 0!
				  var yyyy = today.getFullYear();
				  if(dd<10) {dd='0'+dd} 
				  if(mm<10) {mm='0'+mm} 
				  today = yyyy + '년 ' + mm+'월 '+dd+'일';
				  document.getElementById('sysdate').value = today;
			  }
			  </script>
			  
			  <span class="fontSize">제목</span>
			  <input type="text" class="form-control" name="not_title" placeholder="제목을 입력하세요" required autofocus="" /><br>
			  <span class="fontSize">작성일</span>
			  <input type="text" id="sysdate" name="not_date" class="form-control" readOnly/><br>	
			  <span class="fontSize">내용</span>
			  <textarea type="text" class="form-control" name="not_content" placeholder="본문입력" required style="height:350px;"></textarea><br>		  
			  <input type="hidden" name="not_writer" value="관리자"/>
			  <button class="btn btn-lg btn-primary btn-block"  name="Submit" type="Submit" style="font-size:20px;">글 등록</button><br>			
		</form>			
	</div>
</div>
</body>
</html>