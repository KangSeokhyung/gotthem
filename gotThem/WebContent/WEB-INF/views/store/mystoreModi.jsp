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
<link rel="stylesheet" href="resources/landy/css/style.default.css"
	id="theme-stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
body{
font-size:16px !important;
font-family:나눔스퀘어라운드 !important;
}
.btn{
font-size:16px !important;
font-family:나눔스퀘어라운드 !important;
}
.btn-primary {
	border-radius: 4px;
	margin: 1px;
	padding: 0.6rem 1rem;
}

label {
	margin-bottom: 0px;
}
.pb-5{padding-top:20px;}
#comment{width:500px;}
.form-comment {
	display: block;
	width: 253px;
	height: 100px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

@media ( max-width : 640px ) {
	#myInfo, #myInfo thead, #myInfo tbody, #myInfo tr, #myInfo th, #myInfo td
		{
		display: block;
	}
	#myInfo tr {
		border: 1.5px solid #E0F8F1;
	}
	#myInfo th {
		background-color: #E0F8F1
	}
	#myInfo th, #myInfo td {
		border-top: none;
		border-bottom: none;
	}
	#img {
		padding: 0px
	}
	.pb-5 {
		padding-top: 7%;
	}
	#comment{width:253px;}
}

.form-control {
	width: 253px;
	height: 34px;
}

.fileBox .fileName {
	display: inline-block;
	width: 172px;
	height: 30px;
	padding-left: 10px;
	margin-right: 5px;
	line-height: 1.42857143;
	border: 1px solid #ccc;
	background-color: #fff;
	vertical-align: middle;
	border-radius: 4px;
}

.fileBox .btn_file {
	background: #1FAD9F;
	color: #fff;
	border-radius: 4px;
	display: inline-block;
	width: 100px;
	height: 30px;
	font-size: 0.8em;
	line-height: 30px;
	text-align: center;
	vertical-align: middle;
	margin-top: 2px;
}

.fileBox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0
}

.fileBox .btn_file:hover {
	color: #fff;
	background-color: #178277;
}
</style>
<script type="text/javascript">
	$(document).ready(
		function() {
			var uploadFile = $('.fileBox .uploadBtn');
			uploadFile.on('change', function() {
				if (window.FileReader) {
					var filename = $(this)[0].files[0].name;
				} else {
					var filename = $(this).val().split('/').pop().split('\\').pop();
				}
				$(this).siblings('.fileName').val(filename);
			});
			
		var str = $('#prev_comment').val();
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$('#sto_comment').val(str);
			
		var str = $('#prev_comment').val();
		str = str.split('<br/>').join("\r\n");
		$('#prev_comment').val(str);	
		
		$("#prev_comment").keyup(function(){
			var str = $('#prev_comment').val();
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			$('#sto_comment').val(str);
		});
	});
	
</script>
</head>
<body>

	<header>
		<%@include file="nav.jsp"%>
	</header>


	<main role="main" class="probootstrap-main js-probootstrap-main">
	<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<c:set var="sessionCheck"
				value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
			<c:choose>
				<c:when test="${sessionCheck eq null}">
					<a href="login.st">GOT THEM</a>
				</c:when>
				<c:otherwise>
					<a href="stock.st?pageNo=1" class="mb-2 d-block probootstrap-logo">GOTTHEM</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


	<!--Main content code to be written here -->

	<div class="cover-container pb-5">
		<div class="cover-inner container">
		<h2 align="center">매장정보수정</h2>
			<form action="storeModi.st" method="POST"
				enctype="multipart/form-data">
				<input type="hidden" name="mem_name" value="${memberInfo.mem_name }" />
				<input type="hidden" name="mem_id" value="${memberInfo.mem_id}" />
				<input type="hidden" name="sto_img" value="${memberInfo.sto_img}" />
				<table id="myInfo" class="table">
					<tr>
						<th nowrap>아이디</th>
						<td>${memberInfo.mem_id }</td>
					</tr>
					<tr>
						<th nowrap>이름</th>
						<td>${memberInfo.mem_name }</td>
					</tr>
					<tr>
						<th nowrap>매장명</th>
						<td><input type="text" class="form-control" name="sto_name"
							value="${memberInfo.sto_name}" required="" maxlength="20" /></td>
					</tr>
					<tr>
						<th nowrap>이메일</th>
						<td><input type="text" class="form-control" name="mem_email"
							value="${memberInfo.mem_email}" required="" maxlength="20" /></td>
					</tr>
					<tr>
						<th nowrap>전화번호</th>
						<td><input type="text" class="form-control" name="mem_phone"
							value="${memberInfo.mem_phone}" required="" maxlength="12" /></td>
					</tr>
					<tr>
						<th nowrap>우편번호</th>
						<td><input type="text" class="form-control" name="mem_post"
							value="${mem_post}" required="" maxlength="5" /></td>
					</tr>
					<tr>
						<th nowrap>주소</th>
						<td><input type="text" class="form-control"
							name="mem_address1" value="${mem_address1}" required=""
							maxlength="50" /><br> <input type="text"
							class="form-control" name="mem_address2" value="${mem_address2}"
							required="" maxlength="50" /></td>
					</tr>
					<tr>
						<th nowrap>매장사진</th>
						<td><div class="fileBox">
								<input type="text" class="fileName" readonly="readonly">
								<label for="uploadBtn" class="btn_file">찾아보기</label> <input
									type="file" name="file" id="uploadBtn" class="uploadBtn">
							</div></td>
					</tr>
					<tr>
						<th nowrap>코멘트</th>
						<td><textarea class="form-comment" name="sto_comment" id="comment"
								style="height: 160px; resize: none; overflow: visible; text-overflow: ellipsis;"
								required="" maxlength="2000">${memberInfo.sto_comment }</textarea></td>
					</tr>
					<tr>
						<td nowrap colspan="2" align="right"><button
								class="btn btn-primary" type="submit">완료</button>
							<button class="btn btn-primary" onclick="history.go(-1)">취소</button></td>
					</tr>
				</table>

			</form>
		</div>
	</div>




	<div class="container-fluid d-md-none">
		<div class="row">
			<div class="col-md-12">
				<ul class="list-unstyled d-flex probootstrap-aside-social">
					<li><a href="#" class="p-2"><span class="icon-twitter"></span></a></li>
					<li><a href="#" class="p-2"><span class="icon-instagram"></span></a></li>
					<li><a href="#" class="p-2"><span class="icon-dribbble"></span></a></li>
				</ul>
				<p>
					&copy; 2017 <a href="https://uicookies.com/" target="_blank">uiCookies:Aside</a>.
					<br> All Rights Reserved. Designed by <a
						href="https://uicookies.com/" target="_blank">uicookies.com</a>
				</p>
			</div>
		</div>
	</div>

	</main>

	<script src="resources/indexTemplate/js/jquery-3.2.1.slim.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/indexTemplate/js/bootstrap.min.js"></script>
	<script src="resources/indexTemplate/js/owl.carousel.min.js"></script>
	<script src="resources/indexTemplate/js/jquery.waypoints.min.js"></script>
	<script src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script>
	<script src="resources/indexTemplate/js/main.js"></script>
</body>
</html>