<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
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
<style>
html, body { height: 100%; }
#wrap { min-height: 50%; position: relative; }
.probootstrap-header{height:91px;line-height:-20%;} 
body, table, div, p {font-family: '나눔스퀘어라운드';}
.probootstrap-main-nav li a:hover {color: #ea1313;}
.probootstrap-main-nav li a {text-transform: none;padding: 10px 0;color: #000;font-size: 15px;border-bottom: 2px solid transparent;}
.probootstrap-main-nav {padding: 20px 0;}
.probootstrap-header {padding-top: 0px;padding-bottom: 0px;width: 100%;background: #fff;z-index: 12;position: absolute;
	top: 0;-webkit-box-shadow: 0 6px 68px -6px rgba(0, 0, 0, .2);box-shadow: 0 6px 68px -6px rgba(0, 0, 0, .2);}
.container {padding-bottom: 12px;padding-top: 12px;}
.barunPenLogo{font-family:'나눔스퀘어라운드';font-weight:400;font-size:40px;color:#fa2848;text-transform:uppercase;}
.probootstrap-logo:hover { color: #fa2848;}
 .navLogoPadding{padding-top:13.5px;} 
 .padding{padding-top:4px;} 
#pro_stock {padding: 0 0 0 15px}
tbody a:hover {color: #FA5858;}
a{cursor:pointer;}
@media ( max-width : 768px ) {
	#pro_stock {padding: 0 0 0 8px}
	.cartw27 {width: 15%;}
	.cartw13 {width: 17%;}
	.cartw25 {width: 15%;}
	.explain {width: 45%;}
	@media screen and (min-width: 480px) {
	.flexslider.page-inner, .flexslider.page-inner .slides>li, 
	.flexslider2.page-inner, .flexslider2.page-inner .slides>li {
   		display: block;height: 400px !important;}
}
@media not screen and (min-width: 480px) {
	.flexslider.page-inner, .flexslider.page-inner .slides>li, 
	.flexslider2.page-inner, .flexslider2.page-inner .slides>li {
   		display: block;height: 300px !important;}
}
} 
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<c:set var="sessionCheck"
		value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
	<header role="banner" id="navbar" class="probootstrap-header">
		<div class="container navCenter">
			<a href="/gotThem" class="probootstrap-logo barunPenLogo navLogoPadding">GotThem</a> 
			<a href="#" class="probootstrap-burger-menu visible-xs"><i>Menu</i></a>
			<div class="mobile-menu-overlay"></div>

        <nav role="navigation" class="probootstrap-nav hidden-xs padding">
          <ul class="probootstrap-main-nav">
            <li><a href="/gotThem">GotThem 소개</a></li>
            <li><a href="notice.gt" class="nanumbarunpenr">공지사항</a></li>
            <c:choose>
				<c:when test="${sessionCheck eq null}">
					<li><a href="login.gt?prevUrl=listBasket.gt">장바구니</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="listBasket.gt">장바구니</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${sessionCheck eq null}">
					<li><a href="join.gt">회원가입</a></li>
					<c:if test="${search ne null }">
						<li><a href="login.gt?search=${search }">로그인</a></li>
					</c:if>
					<c:if test="${search eq null }">
						<li><a href="login.gt">로그인</a></li>
					</c:if>
				</c:when>
				<c:otherwise>
					<li><a href="mypage.gt">마이페이지</a></li>
					<li><a href="logout.gt">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
		  </ul>
          <div class="extra-text visible-xs"> 
            <a href="#" class="probootstrap-burger-menu"><i>메뉴</i></a>
			<h5>주소</h5>
			<p>서울광역시 서초구 비트교육센터 별관 503호</p>
			<h5>개발자</h5>
			<p>강석형, 김성우, 김채윤, 권도용, 이찬희</p>
          </div>
        </nav>
    </div>
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
<div id="wrap">
<div class="container"> 
<h2 >결제 확인</h2> 
  <form name="form1" id="form1" method="post" action="./update.gt" onsubmit="return validate();">
   <div class="listDiv">
   <table class="listType" border="1">
    <caption>결제 목록</caption>
							<colgroup>
							<col width="15%" class="cartImg"/>
							<col width="*"  />
							<col width="15%" class="cartw13" />
							<col width="9%" />
							<col width="12%" class="tNonePre"/>
							<col width="12%" class="cartw25"/>
							<col width="12%" class="cartw27"/>
							</colgroup>
    <thead>   
       <tr>
                   <th scope="col" colspan="2" class="explain">상품정보</th>
                   <th scope="col">매장명</th>
                   <th scope="col" >수량 </th>
                   <th scope="col" class="tNonePre">상품가격</th>
                    <th scope="col">결제가격</th>
                    <th scope="col" class="cartw27">상태</th>
     </tr>
    </thead>
    <tbody id="rowCheck">
      <c:forEach var="row" items="${map.list}" varStatus="i">
               <tr>                
                  <td class="img" class="tNonePre">
                       <a href="productDetail.gt?pro_code=${row.ord_procode}"><img src="/img/${row.ord_proimg}" style="width:70px; height:70px" class="dn" alt="${row.ord_proimg}상품 이미지" /></a>
                  </td>
                   <td class="explain">
                   <a href="productDetail.gt?pro_code=${row.ord_procode}" > ${row.ord_proname}</a>
                  </td>
                   <td>
                     <a href="storeDetail.gt?mem_no=${row.pro_memno }">${row.sto_name}</a>
                  </td>
                   <td >
                      ${row.ord_stock}
                  </td>
                  <td  style="width: 80px" align="right" class="tNonePre">
                       <fmt:formatNumber pattern="###,###,###" value="${row.ord_proprice}"/>
                  </td>
                  
                  <td class="total"style="width: 80px; color:#333;"  align="right">
                       <fmt:formatNumber pattern="###,###,###" value="${row.ord_price}"/>원
                  </td>
                   <td class="cartw27">
                     ${row.ord_status}
                  </td>
                </tr>
               </c:forEach>
    </tbody>
   </table>                    
  </div>
  </form>
  	<div class="btnAreaList">
		<a href="./listBasket.gt" class="aOrder" ><p>장바구니&nbsp;<span>돌아가기</span></p></a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/gotThem" class="continuation" onclick=""><p>쇼핑&nbsp;<span>계속하기</span></p></a>
	</div>
</div>  
</div>  
<br>
<!-- START: footer -->
<%@include file="../../../footer.jsp" %>
<!-- END: footer -->
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <script src="resources/mainTemplate/js/scripts.min.js"></script>
 <script src="resources/mainTemplate/js/main.min.js"></script>
 <script src="resources/mainTemplate/js/custom.js"></script>
<script type="text/javascript">
  /* $("#btnBasketList").click(function(){  //장바구니 리스트
            location.href="./listBasket.gt";
        }); 
    }); */
</script>
</html>