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
<script type="text/javascript">
	function relatedSearch() {
		$("#releatedField").html("");
		var search = $("#search").val();
		if(search != ""){
			$.ajax({
				url : "stock.st",
				data : { "pro_memno" : pro_memno},
				type : "post",
				success : function(relatedData) {
					var ob = JSON.parse(relatedData);
					var innerHtml = "<div class='list-group'>";
					for (var i = 0; i < 5; i++) {
						if (typeof(ob["search" + i]) != "undefined") {
							innerHtml += "<a href='stock.st?search=" +  ob["search" + i] 
									  + "&pageNo=1' class='list-group-item list-group-item-action'>" 
									  +  ob["search" + i] + "</a>";
						}
					}
					innerHtml += "</div>"
					$("#releatedField").append(innerHtml);
				},
				error : function(xmlHttpReq, status, error) {
					alert(xmlHttpReq + "리퀘스트\n" + status + "상태\n" + error + "에러\n");
				}
			});
		}
	}
</script>
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
						data-animate-effect="fadeInLeft"><a href="storeIndex.st">Got them?</a></li>
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
		</div>
	</aside>


	<main role="main" class="probootstrap-main js-probootstrap-main">
		<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="storeIndex.st">GOT THEM</a></a>
		</div>
	</div>
 

	
<section class="probootstrap-section">	
<div class="cover-container pb-5">
				<div class="cover-inner container">
					<table class="table table-user-information">
						<tr>
							<th>번호</th>
							<td>사진</td>
							<th>상품명</th>
							<th>분류</th>
							<th>가격</th>
							<th>재고</th>
						</tr>
						<c:forEach var="dto" items="${plist }">
						
						<tr>
							<td>${dto.pro_code }</td>
							<td><img src="/img/${dto.pro_img }" style="width:50px; height:50px; cursor:pointer"
							onclick="location='detail.st?pageNo=${pageNo}&code=${dto.pro_code }'"/></td>
							<td><a href="detail.st?pageNo=${pageNo}&code=${dto.pro_code }">${dto.pro_name }</a></td>
							<td>${dto.pro_category }</td>
							<td>${dto.pro_price }</td>
							<td>${dto.pro_stock }</td>
						</tr>
						</c:forEach>
						<tr>
							<td colspan="12" align="right">
							<input type="button" value="상품추가" onclick="location='insert.st?pageNo=${pageNo}'"/>
							</td>
						</tr>
					</table>
					<div id="paging">
						<c:if test="${totalPages ne 0}">
						<ul class="pagination pagination-danger">
							<c:choose>
								<c:when test="${prevPage ne 0}">
									<li class="page-item"><a class="page-link" 
										href="stock.st?pageNo=${prevPage }">&laquo;</a></li>
								</c:when>
							</c:choose>
								<c:forEach begin="${beginPage }" end="${endPage }" step="1" varStatus="status">
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
				</div>
      		</div>	
</section>      		
      		
      		
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