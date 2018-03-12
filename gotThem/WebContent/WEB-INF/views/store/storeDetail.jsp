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
#contentbody { width: 90%; margin: auto; }
#tabStyle a { color: #053741; }
#tabStyle a:hover { color: #5CC8DD; font-weight: bold; }row 클릭 시 checkbox
</style>  
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">

	$(document).on("click", "#statusCheck tr", function(event){
		if(event.target.nodeName.toLowerCase() == 'td') {
			var checkbox = $(this).find('td:first-child :checkbox');
			if (checkbox.is(":checked")) {
				checkbox.prop("checked", false);
			} else {
				checkbox.prop("checked", true);
			}
		}
	});
		
	function addBasket(pro_code, pro_name, pro_memno, pro_category, pro_stock, pro_price, pro_img) {
		$.ajax({
			url : "insertBasket.gt",
			data : { 
				"bas_procode" : pro_code, 
				"bas_proname" : pro_name,
				"bas_memno" : pro_memno,
				"bas_procategory" : pro_category,
				"bas_prostock" : pro_stock,
				"bas_proprice" : pro_price,
				"bas_proimg" : pro_img
			},
			type : "post",
			success : function(check) {
				alert("장바구니에 추가되었습니다.");
			},
			error : function(xmlHttpReq, status, error) {
				alert("오류가 발생했습니다. 시스템 관리자에게 문의해주세요.");
			}
		});
	}
	
	function selectAddBasket() {
		var checkList = [];
		
		$("input[name='statusCheck']:checked").each(function(i) {
			checkList.push($(this).val());
		});
		
		
		
		/* $.ajax({
			url : "selectAddBasket.gt",
			type : "post",
			data : { "checkList" : checkList },
			success : function(result){
				if (confirm("장바구니 페이지로 이동 하시겠습니까?")) {
					location.href="./orderList.gt";	
				} else {
					return false;
				}
			},
			error : function(xmlHttpReq, status, error) {
				alert("오류가 발생했습니다. 시스템 관리자에게 문의해주세요.");
			}
		}); */
	}
</script>
</head>
<body>
  
<div class="probootstrap-loader"></div>
<!-- START: header -->
<header>
<%@include file="../../../nav.jsp" %>
</header>
<!-- END: header -->

	<!-- 값 보낼때 사용할 Mem_no -->
	<input type="hidden" id="mem_no" name="mem_no" value="${mem_no}">

<section class="probootstrap-section probootstrap-section-lighter">
  <div class="container">
    <div class="row">
    	<div class="col-sm-12">
			<h1>${storeInfo.sto_name }</h1>
			<hr>
			<h2>
				<b>소개글</b>
			</h2>
			<p>소개글 값 테스트 : ${storeInfo.sto_comment }</p>
			<br>
			<h2>
				<b>아래쪽에 이미지가 출력된다.</b>
			</h2>
			<p>이미지 값 테스트 : ${storeInfo.sto_img }</p>
		</div>
    </div>
  </div>
</section>

<section class="probootstrap-section">
  <div class="container">
    <div class="col-sm-12">
    	
    </div>
    <div class="row probootstrap-gutter10">
      <div class="col-sm-12">
		<ul id="tabStyle" class="nav nav-tabs" data-tabs="tabs">
			<li class="active"><a href="#lunchbox" class="nav-link" data-toggle="tab">도시락</a></li>
			<li class="nav-item"><a href="#kimbob" class="nav-link" data-toggle="tab">김밥</a></li>
			<li class="nav-item"><a href="#sandwich" class="nav-link" data-toggle="tab">샌드위치</a></li>
			<li class="nav-item"><a href="#etc" class="nav-link" data-toggle="tab">기타</a></li>
        </ul>
        <div class="tab-content text-center">
			<div class="tab-pane active" id="lunchbox"></div>
			<div class="tab-pane" id="kimbob"></div>
			<div class="tab-pane" id="sandwich"></div>
			<div class="tab-pane" id="etc"></div>
        </div>
      </div>
    </div>
  </div>
</section>

<script type="text/javascript">
	$.get("productList.gt", { "category" : "도시락", "mem_no" : "${mem_no}" }, function(data) {
		$("#lunchbox").html(data);
	});
	
	$.get("productList.gt", { "category" : "김밥", "mem_no" : "${mem_no}" }, function(data) {
		$("#kimbob").html(data);
	});
	
	$.get("productList.gt", { "category" : "샌드위치", "mem_no" : "${mem_no}" }, function(data) {
		$("#sandwich").html(data);
	});
	
	$.get("productList.gt", { "category" : "기타", "mem_no" : "${mem_no}" }, function(data) {
		$("#etc").html(data);
	});
</script>

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
