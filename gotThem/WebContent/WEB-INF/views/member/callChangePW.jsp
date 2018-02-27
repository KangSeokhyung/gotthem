<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<body>
	<div>
			<form action="passCheck.gt" method="post">
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
			</form>
		</div>
</body>

</html>