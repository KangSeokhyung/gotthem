<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>상품장바구니 목록</title>
<meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="resources/mainTemplate/css/styles-merged.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/custom.css">
    <!--[if lt IE 9]>
      <script src="resources/mainTemplate/js/vendor/html5shiv.min.js"></script>
      <script src="resources/mainTemplate/js/vendor/respond.min.js"></script>
    <![endif]-->
<style>
#bo {
	border: 1px solid black;
}
#bo div {
	border: 1px solid black;
}

.table {
  display: table;
  table-layout: fixed;
  border-collapse: collapse;
  text-align: center;
}
.thead{
  display: table-header-group;
}
.tbody{
  display: table-row-group;

}
.tr {
  display: table-row;
}
.th {
  display: table-cell;
  border: 1px solid #333;

}
.td {
  display: table-cell;
  border: 1px solid #333;
  vertical-align: middle;
  height:100px; 
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
                <a href="/gotThem">Home</a><span>Cart</span>
              </div>
              <h1>장바구니</h1>
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
  
  <div class="container" >
  	<div class="row" id="bo">
  		<div class="col-xs-4 col-md-2">안녕</div>
  		<div class="col-xs-4 col-md-3">하세요</div>
  		<div class="col-xs-4 col-md-1">저는</div>
  		<div class="col-xs-3 col-md-1">더용</div>
  		<div class="col-xs-3 col-md-3">입니다</div>
  		<div class="col-xs-3 col-md-1">방가</div>
  		<div class="col-xs-3 col-md-1">워용</div>
  	</div>
  </div>
  
  
  
<div class="container">
 <div style='float:right; padding: 3px 30px 3px 6px;'>
  <button type="button" value="상품목록1" id="btnList">쇼핑목록 이동</button> 
 </div>
<c:choose>
<c:when test="${map.count == 0}">
 <img src="/img/cart_img_empty.gif" style=" width:360px;height:263px;margin-left:auto;margin-right:auto;display:block;"/>
 <div>  
            <div style='float:right; padding: 3px 30px 3px 6px;'>
             <button type="button" value="상품목록1" id="btnList">계속 쇼핑하기</button> 
            </div>
  </div>  
</c:when>
<c:otherwise>   
  <form name="form1" id="form1" method="post" action="./update.gt" onsubmit="return validate();">   
   <div class="table">
    <div class="thead">   
       <div class="tr row">
                   <div class="th col-sm-3">상품사진</div>
                   <div class="th col-sm-3">상품명</div>
                   <div class="th col-sm-3">매장명</div>
                   <div class="th col-sm-3">판매가</div>                  
                   <div class="th col-sm-3">수량 </div>
                   <div class="th col-sm-2" style='width:100px'>구매예정가</div>
                   <!-- <th><input type="checkbox" name="checkAll" id="th_checkAll" /></th>  -->
                   <div class="th col-sm-1" ><input type="button" value="전체 선택" name="checkAll" id="th_checkAll" onclick="button_checkAll();" /></div>
                   <div class="th col-sm-3">결제하기</div>
                   <div class="th col-sm-3">삭제하기</div>
       </div>
     </div>
    
    <div class="tbody" id="rowCheck">

             <c:forEach var="row" items="${map.list}" varStatus="i">
               <div class="tr">
                  <div class="td">
                       <img src="/img/${row.bas_proimg}" style="width:50px; height:50px"/>
                  </div>
                  <div class="td">
                      <a href="productDetail.gt?pro_code=${row.bas_procode}" style="color: #7e8890;"> ${row.bas_proname}</a>
                  </div>
                   <div class="td">
                       ${row.pro_memno}
                  </div>
                  <div class="td" style="width: 80px" align="right" >
                       <fmt:formatNumber pattern="###,###,###" value="${row.bas_proprice}"/>
                  </div>
                  <div class="td">
                     <input type="hidden" name="stock1" id="stock1" value="${row.stock}"> 
                     <input type="number" min="1" max="${row.stock}" require="" id="changeStock" name="bas_prostock"  value="${row.bas_prostock}" >
                     <input type="hidden" id="bas_procode" name="bas_procode" value="${row.bas_procode}">
                     <button type="button" id="button_update" name="button_update">변경</button>
                  </div>
                  <div class="td"  style="width: 80px" align="right">
                       <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>
                  </div>
                  <div class="td">
                      <input type="hidden" name="bas_procomment" value="${row.bas_procomment}">
                      <input  class = "check" type="checkbox" name="checkRow" class="chk" id="checkRow"  value="${row.bas_no},${row.bas_proname},${row.bas_proprice},${row.bas_prostock},${row.bas_procode},${row.money},${row.bas_proimg}, ${row.bas_procomment},${row.pro_memno}"
                      onclick="cart();" /> 
                  </div>
                  <div class="td">
                     <input type="hidden" name="money" value="${row.money}">
                     <input type="hidden" name="bas_no" value="${row.bas_no}">
                     <input type="button" value="결제" onclick="button_order('${row.bas_no}','${row.bas_proname}','${row.bas_procode}','${row.money}','${row.bas_prostock}','${row.bas_proimg}','${row.bas_proprice}','${row.pro_memno}');">
                  </div>
                  <div class="td">
                      <input type="button" value="삭제" onclick="button_basDel(${row.bas_no});">
                  </div>
                </div>
               </c:forEach>
                <div class="tr">
                    <div >선택 상품 결제 예상 금액:<p id="chkSum"></p> </div>
                </div><hr>

    </div>
   </div>                  
  </form>
  <div>  
            <input type="hidden" name="count" value="${map.count}">                      
            <div style='float:right; padding: 3px 30px 3px 6px;'>
             <input type="button" name="seDel" id="button_seDel" onclick="button_selDel();" value="선택상품 삭제" />
             <button type="button" value="상품목록1" id="btnList">계속 쇼핑하기</button> 
             <input type="button" value="선택상품 주문" onclick="button_selOrder();">
             <input type="button" value="전체상품 주문" onclick="button_allOrder();">
            </div>
  </div>
</c:otherwise>
</c:choose>   
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
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
 <script src="resources/mainTemplate/js/scripts.min.js"></script>
 <script src="resources/mainTemplate/js/main.min.js"></script>
 <script src="resources/mainTemplate/js/custom.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnList").click(function(){
		location.href="/gotThem";
		});
        
 $("#th_checkAll").click(function(){
	 var chk= $('input[name*="checkRow"]').is(":checked");
	 if(chk){
		 $('input[name*="checkRow"]').prop("checked", false);
		 cart();
		 } else{
			 $('input[name*="checkRow"]').prop("checked", true);
			 cart();
		 }
	 });
 
 var checkSumArr = [];
 $("input[name='checkRow']").each(function(i){
 	checkSumArr.push($(this).val());
 	});
 var sum=0;
 for(var i = 0; i< checkSumArr.length; i++){
 	var cartSum = checkSumArr[i].split(',')[5];
 	cartSum = parseInt(cartSum);
 	sum+=cartSum;
 	var str = sum;
  	var bb = Number(str).toLocaleString('en').split(".")[0];	
 	document.getElementById("chkSum").innerHTML = bb;
 	}
 });
 $(document).on("click", "#rowCheck tr", function(event){
	if(event.target.nodeName.toLowerCase() == "td") {
		var checkbox = $(this).find("td:nth-child(7) :checkbox");

		if (checkbox.is(":checked")) {
			checkbox.prop("checked", false);
			cart();
		} else {
			checkbox.prop("checked", true);
			cart();
		}
	}
}); 
 function button_allOrder(){//장바구니 전체 결제
	 alert("wjscp");
	var checkAllOrder = [];
	$("input[name='checkRow']").each(function(i){
		checkAllOrder.push($(this).val());
		});
	alert("checkAllOrder요." +checkAllOrder);
		if (confirm("전체 상품을 결제 하시겠습니까?")){
			$.ajax({
				url:"selectOrder.gt",
				type:"post",
				dataType: "text",
				data:{arrOrder:checkAllOrder
					},
					success:function(result){
						location.href="./orderList.gt";
						}
					});
			}else{ 
				return;
				} 
		}
		
function cart(){ //결제 금액 계산
	var checkSumArr = [];
	$("input[name='checkRow']:checked").each(function(i) {
		checkSumArr.push($(this).val());	
	});
	var sum=0;
	for ( var i = 0; i< checkSumArr.length; i++){
		var cartSum = checkSumArr[i].split(',')[5];
		cartSum = parseInt(cartSum);
		sum+=cartSum;
		var str = sum;
     	var bb = Number(str).toLocaleString('en').split(".")[0];	
    	document.getElementById("chkSum").innerHTML = bb;
    	}
	}  		   
function button_basDel(bas_no){  //단건 직접 삭제
	alert(bas_no);
	if (confirm("장바구니에서 상품을 삭제 하시겠습니까?")){
		location.href="delete.gt?bas_no="+bas_no;
		}else{ 
			return;
			}
	}
function button_order(bas_no,bas_proname,bas_procode,money,bas_prostock,bas_proimg,bas_proprice,pro_memno){
	alert(bas_proprice);
	if (confirm("상품을 결제 하시겠습니까?")){ //단건결제
		location.href="insertOrder.gt?bas_no="+bas_no+"&bas_proname="+bas_proname+
    		"&bas_procode="+bas_procode+"&money="+money+"&bas_prostock="+bas_prostock+"&bas_proimg="+bas_proimg+"&bas_proprice="+bas_proprice+"&pro_memno="+pro_memno;
	}else{ 
		return;
		}
	}  
function button_selDel(){  //장바구니 선택 삭제
   if( $(":checkbox[name='checkRow']:checked").length==0 ){
	  alert("삭제할 항목을 체크해주세요.");
	 return;
    } 
  var checkArr = [];
  $("input[name='checkRow']:checked").each(function(i){
	  if( $(":checkbox[name='checkRow']:checked").length==1 ){
		  checkArr.push($(this).val());
		  checkArr.push('[]');
	  } else {
		  checkArr.push($(this).val());
		  }
	  });
  if (confirm("선택한 상품을 삭제하시겠습니까?")){
	  $.ajax({
		  url:"selectDelete.gt",
		  type:"post",
		  dataType: "text",
		  data:{arrDel:checkArr
			  },
			  success:function(result){
				  location.href="./listBasket.gt";
				  }
			  });
	  }else{ // 취소
		  return;
	  }
  }  
	
function button_selOrder(){  //장바구니 선택 결제
	if( $(":checkbox[name='checkRow']:checked").length==0 ){
		alert("결제할 항목을 체크해주세요.");
		return;
		}
	var checkOrder = [];
	$("input[name='checkRow']:checked").each(function(i){
		if( $(":checkbox[name='checkRow']:checked").length==1 ){
			checkOrder.push($(this).val());
			checkOrder.push('[]');
		  } else {
			  checkOrder.push($(this).val());
			  }
		});
	if (confirm("선택한 상품을 결제 하시겠습니까?")){
		$.ajax({
			url:"selectOrder.gt",
			type:"post",
			dataType: "text",
			data:{arrOrder:checkOrder
				},
				success:function(result){
					location.href="./orderList.gt";
					}
				});
		}else{ 
			return;
			}
	}
 
$(document).on("click", "#button_update",function(){ //수량변경
	var bas_procode= $(this).prev().val()*1;
	var chaS= $(this).prev().prev().val()*1;
    var basS = $(this).prev().prev().prev().val()*1;
    if (chaS < basS) {
    	location.href="update.gt?bas_procode="+bas_procode+"&bas_prostock=" +chaS;
    	} else{
    		alert(basS+"개 이상 주문이 불가능합니다.");
    		location.reload();
    		}
    });

//결제 함수 스크립트
function payment(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp71254112');  // 가맹점 식별 코드
	
	IMP.request_pay({
	   pg : 'kakao', // 결제방식
	    pay_method : 'card',	// 결제 수단
	    merchant_uid : 'merchant_' + new Date().getTime(),
	   name : '주문명: 결제 테스트',	// order 테이블에 들어갈 주문명 혹은 주문 번호
	    amount : '100',	// 결제 금액
	    buyer_email : '${MemberInfo.getMember_email}',	// 구매자 email
	   buyer_name :  '${MemberInfo.getMember_name}',	// 구매자 이름
	    buyer_tel :  '',	// 구매자 전화번호
	    buyer_addr :  '',	// 구매자 주소
	    buyer_postcode :  '',	// 구매자 우편번호
	    m_redirect_url : '/khx/payEnd.action'	// 결제 완료 후 보낼 컨트롤러의 메소드명
	}, function(rsp) {
		if ( rsp.success ) { // 성공시
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
		} else { // 실패시
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
	});
}
</script>	
</html>