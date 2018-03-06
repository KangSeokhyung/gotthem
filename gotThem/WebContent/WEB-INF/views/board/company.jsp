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
            <li><a href="join.gt">SIGN UP</a></li>
            <li class="active"><a href="login.gt">LOGIN</a></li>
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
                <a href="#">Home</a><span>Company</span>
              </div>
              <h1>회사소개</h1>
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
	
	 <section class="probootstrap-slider flexslider2 page-inner">
    <div class="overlay"></div>
    <div class="probootstrap-wrap-banner">
      <div class="container">
        <div class="row">
          <div class="col-md-8">

            <div class="page-title probootstrap-animate">
              <div class="probootstrap-breadcrumbs">
                <a href="#">Home</a><span>About</span>
              </div>
              <h1>About Us</h1>
            </div>

          </div>
        </div>
      </div>
    </div>
    <ul class="slides">
      <li style="background-image: url(img/slider_1.jpg);"></li>
      <li style="background-image: url(img/slider_4.jpg);"></li>
      <li style="background-image: url(img/slider_2.jpg);"></li>
    </ul>
  </section>
  <!-- END: slider  -->

  <section class="probootstrap-section">
    <div class="container">
      <div class="row heading">
        <div class="col-md-12"><h2 class="mt0 mb50 text-center">Our Company</h2></div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <p><img src="img/slider_5.jpg" class="img-responsive" alt="Free Bootstrap Template by uicookies.com"></p>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <h2>Our Mission</h2>
          <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
        </div>
        <div class="col-md-6">
          <h2>Our Vision</h2>
          <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar. The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p>
        </div>
      </div>
    </div>
  </section>

  <section class="probootstrap-half">
    <div class="image-wrap">
      <div class="image" style="background-image: url(img/slider_2.jpg);"></div>
    </div>
    <div class="text">
      <p class="mb10 subtitle">Know Us More</p>
      <h3 class="mt0 mb40">Company History</h3>
      <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
      <p class="mb50">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
      <p><a href="#" class="btn btn-primary mb10">Find out more</a></p>
    </div>
  </section>
  <section class="probootstrap-half reverse">
    <div class="image-wrap">
      <div class="image" style="background-image: url(img/slider_5.jpg);"></div>
    </div>
    <div class="text">
      <p class="mb10 subtitle">Why Choose Us</p>
      <h3 class="mt0 mb40">You Will Love Our Services</h3>
      <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
      <p class="mb50">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
      <p><a href="#" class="btn btn-primary mb10">Find out more</a></p>
    </div>
  </section>
   <section class="probootstrap-half">
    <div class="image-wrap">
      <div class="image" style="background-image: url(img/slider_1.jpg);"></div>
    </div>
    <div class="text">
      <p class="mb10 subtitle">Accomplishments</p>
      <h3 class="mt0 mb40">Our Accomplishments</h3>
      <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
      <p class="mb50">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
      <p><a href="#" class="btn btn-primary mb10">Find out more</a></p>
    </div>
  </section>
  
  <section class="probootstrap-section probootstrap-section-lighter">
    <div class="container">
      <div class="row heading">
        <h2 class="mt0 mb50 text-center">Our Agents</h2>
      </div>
      <div class="row">
        <div class="col-md-3 col-sm-6">
          <div class="probootstrap-card probootstrap-person text-left">
            <div class="probootstrap-card-media">
              <img src="img/person_1.jpg" class="img-responsive" alt="Free HTML5 Template by uicookies.com">
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading mb0">Jeremy Slater</h2>
              <p><small>Real Estate Brooker</small></p>
              <p><a href="#">View Details</a></p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="probootstrap-card probootstrap-person text-left">
            <div class="probootstrap-card-media">
              <img src="img/person_2.jpg" class="img-responsive" alt="Free HTML5 Template by uicookies.com">
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading mb0">James Butterly</h2>
              <p><small>Buying Agent</small></p>
              <p><a href="#">View Details</a></p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="probootstrap-card probootstrap-person text-left">
            <div class="probootstrap-card-media">
              <img src="img/person_3.jpg" class="img-responsive" alt="Free HTML5 Template by uicookies.com">
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading mb0">James Smith</h2>
              <p><small>Real Estate Brooker</small></p>
              <p><a href="#">View Details</a></p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="probootstrap-card probootstrap-person text-left">
            <div class="probootstrap-card-media">
              <img src="img/person_4.jpg" class="img-responsive" alt="Free HTML5 Template by uicookies.com">
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading mb0">Chris White</h2>
              <p><small>Selling Agent</small></p>
              <p><a href="#">View Details</a></p>
            </div>
          </div>
        </div>

        <div class="col-md-3 col-sm-6">
          <div class="probootstrap-card probootstrap-person text-left">
            <div class="probootstrap-card-media">
              <img src="img/person_3.jpg" class="img-responsive" alt="Free HTML5 Template by uicookies.com">
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading mb0">James Smith</h2>
              <p><small>Real Estate Brooker</small></p>
              <p><a href="#">View Details</a></p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="probootstrap-card probootstrap-person text-left">
            <div class="probootstrap-card-media">
              <img src="img/person_4.jpg" class="img-responsive" alt="Free HTML5 Template by uicookies.com">
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading mb0">Chris White</h2>
              <p><small>Selling Agent</small></p>
              <p><a href="#">View Details</a></p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="probootstrap-card probootstrap-person text-left">
            <div class="probootstrap-card-media">
              <img src="img/person_1.jpg" class="img-responsive" alt="Free HTML5 Template by uicookies.com">
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading mb0">Jeremy Slater</h2>
              <p><small>Real Estate Brooker</small></p>
              <p><a href="#">View Details</a></p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="probootstrap-card probootstrap-person text-left">
            <div class="probootstrap-card-media">
              <img src="img/person_2.jpg" class="img-responsive" alt="Free HTML5 Template by uicookies.com">
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading mb0">James Butterly</h2>
              <p><small>Buying Agent</small></p>
              <p><a href="#">View Details</a></p>
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
</body>
</html>