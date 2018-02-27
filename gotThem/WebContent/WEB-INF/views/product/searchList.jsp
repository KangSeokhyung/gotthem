<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>I'm Stisla</title>
<link rel="stylesheet"
	href="resources/mainTemplate/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="resources/mainTemplate/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/mainTemplate/sweetalert/dist/sweetalert.css">
<link rel="stylesheet" href="resources/mainTemplate/css/stisla.css">
<style>
section{
background-size : cover;
table { border: 1px solid #ddd; width: 100%; }
}
</style>
</head>
<body>
	<header>
		<%@include file="../../../nav.jsp"%>
	</header>
	<section class="hero bg-overlay" id="hero"
		data-bg="resources/mainTemplate/img/hero.jpg">
		<div class="text">
			<h1>지도 API</h1>
			
		</div>
	</section>

	<section class="padding bg-grey" id="blog">
		<div class="container">
			<h2 class="section-title">RECENTLY UPDATED STORE LIST</h2>
			<div class="section-body">
				<div class="row col-spacing">
					<h2>편의점 리스트</h2>
					<table>
						<colgroup>
							<col width="25%" />
							<col width="25%" />
							<col width="20%" />
							<col width="30%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">매장이미지</th>
								<th scope="col">매장이름</th>
								<th scope="col">상품명</th>
								<th scope="col">매장주소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${searchList }">
							<tr>
								<th><a href="storeDetail.gt?mem_no=${list.mem_no }"><img src="${list.pro_img}"></a></th>
								<td><a href="storeDetail.gt?mem_no=${list.mem_no }">${list.sto_name }</a></td>
								<td>${list.pro_name }</td>
								<td>${list.mem_address }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<div class="container">
			<figure>
				<img src="resources/mainTemplate/img/logo.png" alt="Logo">
			</figure>
			<p>Copyright &copy; 2018 스탑없으</p>
			<p>
				Made with <i class="ion-heart"></i> By Kodinger
			</p>
		</div>
	</footer>
	<script src="resources/mainTemplate/js/jquery.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/mainTemplate/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/mainTemplate/js/jquery.easeScroll.js"></script>
	<script src="resources/mainTemplate/sweetalert/dist/sweetalert.min.js"></script>
	<script src="resources/mainTemplate/js/stisla.js"></script>
</body>
</html>