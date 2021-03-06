<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>상품장바구니 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<link rel="stylesheet"
	href="resources/mainTemplate/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="resources/mainTemplate/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/mainTemplate/sweetalert/dist/sweetalert.css">
<link rel="stylesheet" href="resources/mainTemplate/css/stisla.css">
<style>
section{
background-size : cover;
}
</style>
</head>
<body>
	<header>
		<%@include file="/nav.jsp"%>
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
                   <th><!-- <input type="checkbox" id="checkall" /> --></th>  
                   <th>상품명</th>
                   <th>단가</th>
                   <th>수량</th>
                   <th>금액</th>
                   <th>취소</th>
                   <th>결제</th>
               </tr>
             <c:forEach var="row" items="${map.list}" varStatus="i">
               <tr>                
                  <!-- <td><input type="checkbox" name="chk" /></td> -->
                  <td><input type="checkbox" name="chk[]" value="${row.bas_no}"/> 
                  </td>
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
             <input type="button" name="sedelete" id="button" value="선택삭제" />
        </form>
      </c:otherwise>
    </c:choose>
</div>    
	<footer>
		<div class="container">
			<figure>
				<img src="resources/mainTemplate/img/logo.png" alt="Logo">
			</figure>
			<p>Copyright &copy; 2018 스탑없으</p>
			<p>
				Made with <i class="ion-heart"></i> By Kodinger
			</p>
		</div>
	</footer>
</body>
	<script src="resources/mainTemplate/js/jquery.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/mainTemplate/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/mainTemplate/js/jquery.easeScroll.js"></script>
	<script src="resources/mainTemplate/sweetalert/dist/sweetalert.min.js"></script>
	<script src="resources/mainTemplate/js/stisla.js"></script>
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
    
/*     $(document).ready(function(){
      $("#checkall").click(function(){  //최상단 체크박스 클릭
         if($("#checkall").prop("checked")){  //클릭되었으면
                //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                $("input[name=chk]").prop("checked",true);
            }else{     //클릭이 안되있으면
                //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                $("input[name=chk]").prop("checked",false);
            }
        })
    }) */
/*    function modify() {
	   var submitTest = document.form1;
	   submitTest.action="./update.gt";
	   submitTest.method="post";
	   submitTest.submit();
   } */

/*    function _sedelete(f) {
	   alert("선택삭제"); //같이 보낼 값 정리
       if (typeof(f.elements['chk[]'].length) == 'undefined') { //단일
           if (f.elements['chk[]'].checked==false) {
               f.elements['field_a[]'].disabled=true;
               f.elements['field_b[]'].disabled=true;
           }
       } else { //다중
           for (i=0; i<f.elements['chk[]'].length; i++) {
               if (f.elements['chk[]'][i].checked==false){
                   f.elements['field_a[]'][i].disabled=true;
                   f.elements['field_b[]'][i].disabled=true;
               }
           }
       }
       return true;
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