<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body, table, div, p {
	font-family: '나눔고딕';
}

.probootstrap-main-nav li a:hover {
	color: #ea1313;
}

.probootstrap-main-nav li a {
	text-transform: none;
	padding: 10px 0;
	color: #000;
	font-size: 15px;
	border-bottom: 2px solid transparent;
}

.probootstrap-main-nav {
	padding: 20px 0;
}

.probootstrap-header {
	padding-top: 0px;
	padding-bottom: 0px;
	width: 100%;
	background: #fff;
	z-index: 12;
	position: absolute;
	top: 0;
	-webkit-box-shadow: 0 6px 68px -6px rgba(0, 0, 0, .2);
	box-shadow: 0 6px 68px -6px rgba(0, 0, 0, .2);
}
.material-icons {
	font-family: 'Material Icons';
	font-weight: normal;
	font-style: normal;
	font-size: 15px;
	line-height: 1;
	letter-spacing: normal;
	text-transform: none;
	display: inline-block;
	white-space: nowrap;
	word-wrap: normal;
	direction: ltr;
	-webkit-font-feature-settings: 'liga';
	-webkit-font-smoothing: antialiased;
}
.container {
    padding-bottom: 10px;
    padding-top: 10px;
}
.barunPenLogo{
	font-family:'나눔바른펜';
	font-size:40px;
	color:#fa2848;
}
.probootstrap-logo:hover {
    color: #fa2848;
}

</style>
</head>
<body>
	<c:set var="sessionCheck"
		value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
	<header role="banner" id="navbar" class="probootstrap-header">
		<div class="container">
			<a href="/gotThem" class="probootstrap-logo barunPenLogo"><img
				src="resources/image/indexLOGO.PNG" height="50"
				alt="Gotthem">GotThem</a> <a href="#"
				class="probootstrap-burger-menu visible-xs"><i>Menu</i></a>
			<div class="mobile-menu-overlay"></div>

			<nav role="navigation" class="probootstrap-nav hidden-xs">
				<ul class="probootstrap-main-nav">
					<li><a href="gotthemInfo.gt" class="nanumbarunpenr">GotThem
							소개</a></li>
					<li><a href="listBasket.gt">장바구니</a></li>
					<c:set var="sessionCheck"
						value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
					<c:choose>
						<c:when test="${sessionCheck eq null}">
							<li><a href="join.gt">회원가입</a></li>
							<li><a href="login.gt">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="mypage.gt">마이페이지</a></li>
							<li><a href="logout.gt">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<div class="extra-text visible-xs">
					<a href="#" class="probootstrap-burger-menu"><i>메뉴</i></a>
					<h5>주소</h5>
					<p>서울광역시 서초구 비트교육센터 별관 503호</p>
					<h5>개발자</h5>
					<p>강석형, 김성우, 김채윤, 권도용, 이찬희</p>
				</div>
			</nav>
		</div>
	</header>
</body>
</html>