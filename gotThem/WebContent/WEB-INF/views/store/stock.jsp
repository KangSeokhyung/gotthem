<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
		<meta charset="utf-8">
		<title>Startup UI Kit - Free Sample</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="resources/ownerindex/images/favicon.ico">
		<link rel="stylesheet" href="resources/ownerindex/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" href="resources/ownerindex/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/ownerindex/css/style.css">
		<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i|Montserrat:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	</head>
<body>
<section class="cover-1 text-center">
			<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
				<div class="container">
					<a class="navbar-brand" href="#">Got them</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse pull-xs-right justify-content-end" id="navbarSupportedContent">
						<ul class="navbar-nav mt-2 mt-md-0">
							<li class="nav-item">
								<a class="nav-link" href="#">알림사항</a>
							</li>					
							<li class="nav-item">
								<a class="nav-link" href="#">점포관리</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">재고관리</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">회사소개</a>
							</li>
							<li class="nav-item">
								<a class="btn btn-outline-white btn-outline" href="#">사장님 로그인</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
			<div class="cover-container pb-5">
				<div class="cover-inner container">
					<table border="1">
						<tr>
							<th>번호</th>
							<th>상품명</th>
							<th>재고</th>
							<th>가격</th>
						</tr>
						<c:forEach var="vo" items="${plist }">
						
						<tr>
							<td>${vo.pro_code }</td>
							<td>${vo.pro_name }</td>
							<td>${vo.pro_stock }</td>
							<td>${vo.pro_price }</td>		
						</tr>
						
						</c:forEach>
					</table>
				</div>
      		</div>
</section>
<footer class="footer-3">
			<div class="container-fluid">
				<div class="divider"></div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-6 text-center text-md-left mt-2 mb-3 pt-1">
						<p>Copyright &copy; YourStartup. All rights reserved.</p>
					</div>
					<div class="col-md-6 text-center text-md-right mb-4">
						<ul class="social">
							<li><a href="#" title="Facebook" class="fa fa-facebook"></a></li>
							<li><a href="#" title="Twitter" class="fa fa-twitter"></a></li>
							<li><a href="#" title="Google+" class="fa fa-google"></a></li>
							<li><a href="#" title="Dribbble" class="fa fa-dribbble"></a></li>
							<li><a href="#" title="Instagram" class="fa fa-instagram"></a></li>
							<div class="clear"></div>
						</ul>
					</div>
				</div>
			</div>
		</footer>
</body>
</html>