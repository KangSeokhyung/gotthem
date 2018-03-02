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
<script type="text/javascript">
	function relatedSearch() {
		$("#releatedField").html("");
		var search = $("#search").val();
		if(search != ""){
			$.ajax({
				url : "relatedSearch.gt",
				data : { "search" : search, "pageNo" : 1 },
				type : "post",
				success : function(relatedData) {
					var ob = JSON.parse(relatedData);
					var innerHtml = "";
					for (var i = 0; i < 5; i++) {
						if (typeof(ob["search" + i]) != "undefined") {
							innerHtml += "<a href='searchList.gt?search=" + ob["search" + i] + "&pageNo=1'>" + ob["search" + i] + "</a> <br>";
						}
					}
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
	<header>
		<%@include file="../../../nav.jsp"%>
	</header>
	<section class="hero bg-overlay" id="hero"
		data-bg="resources/mainTemplate/img/hero.jpg">
		<div class="text">
			<h1>지도 API 자리</h1>
		</div>
	</section>
	
	<section class="padding bg-grey">
		<div class="form-holder">
			<form id="newsletterForm" action="searchList.gt" method="get">
				<div class="form-group">
					<input type="text" name="search" id="search"
						onkeyup="relatedSearch()"
						placeholder="원하는 지역명 혹은 상품명을 검색해보세요 (ex. 강남역 김밥)">
					<button type="submit"
					class="btn btn-primary btn-gradient submit">검색</button>
					<div id="releatedField" style="border: 1px solid #ddd">
					</div>
					
				</div>
			</form>
		</div>
	</section>
	
	<section class="padding bg-grey" id="blog">
		<div class="container">
			<h6><strong>${search }</strong> 검색결과</h6>
			<div class="section-body">
				<table class="table table-bordered table-hover">
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
							<th><a href="storeDetail.gt?mem_no=${list.mem_no }"><img src="${list.pro_img}" title="매장이미지" alt="매장이미지"></a></th>
							<td><a href="storeDetail.gt?mem_no=${list.mem_no }">${list.sto_name }</a></td>
							<td>${list.pro_name }</td>
							<td>${list.mem_address }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="paging">
					<c:if test="${totalPages ne 0}">
					<ul class="pagination">
						<c:choose>
							<c:when test="${prevPage ne 0}">
								<li class="page-item"><a class="page-link" 
									href="searchList.gt?search=${search }&pageNo=${prevPage }">Prev</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link">Prev</a></li>
							</c:otherwise>
						</c:choose>
							<c:forEach begin="${beginPage }" end="${endPage }" step="1" varStatus="status">
								<c:choose>
									<c:when test="${nowPage eq status.index }">
										<li class="page-item active"><a class="page-link" 
											href="searchList.gt?search=${search }&pageNo=${status.index }">${status.index }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" 
											href="searchList.gt?search=${search }&pageNo=${status.index }">${status.index }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						<c:choose>
							<c:when test="${nextPage ne 0 }">
								<li class="page-item"><a class="page-link" 
									href="searchList.gt?search=${search }&pageNo=${nextPage }">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					</c:if>
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