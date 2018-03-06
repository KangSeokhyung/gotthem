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
<style type="text/css">
#releatedField { position: absolute; width: 63%; }
#releatedField a { color: #66615b; }
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
					var innerHtml = "<div class='list-group'>";
					for (var i = 0; i < 5; i++) {
						if (typeof(ob["search" + i]) != "undefined") {
							innerHtml += "<a href='searchList.gt?search=" +  ob["search" + i] 
									  + "&pageNo=1' class='list-group-item list-group-item-action'>" 
									  +  ob["search" + i] + "</a>";
						}
					}
					innerHtml += "</div>"
					$("#releatedField").append(innerHtml);
				},
				error : function(xmlHttpReq, status, error) {
					alert(xmlHttpReq + "리퀘스트\n" + status + "상태\n" + error + "에러\n");
				}
			});
		}
	}
</script>    
</head>
<body>

<!-- START: header -->
<div class="probootstrap-loader"></div>
<header>
<%@include file="nav.jsp" %>
</header>
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
											id="search" onkeyup="relatedSearch()" placeholder="예) 김밥, 강남역" />
									</div>
									<div id="releatedField"></div>
								</div>
								<input type="submit" class="btn btn-fill btn-danger" value="검색">
							</div>
						</form>
					</div>
						
				</div>
			</div>
		</div>
	</div>
	
	<ul class="slides">
		<li style="background-image: url(resources/mainTemplate/img/slider_1.jpg);"
			class="overlay"></li>
		<li style="background-image: url(resources/mainTemplate/img/slider_4.jpg);"
			class="overlay"></li>
		<li style="background-image: url(resources/mainTemplate/img/slider_2.jpg);"
			class="overlay"></li>
	</ul>
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
            <h2 class="probootstrap-card-heading">Award Winning Brooker</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
            <p><a href="#">Find out more</a></p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="probootstrap-card text-center probootstrap-animate">
          <div class="probootstrap-card-media svg-sm colored">
            <img src="resources/mainTemplate/img/flaticon/svg/005-new.svg" class="svg" alt="Free HTML5 Template by uicookies.com">
          </div>
          <div class="probootstrap-card-text">
            <h2 class="probootstrap-card-heading">New Houses</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
            <p><a href="#">Find out more</a></p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="probootstrap-card text-center  probootstrap-animate">
          <div class="probootstrap-card-media svg-sm colored">
            <img src="resources/mainTemplate/img/flaticon/svg/006-coin.svg" class="svg" alt="Free HTML5 Template by uicookies.com">
          </div>
          <div class="probootstrap-card-text">
            <h2 class="probootstrap-card-heading">Affordable Houses</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
            <p><a href="#">Find out more</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="probootstrap-section">
  <div class="container">
    <div class="row heading">
      <h2 class="mt0 mb50 text-center">RECENTLY UPDATED STORE</h2>
    </div>
    <div class="row probootstrap-gutter10">
      <div class="col-md-6 col-sm-6">
        <a href="#" class="probootstrap-hover-overlay">
          <img src="resources/mainTemplate/img/slider_2.jpg" alt="Free Bootstrap Template by uicookies.com" class="img-responsive">
          <div class="probootstrap-text-overlay">
            <h3>씨유 강남점</h3>
          </div>
        </a>
      </div>
      <div class="col-md-6 col-sm-6">
        <a href="#" class="probootstrap-hover-overlay">
          <img src="resources/mainTemplate/img/slider_1.jpg" alt="Free Bootstrap Template by uicookies.com" class="img-responsive">
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

  <section class="probootstrap-section probootstrap-bg" style="background-image: url(img/slider_2.jpg);">
    <div class="container text-center probootstrap-animate" data-animate-effect="fadeIn">
      <h2 class="heading">저희와 제휴를 원하시나요?</h2>
      <p class="sub-heading">많은 점주 분들이 <strong>GOT THEM</strong>과 제휴 한 이후로 매출이 상승했습니다.<br>
      당신도 이제 GOT THEM과 제휴를 맺고 급격한 매출상승을 이루어보세요! </p>
      <p><a href="storeIndex.st" class="btn btn-primary mb10">제휴페이지</a></p>
    </div>
  </section>
  <!-- END: section -->

  <section class="probootstrap-section probootstrap-section-lighter">
    <div class="container">
      <div class="row heading">
        <h2 class="mt0 mb50 text-center">Featured Listing</h2>
      </div>
      <div class="row">
        <div class="col-md-4 col-sm-6">
          <div class="probootstrap-card probootstrap-listing">
            <div class="probootstrap-card-media">
              <img src="img/slider_1.jpg" class="img-responsive" alt="Free HTML5 Template by uicookies.com">
              <a href="#" class="probootstrap-love"><i class="icon-heart"></i></a>
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading"><a href="#">3 Bed Room Property for Sale</a></h2>
              <div class="probootstrap-listing-location">
                <i class="icon-location2"></i> <span>360 W Wellington Chicago, IL 60657</span>
              </div>
              <div class="probootstrap-listing-category for-sale"><span>for sale</span></div>
              <div class="probootstrap-listing-price"><strong>$ 1,121,000</strong> / month</div>
            </div>
            <div class="probootstrap-card-extra">
              <ul>
                <li>
                  Area
                  <span>2400 m2</span>
                </li>
                <li>
                  Beds
                  <span>3</span>
                </li>
                <li>
                  Baths
                  <span>2</span>
                </li>
                <li>
                  Garages
                  <span>1</span>
                </li>
              </ul>
            </div>
          </div>
          <!-- END listing -->
        </div>
        <div class="col-md-4 col-sm-6">
          <div class="probootstrap-card probootstrap-listing">
            <div class="probootstrap-card-media">
              <img src="img/slider_2.jpg" class="img-responsive" alt="Free HTML5 Template by uicookies.com">
              <a href="#" class="probootstrap-love"><i class="icon-heart"></i></a>
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading"><a href="#">3 Bed Room Property for Sale</a></h2>
              <div class="probootstrap-listing-location">
                <i class="icon-location2"></i> <span>360 W Wellington Chicago, IL 60657</span>
              </div>
              <div class="probootstrap-listing-category for-sale"><span>for sale</span></div>
              <div class="probootstrap-listing-price"><strong>$ 250,000</strong> / month</div>
            </div>
            <div class="probootstrap-card-extra">
              <ul>
                <li>
                  Area
                  <span>2400 m2</span>
                </li>
                <li>
                  Beds
                  <span>3</span>
                </li>
                <li>
                  Baths
                  <span>2</span>
                </li>
                <li>
                  Garages
                  <span>1</span>
                </li>
              </ul>
            </div>
          </div>
          <!-- END listing -->
        </div>
        <div class="clearfix visible-sm-block"></div>
        <div class="col-md-4 col-sm-6">
          <div class="probootstrap-card probootstrap-listing">
            <div class="probootstrap-card-media">
              <img src="img/slider_3.jpg" class="img-responsive" alt="Free HTML5 Template by uicookies.com">
              <a href="#" class="probootstrap-love"><i class="icon-heart"></i></a>
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading"><a href="#">3 Bed Room Property for Sale</a></h2>
              <div class="probootstrap-listing-location">
                <i class="icon-location2"></i> <span>360 W Wellington Chicago, IL 60657</span>
              </div>
              <div class="probootstrap-listing-category for-rent"><span>for rent</span></div>
              <div class="probootstrap-listing-price"><strong>$ 60,000</strong> / month</div>
            </div>
            <div class="probootstrap-card-extra">
              <ul>
                <li>
                  Area
                  <span>2400 m2</span>
                </li>
                <li>
                  Beds
                  <span>3</span>
                </li>
                <li>
                  Baths
                  <span>2</span>
                </li>
                <li>
                  Garages
                  <span>1</span>
                </li>
              </ul>
            </div>
          </div>
          <!-- END listing -->
        </div>
        <div class="col-md-4 col-sm-6">
          <div class="probootstrap-card probootstrap-listing">
            <div class="probootstrap-card-media">
              <img src="img/slider_4.jpg" class="img-responsive" alt="Free HTML5 Template by uicookies.com">
              <a href="#" class="probootstrap-love"><i class="icon-heart"></i></a>
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading"><a href="#">3 Bed Room Property for Sale</a></h2>
              <div class="probootstrap-listing-location">
                <i class="icon-location2"></i> <span>360 W Wellington Chicago, IL 60657</span>
              </div>
              <div class="probootstrap-listing-category for-sale"><span>for sale</span></div>
              <div class="probootstrap-listing-price"><strong>$ 125,000</strong> / month</div>
            </div>
            <div class="probootstrap-card-extra">
              <ul>
                <li>
                  Area
                  <span>2400 m2</span>
                </li>
                <li>
                  Beds
                  <span>3</span>
                </li>
                <li>
                  Baths
                  <span>2</span>
                </li>
                <li>
                  Garages
                  <span>1</span>
                </li>
              </ul>
            </div>
          </div>
          <!-- END listing -->
        </div>
        <div class="clearfix visible-sm-block"></div>
        <div class="col-md-4 col-sm-6">
          <div class="probootstrap-card probootstrap-listing">
            <div class="probootstrap-card-media">
              <img src="img/slider_2.jpg" class="img-responsive" alt="Free HTML5 Template by uicookies.com">
              <a href="#" class="probootstrap-love"><i class="icon-heart"></i></a>
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading"><a href="#">3 Bed Room Property for Sale</a></h2>
              <div class="probootstrap-listing-location">
                <i class="icon-location2"></i> <span>360 W Wellington Chicago, IL 60657</span>
              </div>
              <div class="probootstrap-listing-category for-sale"><span>for sale</span></div>
              <div class="probootstrap-listing-price"><strong>$ 125,000</strong> / month</div>
            </div>
            <div class="probootstrap-card-extra">
              <ul>
                <li>
                  Area
                  <span>2400 m2</span>
                </li>
                <li>
                  Beds
                  <span>3</span>
                </li>
                <li>
                  Baths
                  <span>2</span>
                </li>
                <li>
                  Garages
                  <span>1</span>
                </li>
              </ul>
            </div>
          </div>
          <!-- END listing -->
        </div>
        <div class="col-md-4 col-sm-6">
          <div class="probootstrap-card probootstrap-listing">
            <div class="probootstrap-card-media">
              <img src="img/slider_1.jpg" class="img-responsive" alt="Free HTML5 Template by uicookies.com">
              <a href="#" class="probootstrap-love"><i class="icon-heart"></i></a>
            </div>
            <div class="probootstrap-card-text">
              <h2 class="probootstrap-card-heading"><a href="#">3 Bed Room Property for Sale</a></h2>
              <div class="probootstrap-listing-location">
                <i class="icon-location2"></i> <span>360 W Wellington Chicago, IL 60657</span>
              </div>
              <div class="probootstrap-listing-category for-sale"><span>for sale</span></div>
              <div class="probootstrap-listing-price"><strong>$ 125,000</strong> / month</div>
            </div>
            <div class="probootstrap-card-extra">
              <ul>
                <li>
                  Area
                  <span>2400 m2</span>
                </li>
                <li>
                  Beds
                  <span>3</span>
                </li>
                <li>
                  Baths
                  <span>2</span>
                </li>
                <li>
                  Garages
                  <span>1</span>
                </li>
              </ul>
            </div>
          </div>
          <!-- END listing -->
        </div>
      </div>
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

  <section class="probootstrap-section">
    <div class="container">
      <div class="row heading">
        <h2 class="mt0 mb50 text-center">Our Services</h2>
      </div>
      <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 probootstrap-animate">
          <div class="service text-center">
            <div class="icon"><i class="icon-list2"></i></div>
            <h2 class="heading">Property Listing</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 probootstrap-animate">
          <div class="service text-center">
            <div class="icon"><i class="icon-power-cord"></i></div>
            <h2 class="heading">Property Management</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
          </div>
        </div>
        <div class="clearfix visible-sm-block"></div>
        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 probootstrap-animate">
          <div class="service text-center">
            <div class="icon"><i class="icon-price-tag2"></i></div>
            <h2 class="heading">Renting Properties</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
          </div>
        </div>
        <div class="clearfix visible-lg-block visible-md-block"></div>
        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 probootstrap-animate">
          <div class="service text-center">
            <div class="icon"><i class="icon-direction"></i></div>
            <h2 class="heading">Selling Properties</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
          </div>
        </div>
        <div class="clearfix visible-sm-block"></div>
        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 probootstrap-animate">
          <div class="service text-center">
            <div class="icon"><i class="icon-home3"></i></div>
            <h2 class="heading">Brook A Property</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 probootstrap-animate">
          <div class="service text-center">
            <div class="icon"><i class="icon-magnifying-glass"></i></div>
            <h2 class="heading">Search Property</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
          </div>
        </div>
        <div class="clearfix visible-lg-block visible-md-block"></div>
      </div>
    </div>
  </section>

  <!-- END: section -->

  <section class="probootstrap-section probootstrap-section-lighter">
    <div class="container">
      <div class="row heading">
        <h2 class="mt0 mb50 text-center">Our Agents</h2>
      </div>
      <div class="row">
        <div class="col-md-3">
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
        <div class="col-md-3">
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
        <div class="col-md-3">
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
        <div class="col-md-3">
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
      </div>
    </div>
  </section>

  <footer class="probootstrap-footer probootstrap-bg" style="background-image: url(img/slider_3.jpg)">
    <div class="container">
      <div class="row mb60">
        <div class="col-md-3">
          <div class="probootstrap-footer-widget">
            <h4 class="heading">About Haus.</h4>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
            <p><a href="#">Read more...</a></p>
          </div> 
        </div>
        <div class="col-md-3">
          <div class="probootstrap-footer-widget probootstrap-link-wrap">
            <h4 class="heading">Quick Links</h4>
            <ul class="stack-link">
              <li><a href="#">Property Listing</a></li>
              <li><a href="#">Rent Properties</a></li>
              <li><a href="#">Sell Properties</a></li>
              <li><a href="#">Agents</a></li>
              <li><a href="#">Testimonial</a></li>
            </ul>
          </div>
        </div>
        <div class="col-md-3">
          <div class="probootstrap-footer-widget">
            <h4 class="heading">Popular Cities</h4>
            <ul class="stack-link">
              <li><a href="#">New York <small>(320 properties)</small></a></li>
              <li><a href="#">San Francisco <small>(294 properties)</small></a></li>
              <li><a href="#">Brooklyn <small>(300 properties)</small></a></li>
              <li><a href="#">Chicago <small>(268 properties)</small></a></li>
              <li><a href="#">Los Angeles <small>(342 properties)</small></a></li>
            </ul>
          </div> 
        </div>
        <div class="col-md-3">
          <div class="probootstrap-footer-widget probootstrap-link-wrap">
            <h4 class="heading">Subscribe</h4>
            <p>Far far away behind the word mountains far from.</p>
            <form action="#">
              <div class="form-field">
                <input type="text" class="form-control" placeholder="Enter your email">
                <button class="btn btn-subscribe">Send</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="row copyright">
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
