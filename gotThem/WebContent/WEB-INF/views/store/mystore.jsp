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
<link href="https://fonts.googleapis.com/css?family=Work+Sans" rel="stylesheet">
<link rel="stylesheet" href="resources/indexTemplate/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/icomoon.css">
<link rel="stylesheet" href="resources/indexTemplate/css/animate.css">
<link rel="stylesheet" href="resources/indexTemplate/css/style.css">
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
			<a href="storeIndex.st">GOT THEM</a></a>
		</div>
	</div>
 

	<main role="main" class="probootstrap-main js-probootstrap-main">
		<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="index.html">Aside</a></a>
		</div>
	</div>
	
	
	<div class="cover-container pb-5">
		<div class="cover-inner container">
			<input type="hidden" name="mem_no" value="${info.mem_no }"/> 
			<table class="table table-user-information">
						<tr>
							<td>아이디</td><td>${info.mem_id }</td>
						</tr>
						<tr>
							<td>이름</td><td>${info.mem_name }</td>
						</tr>
						<tr>
							<td>매장명</td><td>${info.sto_name }</td>
						</tr>
						<tr>
							<td>이메일</td><td>${info.mem_email }</td>
						</tr>
						<tr>
							<td>전화번호</td><td>${info.mem_phone }</td>
						</tr>
						<tr>
							<td>우편번호</td><td>${mem_post }</td>
						</tr>
						<tr>
							<td>주소</td><td>${mem_address1 }</td>
						</tr>
						<tr>
							<td>상세주소</td><td>${mem_address2 }</td>
						</tr>
						<tr>
							<td>사진</td><td><img src="/img/${info.sto_img }" style="width:250px; height:250px"/></td>
						</tr>
						<tr>
							<td>매장소개</td><td>${info.sto_comment }</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="button" value="정보수정" onclick="location='mystoreModi.st'"/>
								<input type="button" value="제휴해지" onclick="fnDelete(${info.mem_no})" />
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