<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<%@include file="../store/nav.jsp"%>
	</aside>
	<main role="main" class="probootstrap-main js-probootstrap-main">
	<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="index.html">Aside</a></a>
		</div>
	</div>
	<br><br>
	<h2>점포별 결제 목록</h2>
	<form action="./storeOrderListTime.st"><br>
		<div>
			<label for="fromDate">기간:</label>&nbsp;&nbsp; <input type="date"
				id="fromDate" name="from" required="" /> <label for="toDate">~</label>
			<input type="date" id="toDate" name="to" required="" />&nbsp;&nbsp;
			<input type="submit" value="조회" /><strong>&nbsp;&nbsp;&nbsp;총 결제 금액:&nbsp; <span id="chkSum"></span>
			</strong>
		</div>
	</form>
	<div class="cover-container pb-5">
		<div class="cover-inner container">
			<table class="table table-user-information" id="mytable">
				<tr>
					<th>결제 번호</th>
					<th>결제 시간</th>
					<th>상품코드</th>
					<th>상품사진</th>
					<th>상품명</th>
					<th>매장명</th>
					<th>상품수량</th>
					<th>상품가격</th>
					<th>결제 가격</th>
					<th>상태</th>
					<th>결제취소</th>
				</tr>
				<c:forEach var="row" items="${map.list}" varStatus="i">
					<tr>
						<td>${row.ord_no}</td>
						<td>${row.ord_findtime}</td>
						<td>${row.ord_procode}</td>
						<td><img src="/img/${row.ord_proimg}"
							style="width: 50px; height: 50px" /></td>
						<td>${row.ord_proname}</td>
						<td>${row.pro_memno}</td>
						<td>${row.ord_stock}</td>
						<td><fmt:formatNumber pattern="###,###,###"
								value="${row.ord_proprice}" /></td>
						<td><fmt:formatNumber pattern="###,###,###"
								value="${row.ord_price}" /> <input type="hidden" name="sum"
							value="${row.ord_price}"></td>
						<td>${row.ord_status}</td>
						<td><input type="button" value="삭제"
							onclick="button_delete('${row.ord_no}','${row.ord_stock}','${row.ord_procode}');">
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
	<script type="text/javascript">
		$(document).ready(function() {
			var checkSumArr = [];
			$("input[name='sum']").each(function(i) {
				checkSumArr.push($(this).val());
			});
			var sum = 0;
			for (var i = 0; i < checkSumArr.length; i++) {
				var cartSum = checkSumArr[i];
				cartSum = parseInt(cartSum);
				sum += cartSum;
				document.getElementById("chkSum").innerHTML = sum;
			}
		});
		jQuery(function($) {
			$('#fromDate').on('change', function() {
				$('#toDate').prop('min', $(this).val());
			});
			$('#toDate').on('change', function() {
				$('#fromDate').prop('max', $(this).val());
			});
		});
	</script>  <script src="resources/indexTemplate/js/jquery-3.2.1.slim.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script> <script
		src="resources/indexTemplate/js/bootstrap.min.js"></script> <script
		src="resources/indexTemplate/js/owl.carousel.min.js"></script> <script
		src="resources/indexTemplate/js/jquery.waypoints.min.js"></script> <script
		src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script> <script
		src="resources/indexTemplate/js/main.js"></script>
</body>
</html>