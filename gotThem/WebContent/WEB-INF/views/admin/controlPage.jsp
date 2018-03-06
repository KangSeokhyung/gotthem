<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<!--
	Dimension by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Dimension by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="resources/admintemplate/assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<noscript>
	<link rel="stylesheet"
		href="resources/admintemplate/assets/css/noscript.css" />
</noscript>
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="content">
				<div class="inner">
					<h1>관리자 모드에 진입하였습니다.</h1>
					<h3>원하는 관리 모드를 선택하세요</h3>
				</div>
			</div>
			<nav>
				<ul>
					<li><a href="#work">회원관리</a></li>
					<li><a href="#store">점포관리</a></li>
					<li><a href="#contact">게시판관리</a></li>
				</ul>
			</nav>

		</header>

		<!-- Main -->
		<div id="main">

			<!-- Work -->
			<article id="work" style="width:1200px;">
			 <section>
					<h3 class="major">회원관리</h3>
					<div class="table-wrapper">
						<table class="table">
							<thead>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>이메일</th>
									<th>전화번호</th>
									<th>주소</th>
									<th>가입일</th>
									<th>계정상태</th>
									<th>수정</th>
								</tr>
							<tbody>
								<c:forEach var="mlist" items="${requestScope.mlist}">
									<tr>
										<td>${mlist.mem_id}</td>
										<td>${mlist.mem_name}</td>
										<td>${mlist.mem_email}</td>
										<td>${mlist.mem_phone}</td>
										<td>${mlist.mem_address}</td>
										<td>${mlist.mem_regdate}</td>
										<td><c:choose>
												<c:when test="${mlist.enabled eq 0 }">
						가입</c:when>
												<c:when test="${mlist.enabled eq 1 }">
						탈퇴</c:when>
											</c:choose></td>
										<td><a href="memmodi()" onclick="window.open
										(this.href, '_blank', 'width=400,height=300,toolbars=no,scrollbars=no'); 
										return false;">수정</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</section>
			</article>


			<!-- Store -->
			<article id="store" style="width:1200px;">
				<section>
					<h3 class="major">점포관리</h3>
					<div class="table-wrapper">
						<table class="table">
							<thead>
								<tr>
									<th>점포아이디</th>
									<th>점주명</th>
									<th>점포명</th>
									<th>이메일</th>
									<th>전화번호</th>
									<th>주소</th>
									<th>가입일</th>
									<th>계정상태</th>
									<th>수정</th>
								</tr>
							<tbody>
								<c:forEach var="stlist" items="${requestScope.stlist}">
									<tr>
										<td>${stlist.mem_id}</td>
										<td>${stlist.mem_name}</td>
										<td>${stlist.sto_name }</td>
										<td>${stlist.mem_email}</td>
										<td>${stlist.mem_phone}</td>
										<td>${stlist.mem_address}</td>
										<td>${stlist.mem_regdate}</td>
										<td><c:choose>
												<c:when test="${stlist.enabled eq 0 }">
						승인대기</c:when>
												<c:when test="${stlist.enabled eq 1 }">
						승인완료</c:when>
											</c:choose></td>
										<td><button type="button" class="btn btn-primary edit"
												data-toggle="modal" data-target="#myModal1">수정</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</section>
			</article>

			<!-- Contact -->
			<article id="contact"></article>





		</div>

		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">
				&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.
			</p>
		</footer>

	</div>

	<!-- BG -->
	<div id="bg"></div>

	<!-- Scripts -->
	<script src="resources/admintemplate/assets/js/jquery.min.js"></script>
	<script src="resources/admintemplate/assets/js/skel.min.js"></script>
	<script src="resources/admintemplate/assets/js/util.js"></script>
	<script src="resources/admintemplate/assets/js/main.js"></script>
</body>
</html>
