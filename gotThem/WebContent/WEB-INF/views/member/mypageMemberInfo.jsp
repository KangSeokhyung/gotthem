<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Mypage</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="resources/mypages/vendor/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet"
	href="resources/mypages/css/mypage.css">

</head>

<body>

	<!--Main content code to be written here -->
	<br>
	<div style="border-top: 5px solid gray; border-bottom: 5px solid gray;">
		
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">회원 정보</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class=" col-md-12 col-lg-12 " align="center">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>회원 아이디:</td>
										<td>${memberInfo.mem_id}</td>
									</tr>
									<tr>
										<td>이름:</td>
										<td>${memberInfo.mem_name}</td>
									</tr>
									<tr>
										<td>이메일:</td>
										<td>${memberInfo.mem_email}</td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td>${memberInfo.mem_phone}</td>
									</tr>
									<tr>
										<td>가입일</td>
										<td>${memberInfo.mem_regdate}</td>
									</tr>
									<tr>
										<td>우편번호</td>
										<td>${mem_post}</td>
									</tr>
									<tr>
										<td>주소</td>
										<td>${mem_address1}&nbsp;&nbsp;${mem_address2}
										</td>

									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					
				</div>

			</div>
		</div>


</body>
</html>