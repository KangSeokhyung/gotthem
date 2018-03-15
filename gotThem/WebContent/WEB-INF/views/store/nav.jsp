<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<aside class="probootstrap-aside js-probootstrap-aside">
		<a href="#"
			class="probootstrap-close-menu js-probootstrap-close-menu d-md-none"><span
			class="oi oi-arrow-left"></span> Close</a>
		<div class="probootstrap-site-logo probootstrap-animate"
			data-animate-effect="fadeInLeft">

			<a href="storeIndex.st" class="mb-2 d-block probootstrap-logo">GOTTHEM</a>
			<p class="mb-0">제휴 사이트</p>
		</div>
		<div class="probootstrap-overflow">
			<nav class="probootstrap-nav">
				<ul>
					<li class="probootstrap-animate"
						data-animate-effect="fadeInLeft"><a href="storeIndex.st">Got
							them?</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="mystore.st">점포관리</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="stock.st?pageNo=1">재고관리</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="storeOrderList.st">결제관리</a></li>
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
							<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
								href="logout.st" class="nav-link">로그아웃</a></li>
							<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
								href="passWordChange.st" class="nav-link">비밀번호 변경</a></li>
						</c:otherwise>
					</c:choose>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="index.gt">고객 사이트</a></li>
				</ul>
			</nav>
			<footer class="probootstrap-aside-footer probootstrap-animate"
				data-animate-effect="fadeInLeft">
				<p>
					&copy; 2018 <a href="/gotThem" target="_blank">스탑없으 X Got Them</a>.
					<br> All Rights Reserved.
				</p>
			</footer>
		</div>
	</aside>
</body>
</html>