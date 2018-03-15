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
  </head>
<style type="text/css">
#releatedField { position: absolute; width: 63%; }
#releatedField a { color: #66615b; text-decoration: none; }
</style>  
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function relatedSearch() {
		$("#releatedField").html("");
		var search = $("#search").val();
		if(search != ""){
			$.ajax({
				url : "relatedSearch.gt",
				data : { "search" : search },
				type : "post",
				success : function(relatedData) {
					var ob = JSON.parse(relatedData);
					var innerHtml = "";
					$("#releatedField").html("");
					for (var i = 0; i < 5; i++) {
						if (typeof(ob["search" + i]) != "undefined") {
							innerHtml += "<div class='list-group'>"
									  + "<a href='searchList.gt?search=" +  ob["search" + i] 
									  + "&pageNo=1' class='list-group-item list-group-item-action'>" 
									  +  ob["search" + i] + "</a>";
				 					  + "</div>"
						}
					}
					
					$("#releatedField").append(innerHtml);
				},
				error : function(xmlHttpReq, status, error) {
				}
			});
		}
	}
</script>
  <body>
  <!-- START: header -->
   <%@include file="nav.jsp" %>
  <!-- END: header -->
  <section class="probootstrap-slider flexslider">
    <div class="probootstrap-wrap-banner">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-md-offset-2">

            <div class="probootstrap-home-search probootstrap-animate">
              <form action="searchList.gt" method="get">
              	<input type="hidden" name="pageNo" value="1">
                <h2 class="heading">즉석식품 재고 검색 사이트 GOT THEM</h2>
	            <div class="probootstrap-field-group">
					<div class="probootstrap-fields">
						<div class="form-field">
							<input type="text" class="form-control" name="search" autocomplete="off"
								id="search" onkeyup="relatedSearch()" required="required" 
								placeholder="예) 김밥, 강남역" />
						</div>
						<div id="releatedField"></div>
					</div>
					<input type="submit" class="btn btn-fill btn-success" value="검색">
				</div>
              </form>
            </div>

          </div>
        </div>
      </div>
    </div>
    <ul class="slides">
      <li style="background-image: url(resources/mainTemplate/img/slider_1.jpg);" class="overlay"></li>
      <li style="background-image: url(resources/mainTemplate/img/slider_4.jpg);" class="overlay"></li>
      <li style="background-image: url(resources/mainTemplate/img/slider_2.jpg);" class="overlay"></li>
    </ul>
  </section>
  <!-- END: slider  -->

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
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
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
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
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
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- END: section -->

  <section class="probootstrap-section">
    <div class="container">
      <div class="row heading">
        <h2 class="mt0 mb50 text-center">RECENTLY UPDATED STORE</h2>
      </div>
      <div class="row probootstrap-gutter10">
        <div class="col-md-6 col-sm-6">
          <a href="#" class="probootstrap-hover-overlay">
            <img src="resources/mainTemplate/img/cu.png" alt="Free Bootstrap Template by uicookies.com" class="img-responsive">
            <div class="probootstrap-text-overlay">
              <h3>씨유 강남점</h3>
            </div>
          </a>
        </div>
        <div class="col-md-6 col-sm-6">
          <a href="#" class="probootstrap-hover-overlay">
            <img src="resources/mainTemplate/img/gs25.jpg" alt="Free Bootstrap Template by uicookies.com" class="img-responsive">
            <div class="probootstrap-text-overlay">
              <h3>GS25 서울대입구점</h3>
            </div>
          </a>
        </div>
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-4 col-sm-6">
          <a href="#" class="probootstrap-hover-overlay">
            <img src="resources/mainTemplate/img/slider_3.jpg" alt="Free Bootstrap Template by uicookies.com" class="img-responsive">
            <div class="probootstrap-text-overlay">
              <h3>Brooklyn</h3>
              <p>300 Properties</p>
            </div>
          </a>
        </div>
        <div class="col-md-4 col-sm-6">
          <a href="#" class="probootstrap-hover-overlay">
            <img src="resources/mainTemplate/img/slider_4.jpg" alt="Free Bootstrap Template by uicookies.com" class="img-responsive">
            <div class="probootstrap-text-overlay">
              <h3>Chicago</h3>
              <p>268 Properties</p>
            </div>
          </a>
        </div>
        <div class="clearfix visible-sm-block"></div>
        <div class="col-md-4 col-sm-6">
          <a href="#" class="probootstrap-hover-overlay">
            <img src="resources/mainTemplate/img/slider_2.jpg" alt="Free Bootstrap Template by uicookies.com" class="img-responsive">
            <div class="probootstrap-text-overlay">
              <h3>Los Angeles</h3>
              <p>342 Properties</p>
            </div>
          </a>
        </div>
		
      </div>
    </div>
  </section>
  <!-- END: section -->

  <section class="probootstrap-section probootstrap-bg" style="background-image: url(resources/mainTemplate/img/partner.jpg); background-size:cover;">
    <div class="container text-center probootstrap-animate" data-animate-effect="fadeIn">
      <h2 class="heading">저희와 제휴를 원하시나요?</h2>
      <p class="sub-heading">많은 점주 분들이 <strong>GOT THEM</strong>과 제휴 한 이후로 매출이 상승했습니다.<br>
      당신도 이제 GOT THEM과 제휴를 맺고 급격한 매출상승을 이루어보세요! </p>
      <p><a href="storeIndex.st" class="btn btn-primary mb10">제휴페이지</a></p>
    </div>
  </section>


  <footer class="probootstrap-footer probootstrap-bg" style="background-image: url(img/slider_3.jpg)">
    <div class="container">
        <div class="col-md-6">
          <div class="probootstrap-footer-widget">
            <p>&copy; 2017 <a href="https://uicookies.com/">uiCookies:Haus</a>. Designed by <a href="https://uicookies.com/">uicookies.com</a> <br> Demo Photos from <a href="https://pixabay.com/">Pixabay</a> &amp; <a href="https://unsplash.com/">Unsplash</a></p>
          </div>
        </div>
        <div class="col-md-6">
          <div class="probootstrap-footer-widget right">
            <ul class="probootstrap-footer-social">
              <li><a href="#"><i class="icon-twitter"></i></a></li>
              <li><a href="#"><i class="icon-facebook"></i></a></li>
              <li><a href="#"><i class="icon-instagram2"></i></a></li>
            </ul>
          </div>
        </div>
    </div>
  </footer>
  <div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-chevron-thin-up"></i></a>
  </div>
  

  <script src="resources/mainTemplate/js/scripts.min.js"></script>
  <script src="resources/mainTemplate/js/main.min.js"></script>
  <script src="resources/mainTemplate/js/custom.js"></script>

  </body>

</html>

