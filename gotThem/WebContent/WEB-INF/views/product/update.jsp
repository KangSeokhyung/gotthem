<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<title>Startup UI Kit - Free Sample</title>
<head>
<link href="https://fonts.googleapis.com/css?family=Work+Sans"
	rel="stylesheet">
<link rel="stylesheet" href="resources/indexTemplate/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/icomoon.css">
<link rel="stylesheet" href="resources/indexTemplate/css/animate.css">
<link rel="stylesheet" href="resources/indexTemplate/css/style.css">
<link rel="stylesheet" href="resources/landy/css/style.default.css" id="theme-stylesheet">
<link rel="stylesheet" href="resources/landy/css/custom.css">
<script type="text/javascript">
	function fnList(){
		location.href="stock.st";
	}
	
</script>

</head>
<body>
<aside class="probootstrap-aside js-probootstrap-aside">
		<a href="#"
			class="probootstrap-close-menu js-probootstrap-close-menu d-md-none"><span
			class="oi oi-arrow-left"></span> Close</a>
		<div class="probootstrap-site-logo probootstrap-animate"
			data-animate-effect="fadeInLeft">

			<a href="storeIndex.st" class="mb-2 d-block probootstrap-logo">GOTTHEM</a>
			<p class="mb-0">
				제휴 사이트 
			</p>
		</div>
		<div class="probootstrap-overflow">
			<nav class="probootstrap-nav">
				<ul>
					<li class="probootstrap-animate"
						data-animate-effect="fadeInLeft"><a href="storeIndex.st">Got them?</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="mystore.st">점포관리</a></li>
					<li class="probootstrap-animate active" data-animate-effect="fadeInLeft"><a
						href="stock.st">재고관리</a></li>
				<c:set var="sessionCheck"
					value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
				<c:choose>
					<c:when test="${sessionCheck eq null}">
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="login.st">로그인</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="join.st">제휴맺기</a></li>
					</c:when>
					<c:otherwise>
						<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a href="logout.st" class="nav-link">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="index.gt">고객 사이트</a></li>
			</ul>
			</nav>
			
			<footer class="probootstrap-aside-footer probootstrap-animate"
				data-animate-effect="fadeInLeft">
				<p>
					&copy; 2018 <a href="/gotThem" target="_blank">스탑없으 X Got Them</a>.
					<br> All Rights Reserved.
				</p>
			</footer>
		</div>
	</aside>


	<main role="main" class="probootstrap-main js-probootstrap-main">
		<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="index.html">Aside</a></a>
		</div>
	</div>

			<div class="cover-container pb-5">
				<div class="cover-inner container">
					<form method="post" action="update.st" enctype="multipart/form-data">
					<div class="row">
				<div class="col-sm-3">
				<img src="/img/${pro.pro_img }" style="width:250px; height:250px"/></div>
					<div class="col-sm-9">
					<input type="hidden" name="pro_code" value="${pro.pro_code }"/>
					<table class="table table-user-information">
						<tr>
							<td><span>제품번호</span></td><td>${pro.pro_code }</td>
						</tr>
						<tr>
							<td><span>제품명</span></td><td><input type="text" name="pro_name" value="${pro.pro_name }"/></td>
						</tr>
						<tr>
							<td><span>분류</span></td><td><input type="text" name="pro_category" value="${pro.pro_category }"/></td>
						</tr>
						<tr>
							<td><span>가격</span></td><td><input type="text" name="pro_price" value="${pro.pro_price }"/></td>
						</tr>
						<tr>
							<td><span>재고</span></td><td><input type="text" name="pro_stock" value="${pro.pro_stock }"/></td>
						</tr>
						<tr>
							<td><span>상품사진</span></td><td><input type="file" name="file" value="${pro.pro_img }"/></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="확인"/>
								<input type="button" value="리셋" onclick="reset()"/>
								<input type="button" value="취소" onclick="history.back()"/>
								<input type="button" value="목록으로" onclick="fnList()"/>
							</td>
						</tr>
					</table>
					</div>
					</div>
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