<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>편의점 재고 검색 GOT THEM!</title>
    <meta name="description" content="Free Bootstrap Theme by uicookies.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
    <link rel="stylesheet" href="resources/mainTemplate/css/styles-merged.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/custom.css">
	<link rel="stylesheet" href="resources/autocomplete/auto-complete.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
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
#pro_stock { width: 55px; text-align: center; }
#btnColor { background: #fa2848; border: 1px solid white; }
.btnColor2 { background: #70C585; color: white; padding: 10px 25px; }
.btnColor3 { background: #899; color: white; padding: 10px 25px; }
.zeroP { padding: 0px; }
.probootstrap-footer.probootstrap-bg {
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    padding: 2em 0;
    position: relative;
    color: rgba(255,255,255,.9);
}
@media not screen and (min-width: 480px) {
	footer .container {
		height: 95px !important;
	}
}
label { font-size: 17px; font-weight: 500; }
#main { color: #666; }
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
			if (confirm("장바구니에 추가됐습니다. \n장바구니로 가시겠으면 '확인',\n계속 쇼핑하시겠으면 '취소' 를 클릭해주세요.")) {
				location.href="listBasket.gt";
			} else {
				return false;
			}
			
		}
	});

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
				"bas_proimg" : "${productInfo.pro_img }",
				"sto_name" : "${sto_name}"
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
		var totalPrice = $("#totalPrice").val() * 1;
		var fmtPrice;
		if (idx == 1) {
			if (pro_stock == 1) {
				return false;
			}
			$("#pro_stock").val(pro_stock * 1 - 1);
			totalPrice -= ${productInfo.pro_price };
			$("#totalPrice").val(totalPrice);
		} else {
			if (pro_stock >= ${productInfo.pro_stock }) {
				alert("상품수량보다 적게 입력이 가능합니다.");
				return false;
			}
			$("#pro_stock").val(pro_stock * 1 + 1);
			totalPrice += ${productInfo.pro_price };
			$("#totalPrice").val(totalPrice);
		}
		fmtPrice = Number(totalPrice).toLocaleString('en').split(".")[0];
		$("#fmtPrice").text(fmtPrice);
	}
	
	function loginForward(pro_code) {
		var pro_stock = $("#pro_stock").val();
		alert("로그인하고 이용하실 수 있습니다.\n로그인 창으로 이동합니다.");
		location.href="login.gt?prevUrl=detailForward.gt&pro_stock=" + pro_stock + "&pro_code=" + pro_code + "&gubun=pdPage";
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
          <div class=" col-md-offset-2">

            <div id="marginChg" class="probootstrap-home-search probootstrap-animate">
              <form action="searchList.gt" method="get">
              	<input type="hidden" name="pageNo" value="1">
	            <div class="probootstrap-field-group">
					<div class="probootstrap-fields">
						<div class="form-field">
							<div class="col-xs-9 col-sm-10 col-md-10 col-lg-10 zeroP">
								<input type="text" class="form-control" id="autoComplete" name="search"
									required="required" maxlength="20"
									placeholder="예) 도시락, 서초, 강남  김밥" />
							</div>
							<div class="col-xs-3 col-sm-2 col-md-2 col-lg-2 zeroP">
								<button type="submit" title="검색" id="btnColor" class="btn btn-fill sb" style="width: 100%">
									<i style="font-size:45px;"class="material-icons">search</i>
								</button>
							</div>		
						</div>
					</div>
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
    	<div class="col-xs-11 col-xs-offset-1 col-sm-4 col-sm-offset-1">
    		<img src="/img/${productInfo.pro_img }" height="350px" width="290px" title="상품이미지" alt="상품이미지">
    		<br><br>
    	</div>
    	<div id="main" class="col-xs-12 col-sm-6 col-sm-offset-1">
    		<div style="font-size: 30px; color: #333;">${productInfo.pro_name }</div>
    		<hr style="border-color: black">
    		<h3>상품 가격 : <fmt:formatNumber pattern="###,###,###" value="${productInfo.pro_price }" /></h3>
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
	    		<span id="fmtPrice"><fmt:formatNumber pattern="###,###,###" value="${productInfo.pro_price }" /></span></label>
	    		<input type="hidden" id="totalPrice" value="${productInfo.pro_price }">
	    	</div>
			<hr>	    	
    		<input type="button" class="btn btnColor2" onclick="" value="결제">
    		<c:choose>
				<c:when test="${sessionCheck eq null}">
					<input type="button" class="btn btnColor2" onclick="loginForward('${productInfo.pro_code }')" value="장바구니">
				</c:when>
				<c:otherwise>
					<input type="button" class="btn btnColor2" onclick="addBasket()" value="장바구니">
				</c:otherwise>
			</c:choose>
    		<input type="button" class="btn btnColor3" onclick="history.back();" value="이전">
    	</div>
    </div>
  </div>
</section>

<!-- START: footer -->
<%@include file="../../../footer.jsp" %>
<!-- END: footer -->

  <div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-chevron-thin-up"></i></a>
  </div>

  <script src="resources/mainTemplate/js/scripts.min.js"></script>
  <script src="resources/mainTemplate/js/main.min.js"></script>
  <script src="resources/mainTemplate/js/custom.js"></script>

  </body>
</html>
