<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>상품장바구니 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="resources/landy/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="resources/landy/vendor/font-awesome/css/font-awesome.min.css">
<!-- Custom Font Icons CSS-->
<link rel="stylesheet" href="resources/landy/css/landy-iconfont.css">
<!-- Google fonts - Open Sans-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
<!-- owl carousel-->
<link rel="stylesheet"
	href="resources/landy/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet"
	href="resources/landy/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="resources/landy/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="resources/landy/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="favicon.png">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%-- <%@ include file="../include/header.jsp" %> --%>
</head>
<body>
	<!-- navbar-->
	<header class="header">
		<%@include file ="/nav.jsp" %>
	</header>
<div class="container">
    <h2>장바구니 확인</h2>
    <c:choose>
        <c:when test="${map.count == 0}">
            장바구니가 비어있습니다.
        </c:when>
        <c:otherwise>     
        <form name="form1" id="form1" method="post" action="./update.gt">
         <table class="table">
               <tr>
                   <th></th>  
                   <th>상품명</th>
                   <th>단가</th>
                   <th>수량</th>
                   <th>금액</th>
                   <th>취소</th>
                   <th>결제</th>
               </tr>
             <c:forEach var="row" items="${map.list}" varStatus="i">
               <tr>                
                  <td><input type="checkbox" name="checkall" onclick="javascript:CheckAll()"></td>
                  <td> ${row.bas_proname}</td>
                  <td style="width: 80px" align="right">
                       <fmt:formatNumber pattern="###,###,###" value="${row.bas_proprice}"/></td>
                  <td>
                     <input type="number" style="width: 40px" name="bas_prostock" value="${row.bas_prostock}" min="1">
                     <input type="hidden" name="bas_procode" value="${row.bas_procode}">
                     <!-- <button type="button" id="btnUpdate" onclick="modify();" >수정</button> -->
                     <button type="submit" id="btnUpdate" >수정</button></td>
                  <td style="width: 80px" align="right">
                       <fmt:formatNumber pattern="###,###,###" value="${row.money}"/></td>
                  <td>                    
                       <input type="button" value="삭제" onclick="button_event(${row.bas_no});"></td>
                  <td>
                       <input type="hidden" name="money" value="${row.money}">
                       <input type="hidden" name="bas_proname" value="${row.bas_proname}">
                       <!-- <input type="submit" value="하나결제"> -->
                       <input type="button" value="하나결제" onclick="button_order('${row.bas_no}','${row.bas_proname}','${row.bas_procode}','${row.money}','${row.bas_prostock}');"></td>
                </tr>
               </c:forEach>
                <tr>
                    <td colspan="5" align="right"> 장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/><br>
                        <%-- 배송료 : ${map.fee}<br>전체 주문금액  :<fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/> --%>
                    </td></tr>
            </table>
             <input type="hidden" name="count" value="${map.count}">
             <button type="button" value="상품목록2" id="btnList">상품목록</button>
        </form>
      </c:otherwise>
    </c:choose>
</div>    
	<footer class="main-footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<a href="#" class="brand">Gotthem</a>
					<ul class="contact-info list-unstyled">
						<li><a href="mailto:sales@landy.com">admin@gotthem.co.kr</a></li>
						<li><a href="tel:123456789">02-1234-5768</a></li>
					</ul>					
				</div>
				<div class="col-lg-3 col-md-6">
					<h5>Selected Cases</h5>
					<ul class="links list-unstyled">
						<li><a href="#">Guess Conntect</a></li>
						<li><a href="#">Postly</a></li>
						<li><a href="#">Iris Vor Arnim</a></li>
						<li><a href="#">Yapital</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6">
					<h5>Selected Cases</h5>
					<ul class="links list-unstyled">
						<li><a href="#">Guess Conntect</a></li>
						<li><a href="#">Postly</a></li>
						<li><a href="#">Iris Vor Arnim</a></li>
						<li><a href="#">Yapital</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6">
					<h5>Selected Cases</h5>
					<ul class="links list-unstyled">
						<li><a href="#">Guess Conntect</a></li>
						<li><a href="#">Postly</a></li>
						<li><a href="#">Iris Vor Arnim</a></li>
						<li><a href="#">Yapital</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="copyrights">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<p>&copy; 2018 스탑없으팀 프로젝트 Gotthem  All rights reserved.</p>
					</div>
					<div class="col-md-5 text-right">
						<p>
							Template By <a href="https://bootstrapious.com/" class="external">Bootstrapious</a>
						</p>
						<!-- Please do not remove the backlink to Bootstrapious unless you support us at http://bootstrapious.com/donate. It is part of the license conditions. Thanks for understanding :) -->
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
	<!-- Javascript files-->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="resources/landy/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/landy/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="resources/landy/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="resources/landy/js/front.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        // 리스트 페이지로 이동
        $("#btnList").click(function(){
            location.href="./productlist.gt";     
        });
        /* $("#btnOrd").click(function(){
            location.href="ord.gt?bas_no="+bas_no;
        }); */
    });
    
/*    function modify() {
	   var submitTest = document.form1;
	   submitTest.action="./update.gt";
	   submitTest.method="post";
	   submitTest.submit();
   } */
   
   function button_event(bas_no){
    	alert(bas_no);
   if (confirm("정말 삭제하시겠습니까??")){    //확인
     location.href="delete.gt?bas_no="+bas_no;
   }else{   //취소.
       return;
      }
   }
   
    function button_order(bas_no,bas_proname,bas_procode,money,bas_prostock){
   	alert(bas_no);
  if (confirm("결제 하시겠습니까??")){    //확인
    location.href="insertOrder.gt?bas_no="+bas_no+"&bas_proname="+bas_proname+
    		"&bas_procode="+bas_procode+"&money="+money+"&bas_prostock="+bas_prostock;
  }else{   //취소.
      return;
     }
  } 
</script>	
</html>