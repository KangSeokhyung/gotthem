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
<style>
.btn-primary{
border-radius:4px;
margin:1px;
padding: 0.6rem 1rem;
}
td .img{padding:0px;}

.form-control {
	width: 240px;
	height: 34px;
	display:inline;
}

.container{
padding-top:50px;
padding-bottom:20px;
padding-left:0;
margin-left:180px;
}

table th, td {
  text-align: center;
  vertical-align: middle;
}



@media all and (max-width:767px){
table, tr, td {
    display: block;
    font-size:16px;
}

td:first-child {
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
    width: 100px;
  }
  td:not(:first-child) {
    clear: both;
    padding: 4px 20px 4px 90px;
    position: relative;
    text-align: left;
  }
  td:not(:first-child):before {
    content: '';
    display: block;
    left: 0;
    position: absolute;
  }
  td:nth-child(2):before {
    content: '사진:';
  }
  td:nth-child(3):before {
    content: '상품명:';
  }
  td:nth-child(4):before {
    content: '수량:';
  }
  td:nth-child(5):before {
    content: '가격:';
  }
  td:nth-child(6):before {
    content: '상태:';
  }
  td:nth-child(7):before {
    content: '결제시간:';
  }
  td:nth-child(8):before {
    content: '고객정보:';
  }
  td:nth-child(9):before {
    content: '결제취소:';
  }

  tr {
    padding: 10px 0;
    position: relative;
  }
  tr:first-child {
    display: none;
  }
  
.container{
padding-top:20px;
padding-bottom:20px;
padding-left:0;
margin-left:0px;
}

.datePick{display:none;}
.pickedDate{display:none;}
}
</style>
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
			<a href="index.html">GOT THEM</a>
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
			<input type="submit" class="btn btn-primary" value="조회" /><span class="pickedDate">&nbsp;<strong>${map.begin}&nbsp;~&nbsp;${map.end}&nbsp;&nbsp;&nbsp;총 결제 금액:&nbsp; <span id="chkSum"></span>
			</strong></span>
		</div>
	</form>
			<table class="table table-user-information" id="mytable">
				<tr>
					<th class="no">no.</th>
					<th class="img">사진</th>
					<th class="name">상품명</th>
					<th class="stock">수량</th>
					<th class="price">가격</th>
					<th class="status">상태</th>
					<th class="findtime">결제 시간</th>
					<th class="info">고객정보</th>
					<th class="delete">결제취소</th>
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
	</script> 
	<script src="resources/indexTemplate/js/popper.min.js"></script> <script
		src="resources/indexTemplate/js/bootstrap.min.js"></script> <script
		src="resources/indexTemplate/js/owl.carousel.min.js"></script> <script
		src="resources/indexTemplate/js/jquery.waypoints.min.js"></script> <script
		src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script> <script
		src="resources/indexTemplate/js/main.js"></script>
</body>
</html>