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
   <header>
		<%@include file="../../../nav.jsp"%>
	</header>
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
                  <form method="post" class="probootstrap-form mb60">
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
            <a id="kakao-login-btn" style="cursor:pointer; width:48%; height:49px;"></a>
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
          <form id="kakaoForm" action="kakaoLogin.st" method="post">
          	<input type="hidden" value="" id="kakao_email" name="mem_id">
          	<input type="hidden" value="" id="mem_name" name="mem_name">
          	<input type="hidden" value="" id="mem_email" name="mem_email">
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
  	<!-- KAKAO LOGIN -->
  	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  	<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('7f93c771faceb935af25ef6e91c4a334');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
    	  Kakao.API.request({
    		    url: '/v1/user/me',
    		    success: function(res) {
    		      alert(res.kaccount_email +
    		      res.id +
    		      res.properties.nickname);
    		      if(document.getElementById('mem_id').value !=null){
    		    	  document.getElementById('mem_id').value = null;
    		      }
    		    document.getElementById('kakao_email').value = res.kaccount_email;
    		    },
    		    fail: function(error) {
    		      alert(JSON.stringify(error))
    		    }
    		});
      },
      fail: function(err) {
         alert("Login Fail");
      }
    });
  //]]>
</script>
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