<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Landy: Bootstrap 4 landing page template by Bootstrapious.com</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="resources/landy/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="resources/landy/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom Font Icons CSS-->
    <link rel="stylesheet" href="resources/landy/css/landy-iconfont.css">
    <!-- Google fonts - Open Sans-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
    <!-- owl carousel-->
    <link rel="stylesheet" href="resources/landy/vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="resources/landy/vendor/owl.carousel/assets/owl.theme.default.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="resources/landy/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="resources/landy/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<style type="text/css">
	section { background-size : cover; }
	#contentbody { width: 90%; margin: auto; }
	#tabStyle a { color: #053741; }
	#tabStyle a:hover { color: #5CC8DD; font-weight: bold; }
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	<header>
	<%@include file="../../../nav.jsp" %>
	</header>
	
	<!-- 값 보낼때 사용할 Mem_no -->
    <input type="hidden" id="mem_no" name="mem_no" value="${mem_no}">
	
	<section class="section section-light-blue">
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
		
		<div class="container">
		<hr>
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
    
	<footer class="main-footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6"><a href="#" class="brand">Landy</a>
            <ul class="contact-info list-unstyled">
              <li><a href="mailto:sales@landy.com">Sales@Landy.com</a></li>
              <li><a href="tel:123456789">+00 123 456 789</a></li>
            </ul>
            <ul class="social-icons list-inline">
              <li class="list-inline-item"><a href="#" target="_blank" title="Facebook"><i class="fa fa-facebook"></i></a></li>
              <li class="list-inline-item"><a href="#" target="_blank" title="Twitter"><i class="fa fa-twitter"></i></a></li>
              <li class="list-inline-item"><a href="#" target="_blank" title="Instagram"><i class="fa fa-instagram"></i></a></li>
              <li class="list-inline-item"><a href="#" target="_blank" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
            </ul>
          </div>
          <div class="col-lg-3 col-md-6">
            <h5>Selected Cases</h5>
            <ul class="links list-unstyled">
              <li> <a href="#">Guess Conntect</a></li>
              <li> <a href="#">Postly</a></li>
              <li> <a href="#">Iris Vor Arnim</a></li>
              <li> <a href="#">Yapital</a></li>
            </ul>
          </div>
          <div class="col-lg-3 col-md-6">
            <h5>Selected Cases</h5>
            <ul class="links list-unstyled">
              <li> <a href="#">Guess Conntect</a></li>
              <li> <a href="#">Postly</a></li>
              <li> <a href="#">Iris Vor Arnim</a></li>
              <li> <a href="#">Yapital</a></li>
            </ul>
          </div>
          <div class="col-lg-3 col-md-6">
            <h5>Selected Cases</h5>
            <ul class="links list-unstyled">
              <li> <a href="#">Guess Conntect</a></li>
              <li> <a href="#">Postly</a></li>
              <li> <a href="#">Iris Vor Arnim</a></li>
              <li> <a href="#">Yapital</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="copyrights">
        <div class="container">
          <div class="row">
            <div class="col-md-7">
              <p>&copy; 2018 gotThem.co.kr 스탑없으. All rights reserved.                        </p>
            </div>
            <div class="col-md-5 text-right">
              <p>Template By <a href="https://bootstrapious.com/" class="external">Bootstrapious</a>  </p>
              <!-- Please do not remove the backlink to Bootstrapious unless you support us at http://bootstrapious.com/donate. It is part of the license conditions. Thanks for understanding :) -->
            </div>
          </div>
        </div>
      </div>
    </footer>
    
    <!-- Javascript files-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"> </script>
    <script src="resources/landy/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="resources/landy/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="resources/landy/vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="resources/landy/js/front.js"></script>
    
  </body>
</html>
