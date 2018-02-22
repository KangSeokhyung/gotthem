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
		<div id="tab-a">
			<table class="table table-user-information">
				<tr>
					<td><span>현재 비밀번호 :</span></td>
					<td><input name="mem_pw" type="text" ></td>
					<td><button  type="submit" class="btn-success" value="">확인</button></td>
				</tr>
			</table>
			<br>
		</div>
		</form>
		
	</div>
</body>
<script>

</script>
</html>