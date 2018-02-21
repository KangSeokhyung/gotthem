<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<title>Startup UI Kit - Free Sample</title>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="resources/ownerindex/images/favicon.ico">
		<link rel="stylesheet" href="resources/ownerindex/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" href="resources/ownerindex/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/ownerindex/css/style.css">
		<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i|Montserrat:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	</head>
<body>
<section class="cover-1 text-center">
		<%@include file ="../store/storeNav.jsp"%>
			<div class="cover-container pb-5">
				<div class="cover-inner container">
					<table border="1">
						<tr>
							<th>번호</th>
							<th style="text-align: center;">상품명</th>
							<th>분류</th>
							<th>가격</th>
							<th>입고</th>
							<th>출고</th>
							<th>전일재고</th>
							<th>현재고</th>
							<th>매출</th>
						</tr>
						<c:forEach var="dto" items="${plist }">
						
						<tr>
							<td>${dto.pro_code }</td>
							<td><a href="detail.st?code=${dto.pro_code }">${dto.pro_name }</a></td>
							<td>${dto.pro_category }</td>
							<td>${dto.pro_price }</td>
							<td>${dto.pro_income }</td>
							<td>${dto.pro_release }</td>
							<td>${dto.pro_stock }</td>
							<td>${dto.pro_stock+dto.pro_income-dto.pro_release }</td>
							<td>${dto.pro_price*dto.pro_release}</td>
						</tr>
						</c:forEach>
					</table>
					<%-- <div>
					${sessionScope.SPRING_SECURITY_CONTEXT}					
					</div> --%>
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