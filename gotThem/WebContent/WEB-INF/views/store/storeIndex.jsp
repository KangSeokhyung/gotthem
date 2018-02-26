<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>편의점 재고 검색 포털 Got them</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/main.css">
<link href="https://fonts.googleapis.com/css?family=Work+Sans"
	rel="stylesheet">
<link rel="stylesheet" href="resources/indexTemplate/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/icomoon.css">
<link rel="stylesheet" href="resources/indexTemplate/css/animate.css">
<link rel="stylesheet" href="resources/indexTemplate/css/style.css">
<link rel="stylesheet" href="resources/landy/css/style.default.css" id="theme-stylesheet">
<link rel="stylesheet" href="resources/landy/css/custom.css">
</head>
<body>

	<aside class="probootstrap-aside js-probootstrap-aside">
		<a href="#"
			class="probootstrap-close-menu js-probootstrap-close-menu d-md-none"><span
			class="oi oi-arrow-left"></span> Close</a>
		<div class="probootstrap-site-logo probootstrap-animate"
			data-animate-effect="fadeInLeft">

			<a href="storeIndex.st" class="mb-2 d-block probootstrap-logo">GOTTHEM</a>
			<p class="mb-0">
				제휴 사이트 
			</p>
		</div>
		<div class="probootstrap-overflow">
			<nav class="probootstrap-nav">
				<ul>
					<li class="probootstrap-animate active"
						data-animate-effect="fadeInLeft"><a href="/storeIndex">Got them?</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="store.st">점포관리</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="stock.st">재고관리</a></li>
				<c:set var="sessionCheck"
					value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
				<c:choose>
					<c:when test="${sessionCheck eq null}">
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="login.st">로그인</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="join.st">제휴맺기</a></li>
					</c:when>
					<c:otherwise>
						<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a href="logout.gt" class="nav-link">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			</nav>
			<footer class="probootstrap-aside-footer probootstrap-animate"
				data-animate-effect="fadeInLeft">
				<p>
					&copy; 2018 <a href="/gotThem" target="_blank">스탑없으 X Got Them</a>.
					<br> All Rights Reserved.
				</p>
			</footer>
		</div>
	</aside>


	<main role="main" class="probootstrap-main js-probootstrap-main">
		<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="index.html">Aside</a></a>
		</div>
	</div>
	
 	 <!--   <section id="cvssearch" class="newsletter bg-gray">
      <div class="container text-center">
        <h2>편의점 신선식품 재고 검색</h2>
        <div class="form-holder">
          <form id="newsletterForm" action="#">
            <div class="form-group">
              <input type="text" name="search" id="email" placeholder="원하는 지역명 혹은 상품명을 검색해보세요 (ex. 강남역 김밥)">
              <button type="submit" class="btn btn-primary btn-gradient submit">Subscribe</button>
            </div>
          </form>
        </div>
      </div>
    </section>  -->

	 <section id="browser" class="browser">
      <div class="container">
        <div class="row d-flex justify-content-center"> 
          <div class="col-lg-8 text-center">
            <h2 class="h3 mb-5">제휴 신청은 어떻게 하는 것이죠?</h2>
            <div class="browser-mockup">
              <div id="nav-tabContent" class="tab-content">
                <div id="nav-first" role="tabpanel" aria-labelledby="nav-first-tab" class="tab-pane fade show active"><img src="img/preview-3.png" alt="..." class="img-fluid"></div>
                <div id="nav-second" role="tabpanel" aria-labelledby="nav-second-tab" class="tab-pane fade"><img src="img/preview-2.png" alt="..." class="img-fluid"></div>
                <div id="nav-third" role="tabpanel" aria-labelledby="nav-third-tab" class="tab-pane fade"><img src="img/preview-1.png" alt="..." class="img-fluid"></div>
              </div>
            </div>
          </div>
        </div>
        <div id="myTab" role="tablist" class="nav nav-tabs">
          <div class="row">
            <div class="col-md-4"><a id="nav-first-tab" data-toggle="tab" href="#nav-first" role="tab" aria-controls="nav-first" aria-expanded="true" class="nav-item nav-link active"> <span class="number">1</span>메인에서 먼저 검색을 해봅니다.</a></div>
            <div class="col-md-4"><a id="nav-second-tab" data-toggle="tab" href="#nav-second" role="tab" aria-controls="nav-second" class="nav-item nav-link"> <span class="number">2</span>원하는 상품을 선택하고 결제버튼을<br> 클릭합니다!</a></div>
            <div class="col-md-4"><a id="nav-third-tab" data-toggle="tab" href="#nav-third" role="tab" aria-controls="nav-third" class="nav-item nav-link"> <span class="number">3</span>마지막으로 결제 버튼을 누르고 상품을 찾으러 가면 끝!</a></div>
          </div>
        </div>
      </div>
    </section>
    
        <section id="features" class="features">
      <div class="container">
        <div class="row d-flex align-items-center">
          <div class="text col-lg-6 order-2 order-lg-1">
            <h4>당신과 함께 제휴를 해보고 싶습니다!</h4>
            <p>많은 점주들이 Got Them과 제휴 한 뒤 매출이 <strong>150% 이상 상승</strong>하였습니다. 당신도 원한다면 아래의 제휴 사이트에서 제휴신청을 해보세요!</p><a href="storeIndex.st" class="btn btn-primary btn-shadow btn-gradient">이동하기</a>
          </div>
          <div class="image col-lg-6 order-1 order-lg-2"><img src="img/feature-1.png" alt="..." class="img-fluid"></div>
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

	<script src="resources/indexTemplate/js/jquery-3.2.1.slim.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/indexTemplate/js/bootstrap.min.js"></script>
	<script src="resources/indexTemplate/js/owl.carousel.min.js"></script>
	<script src="resources/indexTemplate/js/jquery.waypoints.min.js"></script>
	<script src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script>
	<script src="resources/indexTemplate/js/main.js"></script>

</body>
</html>