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
<style>
.btn-primary{
border-radius:4px;
margin:1px;
padding: 0.6rem 1rem;
}
td .img{padding:0px;}

.form-control {
	width: 253px;
	height: 34px;
	display:inline;
}

.container{
padding-top:50px;
padding-bottom:20px;
padding-left:0;
margin-left:180px;
}

@media all and (max-width:767px){
.container{
padding-top:20px;
padding-bottom:20px;
padding-left:0;
margin-left:0px;
}

.table-user-information .no {display:none}
.table-user-information .img {display:none}
.table-user-information .fidetime {display:none}
td .img{weight:10%}
td .name{weight:70%}
td .stock{weight:20%}
}

.datePick{display:none;}
}
</style>
<body>
	<aside>
		<%@include file="../store/nav.jsp"%>
	</aside>
	<main role="main" class="probootstrap-main js-probootstrap-main">
	<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="index.html">GOT THEM</a></a>
		</div>
	</div>
	<br><br>
	<div class="cover-container pb-5">
		<div class="cover-inner container">
	<form action="./storeOrderListTime.st"><br>
		<div>
			<label for="fromDate"><span class="datePick">기간: &nbsp;&nbsp; </span></label><input type="date"
				id="fromDate" name="from" class="form-control" required="" /> <label for="toDate"><span class="datePick">~</span></label>
			<input type="date" id="toDate" class="form-control" name="to" required="" max=""/>&nbsp;&nbsp;
			<input type="submit" class="btn btn-primary" value="조회" /><strong>&nbsp;&nbsp;&nbsp;총 결제 금액:&nbsp; <span id="chkSum"></span>
			</strong>
		</div>
	</form>
			<table class="table table-user-information" id="mytable">
				<tr>
					<th class="no" scope="col">no.</th>
					<th class="img" scope="col">사진</th>
					<th class="name" scope="col">상품명</th>
					<th class="stock" scope="col">수량</th>
					<th class="price" scope="col">가격</th>
					<th class="status" scope="col">상태</th>
					<th class="findtime" scope="col">결제 시간</th>
					<th class="info" scope="col">고객정보</th>
					<th class="delete" scope="col">결제취소</th>
				</tr>
				<c:forEach var="row" items="${map.list}" varStatus="i">
					<tr>
						<td class="no">${row.ord_no}</td>
						<td class="img"><img src="/img/${row.ord_proimg}"
							style="width: 50px; height: 50px" /></td>
						<td class="name">${row.ord_proname}</td>
						<td class="stock">${row.ord_stock}</td>
						<td class="price"><fmt:formatNumber pattern="###,###,###"
								value="${row.ord_price}" /> <input type="hidden" name="sum"
							value="${row.ord_price}"></td>
						<td class="status">${row.ord_status}</td>
						<td class="findtime">${row.ord_findtime}</td>
						<td class="info"><input type="button" value="상세" class="btn btn-primary"
							onclick="button_detail('${row.ord_no}','${row.ord_stock}','${row.ord_procode}');">
						</td>
						<td class="delete"><input type="button" value="취소" class="btn btn-primary"
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
	<script src="resources/indexTemplate/js/jquery-3.2.1.slim.min.js"></script>
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
				var str = sum;
		     	var bb = Number(str).toLocaleString('en').split(".")[0];	
				document.getElementById("chkSum").innerHTML = bb;
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
		document.getElementById('toDate').valueAsDate = new Date();
		</script> 
	<script src="resources/indexTemplate/js/popper.min.js"></script> <script
		src="resources/indexTemplate/js/bootstrap.min.js"></script> <script
		src="resources/indexTemplate/js/owl.carousel.min.js"></script> <script
		src="resources/indexTemplate/js/jquery.waypoints.min.js"></script> <script
		src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script> <script
		src="resources/indexTemplate/js/main.js"></script>
</body>
</html>