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
    backgroundColor{
    background: #2866AB;
    }
    .btn-colorRed {
	border-radius: 4px;
	backgroud:#fa2848;
    border: 2px solid #fa5858;
    background: #fa5858;
    color: #fff;
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
                <a href="index.gt">Home</a><span>Login</span>
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
        <div class="col-md-3" style="word-break:keep-all;">
			<h4>GOTTHEM에 오신 것을 환영합니다.</h4>
          <ul class="with-icon colored">
            <li><i style="color:#fa5858;" class="icon-location2"></i> <span>서울특별시 서초구 비트아카데미 빌딩 3층</span></li>
            <li><i style="color:#fa5858;" class="icon-mail"></i><span>gotthem@gmail.com</span></li>
            <li><i style="color:#fa5858;" class="icon-phone2"></i><span>02-123-4567</span></li>
          </ul>

          <h4>Feedback</h4>
          <p style="word-break:keep-all;">궁금하신 점이 있으면, 언제라도 문의 주세요.<br> Gotthem은 고객만족에 최선을 다합니다.</p>
          <p><a href="gotthemInfo.gt">더 궁금하신가요?</a></p>
        </div>
        <div class="col-md-8 col-md-push-1">
                  <form id="kakaoLogin" method="post" class="probootstrap-form mb60">
            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="mem_id">아이디</label>
                  <input type="text" class="form-control" id="mem_id" name="mem_id" autofocus>
                </div>
              </div>
              </div>
              <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="mem_pw">패스워드</label>
                  <input type="password" class="form-control" id="mem_pw" name="mem_pw">
                </div>
              </div>
            </div>
            <div class="form-group ">
              <input type="submit" class="btn btn-primary" name="submit" value="로그인하기" style="width:360px;"onclick="loginResult()">
            </div>
            <div class="form-group " >
            <!-- <a id="kakao-login-btn" style="cursor:pointer;"></a> -->
            <a id="custom-login-btn" href="javascript:loginWithKakao()">
			<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="360px;"/>
			</a>
            </div>
            <div class="form-group">
             <a href="findIDAndPW.gt">아이디를 잊으셨나요?</a>
            </div>
            <div class="form-group">
             <a href="join.gt">아직 아이디가 없으신가요?</a>
            </div>
           
          </form>
          
        </div>
      </div>
    </div>
  </section>  
		<form id="kakaoForm" action="kakaoLogin.gt" method="post">
          	<input type="hidden" value="" id="kakao_id" name="kakao_id">
          	<input type="hidden" value="" id="kakao_name" name="kakao_name">
          	<input type="hidden" value="" id="kakao_email" name="kakao_email">
          	<input type="hidden" value="" id="kakao_token" name="kakao_token">
          </form>
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
    Kakao.init('363553076ca8777f012d9c9ce3b92b8c');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
    	  success: function(authObj) {
        	  Kakao.API.request({
        		    url: '/v1/user/me',
        		    success: function(res) {
        		      if(document.getElementById('mem_id').value !=null || document.getElementById('mem_pw').value !=null){
        		    	  document.getElementById('mem_id').value = null;
        		    	  document.getElementById('mem_pw').value = null;
        		      }
        		    document.getElementById('kakao_email').value = res.kaccount_email;
        		    document.getElementById('kakao_id').value = res.id;
        		    document.getElementById('kakao_name').value = res.properties.nickname;
        		    document.getElementById('kakao_token').value = authObj.access_token;
        		    document.getElementById("kakaoForm").submit();
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
    };
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