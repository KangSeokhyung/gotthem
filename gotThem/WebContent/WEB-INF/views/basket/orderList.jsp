<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 목록</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<%-- <%@ include file="../include/header.jsp" %> --%>
</head>
<body>
<%-- <%@ include file="../include/menu.jsp" %> --%> 
<div class="container">	
 <h2>결제 확인</h2>
  <h4>결제 확인 목록</h4>   
  	<div class="reserve-methods" style="text-align:center;">
		<input id="ressearch-admin" onkeyup="searchName()" type="text" placeholder="공연 검색" autofocus="autofocus">
		<form action="AdminReserve.ad" method="post">
			<input id="resdate-admin" name="deleteDate" type="date">
			<button type="submit" id="resdeletedate" type="button" class="btn btn-warning">해당날짜 이전데이터 삭제</button>
		</form>
		<form action="AdminReserve.ad" method="post">
			<input id="resid-admin" name="deleteId" type="text" placeholder="아이디 검색" onkeyup="searchId()">
			<button id="resdeleteid" type="submit" class="btn btn-danger">아이디 예약 삭제</button>
		</form>
		<button type="button" class="btn btn-default" onclick="location.reload()"><span class="glyphicon glyphicon-refresh"></span></button>
	</div>

  	<form name="form1" id="form1" method="post" action="./update.gt">
           <table border="1">
               <tr>
                   <th>상품명</th>
                   <th>단가</th>
                   <th>수량</th>
                   <th>금액</th>
                   <th>취소</th>
                   <th>결제</th>
               </tr>
             <c:forEach var="row" items="${map.list}" varStatus="i">
               <tr>
                  <td>
                        ${row.bas_proname}
                  </td>
                  <td style="width: 80px" align="right">
                       <fmt:formatNumber pattern="###,###,###" value="${row.bas_proprice}"/>
                  </td>
                    
                  <td>
                     <input type="number" style="width: 40px" name="bas_prostock" value="${row.bas_prostock}" min="1">
                     <input type="hidden" name="bas_procode" value="${row.bas_procode}">
                     <button type="submit" id="btnUpdate">수정</button>
                  </td>
                  <td style="width: 100px" align="right">
                       <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>                   
                  </td>
                  <td>
                       <%-- <a href="./delete.gt?bas_no=${row.bas_no}">삭제</a> --%>
                       <input type="button" value="삭제" onclick="button_event(${row.bas_no});">
                  </td>
                  <td>
                       <input type="number" style="width: 40px" name="bas_prostock" value="${row.bas_prostock}" min="1">
                       <input type="hidden" name="bas_procode" value="${row.bas_procode}">
                       <button type="submit" id="btnOrd">하나결제</button>
                  </td>
                 </tr>
               </c:forEach>
                <tr>
                    <td colspan="5" align="right">
                    
                   장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/><br>
                        <%-- 배송료 : ${map.fee}<br>
                        전체 주문금액  :<fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/> --%>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="count" value="${map.count}">
        </form>
    <button type="button" value="상품목록2" id="btnList">상품목록</button>
</body>
<script type="text/javascript">
    $(document).ready(function(){
        // 리스트 페이지로 이동
        $("#btnList").click(function(){
            location.href="./productlist.gt";
        });
    });

   function button_event(bas_no){
    	alert(bas_no);
   if (confirm("정말 삭제하시겠습니까??")){    //확인
     location.href="delete.gt?bas_no="+bas_no;
   }else{   //취소
       return;
      }
   }
</script>
</html>