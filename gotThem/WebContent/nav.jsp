<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- navbar-->
	<header class="header">
		<nav class="navbar navbar-expand-lg fixed-top">
			<a href="index.jsp" class="navbar-brand">Got Them!</a>
			<button type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation"
				class="navbar-toggler navbar-toggler-right">
				<span></span><span></span><span></span>
			</button>
			<div id="navbarSupportedContent" class="collapse navbar-collapse">
				<ul
					class="navbar-nav ml-auto align-items-start align-items-lg-center">
					<li class="nav-item"><a href="#about-us"
						class="nav-link link-scroll">Got them?</a></li>
					<li class="nav-item"><a href="#features"
						class="nav-link link-scroll">Notice</a></li>
					<li class="nav-item"><a href="#testimonials"
						class="nav-link link-scroll">Event</a></li>
					<li class="nav-item"><a href="test.gt" class="nav-link">Question</a></li>
				</ul>
				<div class="navbar-text">
					<!-- Button trigger modal-->
					
					
					
					<c:set var="sessionCheck" value="${sessionScope.SPRING_SECURITY_CONTEXT}"/>
					 <c:choose>
					 	<c:when test="${sessionCheck eq null}">
					<a href="join.gt" class="btn btn-primary navbar-btn btn-shadow btn-gradient">Sign Up</a> 				
					<a href="login.gt" class="btn btn-primary navbar-btn btn-shadow btn-gradient">Login</a>
						</c:when>
						<c:otherwise>
					<a href="mypage.gt" class="btn btn-primary navbar-btn btn-shadow btn-gradient">Mypage</a> 				
					<a href="logout.gt" class="btn btn-primary navbar-btn btn-shadow btn-gradient">Logout</a>
					 	 </c:otherwise>
					 </c:choose>
				</div>
			</div>
		</nav>
	</header>