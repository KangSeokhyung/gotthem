<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--Main content code to be written here -->
	<br>
	<div style="border-top: 5px solid gray; border-bottom: 5px solid gray;">
		<div
			class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">


			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">회원 정보</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class=" col-md-12 col-lg-12 " align="center">
							<table class="table table-user-information">
								<tbody>
									<tr><td>
										<span>회원 아이디:</span>
										<input type="text" value="${memberInfo.mem_id}">
										</td>
									</tr>
									<tr>
										<td>
										<span>이름:</span>
										<input type="text" value="${memberInfo.mem_name}">
										</td>
									</tr>
									<tr>
										<td>
										<span>이메일:</span>
										<input type="text" value="${memberInfo.mem_email}">
										</td>
										
									</tr>
									<tr>
										<td>
										<span>전화번호:</span>
										<input type="text" value="${memberInfo.mem_phone}">
										</td>
									</tr>
									<tr>
										<td>
										<span>가입일:</span>
										<input type="text" value="${memberInfo.mem_regdate}">
										</td>
									</tr>
									<tr>
										<td>
										<span>우편번호:</span>
										<input type="text" value="${memberInfo.mem_post}">
										</td>
									</tr>
									<tr>
										<td>
										<span>주소:</span>
										<input type="text" value="${memberInfo.mem_address1}+${memberInfo.mem_address2}">
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<span class="pull-right"> <a href="edit.html"
						data-original-title="Edit this user" data-toggle="tooltip"
						type="button" class="btn btn-sm btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a> <a
						data-original-title="Remove this user" data-toggle="tooltip"
						type="button" class="btn btn-sm btn-danger"><i
							class="glyphicon glyphicon-remove"></i></a>
					</span>
				</div>

			</div>
		</div>

	</div>
</body>
</html>