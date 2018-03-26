<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.setAttribute("basketFoward", "/gotThem/listBasket.gt");
%>
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
    <link rel="stylesheet" href="resources/autocomplete/auto-complete.css">
    
  </head>
<style type="text/css">
#marginChg { 
	padding-bottom: 10px; 
	margin-top: 340px; 
	background: none;
	-webkit-box-shadow: none;
	box-shadow: none;
}
#btnColor { background: #fe490f; }
</style>  
<script src="resources/autocomplete/auto-complete.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$().ready(function() {
		var msg = '${resultMsg}';
		var str;
		if (msg != null) {
			if (msg == 'fail1') {
				str = "현재 비밀번호가 맞지 않습니다. 다시 확인해주세요";
			} else if (msg == 'fail2') {
				str = "새로운 비밀번호를 정확히 입력하여 주세요";
			} else if (msg == 'fail3') {
				str = "비밀번호 변경이 실패하였습니다";
			} else if (msg == 'success') {
				str = "비밀번호 변경이 성공하였습니다.";
			} else if (msg == 'DelSuccess') {
				str = "회원탈퇴 성공하였습니다. 이용해 주셔서 감사합니다";
			} else if (msg == 'DelFail') {
				str = "회원탈퇴에 실패했습니다. 비밀번호를 확인해주세요";
			}
			if (str != null)
				alert(str);
		}
	});
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

            <div id="marginChg" class="probootstrap-home-search probootstrap-animate">
              <form action="searchList.gt" method="get">
              	<input type="hidden" name="pageNo" value="1">
	            <div class="probootstrap-field-group">
					<div class="probootstrap-fields">
						<div class="form-field">
							<input type="text" class="form-control" id="autoComplete" name="search"
								required="required"
								placeholder="예) 도시락, 서초, 강남  김밥" />
						</div>
					</div>
					<input type="submit" id="btnColor" class="btn btn-fill btn-success" value="검색">
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
  <script type="text/javascript">
	  var ac = new autoComplete({
		    selector: "#autoComplete",
		  	minChars: 0,
		    source: function(term, suggest){
		    	term = term.toLocaleUpperCase();
		    	$.ajax({
					url : "relatedSearch.gt",
					data : { "search" : term },
					type : "post",
					success : function(relatedData) {
						if (term != "") {
							var suggestions = [];	
							var ob = JSON.parse(relatedData);
							for (var i = 0; i < 5; i++) {
								if (typeof(ob["search" + i]) != "undefined") {
									suggestions.push(ob["search" + i]);
								}
							}
							suggest(suggestions);
						}
					},
					error : function(xmlHttpReq, status, error) {
					}
				});
		     }
	  });  
  </script>

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
      <p><a href="login.st" class="btn btn-primary mb10">제휴페이지</a></p>
    </div>
  </section>


  <footer class="probootstrap-footer probootstrap-bg" style="height:100px">
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

