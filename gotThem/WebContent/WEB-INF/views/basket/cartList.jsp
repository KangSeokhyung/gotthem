<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>상품장바구니 목록</title>
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
 #pro_stock {
 padding:0 0 0 15px
}
  
@media ( max-width: 768px ) {
 #pro_stock {
 padding:0 0 0 8px
}
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
            <a href="/gotThem" class="continuation" onclick=""><p>쇼핑 <span>계속하기</span></p></a>
            </div>
 </div>  
</c:when>
<c:otherwise>   
  <form name="form1" id="form1" method="post" action="./update.gt" onsubmit="return validate();">
   <!-- del btnArea -->
					<div class="btnArea nMn">
						<ul class="delTopLeft">
							<li><a href="#" onclick="button_selDel()"><img src="/img/btn_select_del.gif" alt="선택삭제"/></a></li>
							<li><a href="#" onclick="button_allDel()"><img src="/img/btn_all_del.gif" alt="전체삭제"/></a></li>
						</ul>
					</div>
					<!-- //del btnArea -->
   <div class="listDiv">
   <table class="listType" border="1" cellspacing="0">
    <caption>장바구니 목록</caption>
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
                   <th scope="col"><!-- <input type="checkbox" name="checkAll" id="th_checkAll" /> -->
                   
                   <a class="con"  name="checkAll" id="th_checkAll" onclick="button_checkAll();" />all</a>
                   <!-- <input type="button" class="con" value="All" name="checkAll" id="th_checkAll" onclick="button_checkAll();" /> --></th> 
                   <th scope="col" colspan="2">상품정보</th>
                   <th scope="col">매장명</th>
                   <th scope="col" class="tNonePre">가격</th>
                   <th scope="col">수량 </th>
                   <th scope="col"style='width:100px'>주문금액</th>
                   <th scope="col" class="tNonePre">주문</th>
     </tr>
    </thead>
    <tbody id="rowCheck">
             <c:forEach var="row" items="${map.list}" varStatus="i">
               <tr>                
                  <td> 
                      <input type="checkbox" name="checkRow" class="chk" id="checkRow"  value="${row.bas_no},${row.bas_proname},${row.bas_proprice},${row.bas_prostock},${row.bas_procode},${row.bas_proimg}, ${row.bas_procomment},${row.pro_memno},${row.sto_name},${row.bas_memno}"
                      onclick="cart();" /> 
                      <input type="hidden" value="${row.money}">
                  </td>
                  <td class="img" class="tNonePre">
                       <a href="productDetail.gt?pro_code=${row.bas_procode}"><img src="/img/${row.bas_proimg}" style="width:60px; height:60px" class="dn" alt="" /></a>
                  </td>
                  <td class="minLeft" >
                      <a href="productDetail.gt?pro_code=${row.bas_procode}" style="color: #7e8890;"> ${row.bas_proname}</a>
                  </td>
                   <td>
                       ${row.sto_name}
                  </td>
                  <td class="tNonePre" style="width: 80px" align="right" id="proprice"><fmt:formatNumber pattern="###,###,###" value="${row.bas_proprice}"/></td>
                  <td id="stock2">
					<div class="qty">
                      <input type="hidden" id="bas_procode" name="bas_procode" value="${row.bas_procode}">
                      <input type="hidden" name="stock1" id="stock1" value="${row.stock}"> 
	    		      <input type="text" id="pro_stock" name="pro_stock" value="${row.bas_prostock}">
	    		      <div class="up"><a id= count_up ><img src="/img/btn_qty_up.gif" alt="up" /></a></div>
	    		      <div class="down"><a id=count_down><img src="/img/btn_qty_down.gif" alt="down" /></a></div>
	    		      <%-- <input type="text" value="${row.money }"> --%>
                    </div>
                    <input type="hidden" value="${row.money }">
				  </td>
                  <td class="total"style="width: 80px" align="right" id= orderSum>
                 	<fmt:formatNumber pattern="###,###,###" value="${row.money}"/>원
                  </td>
                   <td class="tNonePre">
                   		<input type="hidden" id="firstMoney" value="${row.money}">
						<input type="hidden" name="bas_all" id="bas_all" value="${row.bas_no},${row.bas_proname},${row.bas_proprice},${row.bas_prostock},${row.bas_procode},${row.bas_proimg}, ${row.bas_procomment},${row.pro_memno},${row.sto_name},${row.bas_memno}">
						<a class="minPurchase" id= "orderOne" onclick="" >바로구매</a><br/>
						<a href="#" class="minDel02" onclick="button_basDel(${row.bas_no});">상품삭제</a>
				   </td>
                </tr>
               </c:forEach>
    </tbody>
   </table> 
    <table class="listType" border="1" cellspacing="0">
							<caption>결제 목록</caption>
							<colgroup>
							<col width="*" />
							<col width="14%" class="cartw28"/>
							<col width="12%" class="cartw29"/>
							</colgroup>
							<tbody>
								<tr>
									<td class="bg">&nbsp;</td>
									<td class="total bg">총 주문금액</td>
									<td class="total bg"><strong><span ID="chkSum"></span></strong> 원</td>
								</tr>
							</tbody>
						</table>
  
  
  </div>
  </form>
  	<div class="btnAreaList">
		<a href="#" class="sOrder"  id=button_selOrder onclick="button_selOrder();"><p>선택상품 <span>주문하기</span></p></a>&nbsp;&nbsp;
		<a href="#" class="aOrder" id=button_allOrder onclick="button_allOrder();"><p>전체상품 <span>주문하기</span></p></a>&nbsp;&nbsp;
		<a href="/gotThem" class="continuation" onclick=""><p>쇼핑 <span>계속하기</span></p></a>
	</div>
</c:otherwise>
</c:choose>   
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

<script src="resources/mainTemplate/js/scripts.min.js"></script>
 <script src="resources/mainTemplate/js/main.min.js"></script>
 <script src="resources/mainTemplate/js/custom.js"></script>
 <!-- KAKAO API -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
var Sum1;
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
 	checkSumArr.push($(this).next().val());
 	});
 var sum=0;
 for(var i = 0; i< checkSumArr.length; i++){
 	var cartSum = parseInt(checkSumArr[i]);
 	sum+=cartSum;
 	var str = sum;
  	var bb = Number(str).toLocaleString('en').split(".")[0];	
 	document.getElementById("chkSum").innerHTML = bb;
 	}
 
 });
 $(document).on("click", "#rowCheck tr", function(event){
	if(event.target.nodeName.toLowerCase() == "td") {
		/* var checkbox = $(this).find("td:nth-child(7) :checkbox"); */
		var checkbox = $(this).find("td:first-child :checkbox");

		if (checkbox.is(":checked")) {
			checkbox.prop("checked", false);
			cart();
		} else {
			checkbox.prop("checked", true);
			cart();
		}
	}
}); 

function cart(){ //결제 금액 계산
	var checkSumArr = [];
	$("input[name='checkRow']:checked").each(function(i) {
		/* $(this).parent().next().next().next().next().next().children().next().css("background-color", "aqua");  */
		checkSumArr.push($(this).parent().next().next().next().next().next().children().next().val());
		});
	var sum=0;
	for ( var i = 0; i< checkSumArr.length; i++){
		var cartSum = parseInt(checkSumArr[i]);
		sum+=cartSum;
		var str = sum;
     	var bb = Number(str).toLocaleString('en').split(".")[0];
     	document.getElementById("chkSum").innerHTML = bb;
     	}
	return sum;
	}  
	
function cart1(){ //결제 금액 계산
	var checkSumArr = [];
	$("input[name='checkRow']").each(function(i) {
		checkSumArr.push($(this).parent().next().next().next().next().next().children().next().val());
		});
	var sum=0;
	for ( var i = 0; i< checkSumArr.length; i++){
		var cartSum = parseInt(checkSumArr[i]);
		sum+=cartSum;
		var str = sum;
     	var bb = Number(str).toLocaleString('en').split(".")[0];
     	document.getElementById("chkSum").innerHTML = bb;
     	}
	return sum;
	}  

function button_basDel(bas_no){  //단건 직접 삭제
	if (confirm("장바구니에서 상품을 삭제 하시겠습니까?")){
		location.href="delete.gt?bas_no="+bas_no;
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
	

function button_allDel(){  //장바구니 전체 삭제
	  var checkAllDel = [];
	  $("input[name='checkRow']").each(function(i){
	       checkAllDel.push($(this).val());
	       });
	  checkAllDel.push('[]');
	  if (confirm("전체 상품을 삭제하시겠습니까?")){
		  $.ajax({
			  url:"selectDelete.gt",
			  type:"post",
			  dataType: "text",
			  data:{arrDel:checkAllDel
				  },
				  success:function(result){
					  location.href="./listBasket.gt";
					  }
				  });
		  }else{ // 취소
			  return;
		  }
	  }  

		 

$(document).on("click", "#count_down",function(){// 수량 변경 다운
	var bas_procode= $(this).parent().prev().prev().prev().prev().val()*1;
	var basS = $(this).parent().prev().prev().prev().val()*1;
	var chaS=  $(this).parent().prev().prev().val()*1 -1;
	var text= $(this).parent().prev().prev();
	var price1= $(this).parent().parent().parent().prev().text();
	var price =  price1.replace(/,/g, '');
	Sum1= chaS *price;
	$(this).parent().parent().next().val(Sum1);
	var bb = Number(Sum1).toLocaleString('en').split(".")[0] +"원";
	var orderSum= $(this).parent().parent().parent().next(); 

	if (chaS > 0) {
		$.ajax({
			url:"update.gt",
			type:"post",
			data:{"bas_procode" : bas_procode,
		    	  "bas_prostock" : chaS
		    	  },
		    	  success:function(){
		    		  text.val(chaS);
		    		  orderSum.text(bb);
		    		  cart1();
		    		  }
		    	  });
		} else{
			return;
			}
	
	});
	
$(document).on("click", "#count_up",function(){//수량변경 업
	var bas_procode= $(this).parent().prev().prev().prev().val()*1;	
	var basS = $(this).parent().prev().prev().val()*1;
	var chaS= 1+ $(this).parent().prev().val()*1; 
	var text= $(this).parent().prev();
	var price1= $(this).parent().parent().parent().prev().text();
	var price =  price1.replace(/,/g, '');
	Sum1= chaS *price;
	$(this).parent().parent().next().val(Sum1);
	var bb = Number(Sum1).toLocaleString('en').split(".")[0] +"원";
	var orderSum= $(this).parent().parent().parent().next();
	if (chaS <= basS) {
    	$.ajax({
    		url:"update.gt",
    		type:"post",
    		data:{"bas_procode" : bas_procode,
    			  "bas_prostock" : chaS
    			  },
    			  success:function(){
    				  text.val(chaS);
		    		  orderSum.text(bb); 
		    		  cart1();
    				  }
    			  });
    	} else{
    		alert("최대 "+ basS+"개 이하 주문이 가능합니다.");
    		location.reload();
    		}
    });

$(document).on("change", "#pro_stock", function(){//텍스트로 수량 변경	
	var bas_procode= $(this).prev().prev().val()*1;	
	var basS =$(this).prev().val()*1;
	var chaS= $(this).val()*1;
	var text= $(this);
    var price1= $(this).parent().parent().prev().text();
    var price =  price1.replace(/,/g, '');
	Sum1= chaS *price;
	$(this).val(Sum1);
	var bb = Number(Sum1).toLocaleString('en').split(".")[0] +"원";
    var orderSum= $(this).parent().parent().next(); 
	
	 if (chaS < 0) {
		 location.reload();
		 }else if (chaS <= basS) {
			 $.ajax({
				 url:"update.gt",
				 type:"post",
				 data:{"bas_procode" : bas_procode,
	    			   "bas_prostock" : chaS
	    			   },
	    			   success:function(){
	    				   text.val(chaS);
	    				   orderSum.text(bb);
	    				   }
	    			   });
			 } else {
				 alert("최대 "+ basS+"개 이하 주문이 가능합니다.");
				 location.reload();
				 }
	 });  


var access_Token = '${sessionScope.token}';
Kakao.init("363553076ca8777f012d9c9ce3b92b8c");	

$(document).on("click", "#orderOne",function(){// 단건 결제 api
	if(!access_Token){
		console.log('토큰이 없음');
		loginWithKakao();
		} else {
			console.log("토근존재");
			var firstMoney = $(this).prev().prev().val();
			var orderOne = $(this).prev().val();
			if (Sum1 == null) {
				orderOne = orderOne+","+firstMoney+","+$(this).parent().prev().prev().children().children().next().next().val(); 			
				paymentOne(orderOne);
			} else {
				orderOne = orderOne+","+Sum1+","+$(this).parent().prev().prev().children().children().next().next().val(); 
				paymentOne(orderOne);	
			}
			}
	});

function paymentOne(orderOne){// 단건 결제
	if(confirm("상품을 결제 하시겠습니까?")){
		$.ajax({
			url : 'paymentOne.gt',
			data : {
				accessToken : access_Token,
				"orderOne": orderOne
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
		}else{
			return;
			}
	}


$(document).on("click", "#button_allOrder",function(){// 복수 결제_전체 api
	if(!access_Token){
		console.log('토큰이 없음');
		loginWithKakao();
		} else {
			console.log("토근존재");
			var checkAllOrder = [];
			if (Sum1 == null) {	
			$("input[name='checkRow']").each(function(i){
				checkAllOrder.push($(this).val());
				checkAllOrder.push($(this).next().val());
				});
			checkAllOrder.push('[]');
			} else {
				$("input[name='checkRow']").each(function(i){
					checkAllOrder.push($(this).val()+","+$(this).parent().next().next().next().next().next().children().next().val()+","+$(this).parent().next().next().next().next().next().children().children().next().next().val());
					});
				checkAllOrder.push('[]');
			}
			if (confirm("전체 상품을 결제 하시겠습니까?")){
				payment(checkAllOrder);
				} else {
					return;
					}
			}
			});
	
		
$(document).on("click", "#button_selOrder",function(){// 복수 결제_선택 api
	if(!access_Token){
		console.log('토큰이 없음');
		loginWithKakao();
		} else {
			console.log("토근존재");
			if( $(":checkbox[name='checkRow']:checked").length==0 ){
				alert("결제할 항목을 체크해주세요.");
				return;
				}
			var checkAllOrder = [];
			if (Sum1 == null) {
				$("input[name='checkRow']:checked").each(function(i){
					checkAllOrder.push($(this).val());
					checkAllOrder.push($(this).next().val());
					});
				checkAllOrder.push('[]');
				} else {
					$("input[name='checkRow']:checked").each(function(i){
						checkAllOrder.push($(this).val()+","+$(this).parent().next().next().next().next().next().children().next().val()+","+$(this).parent().next().next().next().next().next().children().children().next().next().val());
					});
					checkAllOrder.push('[]');
					}
			if (confirm("선택한 상품을 결제 하시겠습니까?")){
				payment(checkAllOrder);
				} else {
					return;
					}
			}

			});
				

function payment(checkAllOrder) { // 복수 결제 api
	var chkSum = $("#chkSum").text();
    var sum =  chkSum.replace(/,/g, '');
    $.ajax({
		url : 'payment.gt',
		data: {
			accessToken : access_Token,
			arrOrder: checkAllOrder,
			sum: sum
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
