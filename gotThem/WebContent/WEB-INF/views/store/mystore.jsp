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
<style>
body{
font-size:18px !important;
font-family:나눔스퀘어라운드 !important;
}
.btn{
font-size:16px !important;
font-family:나눔스퀘어라운드 !important;
}
.btn-primary{
border-radius:4px;
margin:1px;
padding: 0.6rem 1rem;
}

td{font-weight: bold;}

@media( max-width: 640px ) {
	#myInfo,
	#myInfo thead,
	#myInfo tbody,
	#myInfo tr,
	#myInfo th,
	#myInfo td {
		display: block;
	}

	#myInfo tr {
		border: 1.5px solid #E0F8F1;
	}
	#myInfo th{background-color:#E0F8F1}
	#myInfo th,
	#myInfo td {
		border-top: none;
		border-bottom: none;
	}
	
	#img{padding:0px}
	.pb-5{
	padding-top:7%;
	}
}
</style>
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




<div class="cover-container pb-5">
<div class="cover-inner container">
<input type="hidden" name="mem_no" value="${info.mem_no }"/> 
<table id="myInfo" class="table">
	<tr>
		<th nowrap>아이디</th>
		<td>${info.mem_id }</td>
	</tr>
	<tr>
		<th nowrap>이름</th>
		<td>${info.mem_name }</td>
	</tr>
	<tr>
		<th nowrap>매장명</th>
		<td>${info.sto_name }</td>
	</tr>
	<tr>
		<th nowrap>이메일</th>
		<td>${info.mem_email }</td>
	</tr>
	<tr>
		<th nowrap>전화번호</th>
		<td>${info.mem_phone }</td>
	</tr>
	<tr>
		<th nowrap>우편번호</th>
		<td>${mem_post }</td>
	</tr>
	<tr>
		<th nowrap>주소</th>
		<td>${mem_address1}</td>
	</tr>
	<tr>
		<th nowrap>상세주소</th>
		<td>${mem_address2}</td>
	</tr>
	<tr>
		<th nowrap>사진</th>
		<td id="img"><div style="width:260px;height:auto;">
		<img src="/img/store/${info.sto_img }" style="width:270px;height:auto"/></div></td>
	</tr>
	<tr>
		<th nowrap>매장소개</th>
		<td>${info.sto_comment }</td>
	</tr>
	<tr>
		<td nowrap colspan="2" align="right">
		<input type="button" value="정보수정" onclick="location='mystoreModi.st'"
		 class="btn btn-primary"/>
		<input type="button" value="제휴해지" onclick="location='mystoreDel.st'"
		 class="btn btn-primary"/>
		</td>
	</tr>
</table>
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