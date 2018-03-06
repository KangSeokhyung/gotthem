<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>편의점 재고 검색 GOT THEM!</title>
    <meta name="description" content="Free Bootstrap Theme by uicookies.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="resources/mainTemplate/css/styles-merged.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/custom.css">
    <link href="resources/table/css/fresh-bootstrap-table.css" rel="stylesheet" />
    <!--[if lt IE 9]>
      <script src="resources/mainTemplate/js/vendor/html5shiv.min.js"></script>
      <script src="resources/mainTemplate/js/vendor/respond.min.js"></script>
    <![endif]-->
    <style>
    header{
    padding-bottom:80px;
    }
    div .navbar{
    border: 1px;
    }
    </style>
  </head>
<body>
<!-- START: header -->
   <header role="banner" class="probootstrap-header">
    <div class="container">
        <a href="/gotThem" class="probootstrap-logo">GOT THEM<span>.</span></a>
        
        <a href="#" class="probootstrap-burger-menu visible-xs" ><i>Menu</i></a>
        <div class="mobile-menu-overlay"></div>

        <nav role="navigation" class="probootstrap-nav hidden-xs">
          <ul class="probootstrap-main-nav">
            <li><a href="#">GOTTHEM</a></li>
            <li><a href="#">NOTICE</a></li>
            <li><a href="#">EVENT</a></li>
            <c:set var="sessionCheck"
					value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
				<c:choose>
					<c:when test="${sessionCheck eq null}">
            <li><a href="join.gt">SIGN UP</a></li>
            <li class="active"><a href="login.gt">LOGIN</a></li>
            		</c:when>
					<c:otherwise>
			<li><a href="mypage.gt">MY PAGE</a></li>
            <li><a href="logout.gt">LOGOUT</a></li>
				</c:otherwise>
				</c:choose>
          </ul>
          <div class="extra-text visible-xs"> 
            <a href="#" class="probootstrap-burger-menu"><i>Menu</i></a>
            <h5>Address</h5>
            <p>198 West 21th Street, Suite 721 New York NY 10016</p>
            <h5>Connect</h5>
            <ul class="social-buttons">
              <li><a href="#"><i class="icon-twitter"></i></a></li>
              <li><a href="#"><i class="icon-facebook2"></i></a></li>
              <li><a href="#"><i class="icon-instagram2"></i></a></li>
            </ul>
          </div>
        </nav>
    </div>
  </header>
  <!-- END: header -->
  <section class="probootstrap-slider flexslider2 page-inner">
    <div class="overlay"></div>
    <div class="probootstrap-wrap-banner">
      <div class="container">
        <div class="row">
          <div class="col-md-8">

            <div class="page-title probootstrap-animate">
              <div class="probootstrap-breadcrumbs">
                <a href="#">Home</a><span>Mypage</span>
              </div>
              <h1>회원정보수정</h1>
            </div>

          </div>
        </div>
      </div>
    </div>
    <ul class="slides">
      <li style="background-image: url(resources/mainTemplate/img/slider_1.jpg);"></li>
      <li style="background-image: url(resources/mainTemplate/img/slider_4.jpg);"></li>
      <li style="background-image: url(resources/mainTemplate/img/slider_2.jpg);"></li>
    </ul>
  </section>
  <!-- END: slider  -->
	 <section class="probootstrap-section">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
			<h2>마이페이지</h2>
			<div class="navbar">
          <ul class="with-icon colored">
             <li><i class="xi-user"></i><span>
            <a href="#tab-1" data-toggle="tab">회원정보</a>
            </span></li>
             <li><i class="xi-pen"></i><span>
            <a href="#tab-2" data-toggle="tab">회원정보 수정</a>
            </span></li>
            <li><i class="xi-key"></i><span>
            <a href="#tab-3" data-toggle="tab">비밀번호 변경</a>
            </span></li>
             <li><i class="xi-cart"></i><span>
            <a href="#tab-4" data-toggle="tab">구매 정보</a>
            </span></li>
             <li><i class="xi-truck"></i><span>
            <a href="#" data-toggle="tab">찾아갈 상품</a>
            </span></li>
           	<li><i class="xi-airplay"></i><span>
            <a href="#" data-toggle="tab">회원 탈퇴</a>
            </span></li>
          </ul>
          </div>
        </div>
        <div class="col-sm-8">
       <div class="tab-content">
	<div class="tab-pane active" id="tab-1">

				</div>
				<div class="tab-pane fade" id="tab-2"></div>
				<div class="tab-pane fade" id="tab-3">
				</div>
				<div class="tab-pane fade" id="tab-4">
				</div>
				<div class="tab-pane fade" id="tabE">
					<p>Okay, last one E</p>
				</div>


			</div>
        </div>
      </div>
    </div>
  </section>  

</body>
    <!-- Javascript files-->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
     <script src="resources/mainTemplate/js/scripts.min.js"></script>
  	<script src="resources/mainTemplate/js/main.min.js"></script>
  	<script src="resources/mainTemplate/js/custom.js"></script>
   	<script>
		$.get("mypageMemberInfo.gt", function(data) {
			$('#tab-1').html(data);
		});
	</script> 
	<script>
		$.get("mypageMemberModi.gt", function(data) {
			$('#tab-2').html(data);
		});
	</script>
	<script>
		$.get("passCheck.gt", function(data) {
			$('#tab-3').html(data);
		});
	</script>
	<script>
		$.get("mypageMemberDel.gt", function(data) {
			$('#tab-4').html(data);
		});
	</script>
</body>
</html>