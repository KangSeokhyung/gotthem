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
			<a href="index.html">GOT THEM</a>
		</div>
	</div>


	<!--Main content code to be written here -->

	<div class="cover-container pb-5">
		<div class="cover-inner container">
			<div class="row">
				<div class=" col-md-12 col-lg-12 " align="center">
					<form action="storeModi.st" method="POST"
						enctype="multipart/form-data">

						<input type="hidden" name="mem_id" value="${memberInfo.mem_id}" />
						<input type="hidden" name="sto_img" value="${memberInfo.sto_img}" />
						<table class="table table-user-information">
							<tr>
								<td><span>회원 아이디:</span></td>
								<td>${memberInfo.mem_id}</td>
							</tr>
							<tr>
								<td><span>이름:</span></td>
								<td><input style="width: 100%" type="text" name="mem_name"
									value="${memberInfo.mem_name}" required="" maxlength="20"/></td>
							</tr>
							<tr>
								<td><span>매장명:</span></td>
								<td><input style="width: 100%" type="text" name="sto_name"
									value="${memberInfo.sto_name}" required="" maxlength="20"/></td>
							</tr>
							<tr>
								<td><span>이메일:</span></td>
								<td><input style="width: 100%" type="text" name="mem_email"
									value="${memberInfo.mem_email}" required="" maxlength="20"/></td>

							</tr>
							<tr>
								<td><span>전화번호:</span></td>
								<td><input style="width: 100%" type="text" name="mem_phone"
									value="${memberInfo.mem_phone}" required="" maxlength="11"/></td>
							</tr>
							<tr>
								<td><span>우편번호:</span></td>
								<td><input style="width: 100%" type="text" name="mem_post"
									value="${mem_post}" required="" maxlength="5"/></td>
							</tr>
							<tr>
								<td><span>주소:</span></td>
								<td><input style="width: 100%" type="text"
									name="mem_address1" value="${mem_address1}" required="" maxlength="50"/><br> <input
									style="width: 100%" type="text" name="mem_address2"
									value="${mem_address2}" required="" maxlength="50"/></td>
							</tr>
							<tr>
								<td><span>매장사진:</span></td>
								<td><input type="file" name="file" value="${pro.pro_img }" /></td>
							</tr>
							<tr>
								<td><span>코멘트:</span></td>
								<td><input style="width: 100%" type="text"
									name="sto_comment" value="${memberInfo.sto_comment}" required="" maxlength="100"/></td>
							</tr>

						</table>


						<button class="button" type="submit">완료</button>
						<button class="button" onclick="reset()">취소</button>
						<button class="button" onclick="history.go(-1)">뒤로가기</button>

					</form>
				</div>
			</div>
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