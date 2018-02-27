<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String id=(String)session.getAttribute("id");%>
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
					<li class="nav-item"><a href="text.html" class="nav-link">Question</a></li>
				</ul>
				<div class="navbar-text">
					<!-- Button trigger modal-->
					  <%if(id==null) {%> 
					<a href="#" class="btn btn-primary navbar-btn btn-shadow btn-gradient">Sign Up</a> 				
					<a href="login.gt" class="btn btn-primary navbar-btn btn-shadow btn-gradient">Login</a>
					 <% } else { %>
					<a href="#" class="btn btn-primary navbar-btn btn-shadow btn-gradient">Modify</a> 				
					<a href="logout.gt" class="btn btn-primary navbar-btn btn-shadow btn-gradient">Logout</a>
					 <% } %>
				</div>
			</div>
		</nav>
	</header>