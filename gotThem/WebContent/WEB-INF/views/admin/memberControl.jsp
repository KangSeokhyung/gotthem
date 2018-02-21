<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="resources/landy/vendor/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>점포번호</th>
					<th>점주아이디</th>
					<th>점주명</th>
					<th>점포명</th>
					<th>점포주소</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>가입일</th>
					<th>사업자번호</th>
					<th>승인상태</th>
					<th>승인여부</th>	
					<th>수정하기</th>
					<th>삭제하기</th>			
				</tr>
			</thead>
			<tbody>
			<c:forEach var="stlist" items="${requestScope.stlist}">
					<tr>
						<td>${stlist.sto_no}</td>
						<td>${stlist.sto_id}</td>
						<td>${stlist.sto_owner}</td>
						<td>${stlist.sto_name }</td>
						<td>${stlist.sto_address}</td>
						<td>${stlist.sto_registno}</td>
						<td>${stlist.sto_phone}</td>
						<td>${stlist.sto_email}</td>
						<td>${stlist.sto_regdate}</td>
						<td>${stlist.enabled}</td>
						<td><select>
						<option value="volvo">0</option>
						<option value="saab">1</option>
						</select></td>
						<td><button type="button" class="btn btn-primary">수정</button></td>
						<td><button type="button" class="btn btn-danger">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>