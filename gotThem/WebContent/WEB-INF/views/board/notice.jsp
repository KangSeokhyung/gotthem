<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.setAttribute("basketFoward", "/gotThem/listBasket.gt");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>편의점 재고 검색 GOT THEM!</title>
<meta name="description" content="Free Bootstrap Theme by uicookies.com">
<meta name="keywords"
	content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400"
	rel="stylesheet">
<link rel="stylesheet"
	href="resources/mainTemplate/css/styles-merged.css">
<link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
<link rel="stylesheet" href="resources/mainTemplate/css/custom.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="resources/autocomplete/auto-complete.css">

</head>
<style type="text/css">
#releatedField {
	position: absolute;
	width: 63%;
}

#releatedField a {
	color: #66615b;
	text-decoration: none;
}

.buttonBackgroundColor {
	background-color: #fe490f;
}

.buttonBackgroundColor:hover {
	background-color: #ff990f;
	color: #fff;
}

.probootstrap-section.probootstrap-bg:before {
	position: absolute;
	content: "";
	background: rgba(255, 255, 255, 0.6);
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: -1;
}

.colorCyan {
	color: #2fb1bd !important;
}

.btn.btn-primary {
	border: 2px solid #2fb1bd;
	background: #2fb1bd;
	color: #fff;
}

.btn.btn-primary:hover {
	border: 2px solid #1fffff;
	background: #1fffff;
	color: #fff;
}

.probootstrap-footer.probootstrap-bg {
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	padding: 2em 0;
	position: relative;
	color: rgba(255, 255, 255, .9);
}

#marginChg {
	padding-bottom: 10px;
	margin-top: 340px;
	background: none;
	-webkit-box-shadow: none;
	box-shadow: none;
}

#btnColor {
	background: #fa2848;
}

body {
	color: #000;
}

.probootstrap-animated {
	-webkit-animation-duration: .1s;
	animation-duration: 1s;
	-webkit-animation-fill-mode: both;
	animation-fill-mode: both;
}

thead th {
	text-align: center;
	font-size: 20px;
}

tbody tr td {
	text-align: center;
}

.btn-magen {
	border-radius: 10px;
	background: #fa5858;
	color: #fff;
}

.btn-magen:hover {
	background: #fa2848;
	color: #fff;
}
/*** media query 420px ***/
@media all and (max-width:420px) {
	/* write table */
	.writeTable th.left {
		padding: 19px 0 19px 10px;
	}

	/* table wide */
	.thWide {
		display: none;
	}
	.cartImg {
		width: 1px;
	}
	.cartw28 {
		width: 25%;
	}
	.cartw29 {
		width: 25%;
	}
	.listType td.img {
		padding: 0;
		width: 0;
		line-height: 0;
		font-size: 0;
	}
	.listType td.img img {
		display: none;
	}

	/* table */
	.diTable th u {
		display: block;
	}
	.tw8 {
		width: 8%;
	}
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<body>
	<!-- START: header -->
	<%@include file="../../../nav.jsp"%>
	<!-- END: header -->

	<div class="container">
		<div class="probootstrap-loader"></div>
		<div class="table-responsive" style="margin-top: 120px;">
			<center>
				<h1 style="display: inline;">
					<b>공지사항</b>
				</h1>
			</center>
			<br>
			<c:set var="sessionCheck"
				value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.authorities}" />
			<c:choose>
				<c:when test="${sessionCheck eq '[ROLE_ADMIN]'}">
					<button style="float: right; margin-right: 25px;"
						class="btn btn-magen" onclick="createContent()">글쓰기</button>
				</c:when>
			</c:choose>
			<hr>
			<table class="table">
				<thead>
					<tr>
						<th class="col-md-2 ">글번호</th>
						<th class="col-md-5 ">제목</th>
						<th class="col-md-2 ">작성자</th>
						<th class="col-md-2 thWide">게시일</th>
						<th class="col-md-1 thWide">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mlist" items="${requestScope.mlist}">
						<tr class="textMiddle">
							<td class="col-md-2">${mlist.not_no}</td>
							<td class="col-md-5"><a
								href="contentDetail.gt?not_no=${mlist.not_no}">${mlist.not_title}</a></td>
							<td class="col-md-2">${mlist.not_writer}</td>
							<td class="col-md-2">${mlist.not_date}</td>
							<td class="col-md-1">${mlist.not_hit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="paging">
				<c:if test="${totalPages ne 0}">
					<ul class="pagination pagination-danger">
						<c:choose>
							<c:when test="${prevPage ne 0}">
								<li class="page-item"><a class="page-link"
									href="notice.gt?pageNo=${prevPage}">&laquo;</a></li>
							</c:when>
						</c:choose>
						<c:forEach begin="${beginPage}" end="${endPage }" step="1"
							varStatus="status">
							<c:choose>
								<c:when test="${nowPage eq status.index}">
									<li class="page-item active"><a class="page-link"
										href="notice.gt?pageNo=${status.index }">${status.index }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="notice.gt?pageNo=${status.index }">${status.index }</a></li>
								</c:otherwise>
							</c:choose>

						</c:forEach>
						<c:choose>

							<c:when test="${nextPage ne 0 }">
								<li class="page-item"><a class="page-link"
									href="searchList.gt?pageNo=${nextPage }">&raquo;</a></li>
							</c:when>
						</c:choose>

					</ul>
				</c:if>
				<center>
					<form style="height: 80px; word-break:kepp-all;">
						<select name="select"
							style="font-size: 16px; height: 35px; border-radius: 10px; border: 2px solid #fa2848">
							<option value="" selected="selected">선택</option>
							<option value="이름">게시일</option>
							<option value="전화번호">제목</option>
						</select> <input type="text"
							style="height: 35px; border-radius: 10px;width:150px; border: 2px solid #fa2848">
						<button type="submit" class="btn btn-magen" style="margin: 5px 0px;padding:0px;width:220px;height: 35px; font-size: 16px;">검색</button>
					</form>
				</center>
				<hr>
			</div>


		</div>
	</div>


	<!-- START: footer -->
	<%@include file="../../../footer.jsp"%>
	<!-- END: footer -->

	<script src="resources/mainTemplate/js/scripts.min.js"></script>
	<script src="resources/mainTemplate/js/main.min.js"></script>
	<script src="resources/mainTemplate/js/custom.js"></script>
	<script>
		function createContent() {
			location.href = "createContent.gt";
		}
	</script>
</body>

</html>

