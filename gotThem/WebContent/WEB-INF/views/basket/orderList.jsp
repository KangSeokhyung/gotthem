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
                   <th>결제 번호</th>
                   <th>상품코드</th>
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
                        ${row.ord_proname}
                  </td>
                  <td>
                        ${row.ord_stock}
                  </td>
                  <td>
                       <fmt:formatNumber pattern="###,###,###" value="${row.ord_price}"/>
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
          <%--   <input type="hidden" name="count" value="${map.count}"> --%>
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