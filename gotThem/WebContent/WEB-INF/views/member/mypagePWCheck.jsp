<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 비밀번호 확인</title>
</head>
<body>
<div style="border-top: 5px solid gray; border-bottom: 5px solid gray;">
	<!-- <form action="passCheck.gt" method="post"> -->
	<br><br><br>
		<div id="tab-a">
			<table class="table table-user-information">
				<tr>
					<td><span>현재 비밀번호 :</span></td>
					<td><input name="mem_pw" type="text" ></td>
					<td><a class="btn-success" onclick="click()" >확인</a></td>
				</tr>
			</table>
			<br>
		</div>
		<!-- </form> -->
		<form action="passCheck.gt" method="post">
		<c:set var="passCheck1" value="${passCheck}"/>
			<c:if test="${passCheck1 ne null}">
				<div>
					<table class="table table-user-information">
						<tr>
							<td>새 비밀번호 :</td>
							<td><input name="mem_pw" type="text"
								placeholder="새 비밀번호를 입력하세요"></td>
						</tr>
						<tr>
							<td>비밀번호 확인 :</td>
							<td><input name="mem_pw2" type="text" placeholder="비밀번호 확인"></td>
						</tr>
						<tr>
							<td><button class="btn-success">변경</button></td>
							<td><button class="btn-success" onclick="history.back()">취소</button></td>
						</tr>
					</table>
				</div>
			</c:if>
	</form>
		
</div>
</body>
<script>
	function click(){
		$.post("passCheck.gt", function(data) {
			$('#tab-a').html(data);
		});
	}
	</script>
</html>