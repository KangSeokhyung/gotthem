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
	<link rel="stylesheet" href="resources/autocomplete/auto-complete.css">
	
    <!--[if lt IE 9]>
      <script src="resources/mainTemplate/js/vendor/html5shiv.min.js"></script>
      <script src="resources/mainTemplate/js/vendor/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
#marginChg { 
	padding-bottom: 10px; 
	margin-top: 200px; 
	background: none;
	-webkit-box-shadow: none;
	box-shadow: none;
}
#btnColor { background: #fe490f; }
</style>  
<script src="resources/autocomplete/auto-complete.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function addBasket() {
		if ("${productInfo.pro_stock }" < 1) {
			alert("해당 상품이 매진되었습니다.");
			return false;
		}
		
		var pro_stock = $("#pro_stock").val();
		$.ajax({
			url : "insertBasket.gt",
			data : { 
				"bas_procode" : "${productInfo.pro_code }", 
				"bas_proname" : "${productInfo.pro_name }",
				"bas_memno" : "${productInfo.pro_memno }",
				"bas_procategory" : "${productInfo.pro_category }",
				"bas_prostock" : pro_stock,
				"bas_proprice" : "${productInfo.pro_price }",
				"bas_proimg" : "${productInfo.pro_img }"
			},
			type : "post",
			success : function(check) {
				$("#navbar").load("nav.jsp");
				if (confirm("장바구니에 추가됐습니다. \n장바구니로 가시겠으면 '확인',\n계속 쇼핑하시겠으면 '취소' 를 클릭해주세요.")) {
					location.href="listBasket.gt";
				} else {
					return false;
				}
			},
			error : function(xmlHttpReq, status, error) {
				alert("오류가 발생했습니다. 시스템 관리자에게 문의해주세요.");
			}
		});
	}
	
	function selectCount(idx) {
		var pro_stock = $("#pro_stock").val();
		var totalPrice = $("#totalPrice").text() * 1;
		if (idx == 1) {
			if (pro_stock == 1) {
				return false;
			}
			$("#pro_stock").val(pro_stock * 1 - 1);
			totalPrice -= ${productInfo.pro_price };
			$("#totalPrice").text(totalPrice);
		} else {
			if (pro_stock >= ${productInfo.pro_stock }) {
				alert("상품수량보다 적게 입력이 가능합니다.");
				return false;
			}
			$("#pro_stock").val(pro_stock * 1 + 1);
			totalPrice += ${productInfo.pro_price };
			$("#totalPrice").text(totalPrice);
		}
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
<section class="probootstrap-slider flexslider" style="height:400px">
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

<section class="probootstrap-section">
  <div class="container">
    <div class="row probootstrap-gutter10">
    	<div class="col-sm-4 col-sm-offset-1">
    		<img src="/img/${productInfo.pro_img }" height="350px" width="280px" title="상품이미지" alt="상품이미지">
    	</div>
    	<div class="col-sm-6 col-sm-offset-1">
    		<h1>${productInfo.pro_name }</h1>
    		<hr style="border-color: black">
    		<h3>상품 가격 : ${productInfo.pro_price }</h3>
    		<hr>
    		상품 카테고리 : ${productInfo.pro_category }
    		<hr>
    		상품 설명 : ${productInfo.pro_comment }
    		<hr>
    		상품 수량 : ${productInfo.pro_stock }
    		<hr>
    		<div style="border: 1px solid #E9E7E7; padding: 15px; background: #FBF9F9">
	    		선택 수량 : 
	    		<input type="button" id="plusBtn" onclick="selectCount(1)" value="-">
	    		<input type="text" id="pro_stock" name="pro_stock" value="1">
	    		<input type="button" id="minusBtn" onclick="selectCount(2)" value="+"><br><br>
	    		<label>합계 가격 : 
	    		<span id="totalPrice">${productInfo.pro_price }</span></label>
	    	</div>
			<hr>	    	
    		<input type="button" class="btn btn-info" onclick="" value="결제">
    		<input type="button" class="btn btn-info" onclick="addBasket()" value="장바구니">
    		<input type="button" class="btn btn-warning" onclick="history.back();" value="이전">
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
