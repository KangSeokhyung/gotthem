<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet"
	href="resources/ownerindex/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/ownerindex/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resource/join/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/join/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/join/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/join/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/join/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/join/css/util.css">
<link rel="stylesheet" type="text/css"
	href="resources/join/css/main.css">

<body>
	<section class="cover-1 text-center">
		<%@include file="storeNav.jsp"%>
		<div class="contact1">
			<div class="container-contact1">
				<div class="col-xs-6">
					<form class="contact1-form validate-form">
						<div class="wrap-input1 validate-input"
							data-validate="Name is required">
							<input class="input1" type="text" name="name"
								placeholder="아이디를 입력하세요"> <span class="shadow-input1"></span>
						</div>

						<div class="wrap-input1 validate-input"
							data-validate="Password is required">
							<input class="input1" type="password" name="pass1"
								placeholder="패스워드를 입력하세요"> <span class="shadow-input1"></span>
						</div>

						<div class="wrap-input1 validate-input"
							data-validate="Password is required">
							<input class="input1" type="password" name="pass2"
								placeholder="한번 더 입력하세요"> <span class="shadow-input1"></span>
						</div>

						<div class="wrap-input1 validate-input"
							data-validate="Password is required">
							<input class="input1" type="text" name="name"
								placeholder="점포명을 입력하세요"> <span class="shadow-input1"></span>
						</div>

						<div class="wrap-input1 validate-input"
							data-validate="Valid email is required: ex@abc.xyz">
							<input class="input1" type="email" name="email"
								placeholder="이메일을 입력하세요"> <span class="shadow-input1"></span>
						</div>

						<div class="wrap-input1 validate-input"
							data-validate="Valid email is required: ex@abc.xyz">
							<input class="input1" type="email" name="email"
								placeholder="핸드폰 번호를 입력하세요"> <span class="shadow-input1"></span>
						</div>

						<div class="wrap-input1 validate-input"
							data-validate="Message is required">
							<textarea class="input1" name="message" placeholder="Message"></textarea>
							<span class="shadow-input1"></span>
						</div>
					</form>
				</div>

				<div class="col-xs-6">
					<form class="contact1-form validate-form">
						<div class="wrap-input1 validate-input"
							data-validate="Name is required">
							<input class="input1" type="text" name="name" placeholder="우편번호">
							<span class="shadow-input1"></span>
						</div>

						<div class="container-contact1-form-btn">
							<button class="contact1-form-btn" onclick="sample6_execDaumPostcode()">
								<span> 우편번호찾기</span>
							</button>
						</div>

						<div class="wrap-input1 validate-input"
							data-validate="Name is required">
							<input class="input1" type="text" name="name"
								placeholder="상세 주소1"> <span class="shadow-input1"></span>
						</div>

						<div class="container-contact1-form-btn">
							<button class="contact1-form-btn">
								<span> apply <i class="fa fa-long-arrow-right"
									aria-hidden="true"></i>
								</span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>

	</section>
	<!--===============================================================================================-->
	<script src="resources/join/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/join/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/join/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/join/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/join/vendor/tilt/tilt.jquery.min.js"></script>
	<script>
		$('.js-tilt').tilt({
			scale : 1.1
		})
	</script>
	<script src="resources/join/js/main.js"></script>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
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
							if (data.userSelectedType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample6_address').value = fullAddr;

							// 커서를 상세주소 필드로 이동한다.
							document.getElementById('sample6_address2').focus();
						}
					}).open();
		}
		/* function checkId(){ 
		     $.ajax({
		         url : "./MemberIdCheckAction.aq",
		         type: "POST",
		         data : {"id":$('#m_id').val()},	              
		         success : function(data){
		              if(data=="0"){
		           	   $("#idcheck").html('<p style="color:blue"> 사용가능한 아이디입니다.</p>');
		              }else if(data=="1"){
		           	   $("#idcheck").html('<p style="color:red"> 다른 사람이 사용중입니다.</p>');
		              }
		         },    error: function(jqXHR, textStatus, errorThrown) {
		       	  console.log(jqXHR);
		       	  console.log(textStatus);
		       	  console.log(errorThrown);
		         }
		     });
		 }
		
		function pwCheck(){
		var pw1 = document.getElementById("m_pass1").value;
		var pw2 = document.getElementById("m_pass2").value;
		 if(pw1 != pw2){
			 	document.getElementById('pwCheck').style.color = "red";
			    document.getElementById('pwCheck').innerHTML = "동일한 암호를 입력하세요."; 
		 		}else {
		 		document.getElementById('pwCheck').style.color = "blue";
		 		document.getElementById('pwCheck').innerHTML = "암호가 확인 되었습니다."; 
		 		} 			 
		 } 	  */
	</script>
</body>
</html>