<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<script type="text/javascript">
	function fnList(){
		location.href="stock.st";
	}
	</script>
</head>
<body>
<section class="cover-1 text-center">
		<%@include file ="../store/storeNav.jsp"%>
			<div class="cover-container pb-5">
				<div class="cover-inner container">
					<form action="insert.st" method="post">
					<input type="hidden" name="mem_no" value="${pro.mem_no }"/>
					<table border ="1">
						<tr>
							<td>매장번호</td><td>${pro.mem_no }</td>
						</tr>
						<tr>
							<td>제품명</td><td><input type="text" name="pro_name"/></td>
						</tr>
						<tr>
							<td>분류</td><td><input type="text" name="pro_category"/></td>
						</tr>
						<tr>
							<td>가격</td><td><input type="text" name="pro_price"/></td>
						</tr>
						<tr>
							<td>재고</td><td><input type="text" name="pro_stock"/></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="입력"/>
								<input type="button" value="목록보기" onclick="fnList()"/>
							</td>
						</tr>
					</table>
					</form>
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