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
#tabStyle a { color: #053741; }
#tabStyle a:hover { color: #5CC8DD; font-weight: bold; }
</style>  
<script src="resources/autocomplete/auto-complete.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function(){
		function getCookie(name) {
			var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
			return value? value[2] : null;
		};
		
		function deleteCookie(name) {
			var expireDate = new Date();
			  
			expireDate.setDate( expireDate.getDate() - 1 );
			document.cookie = name + "= " + "; expires=" + expireDate.toGMTString() + "; path=/;";
		}
		
		if (getCookie("confirm") == "OK") {
			deleteCookie("confirm");
			alert("장바구니에 추가됐습니다.");
		} else if (getCookie("confirm") == "OK2") {
			deleteCookie("confirm");
			if (confirm("장바구니에 추가되었습니다.\n장바구니 페이지로 이동 하시겠습니까?")) {
				location.href="listBasket.gt";	
			} else {
				return false;
			}
		}
	});
	
	$(document).on("click", "#rowCheck tr", function(event){
		if(event.target.nodeName.toLowerCase() == "td") {
			var checkbox = $(this).find("td:nth-child(5) :checkbox");
			
			var stock = $(this).find("td:nth-child(3)");
			if (stock.text()*1 == 0) {
				alert("해당 상품이 매진되어 선택할 수 없습니다.");
				return false;
			}
			
			if (checkbox.is(":checked")) {
				checkbox.prop("checked", false);
			} else {
				checkbox.prop("checked", true);
			}
		}
	});
		
	function addBasket(pro_code, pro_name, pro_memno, pro_category, pro_price, pro_img) {
		$.ajax({
			url : "insertBasket.gt",
			data : { 
				"bas_procode" : pro_code, 
				"bas_proname" : pro_name,
				"pro_memno" : pro_memno,
				"bas_procategory" : pro_category,
				"bas_prostock" : 1,
				"bas_proprice" : pro_price,
				"bas_proimg" : pro_img
			},
			type : "post",
			success : function(check) {
				alert("장바구니에 추가되었습니다.");
				$("#navbar").load("nav.jsp");
			},
			error : function(xmlHttpReq, status, error) {
				alert("오류가 발생했습니다. 시스템 관리자에게 문의해주세요.");
			}
		});
	}
	
	function selectAddBasket() {
		var checkList = [];
		var checkOne = "";
		
		if ($("input[name='statusCheck']:checked").length == 0) {
			alert("장바구니에 담을 상품을 선택해주세요.");
			return false;
		} else if ($("input[name='statusCheck']:checked").length == 1) {
			checkOne = $("input[name='statusCheck']:checked").val();
		}
		
		$("input[name='statusCheck']:checked").each(function(i) {
			checkList.push($(this).val());
		});
		
		$.ajax({
			url : "selectAddBasket.gt",
			type : "post",
			data : { "checkList" : checkList, "checkOne" : checkOne },
			success : function(result){
				$("#navbar").load("nav.jsp");
				if (confirm("장바구니에 추가되었습니다.\n장바구니 페이지로 이동 하시겠습니까?")) {
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
	
	function movedetail(pro_code) {
		location.href="productDetail.gt?pro_code=" + pro_code;
	}
	
	function loginForward(pro_code) {
		alert("로그인 후 이용하실 수 있습니다.\n로그인 창으로 이동합니다.");
		location.href="login.gt?prevUrl=detailForward.gt&mem_no=${mem_no}&pro_code=" + pro_code;
	}
	
	function loginForward2() {
		alert("로그인 후 이용하실 수 있습니다.\n로그인 창으로 이동합니다.");
		location.href="login.gt?prevUrl=listBasket.gt";
	}
	
	function loginForward3() {
		var checkList = [];
		var checkOne = "";
		
		if ($("input[name='statusCheck']:checked").length == 0) {
			alert("장바구니에 담을 상품을 선택해주세요.");
			return false;
		} else if ($("input[name='statusCheck']:checked").length == 1) {
			checkOne = $("input[name='statusCheck']:checked").val();
		}
		
		$("input[name='statusCheck']:checked").each(function(i) {
			checkList.push($(this).val());
		});
		
		$.ajax({
			url : "sessionSet.gt",
			type : "post",
			data : { "checkList" : checkList, "checkOne" : checkOne },
			success : function(){
				alert("로그인 후 이용하실 수 있습니다.\n로그인 창으로 이동합니다.");
				location.href="login.gt?prevUrl=selectDetailForward.gt";
			},
			error : function(xmlHttpReq, status, error) {
				alert("오류가 발생했습니다. 시스템 관리자에게 문의해주세요.");
			}
		}); 
	}
	
</script>
</head>
<body>
  
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
  <div class="row">
    <div class="col-xs-12 col-sm-12">
    	<h1><strong>${storeInfo.sto_name }</strong></h1>
		<hr>
		<c:choose>
			<c:when test="${sessionCheck eq null}">
				<input type="button" onclick="loginForward2();" class="btn btn-info" value="장바구니 가기">
			</c:when>
			<c:otherwise>
				<input type="button" onclick="location.href='login.gt?prevUrl=listBasket.gt'" class="btn btn-info" value="장바구니 가기">
			</c:otherwise>
		</c:choose>
    	<input type="button" onclick="history.back()" class="btn btn-warning" value="이전">
    	<br><br>
    </div>
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

<section class="probootstrap-section probootstrap-section-lighter">
  <div class="container">
    <div class="row">
    	<div class="col-sm-6">
			<img src="/img/store/${storeInfo.sto_img }" height="350px" width="550px" title="편의점 이미지">
		</div>
		<div class="col-sm-6">
			<h4><strong>${storeInfo.sto_name }</strong></h4>
			<hr>
			매장주소 : ${storeInfo.mem_address } <br>
			매장번호 : ${storeInfo.mem_phone } <br>
			${storeInfo.sto_comment } <br>
			맛있는 슈퍼계란딸기오이 굳굳 샌드위치가 이벤트 중입니다. <br>
			맛있는 슈퍼계란딸기오이 굳굳 샌드위치가 이벤트 중입니다. <br>
			맛있는 슈퍼계란딸기오이 굳굳 샌드위치가 이벤트 중입니다. <br>
			맛있는 슈퍼계란딸기오이 굳굳 샌드위치가 이벤트 중입니다. <br>
			맛있는 슈퍼계란딸기오이 굳굳 샌드위치가 이벤트 중입니다. <br>
			맛있는 슈퍼계란딸기오이 굳굳 샌드위치가 이벤트 중입니다. <br>
			맛있는 슈퍼계란딸기오이 굳굳 샌드위치가 이벤트 중입니다. <br>
			맛있는 슈퍼계란딸기오이 굳굳 샌드위치가 이벤트 중입니다. <br>
		</div>
    </div>
  </div>
</section>

  <footer class="probootstrap-footer probootstrap-bg" style="height: 100px">
    <div class="container">
      <div class="row copyright">
        <div class="col-md-6">
          <div class="probootstrap-footer-widget">
            <p>&copy; 2017 <a href="https://uicookies.com/">uiCookies:Haus</a>. Designed by <a href="https://uicookies.com/">uicookies.com</a> <br> Demo Photos from <a href="https://pixabay.com/">Pixabay</a> &amp; <a href="https://unsplash.com/">Unsplash</a></p>
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
