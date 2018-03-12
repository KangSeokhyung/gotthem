<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>결제 목록</title>
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
</head>
<body>

  <!-- START: header -->
   <header role="banner" class="probootstrap-header">
    <div class="container">
        <a href="/gotThem" class="probootstrap-logo">GOT THEM<span>.</span></a>
        
        <a href="#" class="probootstrap-burger-menu visible-xs" ><i>Menu</i></a>
        <div class="mobile-menu-overlay"></div>

        <nav role="navigation" class="probootstrap-nav hidden-xs">
          <ul class="probootstrap-main-nav">
            <li><a href="#">GOTTHEM</a></li>
            <li><a href="#">NOTICE</a></li>
            <li><a href="#">EVENT</a></li>
            <c:set var="sessionCheck"
					value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
				<c:choose>
					<c:when test="${sessionCheck eq null}">
            <li><a href="join.gt">SIGN UP</a></li>
            <li><a href="login.gt">LOGIN</a></li>
            		</c:when>
					<c:otherwise>
			<li><a href="mypage.gt">MY PAGE</a></li>
			<li><a href="list.gt">장바구니</a></li>
            <li><a href="logout.gt">LOGOUT</a></li>
				</c:otherwise>
				</c:choose>
          </ul>
          <div class="extra-text visible-xs"> 
            <a href="#" class="probootstrap-burger-menu"><i>Menu</i></a>
            <h5>Address</h5>
            <p>198 West 21th Street, Suite 721 New York NY 10016</p>
            <h5>Connect</h5>
            <ul class="social-buttons">
              <li><a href="#"><i class="icon-twitter"></i></a></li>
              <li><a href="#"><i class="icon-facebook2"></i></a></li>
              <li><a href="#"><i class="icon-instagram2"></i></a></li>
            </ul>
          </div>
        </nav>
    </div>
  </header>
  <div class="probootstrap-loader"></div>
  <!-- END: header -->
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
 	<form name="form1" id="form1" method="post" action="./update.gt">
           <table class="table">
               <tr>
                   <th>결제 번호</th>
                   <th>상품코드</th>
                   <th>상품사진</th>
                   <th>상품명</th>
                   <th>상품수량</th>
                   <th>상품가격</th>
                   <th>결제 가격</th>
                   <th>상태</th>
                   <th>결제취소</th>
               </tr>
             <c:forEach var="row" items="${map.list}" varStatus="i">
               <tr>
                  <td>
                        ${row.ord_no}
                  </td>
                  <td>
                        ${row.ord_procode}
                  </td>
                  <td>
                       <img src="/img/${row.ord_proimg}" style="width:50px; height:50px"/>
                  </td>
                  <td>
                        ${row.ord_proname}
                  </td>
                  <td>
                        ${row.ord_stock}
                  </td>
                  <td>
                       <fmt:formatNumber pattern="###,###,###" value="${row.ord_proprice}"/>
                  </td>
                  <td>
                       <fmt:formatNumber pattern="###,###,###" value="${row.ord_price}"/>
                  </td>
                  <td>
                        ${row.ord_status}
                  </td>
                   <td>
                       <input type="button" value="삭제" onclick="button_delete('${row.ord_no}','${row.ord_stock}','${row.ord_procode}');">
                  </td>
                 </tr>
               </c:forEach>
            </table>
        </form>
    <button type="button" value="상품목록" id="btnList">상품목록</button>
    <button type="button" value="장바구니목록" id="btnBasketList">장바구니목록</button>
</div>
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
	 <script src="resources/mainTemplate/js/scripts.min.js"></script>
  <script src="resources/mainTemplate/js/main.min.js"></script>
  <script src="resources/mainTemplate/js/custom.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
      $("#btnList").click(function(){  // 제품리스트 페이지로 이동
            location.href="./productlist.gt";
        });
        $("#btnBasketList").click(function(){  //장바구니 리스트
            location.href="./list.gt";
        }); 
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