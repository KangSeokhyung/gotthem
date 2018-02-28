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
											<td>${memberInfo.mem_name}</td>
										</tr>
										<tr>
											<td><span>이메일:</span></td>
											<td><input style="width: 100%" type="text"
												name="mem_email" value="${memberInfo.mem_email}"></td>

										</tr>
										<tr>
											<td><span>전화번호:</span></td>
											<td><input style="width: 100%" type="text" maxlength="11"
												name="mem_phone" value="${memberInfo.mem_phone}"></td>
										</tr>
										<tr>
											<td><span>가입일:</span></td>
											<td>${memberInfo.mem_regdate}</td>
										</tr>
										<tr>
											<td>%nbsp;</td>
											<td>
												<input type="button" class="btn btn-success"
												onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
											</td>
										</tr>
										<tr>
											<td><span>우편번호:</span></td>
											<td><input style="width: 100%" type="text"
												name="mem_post" id="mem_post" value="${mem_post}"></td>
										</tr>
										<tr>
											<td><span>주소:</span></td>
											<td><input style="width: 100%" type="text"
												name="mem_address1" id="mem_address1" value="${mem_address1}"><br>
												<input style="width: 100%" type="text"
												name="mem_address2" id="mem_address2" value="${mem_address2}"></td>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	function sample6_execDaumPostcode() {
       		 new daum.Postcode({
          	  oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('mem_post').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('mem_address1').value = fullAddr;
				
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('mem_address2').focus();
                
               
            }
        }).open();
    }
</script>
</html>