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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
function statusChange(ord_no, pageNo){
	var ord_no = ord_no;
	if(confirm("고객이 상품을 수령하였습니까?")==true){
		$.ajax({
			type:"POST",
			url:"statusChange.st",
			data:"ord_no="+ord_no+"&pageNo="+pageNo,

			success:function(data){
				if(data!=1){
					alert("처리되었습니다.");
					location.replace("storeOrderList.st?pageNo="+pageNo);
				}else{
					alert("처리에 문제가 발생했습니다.");
					
				}
			}
		});
	} else{
		location.history.go(0);
	}
    }
</script>
</head>
<style>
body {font-size: 16px;font-family:나눔스퀘어라운드 !important;}
.table td, .table th {
    padding: 5px;
    vertical-align: middle;
    border-top: 1px solid #e9ecef;
}
h2{font-weight:bold;}
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
padding-top:10px;
padding-bottom:10px;
padding-left:0;
margin-left:170px;
}

table th, td {
  text-align: center;
  vertical-align: middle;
}

@media all and (max-width:767px){
table, tr, td {
    display: block;
    font-size:16px;
    text-align: center;
	vertical-align: middle;
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
    content: '품명:';
  }
  td:nth-child(4):before {
    content: '수량:';
  }
  td:nth-child(5):before {
    content: '가격:';
  }
  td:nth-child(6):before {
    content: '결제시간:';
  }
  td:nth-child(7):before {
    content: '전화번호:';
  }
  td:nth-child(8):before {
    content: '상태:';
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
.no{display: none;}
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
	<br><br>
	<div class="cover-container pb-5">
		<div class="cover-inner container">
		<h2 align="center">점포재고관리</h2>
		<div class="search" style="text-align:right;">
		<form>
		<select name="select" style="font-size:16px; height:30px; border-radius: 4px;border:2px solid #44B3C2">
		    <option value="" selected="selected">선택</option>
		    <option value="전화번호" >전화번호</option>
		    <option value="미수령">미수령</option>
		    <option value="수령">수령</option>
		    <option value="품명">품명</option>
		</select>
		<input type="text" style="height:30px;border-radius: 4px; border:2px solid #44B3C2">
		<button type="submit" class="btn btn-primary" style="height:30px; padding-top:0px; padding-bottom:0px">검색</button>
		</form>
		</div>
			<table class="table table-user-information" id="mytable">
				<tr>
					<th class="no">번호</th>
					<th class="img">사진</th>
					<th class="name">품명</th>
					<th class="stock">수량</th>
					<th class="price">가격</th>
					<th class="findtime">결제 시간</th>
					<th class="info">전화번호</th>
					<th class="status">수령/미수령</th>
				</tr>
				<c:forEach var="row" items="${storeListOrder}" varStatus="i">
					<tr>
						<td class="no">${row.ord_no}</td>
						<td class="img"><img src="/img/${row.ord_proimg}" 
							style="width: 50px; height: 50px" /></td>
						<td class="name">${row.ord_proname}</td>
						<td class="stock">${row.ord_stock}개</td>
						<td class="price"><fmt:formatNumber pattern="###,###,###"
								value="${row.ord_price}" /><input type="hidden" name="sum"
							value="${row.ord_price}">원</td>
						<td class="findtime">${row.ord_findtime}</td>
						<td class="info">${mem_phone}</td>
						<c:choose>
							<c:when test="${row.ord_status == '미수령'}">
								<td class="status">
								<input type="button" onclick="statusChange(${row.ord_no}, ${pageNo})" 
								class="btn btn-primary" value="${row.ord_status}" /></td>
							</c:when>
							<c:otherwise>
								<td class="status"><strong>${row.ord_status}</strong></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
			<div id="paging" align="center">
				<c:if test="${totalPages ne 0}">
					<ul class="pagination pagination-danger">
						<c:choose>
							<c:when test="${prevPage ne 0}">
								<li class="page-item"><a class="page-link"
									href="storeOrderList.st?pageNo=${prevPage }">&laquo;</a></li>
							</c:when>
						</c:choose>
						<c:forEach begin="${beginPage }" end="${endPage }" step="1"
							varStatus="status">
							<c:choose>
								<c:when test="${nowPage eq status.index }">
									<li class="page-item active"><a class="page-link"
										href="storeOrderList.st?pageNo=${status.index }">${status.index }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="storeOrderList.st?pageNo=${status.index }">${status.index }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${nextPage ne 0 }">
								<li class="page-item"><a class="page-link"
									href="storeOrderList.st?pageNo=${nextPage }">&raquo;</a></li>
							</c:when>
						</c:choose>
					</ul>
				</c:if>
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
		</script> 
	<script src="resources/indexTemplate/js/popper.min.js"></script> <script
		src="resources/indexTemplate/js/bootstrap.min.js"></script> <script
		src="resources/indexTemplate/js/owl.carousel.min.js"></script> <script
		src="resources/indexTemplate/js/jquery.waypoints.min.js"></script> <script
		src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script> <script
		src="resources/indexTemplate/js/main.js"></script>
</body>
</html>