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
<div class="container">
<c:choose>
<c:when test="${map.count == 0}">
 <img src="/img/cart_img_empty.gif" style=" width:360px;height:263px;margin-left:auto;margin-right:auto;display:block;"/>
 <div>  
            <div style='float:right; padding: 3px 30px 3px 6px;'>
             <button type="button" value="상품목록1" id="btnList">계속 쇼핑하기</button> 
            </div></div>  
</c:when>
<c:otherwise>   
  <form name="form1" id="form1" method="post" action="./update.gt">
   <table class="table">
    <thead>   
       <tr>
                   <th><input type="checkbox" name="checkAll" id="th_checkAll" /></th> 
                   <th>상품사진</th>
                   <th>상품명</th>
                   <th>매장명</th>
                   <th>판매가</th>
                   <th >수량 </th>
                   <th style='width:100px'>구매예정가</th>
                   <th>선택</th>
     </tr>
    </thead>
    <tbody id="rowCheck">

             <c:forEach var="row" items="${map.list}" varStatus="i">
               <tr>                
                  <td> 
                      <input type="checkbox" name="checkRow" class="chk" id="checkRow"  value="${row.bas_no},${row.bas_proname},${row.bas_proprice},${row.bas_prostock},${row.bas_procode},${row.money},${row.bas_proimg}, ${row.bas_procomment},${row.pro_memno}"
                      onclick="cart();" /> 
                  </td>
                  <td>
                       <img src="/img/${row.bas_proimg}" style="width:50px; height:50px"/>
                  </td>
                  <td>
                      <a href="productDetail.gt?pro_code=${row.bas_procode}" style="color: #7e8890;"> ${row.bas_proname}</a>
                  </td>
                   <td>
                       ${row.pro_memno}
                  </td>
                  <td style="width: 80px" align="right" >
                       <fmt:formatNumber pattern="###,###,###" value="${row.bas_proprice}"/>
                  </td>
                  <td>
                     <input type="number" style="width:50px; height:25px;" name="bas_prostock" value="${row.bas_prostock}" min="1">
                     <input type="hidden" name="bas_procode" value="${row.bas_procode}"><br>
                     <button type="button" id="button_update"style='width:50px;height:25px;font-size: 12px;' onclick="modify();" >변경</button>
                   <!-- <button type="submit" id="btnUpdate" >수정</button> -->
                  </td>
                  <td style="width: 80px" align="right">
                       <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>
                  </td>
                  <td>
                     <input type="hidden" name="money" value="${row.money}">
                     <input type="hidden" name="bas_no" value="${row.bas_no}">
                     <input type="button" value="바로구매" style='width:60px;height:25px;font-size: 12px;' 
                     onclick="button_order('${row.bas_no}','${row.bas_proname}','${row.bas_procode}','${row.money}','${row.bas_prostock}','${row.bas_proimg}','${row.bas_proprice}','${row.pro_memno}');"><br>  
                     <input type="button" value="삭제" style='width:60px;height:25px;font-size: 12px;'  onclick="button_basDel(${row.bas_no});">
                  </td>
                </tr>
               </c:forEach>
                <tr>
                    <td colspan="10" align="right">선택 상품 결제 예상 금액:<p id="chkSum"></p>  </td>
                </tr>

    </tbody>
   </table>                    
  </form>
  <div>  
            <input type="hidden" name="count" value="${map.count}">           
            <input type="button" name="seDel" id="button_seDel" onclick="button_selDel();" value="선택상품 삭제" style='height:25px;font-size: 12px;'/>
            <div style='float:right; padding: 3px 30px 3px 6px;'>
             <button type="button" value="상품목록1" id="btnList">계속 쇼핑하기</button> 
             <input type="button" value="바로구매" onclick="button_selOrder();">
             <button type="button" id="payBtn">카카오페이</button>
             <a href="test.gt">dd</a>
            </div></div>
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


 <script src="resources/mainTemplate/js/scripts.min.js"></script>
 <script src="resources/mainTemplate/js/custom.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <!-- KAKAO API -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnList").click(function(){// 리스트 페이지로 이동
		location.href="/gotThem";
		});
	$('input[name*="checkRow"]').prop("checked",true);
    
    var checkSumArr = [];
    $("input[name='checkRow']:checked").each(function(i){
    	checkSumArr.push($(this).val());
    	});
    var sum=0;
    for(var i = 0; i< checkSumArr.length; i++){
    	var cartSum = checkSumArr[i].split(',')[5];
    	cartSum = parseInt(cartSum);
    	sum+=cartSum;
    	document.getElementById("chkSum").innerHTML = sum;
    	}
    });

$("#th_checkAll").click(function(){ //체크박스 전체 선택
	var chk= $(this).is(":checked");
	if(chk){
		$('input[name*="checkRow"]').prop("checked", true);//체크박스 전체 선택
		} else{
			$('input[name*="checkRow"]').prop("checked", false);//체크박스 전체 해지
			}
	});
	
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
		document.getElementById("chkSum").innerHTML = sum;
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

function modify(){ //수량수정
	var submitTest = document.form1;
	submitTest.action="./update.gt";
	submitTest.method="post";
	submitTest.submit();
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
		location.href="test.gt";
		}else{ 
			return;
			}
	}
	
	
	

var access_Token = '${sessionScope.token}';

Kakao.init("7f93c771faceb935af25ef6e91c4a334");	
$('#payBtn').click(()=> {
	
     if(!access_Token){
    	 console.log('토큰이 없음');
         loginWithKakao();
     } else {
    	 console.log("토근존재");
         payment();
     }
}); 
 

function payment() {
  $.ajax({
	 url : 'payment.gt',
     data: {
         accessToken : access_Token
     },
     method: 'POST',
     success: (result) => {
    	 console.log(result);
     	window.open(result.next_redirect_pc_url,
     			"","width=400, height=700");
     	console.log("온다아아앙");
     }, 
     error: () => {
         window.alert('payment 서버 실행 오류!');
     }
  });
}
function loginWithKakao() {
    Kakao.Auth.login({
      success: function(authObj) {
    	  console.log("토큰이없으면 여기");
          access_Token = authObj.access_token;
          console.log(access_Token)
          payment();
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
  };


</script>	
</html>