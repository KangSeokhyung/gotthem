<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
	<title>편의점 재고 검색 - Got Them</title>
    <link href="resources/mainTemplate/bootstrap3/css/bootstrap.css" rel="stylesheet" />
    <link href="resources/mainTemplate/assets/css/ct-paper.css" rel="stylesheet"/>
    <link href="resources/mainTemplate/assets/css/demo.css" rel="stylesheet" />
    <link href="resources/mainTemplate/assets/css/examples.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<header>
	<%@include file="nav.jsp" %>
	</header>
    <div class="wrapper">
        <div class="landing-header" style="background-image: url('resources/mainTemplate/assets/paper_img/mainimage.jpg');">
            <div id="maincontent"class="container">
                <div class="motto">
                    <h2 >편의점 즉석식품 재고 검색 GOT THEM</h2>
                    <h3 >여기에서 원하는 상품을 검색해보세요</h3>
                    <br/>
			<div class="col-sm-7">
				<div class="form-group">
					<input type="text" value="" placeholder="Inactive" class="form-control" />
				    </div>
				</div>
                    <a class="btn btn-fill btn-danger">SEARCH</a>
                </div>
            </div>
        </div>
        <div class="main">
            <div class="section section-dark text-center landing-section">
                <div class="container">
                    <h2>RECENTLY UPDATED STORE LIST</h2>
                    <div class="col-md-4">
                        <div class="team-player">
                            <img src="../assets/paper_img/chet_faker_2.jpg" alt="Thumbnail Image" class="img-circle img-responsive">
                            <h5>씨유 강남점 <br /><small class="text-muted">서울</small></h5>
                            <p>You can write here details about one of your team members. You can give more details about what they do. Feel free to add some <a href="#">links</a> for people to be able to follow them outside the site.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="team-player">
                            <img src="../assets/paper_img/flume.jpg" alt="Thumbnail Image" class="img-circle img-responsive">
                            <h5>GS25 연남점 <br /><small class="text-muted">서울</small></h5>
                            <p>You can write here details about one of your team members. You can give more details about what they do. Feel free to add some <a href="#">links</a> for people to be able to follow them outside the site.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="team-player">
                            <img src="../assets/paper_img/banks.jpg" alt="Thumbnail Image" class="img-circle img-circle img-responsive">
                            <h5>세븐일레븐 서울대입구점 <br /><small class="text-muted">서울</small></h5>
                            <p>You can write here details about one of your team members. You can give more details about what they do. Feel free to add some <a href="#">links</a> for people to be able to follow them outside the site.</p>
                        </div>
                    </div>
                </div>
            </div>
						<div class="main">
								<div class="section section-nude section-with-space">
										<div class="container tim-container">
												<div class="row">
														<div class="col-md-8 col-md-offset-2 text-center">
																<h2>저희와 제휴를 맺고 싶으신가요?</h2>
																<p>많은 사장님들이 만족한 GOT THEM의 SERVICE를 당신도 누려보세요</p>
														</div>
														<div class="col-xs-8 col-xs-offset-2 col-sm-4 col-sm-offset-4 col-md-4 col-md-offset-4 download-area">
																<a href="storeIndex.st" class="btn btn-danger btn-fill btn-block btn-lg">APPLY</a>
														</div>
												</div>
										</div>
								</div>
						</div>

    <footer class="footer-demo section-dark">
        <div class="container">
            <nav class="pull-left">
                <ul>

                    <li>
                        <a href="http://www.creative-tim.com">
                            Creative Tim
                        </a>
                    </li>
                    <li>
                        <a href="http://blog.creative-tim.com">
                           Blog
                        </a>
                    </li>
                    <li>
                        <a href="http://www.creative-tim.com/product/rubik">
                            Licenses
                        </a>
                    </li>
                </ul>
            </nav>
            <div class="copyright pull-right">
                &copy; 2015, made with <i class="fa fa-heart heart"></i> by Creative Tim
            </div>
        </div>
    </footer>

</body>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/mainTemplate/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
<!--  Plugins -->
<script src="resources/mainTemplate/assets/js/ct-paper-checkbox.js"></script>
<script src="resources/mainTemplate/assets/js/ct-paper-radio.js"></script>
<script src="resources/mainTemplate/assets/js/bootstrap-select.js"></script>
<script src="resources/mainTemplate/assets/js/bootstrap-datepicker.js"></script>
<script src="resources/mainTemplate/assets/js/ct-paper.js"></script>

</html>
