<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Got Them?</title>
</head>
<body>
	<div class="row">
		<table class="table table-bordered table-hover">
			<colgroup>
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
			</colgroup>
			<thead>
				<tr>
					<th class="text-center" scope="col">상품명</th>
					<th class="text-center" scope="col">분류</th>
					<th class="text-center" scope="col">수량</th>
					<th class="text-center" scope="col">금액</th>
				</tr>
			</thead>
			<tbody id="searchTemplate">
				<c:forEach var="list" items="${productInfo }">
					<input type="hidden" name="pro_code" id="pro_code" value="${list.pro_code }">
				<tr>
					<td>${list.pro_name }</td>
					<td>${list.pro_category }</td>
					<td>${list.pro_stock }</td>
					<td>${list.pro_price }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>