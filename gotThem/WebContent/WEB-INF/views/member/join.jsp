<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Animate.css -->
	<link rel="stylesheet" href="resources/newjoin/css/animate.css">
	<!-- Flexslider -->
	<link rel="stylesheet" href="resources/newjoin/css/flexslider.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="resources/newjoin/css/icomoon.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="resources/newjoin/css/magnific-popup.css">
	
	<link rel="stylesheet" href="resources/mainTemplate/ionicons/css/ionicons.min.css">
	<link rel="stylesheet" href="resources/mainTemplate/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/mainTemplate/sweetalert/dist/sweetalert.css">
	<link rel="stylesheet" href="resources/mainTemplate/css/stisla.css">
	
<style>
.container-login100 {
  width: 100%;  
  min-height: 100vh;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  padding-top:100px;
  position: relative;
  background-color: #E6E6E6;
}
.half50{
	width:49%;
}
</style>
</head>
<body>
	<header class="header">
		<%@include file="../../../nav.jsp" %>
	</header>

	<div class="container-login100">
			<div class="row">
				<form action="joinSccess.gt" method="post" onsubmit="return join();">
					<input type="hidden" id="duplicate" value="N"> <input
						type="hidden" id="pwdConfirm" value="N">
					<div class="col-sm-12" >
						<div class="row">
							<div class="col-sm-8 form-group">
								<label for="m_id">아이디 <strong>*</strong></label> <input
									class="form-control" type="text" id="mem_id" name="mem_id"
									placeholder="아이디 입력" autofocus="autofocus" required="required"
									maxlength="30">
							</div>
							<div id="empty" style="font-size:24px;">&nbsp;</div>
							<div class="col-sm-4 form-group">
								<input type="button" id="btn1" class="form-control btn btn-sm btn-success"
									title="중복확인" value="중복확인" onclick="duplCheck()">
							</div>
						</div>
						<div id="idcheck"></div>

						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="mem_pw">비밀번호 <strong>*</strong></label> <input
									type="password" class="form-control"
									pattern="^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$"
									id="mem_pw" name="mem_pw" maxlength="20" required="required"
									onkeyup="pwdCheck()"
									title="비밀번호는 영문, 숫자 혼합 8자이상  20자 이하로 작성해주세요.">
							</div>
							<div class="col-sm-6 form-group">
								<label for="mem_pw2">비밀번호 확인 <strong>*</strong></label> <input
									type="password" class="form-control"
									pattern="^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$"
									id="mem_pw2" name="mem_pw2" maxlength="20" required="required"
									onkeyup="pwdCheck()"
									title="비밀번호는 영문, 숫자 혼합 8자이상  20자 이하로 작성해주세요.">
							</div>
						</div>
						<div id="pwdCheckMsg"></div>

						<div class="form-group">
							<label for="mem_name">이름 <strong>*</strong></label> <input
								type="text" class="form-control" id="mem_name" name="mem_name"
								maxlength="15" placeholder="이름을 입력해주세요." required="required">
						</div>



						<div class="form-group">
							<label for="mem_email">이메일 <strong>*</strong></label> <input
								type="email" class="form-control" id="mem_email"
								name="mem_email" maxlength="17" placeholder="이메일을 입력해주세요."
								required="required">
						</div>


						<div class="form-group">
							<label for="mem_phone">전화번호<strong>*</strong></label> <input
								type="tel" class="form-control"
								onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'
								id="mem_phone" name="mem_phone" maxlength="15"
								placeholder="'-' 제외한 번호만 입력해주세요." required="required">
						</div>

						<div class="row">
							<div class="col-sm-8 form-group">
								<label for="mem_post">우편번호 <strong>*</strong></label> <input
									type="text" class="form-control" id="mem_post" name="mem_post"
									placeholder="우편번호 (우편번호 찾기 버튼 클릭해주세요.)" required="required"
									readonly="readonly">
							</div>
							<div class="col-sm-4 form-group">
								<div id="empty" style="font-size:24px;">&nbsp;</div>
								<input type="button" class="form-control btn btn-sm btn-success"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							</div>
						</div>

						<div class="form-group">
							<label for="mem_address1">주소 <strong>*</strong></label> <input
								type="text" class="form-control" id="mem_address1"
								name="mem_address1" placeholder="주소 (우편번호 찾기 버튼을 클릭해주세요.)"
								required="required" readonly="readonly">
						</div>

						<div class="form-group">
							<label for="mem_address2">상세주소 <strong>*</strong></label> <input
								type="text" class="form-control" id="mem_address2"
								name="mem_address2" placeholder="상세주소를 입력해주세요."
								required="required">
						</div>

						<input type="button" class="btn btn-lg btn-danger pull-right half50"
							onclick="indexFoward();" value="돌아가기">
						<button type="submit" class="btn btn-lg btn-success pull-right half50">회원가입</button>
					</div>
				</form>
			</div>
	</div>




	<!-- Waypoints -->
	<script src="resources/newjoin/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="resources/newjoin/js/jquery.flexslider-min.js"></script>
	<!-- Magnific Popup -->
	<script src="resources/newjoin/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/newjoin/js/magnific-popup-options.js"></script>
	
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/mainTemplate/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/mainTemplate/js/jquery.easeScroll.js"></script>
<script src="resources/mainTemplate/sweetalert/dist/sweetalert.min.js"></script>
<script src="resources/mainTemplate/js/stisla.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		function duplCheck(){ 
		    var id = $('#mem_id').val();
		 		$.ajax({
		              url : "duplCheck.gt",
		              type: "POST",
		              data : {"mem_id": id},	              
		              success : function(data){
		                   if(data=="0"){
		                	   $("#idcheck").html('<p style="color:blue"> 사용가능한 아이디입니다.</p>');
		                	   $('#duplicate').val('Y');
		                   }else if(data!="0"){
		                	   $("#idcheck").html('<p style="color:red"> 이미 사용중입니다.</p>');
		                	   $('#duplicate').val('F');
		                   }
		              },    error: function(jqXHR, textStatus, errorThrown) {
		            	  console.log(jqXHR);
		            	  console.log(textStatus);
		            	  console.log(errorThrown);
		              }
		          });
			  }
		 	 
			function pwdCheck() {
				var mem_pwd = $('#mem_pw').val();
				var mem_pwdCheck = $('#mem_pw2').val();
				$('#pwdCheckMsg').html('비밀번호는 영문, 숫자 혼합 8자이상  20자 이하로 작성해주세요.').css('color', 'red');
				if (mem_pwd.length >= 8 || mem_pwdCheck.length >= 8){
					if (mem_pwd == mem_pwdCheck) {
						$('#pwdCheckMsg').html('비밀번호가 일치합니다.').css('color', 'blue');
						$('#pwdConfirm').val('Y');
					} else {
						$('#pwdCheckMsg').html('비밀번호가 일치하지 않습니다.').css('color', 'red');
						$('#pwdConfirm').val('N');
					}
				}
			}
			
			function join() {
				var dupl = $('#duplicate').val();
				var pwdConfirm = $('#pwdConfirm').val();
				if (dupl == 'N') {
					alert('중복확인을 해주세요.');
					return false;
				} else if (dupl == 'F') {
					alert('이미 존재하는 아이디 입니다. 다른 아이디로 작성해주세요.');
					$('#mem_id').val('');
					$('#mem_id').focus();
					return false;
				} else if (pwdConfirm != 'Y') {
					alert('비밀번호의 길이나 비밀번호 확인이 일치하지 않습니다.');
					$('#mem_pw').val('');
					$('#mem_pw2').val('');
					$('#mem_pw').focus();
					return false;
				}
				if (confirm('가입하시겠습니까?')) {
				
				} else {
					return false;
				}
			}
		
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
   		 
   		function indexFoward() {
			if (confirm('메인페이지로 이동하시겠습니까?')) {
				location.href = "index.jsp";
			}
		}
   		
   		function onlyNumber(event){
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				return false;
		}
		
		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}
   		 
   		
	 	
	 	/*
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
    		 } 	  
	 	*/
</script>
</body>
</html>