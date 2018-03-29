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
.btn-primary{
border-radius:4px;
margin:1px;
padding: 0.6rem 1rem;
}

a {color: #e82424;}
.container{margin-left:170px;}

@media all and (max-width:767px){
.stocktable .no {display:none}
.stocktable .category {display:none}
.stocktable .price {display:none}
td .img{weight:10%}
td .name{weight:70%}
td .stock{weight:20%}
}

.pb-5{
padding-top:50px;
padding-bottom:20px;
padding-left:0;
}
</style>
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
			<table class="table stocktable">
				<tr>
					<th class="no" scope="col">번호</th>
					<th class="img" scope="col">사진</th>
					<th class="name" scope="col">상품명</th>
					<th class="category" scope="col">분류</th>
					<th class="price" scope="col">가격</th>
					<th class="stock" scope="col">재고</th>
				</tr>
				<c:forEach var="dto" items="${plist }">

					<tr>
						<td class="no">${dto.pro_code }</td>
						<td class="img" style="padding:.4rem"><img src="/img/${dto.pro_img }"
							style="width: 50px; height: 50px; cursor: pointer"
							onclick="location='detail.st?pageNo=${pageNo}&code=${dto.pro_code }'" /></td>
						<td class="name"><a
							href="detail.st?pageNo=${pageNo}&code=${dto.pro_code }">${dto.pro_name }</a></td>
						<td class="category">${dto.pro_category }</td>
						<td class="price">${dto.pro_price }</td>
						<td class="stock">${dto.pro_stock }&nbsp;&nbsp;</td>
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
				<input type="button" value="상품추가" class="btn btn-primary"
				 onclick="location='insert.st?pageNo=${pageNo}'"/>
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