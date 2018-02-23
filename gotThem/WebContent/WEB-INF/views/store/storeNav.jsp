<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
	<div class="container">
		<a class="navbar-brand" href="storeIndex.st">Got them</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div
			class="collapse navbar-collapse pull-xs-right justify-content-end"
			id="navbarSupportedContent">
			<ul class="navbar-nav mt-2 mt-md-0">
				<li class="nav-item"><a class="nav-link" href="#">알림사항</a></li>
				<li class="nav-item"><a class="nav-link" href="mystore.st">점포관리</a></li>
				<li class="nav-item"><a class="nav-link" href="stock.st">재고관리</a></li>
				<li class="nav-item"><a class="nav-link" href="#">회사소개</a></li>
				<c:set var="sessionCheck"
					value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
				<c:choose>
					<c:when test="${sessionCheck eq null}">
						<strong><li class="nav-item"><a
							class="nav-link" href="login.st">사장님
								로그인</a></li></strong>
						<strong><li class="nav-item"><a href="join.st"
								class="nav-link">제휴하기</a></li></strong>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a href="logout.st"
								class="nav-link">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>