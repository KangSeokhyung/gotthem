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
<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/main.css">
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
<link rel="stylesheet" href="resources/landy/css/custom.css">
</head>
<body>

	<aside class="probootstrap-aside js-probootstrap-aside">
		<a href="#"
			class="probootstrap-close-menu js-probootstrap-close-menu d-md-none"><span
			class="oi oi-arrow-left"></span> Close</a>
		<div class="probootstrap-site-logo probootstrap-animate"
			data-animate-effect="fadeInLeft">

			<a href="storeIndex.st" class="mb-2 d-block probootstrap-logo">GOTTHEM</a>
			<p class="mb-0">
				제휴 사이트 
			</p>
		</div>
		<div class="probootstrap-overflow">
			<nav class="probootstrap-nav">
				<ul>
					<li class="probootstrap-animate"
						data-animate-effect="fadeInLeft"><a href="/storeIndex">Got them?</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="mystore.st">점포관리</a></li>
					<li class="probootstrap-animate active" data-animate-effect="fadeInLeft"><a
						href="stock.st">재고관리</a></li>
				<c:set var="sessionCheck"
					value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
				<c:choose>
					<c:when test="${sessionCheck eq null}">
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="login.st">로그인</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="join.st">제휴맺기</a></li>
					</c:when>
					<c:otherwise>
						<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a href="logout.st" class="nav-link">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="index.gt">고객 사이트</a></li>
			</ul>
			</nav>
			
			<footer class="probootstrap-aside-footer probootstrap-animate"
				data-animate-effect="fadeInLeft">
				<p>
					&copy; 2018 <a href="/gotThem" target="_blank">스탑없으 X Got Them</a>.
					<br> All Rights Reserved.
				</p>
			</footer>
		</div>
	</aside>


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
					<table class="table table-user-information">
						<tr>
							<th>번호</th>
							<td>사진</td>
							<th style="text-align: center;">상품명</th>
							<th>분류</th>
							<th>가격</th>
							<th>재고</th>
						</tr>
						<c:forEach var="dto" items="${plist }">
						
						<tr>
							<td>${dto.pro_code }</td>
							<td><img src="/img/${dto.pro_img }" style="width:50px; height:50px"
							onclick="location='detail.st?code=${dto.pro_code }'"/></td>
							<td><a href="detail.st?code=${dto.pro_code }">${dto.pro_name }</a></td>
							<td>${dto.pro_category }</td>
							<td>${dto.pro_price }</td>
							<td>${dto.pro_stock }</td>
						</tr>
						</c:forEach>
						<tr>
							<td colspan="12" align="right">
							<input type="button" value="상품추가" onclick="location='insert.st'"/>
							</td>
						</tr>
					</table>
					
					<%-- <div>
					${sessionScope.SPRING_SECURITY_CONTEXT}					
					</div> --%>
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