<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<header>
		<%@include file="nav.jsp"%>
	</header>


	<main role="main" class="probootstrap-main js-probootstrap-main">
		<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<c:set var="sessionCheck"
						value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
			<c:choose>
				<c:when test="${sessionCheck eq null}">
			<a href="login.st">GOT THEM</a>
			</c:when>
				<c:otherwise>
					<a href="stock.st?pageNo=1" class="mb-2 d-block probootstrap-logo">GOTTHEM</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
<section class="probootstrap-section">
         
    <div class="container">
      <div class="row">
      <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <h4 style="color:red;">주의!!</h4>회원탈퇴 전에 구매한 상품을 수령해주세요.<br>구매목록에 미수령 상품이 있다면 탈퇴할 수 없습니다.
        </div>
        <div class="col-md-8">
          <form id="form1" action="mystoreDel.st" method="post" class="probootstrap-form mb60">
            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="fname">현재 비밀번호</label>
                  <input type="password" class="form-control" id="fname" name="mem_pw">
                </div>
              </div>
              </div>
                       
            <div class="form-group">
              <input type="button" class="btn btn-primary" value="탈퇴하기" onclick="storeDel()">
              <input type="reset" class="btn btn-primary" value="취소하기">
            </div>              
          </form>
        </div> 
	</div>
	</div>
  </section> 
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
	<script src="resources/mainTemplate/js/scripts.min.js"></script>
	<script src="resources/indexTemplate/js/jquery-3.2.1.slim.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/indexTemplate/js/bootstrap.min.js"></script>
	<script src="resources/indexTemplate/js/owl.carousel.min.js"></script>
	<script src="resources/indexTemplate/js/jquery.waypoints.min.js"></script>
	<script src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script>
	<script src="resources/indexTemplate/js/main.js"></script>
</body>
<script>
	function storeDel(){
		if(confirm('정말 탈퇴하시겠습니까?')== true){
			document.form1.submit();
		}else{
			alert("취소하셨습니다.")
			history.go(0);
		}
	}
</script>
</html>