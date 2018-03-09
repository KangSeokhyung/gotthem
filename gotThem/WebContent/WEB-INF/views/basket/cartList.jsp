<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>상품장바구니 목록</title>
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
    <h2>장바구니 확인</h2>
    <c:choose>
        <c:when test="${map.count == 0}">
            장바구니가 비어있습니다.
           <div>
            <input type="hidden" name="count" value="${map.count}">
            <button type="button" value="상품목록1" id="btnList">상품목록</button> 
            <input type="button" name="seDel" id="button_seDel" onclick="button_selDel();" value="선택삭제" />
            <input type="button" value="선택결제" onclick="button_selOrder();">  
           </div>
        </c:when>
        <c:otherwise>     
        <form name="form1" id="form1" method="post" action="./update.gt">
         <table class="table">
               <tr>
                   <th><input type="checkbox" name="checkAll" id="th_checkAll" /></th> 
                   <th>상품사진</th>
                   <th>상품명</th>
                   <th>판매가</th>
                   <th >수량 </th>
                   <th style='width:100px'>구매예정가</th>
                   <th>선택</th>
               </tr>
             <c:forEach var="row" items="${map.list}" varStatus="i">
               <tr>                
                  <td>
                      <input type="checkbox" name="checkRow" class="chk" id="checkRow"  value="${row.bas_no},${row.bas_proname},
                      ${row.bas_proprice},${row.bas_prostock},${row.bas_procode},${row.money},${row.bas_proimg}, ${row.bas_procomment}"
                      onclick="cart();" /> 
                  </td>
                  <td>
                       <img src="/img/${row.bas_proimg}" style="width:50px; height:50px"/>
                  </td>
                  <td>
                      <a href="detail/${row.bas_procode}.gt" style="color: #7e8890;"> ${row.bas_proname}</a>
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
                       <input type="button" value="바로구매" style='width:60px;height:25px;font-size: 12px;' onclick="button_order('${row.bas_no}','${row.bas_proname}','${row.bas_procode}','${row.money}','${row.bas_prostock}');"><br>  
                       <input type="button" value="삭제" style='width:60px;height:25px;font-size: 12px;' onclick="button_basDel(${row.bas_no});">
                  </td>
                </tr>
               </c:forEach>
                <tr>
                    <td colspan="12" align="right"> 장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/><br>
                        <%-- 배송료 : ${map.fee}<br>전체 주문금액  :<fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/> --%>
                    </td>
                </tr>
                <tr>
                    <td colspan="10" align="right">선택 상품 결제 예상 금액:<p id="chkSum"></p>  </td>
                </tr>
            </table>                    
        </form>
            <input type="hidden" name="count" value="${map.count}">           
            <input type="button" name="seDel" id="button_seDel" onclick="button_selDel();" value="선택상품 삭제" style='height:25px;font-size: 12px;'/>
            <div style='float:right; padding: 3px 30px 3px 6px;'>
             <button type="button" value="상품목록1" id="btnList">상품목록</button> 
             <input type="button" value="바로구매" onclick="button_selOrder();">
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
 <script src="resources/mainTemplate/js/scripts.min.js"></script>
  <script src="resources/mainTemplate/js/main.min.js"></script>
  <script src="resources/mainTemplate/js/custom.js"></script>

<script type="text/javascript">

    $(document).ready(function(){
        // 리스트 페이지로 이동
        $("#btnList").click(function(){
            location.href="./productlist.gt";     
        });
        /* $("#btnOrd").click(function(){
            location.href="ord.gt?bas_no="+bas_no;
        }); */
        
        $('input[name*="checkRow"]').prop("checked",true); 
   
        
  	    var checkSumArr = [];
  		$("input[name='checkRow']:checked").each(function(i) {
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

$("#th_checkAll").click(function(){		//체크박스 전체 선택
		var chk= $(this).is(":checked");
		if(chk){
			$('input[name*="checkRow"]').prop("checked", true); //체크박스 전체 선택
		} else{
	        $('input[name*="checkRow"]').prop("checked", false);//체크박스 전체 해지 
   }	
});
function cart(){  //결제 금액 계산
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
function button_basDel(bas_no){  //직접 삭제
    	alert(bas_no);
   if (confirm("장바구니에서 상품을 삭제 하시겠습니까?")){    
     location.href="delete.gt?bas_no="+bas_no;
   }else{   //취소.
       return;
      }
   }
function button_order(bas_no,bas_proname,bas_procode,money,bas_prostock){
   	alert(bas_no);
  if (confirm("상품을 결제 하시겠습니까?")){   // 단건 결제
    location.href="insertOrder.gt?bas_no="+bas_no+"&bas_proname="+bas_proname+
    		"&bas_procode="+bas_procode+"&money="+money+"&bas_prostock="+bas_prostock;
  }else{   //취소.
      return;
     }
  }  
  

function button_selDel(){  //장바구니 선택 삭제
	   if( $(":checkbox[name='checkRow']:checked").length==1 ){
		    alert("삭제할 항목을 2이상 체크해주세요.");
		    return;
		  } 
	var checkArr = [];
   $("input[name='checkRow']:checked").each(function(i) {
     checkArr.push($(this).val());
	if (confirm("선택한 상품을 삭제하시겠습니까?")){
		$.ajax({				
			url:"selectDelete.gt",
			type:"post",
			dataType: "text",
			data:{arrDel:checkArr
				},
			success:function(result){
				location.href="./list.gt";
			}	
			});	    	
	}else{   //취소.
	      return;
	   } 			
   });
}  
function button_selOrder(){  //장바구니 선택 결제
	  if( $(":checkbox[name='checkRow']:checked").length==1 ){
		    alert("결제할 항목을 2이상 체크해주세요.");
		    return;
		  }   
	var checkOrder = [];
	   $("input[name='checkRow']:checked").each(function(i) {
	     checkOrder.push($(this).val());
	     }); 
		if (confirm("선택한 상품을 결제 하시겠습니까?")){
			/* alert("배열" + checkOrder); */
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
		}else{   //취소.
		      return;
		} 			
}
function modify() {   // 수량 수정
	   var submitTest = document.form1;
	   submitTest.action="./update.gt";
	   submitTest.method="post";
	   submitTest.submit();
} 

</script>	
</html>