<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품장바구니 목록</title>
<%-- <%@ include file="../include/header.jsp" %> --%>
 
</head>
<body>
<%-- <%@ include file="../include/menu.jsp" %> --%>
    <h2>장바구니 확인</h2>
    <c:choose>
        <c:when test="${map.count == 0}">
            장바구니가 비어있습니다.
        </c:when>
        <c:otherwise>
        <form name="form1" id="form1" method="post" action="./update.gt">
            <table border="1">
                <tr>
                    <th>상품명</th>
                    <th>단가</th>
                    <th>수량</th>
                    <th>금액</th>
                    <th>취소</th>
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
                        <a href="./delete.gt?bas_no=${row.bas_no}">삭제</a>
                        <input type="button" value="삭제" onclick="button_event();">
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
        </c:otherwise>
    </c:choose>
    <button type="button" id="btnList">상품목록</button>
</body>
<script type="text/javascript">
    $(document).ready(function(){
        // 리스트 페이지로 이동
        $("#btnList").click(function(){
            location.href="./productlist.gt";
        });
    });
    </script>  
    <script type="text/javascript">
    function button_event(){
    if (confirm("정말 삭제하시겠습니까??")){    //확인
    location.href="delete.gt?bas_no=${row.bas_no}";
    }else{   //취소
        return;
    }
    }
    </script>
</html>