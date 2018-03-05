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
	  <nav class="navbar navbar-default" role="navigation-demo" id="demo-navbar">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/gotThem">GOT THEM</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navigation-example-2">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/gotThem" class="btn btn-simple">GOT THEM</a></li>
					<li><a href="#" class="btn btn-simple">NOTICE</a></li>
					<li><a href="newMypage.gt" class="btn btn-simple">EVENT</a></li>
					<c:set var="sessionCheck"
 					value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
 					<c:choose>
 					<c:when test="${sessionCheck eq null}">
					<li><a href="join.gt" class="btn btn-simple">SIGN UP</a></li>
					<li><a href="login.gt" class="btn btn-simple">LOGIN</a></li>
					</c:when>
					<c:otherwise>
 					<li><a href="mypage.gt"	class="btn btn-simple">MY INFO</a></li>
 					<li><a href="logout.gt"	class="btn btn-simple">LOGOUT</a></li>
 					</c:otherwise>
 				</c:choose>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div><!-- /.container-->
    </nav>
</body>
</html>