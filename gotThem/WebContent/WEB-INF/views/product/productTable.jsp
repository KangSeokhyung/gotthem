<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Got Them?</title>
<style type="text/css">
.table>tbody>tr>td, .table>tbody>tr>th, 
.table>tfoot>tr>td, .table>tfoot>tr>th, 
.table>thead>tr>td, .table>thead>tr>th {
    padding: 8px;
    line-height: 1.42857143;
    vertical-align: middle;
}
thead { color: #4A3E3E; font-weight: 600; }
tbody a { color: #242D91; }
tbody a:hover { color: #fa2848; }
@media (max-width: 540px){
	.table>tbody>tr>td {
	    font-size: 12px;
	}
	.table>thead>tr>td {
	    font-size: 13px;
	}
}
@media (max-width: 768px) {
	.wid {
		width: 16%;
	} 
}

td { padding:17px 5px 16px; font-size:17px; line-height:1.4; vertical-align:middle; }
</style>
</head>
<body>
	<div>
		<table class="table table-bordered table-hover">
			<colgroup>
				<col width="17%" />
				<col width="30%" />
				<col width="10%" class="tNonePre" />
				<col width="15%" />
				<col width="8%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<td class="text-center">이미지</td>
					<td class="text-center">상품명</td>
					<td class="text-center tNonePre">수량</td>
					<td class="text-center">금액</td>
					<td class="text-center wid">선택</td>
					<td class="text-center">장바구니</td>
				</tr>
			</thead>
			<tbody id="rowCheck">
				<c:forEach var="list" items="${productInfo }">
				<c:if test="${list.pro_stock > 0 }">
				<input type="hidden" id="pro_code" name="pro_code" value="${list.pro_code }">
				<tr>
					<td><a href="javascript:movedetail('${list.pro_code }', '${sto_name }');"><img src="/img/${list.pro_img }" 
					 		height="50px" width="50px" title="상품이미지" alt="상품이미지"></a></td>
					<td><a href="javascript:movedetail('${list.pro_code }', '${sto_name }');">${list.pro_name }</a></td>
					<td class="tNonePre">${list.pro_stock }</td>
					<td><fmt:formatNumber pattern="###,###,###" value="${list.pro_price }" /></td>
					<td>
						<input type="checkbox" name="statusCheck" 
						value="${list.pro_code },${list.pro_name },${list.pro_memno },${list.pro_category },${list.pro_stock },${list.pro_price },${list.pro_img },${sto_name }">
					</td>
					<td>
						<c:set var="sessionCheck" value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
						<c:choose>
							<c:when test="${sessionCheck eq null}">
								<input type="button" onclick="loginForward('${list.pro_code }')" value="담기" class="btn btnColor4 col-sm-12 col-md-6 col-md-offset-3">
							</c:when>
							<c:otherwise>
								<input type="button" id="basketBtn" value="담기" class="btn btnColor4 col-sm-12 col-md-6 col-md-offset-3"
									onclick="addBasket('${list.pro_code }', '${list.pro_name }', '${list.pro_memno }', 
									'${list.pro_category }', '${list.pro_price }', '${list.pro_img }','${sto_name }')">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				</c:if>
				</c:forEach>
			</tbody>
		</table>
		<c:choose>
			<c:when test="${sessionCheck eq null}">
				<div class="col-sm-12">
					<input type="button" onclick="loginForward3()" class="btn btnColor3" value="선택항목 담기 ">
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-sm-12">
					<input type="button" onclick="selectAddBasket()" class="btn btnColor3" value="선택항목 담기 ">
				</div>
			</c:otherwise>
		</c:choose>
		
	</div>
</body>
</html>