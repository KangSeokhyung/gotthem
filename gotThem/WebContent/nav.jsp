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
	<nav class="navbar navbar-expand-lg main-navbar">
			<div class="container-fluid">			
			  <a class="navbar-brand" href="/gotThem">
			  	<img src="resources/mainTemplate/img/logo.png" alt="Logo">
			  </a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon">
			    	<i class="ion-navicon"></i>
			    </span>
			  </button>
			  <div class="collapse navbar-collapse" id="navbarNav">
				  <div class="mr-auto"></div>
			    <ul class="navbar-nav">
			      <li class="nav-item">
			        <a class="nav-link smooth-link" href="#hero">COMPANY</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link smooth-link" href="#features">NOTICE</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link smooth-link" href="#blog">EVENT</a>
			      </li>
			    <c:set var="sessionCheck"
					value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
				<c:choose>
					<c:when test="${sessionCheck eq null}">
					<li class="nav-item">
			        <a class="nav-link smooth-link" href="join.gt">SIGN UP</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link smooth-link" href="login.gt">LOGIN</a>
			      </li>
					</c:when>
					<c:otherwise>
					<li class="nav-item"><a href="mypage.gt"
								class="nav-link">MY INFO</a></li>
						<li class="nav-item"><a href="logout.gt"
								class="nav-link">LOGOUT</a></li>
					</c:otherwise>
				</c:choose>
			    </ul>
			  </div>
		  </div>
		</nav>
</body>
</html>