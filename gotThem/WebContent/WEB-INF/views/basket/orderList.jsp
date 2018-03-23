<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>결제 목록</title>
<meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="resources/renew2/css/reset.css" />
<link rel="stylesheet" type="text/css" href="resources/renew2/css/layout.css" />
<link rel="stylesheet" type="text/css" href="resources/renew2/css/content.css" />
<link rel="stylesheet" type="text/css" href="resources/renew2/css/jquery.fancybox-1.3.4.css" />
<link rel="stylesheet" type="text/css" href="resources/renew2/css/jquery-ui-1.9.2.custom.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="resources/mainTemplate/css/styles-merged.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/custom.css">
<script type="text/javascript" src="resources/renew2/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/renew2/js/common.js"></script>
<script type="text/javascript" src="resources/renew2/js/top_navi.js"></script>
<script type="text/javascript" src="resources/renew2/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="resources/renew2/js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="resources/renew2/js/jquery.anchor.js"></script>
<script type="text/javascript" src="resources/renew2/js/jquery.fancybox-1.3.4.pack.js"></script>
<script type="text/javascript" src="resources/renew2/js/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="resources/renew2/js/jquery.word-break-keep-all.min.js"></script>
<script type="text/javascript" src="resources/renew2/js/jquery.matchHeight-min.js"></script>
<script type="text/javascript" src="resources/renew2/js/jquery.bind.js"></script>
<script type="text/javascript" src="resources/renew2/js/ui.core.js"></script>
<script type="text/javascript" src="resources/renew2/js/ui.checkbox.js"></script>
<script type="text/javascript" src="resources/renew2/js/jquery-ui-1.9.2.custom.min.js"></script>
    <!--[if lt IE 9]>
      <script src="resources/mainTemplate/js/vendor/html5shiv.min.js"></script>
      <script src="resources/mainTemplate/js/vendor/respond.min.js"></script>
    <![endif]-->
 <!-- RENEW 1 -->
<!--<link rel="stylesheet" href="/renew2/common/css/common.css" type="text/css"/>-->
<!--<link rel="stylesheet" href="/renew2/common/css/etc.css" type="text/css"/>-->

<!--<script type="text/javascript" src="/renew2/common/js/jquery-1.7.1.min.js"></script>-->
<script type="text/javascript" src="resources/renew2/common/js/renew.js"></script>
<!-- <script src="/renew2/common/zipcode/postcode.v2.js"></script>-->

<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>   
<style>
 #pro_stock {
 padding:0 0 0 15px
}
  
@media ( max-width: 768px ) {
 #pro_stock {
 padding:0 0 0 8px
}
}
</style>
</head>
<body>
<header>
<%@include file="../../../nav.jsp" %>
</header>
 <section class="probootstrap-slider flexslider2 page-inner">
    <div class="overlay"></div>
    <div class="probootstrap-wrap-banner">
      <div class="container">
        <div class="row">
          <div class="col-md-8">

            <div class="page-title probootstrap-animate">
              <div class="probootstrap-breadcrumbs">
                <a href="/gotThem">Home</a><span>Order</span>
              </div>
              <h1>결제</h1>
            </div>

          </div>
        </div>
      </div>
    </div>
    <ul class="slides">
      <li style="background-image: url(resources/mainTemplate/img/slider_1.jpg);"></li>
      <li style="background-image: url(resources/mainTemplate/img/slider_4.jpg);"></li>
      <li style="background-image: url(resources/mainTemplate/img/slider_2.jpg);"></li>
    </ul>
  </section>
    
<div class="container"> 
<h2>결제 확인 목록</h2> 
  <form name="form1" id="form1" method="post" action="./update.gt" onsubmit="return validate();">
   <div class="listDiv">
   <table class="listType" border="1" cellspacing="0">
    <caption>결제 목록</caption>
							<colgroup>
							<col width="4%" class="tw8"/>
							<col width="10%" class="cartImg"/>
							<col width="*" />
							<col width="13%" class="cartw13" />
							<col width="10%" class="tNonePre"/>
							<col width="13%" class="cartw27"/>
							<col width="14%" class="cartw25"/>
							<col width="12%" class="tNonePre"/>
							</colgroup>
    <thead>   
       <tr>
                   <th scope="col">결제 번호 </th> 
                   <th scope="col">상품코드</th>
                   <th scope="col" >상품사진</th>
                   <th scope="col">상품명</th>
                   <th scope="col">매장명</th>
                   <th scope="col">수량 </th>
                   <th scope="col">상품가격</th>
                    <th scope="col">결제가격</th>
                    <th scope="col">상태</th>
                   <th scope="col" class="tNonePre">결제취소</th>
     </tr>
    </thead>
    <tbody id="rowCheck">
      <c:forEach var="row" items="${map.list}" varStatus="i">
               <tr>                
                  <td> 
                      ${row.ord_no}
                  </td>
                  <td class="img" class="tNonePre">
                       <a href="productDetail.gt?pro_code=${row.ord_procode}"><img src="/img/${row.ord_proimg}" style="width:50px; height:50px" class="dn" alt="" /></a>
                  </td>
                  <td class="minLeft" >
                   ${row.ord_procode}
                  </td>
                   <td>
                        ${row.ord_proname}
                  </td>
                   <td>
                       ${row.sto_name}
                  </td>
                   <td>
                      ${row.ord_stock}
                  </td>
                  <td class="tNonePre" style="width: 80px" align="right" >
                       <fmt:formatNumber pattern="###,###,###" value="${row.ord_proprice}"/>
                  </td>
                  
                  <td class="total"style="width: 80px" align="right">
                       <fmt:formatNumber pattern="###,###,###" value="${row.ord_price}"/>원
                  </td>
                   <td class="tNonePre">
                     ${row.ord_status}
                  </td>
                  <td>
                       <input type="button" value="삭제" onclick="button_delete('${row.ord_no}','${row.ord_stock}','${row.ord_procode}');">
                  </td>
                </tr>
               </c:forEach>
    </tbody>
   </table>                    

  
  
  </div>
  </form>
  	<div class="btnAreaList">
		<a href="./listBasket.gt" class="aOrder" ><p>장바구니 <span>돌아가기</span></p></a>&nbsp;&nbsp;
		<a href="/gotThem" class="continuation" onclick=""><p>쇼핑 <span>계속하기</span></p></a>
	   <!--  <button type="button" value="장바구니목록" id="btnBasketList">장바구니목록</button> -->	
	</div>
  
</div>    
<br>
 <footer class="probootstrap-footer probootstrap-bg" style="background-image: url(img/slider_3.jpg)">
    <div class="container">
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
  </footer>
</body>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
 <script src="resources/mainTemplate/js/scripts.min.js"></script>
 <script src="resources/mainTemplate/js/main.min.js"></script>
 <script src="resources/mainTemplate/js/custom.js"></script>
<script type="text/javascript">
  /*   $(document).ready(function(){
      $("#btnList").click(function(){  // 계속 쇼핑하기 인덱스 이동
            location.href="/gotThem";
        });
        $("#btnBasketList").click(function(){  //장바구니 리스트
            location.href="./listBasket.gt";
        }); 
    }); */
    $(document).on("click", "#rowCheck tr", function(event){
    	if(event.target.nodeName.toLowerCase() == "td") {
    		var checkbox = $(this).find("td:first-child :checkbox");

    		if (checkbox.is(":checked")) {
    			checkbox.prop("checked", false);
    		} else {
    			checkbox.prop("checked", true);
    		}
    	}
    });

   function button_delete(ord_no,ord_stock,ord_procode){
    	alert(ord_no);
   if (confirm("정말 결제 취소하시겠습니까??")){    //확인
     location.href="deleteOrder.gt?ord_no="+ord_no+"&ord_stock="+ord_stock+ "&ord_procode=" +ord_procode;
   }else{   //취소
       return;
      }
   }
</script>
</html>