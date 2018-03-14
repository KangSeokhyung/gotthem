<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>편의점 재고 검색 포털 Got them</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css?family=Work+Sans" rel="stylesheet">
<link rel="stylesheet" href="resources/indexTemplate/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/icomoon.css">
<link rel="stylesheet" href="resources/indexTemplate/css/animate.css">
<link rel="stylesheet" href="resources/indexTemplate/css/style.css">
<script type="text/javascript">
	function fnList(){
		location.href="stock.st?pageNo="+${pageNo};
	}
	
</script>
</head>
<body>
	<header>
		<%@include file="../store/nav.jsp"%>
	</header>


	<main role="main" class="probootstrap-main js-probootstrap-main">
		<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="storeIndex.st">GOT THEM</a></a>
		</div>
	</div>
 

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
					<form action="insert.st?pageNo=${pageNo }" method="post" enctype="multipart/form-data">
					<input type="hidden" name="mem_no" value="${pro.mem_no }"/>
					<table class="table table-user-information">
						<tr>
							<td><span>분류</span></td><td>
							<select  name="pro_category">
							  <option value="도시락">도시락</option>
							  <option value="김밥">김밥</option>
							  <option value="삼각김밥">김밥</option>
							  <option value="샌드위치">샌드위치</option>
							  <option value="햄버거">햄버거</option>
							  <option value="주먹밥">주먹밥</option>
							  <option value="과일">과일</option>
							  <option value="셀러드">셀러드</option>
							</select>
						</tr>
						<tr>
							<td><span>제품명</span></td><td><input type="text" name="pro_name"/></td>
						</tr>
						<tr>
							<td><span>가격</span></td><td><input type="text" name="pro_price"/></td>
						</tr>
						<tr>
							<td><span>재고</span></td><td><input type="text" name="pro_stock"/></td>
						</tr>
						<tr>
							<td><span>상품사진</span></td><td><input type="file" name="file"/></td>
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
      		
      		
	<div class="container-fluid d-md-none">
		<div class="row">
			<div class="col-md-12">
				<ul class="list-unstyled d-flex probootstrap-aside-social">
					<li><a href="#" class="p-2"><span class="icon-twitter"></span></a></li>
					<li><a href="#" class="p-2"><span class="icon-instagram"></span></a></li>
					<li><a href="#" class="p-2"><span class="icon-dribbble"></span></a></li>
				</ul>
				<p>
					&copy; 2017 <a href="https://uicookies.com/" target="_blank">uiCookies:Aside</a>.
					<br> All Rights Reserved. Designed by <a
						href="https://uicookies.com/" target="_blank">uicookies.com</a>
				</p>
			</div>
		</div>
	</div>

	</main>

	<script src="resources/indexTemplate/js/jquery-3.2.1.slim.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/indexTemplate/js/bootstrap.min.js"></script>
	<script src="resources/indexTemplate/js/owl.carousel.min.js"></script>
	<script src="resources/indexTemplate/js/jquery.waypoints.min.js"></script>
	<script src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script>
	<script src="resources/indexTemplate/js/main.js"></script>
	<script type="text/javascript">
	
	</script>
</body>
</html>