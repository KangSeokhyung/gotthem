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
	table { border-top: 0px solid white; }
</style>
</head>
<body>
	<div>
		<form id="tableForm" action="login.gt" method="get">
			<!-- <input type="hidden" id="pro_code" name="bas_procode">
			<input type="hidden" id="pro_name" name="bas_proname">
			<input type="hidden" id="pro_memno" name="pro_memno">
			<input type="hidden" id="pro_category" name="bas_procategory">
			<input type="hidden" id="pro_price" name="bas_proprice">
			<input type="hidden" id="pro_img" name="bas_proimg">
			<input type="hidden" id="pro_stock" name="bas_prostock"> -->
		<table class="table table-bordered table-hover">
			<colgroup>
				<col width="17%" />
				<col width="30%" />
				<col width="10%" />
				<col width="15%" />
				<col width="8%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th class="text-center" scope="col">상품이미지</th>
					<th class="text-center" scope="col">상품명</th>
					<th class="text-center" scope="col">수량</th>
					<th class="text-center" scope="col">금액</th>
					<th class="text-center" scope="col">선택</th>
					<th class="text-center" scope="col">장바구니 담기</th>
				</tr>
			</thead>
			<tbody id="rowCheck">
				<c:forEach var="list" items="${productInfo }">
				<c:if test="${list.pro_stock > 0 }">
				<input type="hidden" id="pro_code" name="pro_code" value="${list.pro_code }">
				<tr>
					<td><a href="javascript:movedetail(${list.pro_code });"><img src="/img/${list.pro_img }" height="50px" width="50px" title="상품이미지" alt="상품이미지"></a></td>
					<td><a href="javascript:movedetail(${list.pro_code });">${list.pro_name }</a></td>
					<td>${list.pro_stock }</td>
					<td><fmt:formatNumber pattern="###,###,###" value="${list.pro_price }" /></td>
					<td>
						<input type="checkbox" name="statusCheck" 
						value="${list.pro_code },${list.pro_name },${list.pro_memno },${list.pro_category },${list.pro_stock },${list.pro_price },${list.pro_img }">
					</td>
					<td>
						<c:set var="sessionCheck" value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
						<c:choose>
							<c:when test="${sessionCheck eq null}">
								<input type="button" onclick="loginForward('${list.pro_code }')" value="담기" class="btn btn-info">
							</c:when>
							<c:otherwise>
								<input type="button" id="basketBtn" value="담기" class="btn btn-info"
									onclick="addBasket('${list.pro_code }', '${list.pro_name }', '${list.pro_memno }', 
									'${list.pro_category }', '${list.pro_price }', '${list.pro_img }')">
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
					<input type="button" onclick="loginForward2()" class="btn btn-info" value="선택항목 담기 ">
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-sm-12">
					<input type="button" onclick="selectAddBasket()" class="btn btn-info" value="선택항목 담기 ">
				</div>
			</c:otherwise>
		</c:choose>
		
		</form>
	</div>
</body>
</html>