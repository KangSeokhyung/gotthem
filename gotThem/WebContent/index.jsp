<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>I'm Stisla</title>
<link rel="stylesheet"
	href="resources/mainTemplate/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="resources/mainTemplate/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/mainTemplate/sweetalert/dist/sweetalert.css">
<link rel="stylesheet" href="resources/mainTemplate/css/stisla.css">
<style>
section{
background-size : cover;
}
</style>
</head>
<body>
	<header>
		<%@include file="nav.jsp"%>
	</header>
	<section class="hero bg-overlay" id="hero"
		data-bg="resources/mainTemplate/img/hero.jpeg">
		<div class="text">
			<h2>편의점 재고 검색 시스템 GOT THEM</h2>
			<h1>
				여기에서 간편하게 <span class="bold"></span>음식을 검색 해보세요.
			</h1>
			<section id="cvssearch" class="newsletter bg-gray">
				<div class="container text-center">
					<div class="form-holder">
						<form id="newsletterForm" action="#">
							<div class="form-group">
								<input type="text" name="search" id="email"
									placeholder="원하는 지역명 혹은 상품명을 검색해보세요 (ex. 강남역 김밥)">
								<button type="submit"
									class="btn btn-primary btn-gradient submit">검색</button>
							</div>
						</form>
					</div>
				</div>
			</section>
		</div>
	</section>

	<section class="padding bg-grey" id="blog">
		<div class="container">
			<h2 class="section-title">RECENTLY UPDATED STORE LIST</h2>
			<div class="section-body">
				<div class="row col-spacing">
					<div class="col-12 col-md-6 col-lg-4">
						<article class="card">
							<img class="card-img-top" src="img/news/img01.jpg"
								alt="Article Image">
							<div class="card-body">
								<div class="card-subtitle mb-2 text-muted">
									CU <a href="#">강남점</a> on August 10, 2017
								</div>
								<h4 class="card-title">
									<a href="#" data-toggle="read" data-id="1">강남역 10번 출구에서 도보
										3분 </a>
								</h4>
								<p class="card-text">항상 신선한 제품을 고객님들에게 제공하겠습니다 ^^*</p>
								<div class="text-right">
									<a href="#" class="card-more" data-toggle="read" data-id="1">상세
										정보 <i class="ion-ios-arrow-right"></i>
									</a>
								</div>
							</div>
						</article>
					</div>
					<div class="col-12 col-md-6 col-lg-4">
						<article class="card">
							<img class="card-img-top" src="img/news/img04.jpg"
								alt="Article Image">
							<div class="card-body">
								<div class="card-subtitle mb-2 text-muted">
									by <a href="#">John Doe</a> on August 10, 2017
								</div>
								<h4 class="card-title">
									<a href="#" data-toggle="read" data-id="1">Velit esse
										cillum dolore eu blos siur dropsida wedor</a>
								</h4>
								<p class="card-text">Mauris eu eros in metus elementum porta
									eget sed ligula. Praesent consequat, ipsum molestie
									pellentesque venenatis.</p>
								<div class="text-right">
									<a href="#" class="card-more" data-toggle="read" data-id="1">상세
										정보 <i class="ion-ios-arrow-right"></i>
									</a>
								</div>
							</div>
						</article>
					</div>
					<div class="col-12 col-md-6 col-lg-4">
						<article class="card">
							<img class="card-img-top" src="img/news/img02.jpg"
								alt="Article Image">
							<div class="card-body">
								<div class="card-subtitle mb-2 text-muted">
									by <a href="#">John Doe</a> on August 10, 2017
								</div>
								<h4 class="card-title">
									<a href="#" data-toggle="read" data-id="1">Excepteur sint
										as occaecat dros cupidatat non proident los</a>
								</h4>
								<p class="card-text">Mauris eu eros in metus elementum porta
									eget sed ligula. Praesent consequat, ipsum molestie
									pellentesque venenatis.</p>
								<div class="text-right">
									<a href="#" class="card-more" data-toggle="read" data-id="1">Read
										More <i class="ion-ios-arrow-right"></i>
									</a>
								</div>
							</div>
						</article>
					</div>
					<div class="col-12 col-md-6 col-lg-4">
						<article class="card">
							<img class="card-img-top" src="img/news/img05.jpg"
								alt="Article Image">
							<div class="card-body">
								<div class="card-subtitle mb-2 text-muted">
									by <a href="#">John Doe</a> on August 10, 2017
								</div>
								<h4 class="card-title">
									<a href="#" data-toggle="read" data-id="1">Sunt in ado
										culpa qui officia deserunt mollit anim id</a>
								</h4>
								<p class="card-text">Mauris eu eros in metus elementum porta
									eget sed ligula. Praesent consequat, ipsum molestie
									pellentesque venenatis.</p>
								<div class="text-right">
									<a href="#" class="card-more" data-toggle="read" data-id="1">Read
										More <i class="ion-ios-arrow-right"></i>
									</a>
								</div>
							</div>
						</article>
					</div>
					<div class="col-12 col-md-6 col-lg-4">
						<article class="card">
							<img class="card-img-top" src="img/news/img03.jpg"
								alt="Article Image">
							<div class="card-body">
								<div class="card-subtitle mb-2 text-muted">
									by <a href="#">John Doe</a> on August 10, 2017
								</div>
								<h4 class="card-title">
									<a href="#" data-toggle="read" data-id="1">Incididunt ut
										labore et labore dolore magna aliqua lorem</a>
								</h4>
								<p class="card-text">Mauris eu eros in metus elementum porta
									eget sed ligula. Praesent consequat, ipsum molestie
									pellentesque venenatis.</p>
								<div class="text-right">
									<a href="#" class="card-more" data-toggle="read" data-id="1">Read
										More <i class="ion-ios-arrow-right"></i>
									</a>
								</div>
							</div>
						</article>
					</div>
					<div class="col-12 col-md-6 col-lg-4">
						<article class="card">
							<img class="card-img-top" src="img/news/img06.jpg"
								alt="Article Image">
							<div class="card-body">
								<div class="card-subtitle mb-2 text-muted">
									by <a href="#">John Doe</a> on August 10, 2017
								</div>
								<h4 class="card-title">
									<a href="#" data-toggle="read" data-id="1">Ut enim ad minim
										veniam quis nostrud enim ad kruv</a>
								</h4>
								<p class="card-text">Mauris eu eros in metus elementum porta
									eget sed ligula. Praesent consequat, ipsum molestie
									pellentesque venenatis.</p>
								<div class="text-right">
									<a href="#" class="card-more" data-toggle="read" data-id="1">Read
										More <i class="ion-ios-arrow-right"></i>
									</a>
								</div>
							</div>
						</article>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="callout">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-12 col-md-8 text">
					<h3>저희와 제휴맺는 것에 관심이 있으신가요?</h3>
				</div>
				<div class="col-12 col-md-4 cta">
					<a href="#" class="btn btn-outline-primary"> 제휴페이지로 이동 </a>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<div class="container">
			<figure>
				<img src="resources/mainTemplate/img/logo-light.png" alt="Logo">
			</figure>
			<p>Copyright &copy; 2018 스탑없으</p>
			<p>
				Made with <i class="ion-heart"></i> By Kodinger
			</p>
		</div>
	</footer>

	<script src="resources/mainTemplate/js/jquery.min.js"></script>
	<script src="resources/mainTemplate/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/mainTemplate/js/jquery.easeScroll.js"></script>
	<script src="resources/mainTemplate/sweetalert/dist/sweetalert.min.js"></script>
	<script src="resources/mainTemplate/js/stisla.js"></script>
</body>
</html>