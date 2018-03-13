<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Got Them?</title>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="row">
		<form action="selectAddBasket" method="post">
		<table class="table table-bordered table-hover">
			<colgroup>
				<col width="3%" />
				<col width="22%" />
				<col width="30%" />
				<col width="10%" />
				<col width="15%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th class="text-center" scope="col"></th>
					<th class="text-center" scope="col">그림</th>
					<th class="text-center" scope="col">상품명</th>
					<th class="text-center" scope="col">수량</th>
					<th class="text-center" scope="col">금액</th>
					<th class="text-center" scope="col">장바구니 담기</th>
				</tr>
			</thead>
			<tbody id="rowCheck">
				<c:forEach var="list" items="${productInfo }">
				<tr>
					<td><input type="checkbox" name="statusCheck" 
						value="${list.pro_code },${list.pro_name },${list.pro_memno },${list.pro_category },${list.pro_stock },${list.pro_price },${list.pro_img }"></td>
					<td><a href="javascript:movedetail(${list.pro_code });"><img src="/img/${list.pro_img }" height="50px" width="50px" title="상품이미지" alt="상품이미지"></a></td>
					<td><a href="javascript:movedetail(${list.pro_code });">${list.pro_name }</a></td>
					<td>${list.pro_stock }</td>
					<td>${list.pro_price }</td>
					<td>
						<input type="button" id="basketBtn" value="장바구니" 
							onclick="addBasket('${list.pro_code }', '${list.pro_name }', '${list.pro_memno }', 
							'${list.pro_category }', '${list.pro_price }', '${list.pro_img }', '${list.pro_stock }')">
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="col-sm-12">
			<input type="button" onclick="selectAddBasket()" value="선택 장바구니 ">
		</div>
		</form>
	</div>
</body>
</html>