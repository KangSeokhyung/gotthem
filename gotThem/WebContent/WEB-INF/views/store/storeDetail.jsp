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
#tabStyle a:hover { color: #5CC8DD; font-weight: bold; }
</style>  
<script type="text/javascript">
	$(document).on('click', '#upCount', function(){
		var pro_stock = $(this).prev().val() * 1 + 1;
		$(this).prev().val(pro_stock);
		
		var pro_price = $(this).parents("td").next("td").text();
		var pro_price_fin = $(this).parents().siblings("#pro_stock_fin").val();
		
		$(this).parents("td").next("td").text("");
		$(this).parents("td").next("td").text(pro_price * 1 + pro_price_fin * 1);
		$("#pro_price").val(pro_price);
		
		var totalPay = $("#totalPay").val();
		$("#totalPay").val(totalPay*1 + pro_price_fin*1);
	});
	
	$(document).on('click', '#downCount', function(){
		var pro_stock = $(this).prev().prev().val() - 1;
		$(this).prev().prev().val(pro_stock);
		
		var pro_price = $(this).parents("td").next("td").text();
		var pro_price_fin = $(this).parents().siblings("#pro_stock_fin").val();
		
		$(this).parents("td").next("td").text("");
		$(this).parents("td").next("td").text(pro_price * 1 - pro_price_fin * 1);
		$("#pro_price").val(pro_price);
		
		var totalPay = $("#totalPay").val();
	});
	
	$(function(){
		var idCount = 1;
		var rowAddDel = $("#searchTemplate tr").click(function(){
			
			var tr = $(this);
			var td = tr.children('td');
			
			var pro_name = td.eq(0).text();
			var pro_stock = td.eq(2).text();
			var pro_price = td.eq(3).text();
				
			var exist = "no";
			
			$("#mySelectField tr").each(function() {
				var myPro_name = $(this).find("#myPro_name").html();
				if (pro_name == myPro_name) {
					exist = "yes";
					return false;
				} 
			});
			
			if (exist == "yes") {
				alert("이미 존재하는 옵션입니다.");
			} else {
				/*---------------------------------------------------
				*	document on과는 다르게 가능한 소스
				*	$("#upCount"+idCount).unbind("click");
				*	$("#upCount"+idCount).bind("click", function(){
				*		alert("테스트");
				*		var pro_stock = $(this).prev().val();
				*		$(this).prev().val(pro_stock * 1 + 1);
				*	}); 
				-----------------------------------------------------*/
				
				$("#mySelectField").append(
					"<tr><input type='hidden' name='pro_name' value='" + pro_name + "'>" +
					"<input type='hidden' id='pro_price' name='pro_price' value='" + pro_price + "'>" +
					"<input type='hidden' id='pro_stock_fin' value='" + pro_price + "'>" +
					"<td id='myPro_name'>" + pro_name + "</td><td><input type='text' id='pro_stock' value='1'>" +
					"<input type='button' id='upCount' value='증가'> <input type='button' id='downCount' value='감소'>" + 
					"</td><td id='myPro_price' class='myPro_price'>" + pro_price + "</td>" +
					"<td><input type='button' id='deleteRow' value='x'></td></tr>"
				);
				
				var totalPay = $("#totalPay").val();
				$("#totalPay").val(totalPay*1 + pro_price*1);
			}
		});
	}); 
	
	$(document).on('click', '#deleteRow', function(){
		var tr = $(this).parents();
		
		var pro_price = $(this).parents().siblings("#myPro_price").text();
		alert(pro_price);
		
		var totalPay = $("#totalPay").val();
		$("#totalPay").val(totalPay*1 - pro_price*1);
		
	});
	
	function productSearch() {
		rowAddDel();
		var productSearch = $("#productSearch").val();
		var mem_no = $("#mem_no").val();
		$.ajax({
			url : "productSearch.gt",
			data : { "productSearch" : productSearch, "mem_no" : mem_no },
			type : "post",
			success : function(searchData) {
				$("#searchTemplate").html("");
				var ob = JSON.parse(searchData);
				$.each(ob, function(index, column){
					$("#searchTemplate").append(
						"<input type='hidden' name='pro_code' id='pro_code' value='"+ column.pro_code +"'>"
					);
					$("#searchTemplate").append(
						"<tr><td>" + column.pro_name +"</td><td>" + column.pro_category + "</td>" +
						"<td>" + column.pro_stock + "</td><td>" + column.pro_price + "</td></tr>"
					);
				});
			},
			error : function(xmlHttpReq, status, error) {
				alert(xmlHttpReq + "리퀘스트\n" + status + "상태\n" + error + "에러\n");
			}
		});
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
		$('#lunchbox').html(data);
	});
	
	$.get("productList.gt", { "category" : "김밥", "mem_no" : "${mem_no}" }, function(data) {
		$('#kimbob').html(data);
	});
	
	$.get("productList.gt", { "category" : "샌드위치", "mem_no" : "${mem_no}" }, function(data) {
		$('#sandwich').html(data);
	});
	
	$.get("productList.gt", { "category" : "기타", "mem_no" : "${mem_no}" }, function(data) {
		$('#etc').html(data);
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
