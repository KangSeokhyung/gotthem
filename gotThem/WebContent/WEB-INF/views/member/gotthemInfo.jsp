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
                <span>Hello</span>
              </div>
              <h1>GOTTHEM 을 알고 계신가요?</h1>
            </div>

          </div>
        </div>
      </div>
    </div>
    <ul class="slides">
      <li style="background-image: url(resources/image/도시락3.jpg);"></li>
      <li style="background-image: url(resources/image/진열대2.jpg);"></li>
      <li style="background-image: url(resources/image/진열대3.jpg);"></li>
    </ul>
  </section>
  
  <section class="probootstrap-section probootstrap-section-lighter">
    <div class="container">
    	<div class="row">
    		<div class="col-md-12">
    			<h1>GOTTHEM은 항상 최선을 다합니다.</h1>
    		</div>
    	</div>
    </div>
  </section>
  <section class="probootstrap-section probootstrap-section-lighter">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <div class="probootstrap-card text-center probootstrap-animate">
            <div class="probootstrap-card-media svg-sm colored">
              <img src="resources/mainTemplate/img/flaticon/svg/001-prize.svg" class="svg" alt="Free HTML5 Template by uicookies.com">
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading">항상 최고의 서비스를!</h2>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="probootstrap-card text-center probootstrap-animate">
            <div class="probootstrap-card-media svg-sm colored">
              <img src="resources/mainTemplate/img/flaticon/svg/005-new.svg" class="svg" alt="Free HTML5 Template by uicookies.com">
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading">지속적인 가맹점 확대!</h2>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="probootstrap-card text-center  probootstrap-animate">
            <div class="probootstrap-card-media svg-sm colored">
              <img src="resources/mainTemplate/img/flaticon/svg/006-coin.svg" class="svg" alt="Free HTML5 Template by uicookies.com">
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading">점주와 GOT THEM WIN-WIN!</h2>
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
  	<!-- KAKAO LOGIN -->
  	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  	
</body>
</html>