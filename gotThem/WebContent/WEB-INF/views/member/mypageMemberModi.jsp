<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<!--Main content code to be written here -->
	<br>
	<div style="border-top: 5px solid gray; border-bottom: 5px solid gray;">
			<form action="memberModi.gt" method="POST">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3>회원 정보 수정</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class=" col-md-12 col-lg-12 " align="center">
							<input type="hidden" name="mem_id" value="${memberInfo.mem_id}"/>
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td><span>회원 아이디:</span></td>
											<td>${memberInfo.mem_id}</td>
										</tr>
										<tr>
											<td><span>이름:</span></td>
											<td><input style="width: 100%" type="text"
												name="mem_name" value="${memberInfo.mem_name}"></td>
										</tr>
										<tr>
											<td><span>이메일:</span></td>
											<td><input style="width: 100%" type="text"
												name="mem_email" value="${memberInfo.mem_email}"></td>

										</tr>
										<tr>
											<td><span>전화번호:</span></td>
											<td><input style="width: 100%" type="text"
												name="mem_phone" value="${memberInfo.mem_phone}"></td>
										</tr>
										<tr>
											<td><span>가입일:</span></td>
											<td>${memberInfo.mem_regdate}</td>
										</tr>
										<tr>
											<td><span>우편번호:</span></td>
											<td><input style="width: 100%" type="text"
												name="mem_post" value="${memberInfo.mem_post}"></td>
										</tr>
										<tr>
											<td><span>주소:</span></td>
											<td><input style="width: 100%" type="text"
												name="mem_address1" value="${memberInfo.mem_address1}"><br>
												<input style="width: 100%" type="text" name="mem_address2"
												value="${memberInfo.mem_address2}"></td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel-footer"></div>
						<button class="btn-success" type="submit">완료</button>
						<button class="btn-danger" onclick="reset()">취소</button>
						<button class="btn-blue" onclick="history.go(-1)">뒤로가기</button>
				</div>
			</form>

		</div>

	
</body>
</html>