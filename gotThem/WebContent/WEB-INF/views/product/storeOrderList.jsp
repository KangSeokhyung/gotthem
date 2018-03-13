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
<aside>
<%@include file="../store/storeIndex2.jsp" %>
</aside>
	<main role="main" class="probootstrap-main js-probootstrap-main">
	<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="storeIndex.st">GOT THEM</a></a>
		</div>
	</div>

<!-- 	<main role="main" class="probootstrap-main js-probootstrap-main">
	<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="index.html">Aside</a></a>
		</div>
	</div> -->
	<div class="cover-container pb-5">
		<div class="cover-inner container">
			<table class="table table-user-information">
				<tr>
					<th>결제 번호</th>
					<th>상품코드</th>
					<th>상품사진</th>
					<th>상품명</th>
					<th>매장명</th>
					<th>상품수량</th>
					<th>상품가격</th>
					<th>결제 가격</th>
					<th>상태</th>
					<th>결제취소</th>
					<th>합계</th>
				</tr>
				<c:forEach var="row" items="${map.list}" varStatus="i">
               <tr>
                  <td>
                        ${row.ord_no}
                  </td>
                  <td>
                        ${row.ord_procode}
                  </td>
                  <td>
                       <img src="/img/${row.ord_proimg}" style="width:50px; height:50px"/>
                  </td>
                  <td>
                        ${row.ord_proname}
                  </td>
                  <td>
                        ${row.pro_memno}
                  </td>
                  <td>
                        ${row.ord_stock}
                  </td>
                  <td>
                       <fmt:formatNumber pattern="###,###,###" value="${row.ord_proprice}"/>
                  </td>
                  <td>
                       <fmt:formatNumber pattern="###,###,###" value="${row.ord_price}"/>
                  </td>
                  <td>
                        ${row.ord_status}
                  </td>
                   <td>
                       <input type="button" value="삭제" onclick="button_delete('${row.ord_no}','${row.ord_stock}','${row.ord_procode}');">
                  </td>
                 </tr>
               </c:forEach>
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

	</main> <script src="resources/indexTemplate/js/jquery-3.2.1.slim.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script> <script
		src="resources/indexTemplate/js/bootstrap.min.js"></script> <script
		src="resources/indexTemplate/js/owl.carousel.min.js"></script> <script
		src="resources/indexTemplate/js/jquery.waypoints.min.js"></script> <script
		src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script> <script
		src="resources/indexTemplate/js/main.js"></script>
</body>
</html>