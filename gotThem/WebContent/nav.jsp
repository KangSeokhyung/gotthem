<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<header role="banner" id="navbar" class="probootstrap-header">
    <div class="container">
        <a href="/gotThem" class="probootstrap-logo">GOT THEM<span>.</span></a>
        
        <a href="#" class="probootstrap-burger-menu visible-xs" ><i>Menu</i></a>
        <div class="mobile-menu-overlay"></div>

        <nav role="navigation" class="probootstrap-nav hidden-xs">
          <ul class="probootstrap-main-nav">
            <li><a href="gotthemInfo.gt">GOTTHEM 소개</a></li>
            <li><a href="#">공지</a></li>
            <li><a href="#">이벤트</a></li>
            <li><a href="listBasket.gt">장바구니<span id="basketCount" style="color:#FE2E2E;">&nbsp;&nbsp;${sessionScope.count}</span></a></li>
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
            <h5>Connect</h5>
            <ul class="social-buttons">
              <li><a href="#"><i class="icon-twitter"></i></a></li>
              <li><a href="#"><i class="icon-facebook2"></i></a></li>
              <li><a href="#"><i class="icon-instagram2"></i></a></li>
            </ul>
          </div>
        </nav>
    </div>
  </header>
</body>
</html>