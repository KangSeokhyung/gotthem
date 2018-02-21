<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세정보</title>
<%-- <%@ include file="../include/header.jsp" %> --%>
</head>
<body>
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
                               <input type="hidden" name="bas_stono" value="${m.pro_stono}"> 
                               <input type="hidden" name="bas_proprice" value="${m.pro_price}">
                                <select name="bas_prostock" >
                                    <c:forEach begin="1" end="10" var="i">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>&nbsp;개
                                <input type="submit" value="장바구니에 담기">
                            </form>
                            <a href="./basket/productList.jsp">상품목록</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>