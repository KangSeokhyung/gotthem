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
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="resources/mainTemplate/css/styles-merged.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/custom.css">

    <!--[if lt IE 9]>
      <script src="resources/mainTemplate/js/vendor/html5shiv.min.js"></script>
      <script src="resources/mainTemplate/js/vendor/respond.min.js"></script>
    <![endif]-->
    <style>
    header{
    padding-bottom:80px;
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
                <a href="#">Home</a><span>Login</span>
              </div>
              <h1>로그인</h1>
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
			<h4>WELCOME TO GOT THEM</h4>
          <ul class="with-icon colored">
            <li><i class="icon-location2"></i> <span>서울특별시 서초구 비트아카데미 빌딩 3층</span></li>
            <li><i class="icon-mail"></i><span>gotthembit@gmail.com</span></li>
            <li><i class="icon-phone2"></i><span>02-123-4567</span></li>
          </ul>

          <h4>Feedback</h4>
          <p>궁금하신 점이 있으면, 언제라도 문의 주세요.<br> Gotthem은 항상 열려 있습니다.</p>
          <p><a href="#">Learn More</a></p>
        </div>
        <div class="col-md-8 col-md-push-1">
                  <form action="#" method="post" class="probootstrap-form mb60">
            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="mem_id">ID</label>
                  <input type="text" class="form-control" id="mem_id" name="mem_id" autofocus>
                </div>
              </div>
              </div>
              <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="mem_pw">PASSWORD</label>
                  <input type="password" class="form-control" id="mem_pw" name="mem_pw">
                </div>
              </div>
            </div>
            <div class="form-group ">
              <input type="submit" class="btn btn-primary" name="submit" value="로그인하기" style="width:48%;" onclick="loginResult()">
            </div>
            <div class="form-group ">
            <img src="image/naver_Green.png" style="cursor:pointer; width:48%; height:49px;" >
            </div>
            <div class="form-group">
             <a href="findIDAndPW.gt">아이디를 잊으셨나요?</a>
            </div>
            <div class="form-group">
             <a href="join.gt">회원 가입이 필요하신가요?</a>
            </div>
            
          </form>
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
  	$().ready(function(){
   		var msg= '${errMsg}';
   		var str;
   		if(msg==null || msg == ''){
   			str = 'g';
   		}else if(msg!=null || msg != ''){
   			alert("${errMsg}");
   		}
   	});
  	</script>
</body>
</html>