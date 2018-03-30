<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wordLine { word-break: keep-all;  }
</style>
</head>
<body>
<footer class="probootstrap-footer probootstrap-bg">
	<div class="container">
		<div class="col-sm-12">
       		<c:set var="sessionCheck" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.authorities}" />
			<c:choose>
				<c:when test="${sessionCheck eq '[ROLE_ADMIN]'}">
					<a href="memcontrol.ad" style="float:right; color:#888;" id="admin">관리자모드</a>
				</c:when>
			</c:choose>
       	</div>
	</div>
    <div class="container" style="height: 60px; text-align: center;">
        <div id="wordLine" class="probootstrap-footer-widget">
        	<div class="col-sm-12">
        		스탑없으 &copy; 2018 GotThem 프로젝트.
        	</div>
        	<div class="col-sm-12">
        		<strong>개발자 : </strong>
       			<span>강석형, 김성우, 김채윤, 권도용, 이찬희</span>
        	</div>
        </div>
    </div>
  </footer>
</body>
</html>