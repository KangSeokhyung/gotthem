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
					<th>NO</th>
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일</th>
					<th>이메일</th>
					<th>탈퇴여부</th>
					<th>회원등급</th>	
					<th>수정</th>
					<th>비활성화</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="mlist" items="${requestScope.mlist}">
					<tr>
						<td>${mlist.mem_no}</td>
						<td>${mlist.mem_id}</td>
						<td>${mlist.mem_name}</td>
						<td>${mlist.mem_phone}</td>
						<td>${mlist.mem_address}</td>
						<td>${mlist.mem_regdate}</td>
						<td>${mlist.mem_status}</td>
						<td>${mlist.enabled}</td>
						<td><select>
						<option value="volvo">ROLE_USER</option>
						<option value="saab">ROLE_ADMIN</option>
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