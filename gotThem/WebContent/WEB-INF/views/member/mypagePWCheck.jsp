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
	<form action="passCheck.gt" method="post">
	<br><br><br>
		<div style="margin:200px;">
			<table class="table table-user-information" style="border: 1px solid gray;">
				<tr>
					<td><span>현재 비밀번호 :</span></td>
					<td><input name="mem_pw" type="text" ></td>
				</tr>
				<tr>
					<td><span>새로운 비밀번호 :</span></td>
					<td><input name="new_pw" type="text" ></td>
				</tr>
				<tr>
					<td><span>비밀번호 확인 :</span></td>
					<td><input name="new_pw2" type="text" ></td>
				</tr>
				<tr>
					<td><button style="width:50%; font-size:20px;" class="btn-danger col-sm-6" onclick="backIndex()">처음으로</button></td>
					<td><button style="width:50%; font-size:20px;" type="submit" class="btn-success col-sm-6" value="">확인</button></td>
				</tr>
			</table>
			<br>
		</div>
		</form>
	</div>
</body>
	<c:if test="${resultMsg ne null }">
		<c:choose>
			<c:when test="${resultMsg eq 'fail1' }">
				<script>
				alert("현재 비밀번호가 맞지 않습니다.");
				</script>
			</c:when>
			<c:when test="${resultMsg eq 'fail2' }">
				<script>
				alert("새로운 비밀번호와 비밀번호 확인이 다릅니다. 확인해주세요");
				</script>
			</c:when>
			<c:when test="${resultMsg eq 'fail3' }">
				<script>
				alert("비밀번호가 변경이 실패했습니다.");
				</script>
			</c:when>
			<c:when test="${resultMsg eq 'success' }">
				<script>
				alert("비밀번호가 변경되었습니다.");
				</script>
			</c:when>
		</c:choose>	
	</c:if>
<script>
	function backIndex(){
		location.href="index.gt";
	}
</script>
</html>