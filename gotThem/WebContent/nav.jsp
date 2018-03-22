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
<c:set var="sessionCheck" value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
<header role="banner" id="navbar" class="probootstrap-header">
    <div class="container">
        <a href="/gotThem" style="font-weight: bold; color: #f00d04; font-size: 28px;">GOT THEM</a>
        
        <a href="#" class="probootstrap-burger-menu visible-xs" ><i>Menu</i></a>
        <div class="mobile-menu-overlay"></div>

        <nav role="navigation" class="probootstrap-nav hidden-xs">
          <ul class="probootstrap-main-nav">
            <li><a href="/gotThem">GOTTHEM</a></li>
            <c:choose>
				<c:when test="${sessionCheck eq null}">
					<li><a href="login.gt?prevUrl=listBasket.gt">CART<span id="basketCount" style="color:#FE2E2E;"></span></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="listBasket.gt">CART<span id="basketCount" style="color:#FE2E2E;"></span></a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${sessionCheck eq null}">
					<li><a href="join.gt">SIGN UP</a></li>
					<c:if test="${search ne null }">
						<li><a href="login.gt?search=${search }">LOGIN</a></li>
					</c:if>
					<c:if test="${search eq null }">
						<li><a href="login.gt">LOGIN</a></li>
					</c:if>
				</c:when>
				<c:otherwise>
					<li><a href="mypage.gt">MYPAGE</a></li>
					<li><a href="logout.gt">LOGOUT</a></li>
				</c:otherwise>
			</c:choose>
		  </ul>
          <div class="extra-text visible-xs"> 
            <a href="#" class="probootstrap-burger-menu"><i>Menu</i></a>
            <h5>Address</h5>
            <p>198 West 21th Street, Suite 721 New York NY 10016</p>
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