<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
</head>
<body>
	<form id="form1" action="mypageMemberDel.gt" method="post">
	<br><br><br>
		<h4>주의!</h4>
		<span>회원탈퇴 전에 구매한 상품을 수령해주세요. 수령받지 않으시면 탈퇴할 수 없습니다</span>
		<table class="table table-user-information">
			<tr>
				<td><span>현재 비밀번호 :</span></td>
				<td><input name="mem_pw" type="text" ></td>
				<td><button class="btn-success" onclick="memberDel()" >확인</button></td>
			</tr>
		</table>
		<br>
		</form>
</body>
<script>
	function memberDel(){
		if(confirm('정말 탈퇴하시겠습니까?')== true){
			alert('트와이스짱~~~!!!')
			document.form1.submit();
		}else{
			alert('모모짱~~~!!!')
			history.go(0);
		}
	}
</script>
</html>