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
<link rel="stylesheet"
	href="resources/indexTemplate/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/indexTemplate/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="resources/indexTemplate/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/indexTemplate/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/icomoon.css">
<link rel="stylesheet" href="resources/indexTemplate/css/animate.css">
<link rel="stylesheet" href="resources/indexTemplate/css/style.css">
<link rel="stylesheet" href="resources/landy/css/style.default.css"
	id="theme-stylesheet">
<link rel="stylesheet" href="resources/landy/css/custom.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	function fnList(){
		location.href="stock.st?pageNo="+${pageNo};
	}
	function fnUpdate(){
		location.href="update.st?pageNo="+${pageNo} + "&code=" + ${pro.pro_code};
	}
	
	function fnDelete(pro_code, pageNo){
		var pro_code = pro_code;
		if(confirm("상품을 삭제하시겠습니까?")==true){
			$.ajax({
				type:"POST",
				url:"delete.st",
				data:"pro_code="+pro_code+"&pageNo="+pageNo,

				success:function(data){
					if(data!=1){
						alert("삭제되었습니다");
						location.replace("stock.st?pageNo="+pageNo);
					}else{
						alert("실패했습니다");
						
					}
				}
			});
		} else{
			location.history.go(0);
		}
	    }
</script>
<style>
.btn-primary{
border-radius:4px;
margin:1px;
padding: 0.6rem 1rem;
}
</style>
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
			<a href="index.html">GOT THEM</a>
		</div>
	</div>
	<div class="cover-container pb-5">
		<div class="cover-inner container">
			<div class="row">
				<div class="col-sm-3">
					<img src="/img/${pro.pro_img }" style="width: 250px; height: 250px" />
				</div>
				<div class="col-sm-9">
					<table class="table table-user-information">
						<tr>
							<td>제품번호</td>
							<td>${pro.pro_code }</td>
						</tr>
						<tr>
							<td>제품명</td>
							<td>${pro.pro_name }</td>
						</tr>
						<tr>
							<td>분류</td>
							<td>${pro.pro_category }</td>
						</tr>
						<tr>
							<td>가격</td>
							<td>${pro.pro_price }</td>
						</tr>
						<tr>
							<td>재고</td>
							<td>${pro.pro_stock }</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="button" class="btn btn-primary"
								value="수정하기" onclick="fnUpdate()" /> <input type="button" class="btn btn-primary"
								value="삭제하기" onclick="fnDelete(${pro.pro_code}, ${pageNo })" />
								<input type="button"  class="btn btn-primary" value="목록으로" onclick="fnList()" /></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="divider"></div>

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

	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/indexTemplate/js/bootstrap.min.js"></script>
	<script src="resources/indexTemplate/js/owl.carousel.min.js"></script>
	<script src="resources/indexTemplate/js/jquery.waypoints.min.js"></script>
	<script src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script>
	<script src="resources/indexTemplate/js/main.js"></script>
</body>
</html>