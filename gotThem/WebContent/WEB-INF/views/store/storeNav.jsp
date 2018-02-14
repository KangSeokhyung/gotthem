<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
				<li class="nav-item"><a class="nav-link" href="#">점포관리</a></li>
				<li class="nav-item"><a class="nav-link" href="stock.st">재고관리</a></li>
				<li class="nav-item"><a class="nav-link" href="#">회사소개</a></li>
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a
						class="btn btn-outline-white btn-outline" href="login.st">사장님
							로그인</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<form:form action="${pageContext.request.contextPath}/logout" method="POST">
						<li class="nav-item"><button type="submit"
							class="btn btn-outline-white btn-outline">로그아웃</button></li>
					</form:form>
				</sec:authorize>
			</ul>
		</div>
	</div>
</nav>