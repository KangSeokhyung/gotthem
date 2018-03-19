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
		<%@include file="../store/nav.jsp"%>
	</header>


	<main role="main" class="probootstrap-main js-probootstrap-main">
	<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="storeIndex.st">GOT THEM</a>
		</div>
	</div>



	<div class="cover-container pb-5">
		<div class="cover-inner container">
			<table class="table table-user-information">
				<tr>
					<th>번호</th>
					<th>사진</th>
					<th>상품명</th>
					<th>분류</th>
					<th>가격</th>
					<th>재고</th>
				</tr>
				<c:forEach var="dto" items="${plist }">

					<tr>
						<td>${dto.pro_code }</td>
						<td><img src="/img/${dto.pro_img }"
							style="width: 50px; height: 50px; cursor: pointer"
							onclick="location='detail.st?pageNo=${pageNo}&code=${dto.pro_code }'" /></td>
						<td><a
							href="detail.st?pageNo=${pageNo}&code=${dto.pro_code }">${dto.pro_name }</a></td>
						<td>${dto.pro_category }</td>
						<td>${dto.pro_price }</td>
						<td>${dto.pro_stock }</td>
					</tr>
				</c:forEach>
			</table>
			<div id="paging" align="center">
				<c:if test="${totalPages ne 0}">
					<ul class="pagination pagination-danger">
						<c:choose>
							<c:when test="${prevPage ne 0}">
								<li class="page-item"><a class="page-link"
									href="stock.st?pageNo=${prevPage }">&laquo;</a></li>
							</c:when>
						</c:choose>
						<c:forEach begin="${beginPage }" end="${endPage }" step="1"
							varStatus="status">
							<c:choose>
								<c:when test="${nowPage eq status.index }">
									<li class="page-item active"><a class="page-link"
										href="stock.st?pageNo=${status.index }">${status.index }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="stock.st?pageNo=${status.index }">${status.index }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${nextPage ne 0 }">
								<li class="page-item"><a class="page-link"
									href="stock.st?pageNo=${nextPage }">&raquo;</a></li>
							</c:when>
						</c:choose>
					</ul>
				</c:if>
			</div>
			<div align="right">
				<input type="button" value="상품추가" onclick="location='insert.st?pageNo=${pageNo}'"/>
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