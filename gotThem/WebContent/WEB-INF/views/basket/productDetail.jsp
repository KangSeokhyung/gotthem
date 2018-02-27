<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세정보</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
</head>
<body>
<%--  <%@include file="/nav.jsp" %> --%>
<%-- <%@ include file="../include/menu.jsp" %> --%>
    <h2>상품 상세정보</h2>
    <table border="1">
        <tr>
            <td>
                사진<%-- <img src="${path}/images/${vo.productUrl}" width="340" height="300"> --%>
            </td>
            <td>
                <table border="1" style="height: 300px; width: 400px;">
                    <tr align="center">
                        <td>상품명</td>
                        <td>${m.pro_name}</td>
                    </tr>
                    <tr align="center">
                        <td>가격</td>
                        <td><fmt:formatNumber value="${m.pro_price}" pattern="###,###,###"/></td>
                    </tr>
                    <tr align="center">
                        <td>상품소개</td>
                        <td>상품소개<%-- ${vo.productDesc} --%></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <form name="form1" method="post" action="../insert.gt">
                               <input type="hidden" name="bas_procode" value="${m.pro_code}">
                               <input type="hidden" name="bas_proname" value="${m.pro_name}"> 
                               <input type="hidden" name="bas_proprice" value="${m.pro_price}">
                               <input type="hidden" name="bas_procategory" value="${m.pro_category}">
                               <input type="hidden" name="bas_proexdate" value="${m.pro_exdate}">
                                <select name="bas_prostock" >
                                    <c:forEach begin="1" end="10" var="i">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>&nbsp;개
                                <input type="submit" value="장바구니에 담기">
                            </form>
                            <button type="button" value="상품목록" id="btnList">상품목록</button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
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
</script>
</html>