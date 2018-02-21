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
    <h2>상품목록</h2>
    <table border="1">
        <tr>
            <th>상품ID번호</th>
            <th>상품이미지</th>
            <th>상품명</th>
            <th>가격</th>
        </tr>
        <c:forEach var="row" items="${list}">
        <tr>
            <td>
                ${row.pro_code}
            </td>
            <td>
                <a href="${path}/shop/product/detail/${row.pro_code}">
                   <%--  <img src="${path}/images/${row.productUrl}" width="120ox" height="110px"> --%>
                </a>
            </td>
            <td>
                <a href="./detail/${row.pro_code}.gt">${row.pro_name}</a>
            </td>
            <td>
                <fmt:formatNumber value="${row.pro_price}" pattern="###,###,###"/>
            </td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>