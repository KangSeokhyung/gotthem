<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/main.css">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="resources/landy/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet" href="resources/landy/vendor/font-awesome/css/font-awesome.min.css">
<!-- Custom Font Icons CSS-->
<link rel="stylesheet"
	href="resources/landy/css/landy-iconfont.css">
<!-- Google fonts - Open Sans-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
<!-- owl carousel-->
<link rel="stylesheet"
	href="resources/landy/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet"
	href="resources/landy/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet"
	href="resources/landy/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="resources/landy/css/custom.css">
</head>
<body>
<header>
<%@include file= "../../../nav.jsp" %>
</header>  
		<div class="container-login100 " >
			<div class="wrap-login100 p-t-0 p-b-30 col-xs-4">
				
 		
			</div>
			
			<div class="wrap-login100 p-t-0 p-b-30 col-xs-8">
				<form action="joinSccess.gt" method="post" class="login100-form validate-form">

					<div class="text-center p-t-55 p-b-30">
						<span class="txt1"> 회원가입 </span>
					</div>

					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="mem_id"
							placeholder="아이디 입력"> <span class="focus-input100"></span> 
						
					</div><button onclick="checkId()">아이디 중복체크</button>
					<div class="wrap-input100 validate-input m-b-20" data-validate = "Please enter password">
						<span class="btn-show-pass">
							<i class="fa fa fa-eye"></i>
						</span>
						<input class="input100" type="password" name="mem_pw" placeholder="패스워드 입력" onkeydown="pwCheck()">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-20" data-validate = "Please enter password">
						<span class="btn-show-pass">
							<i class="fa fa fa-eye"></i>
						</span>
						<input class="input100" type="password" name="mem_pw2" placeholder="한번 더 입력하세요">
						<span class="focus-input100"></span>
					</div> <div id="pwCheck">여기</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="mem_name"
							placeholder="회원 이름을 입력하세요"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="email" name="mem_email"
							placeholder="이메일을 입력하세요"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="mem_phone"
							placeholder="전화번호를 입력하세요"> <span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn">
					<button  onclick="sample6_execDaumPostcode()">
					우편번호 찾기</button></div>
						<br>
					<div class="wrap-input100 validate-input m-b-20" >
						<input type="text" class="input100" name="mem_post" id="sample6_postcode" placeholder="우편번호"> 
						<input type="text" class="input100" name="mem_address1" id="sample6_Address" placeholder="주소"> 
						<input type="text" class="input100" name="mem_address2" id="sample6_detailAddress" placeholder="상세주소">
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">가입하기
						</button><button class="login100-form-btn" onclick="history.back()">뒤로가기</button>
					</div>
				</form>
			</div>
		</div>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/Login_v7/js/main.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_Address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_detailAddress').focus();
            }
        }).open();
    }
	 	/* function checkId(){ 
	          $.ajax({
	              url : "./MemberIdCheck.gt",
	              type: "POST",
	              data : {"mem_id":$('#mem_id').val()},	              
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
   */
      function pwCheck(){
    	 var pw1 = document.getElementById("mem_pw").value;
    	 var pw2 = document.getElementById("mem_pw2").value;
    		 if(pw1 != pw2){
    			 	document.getElementById('pwCheck').style.color = "red";
    			    document.getElementById('pwCheck').innerHTML = "동일한 암호를 입력하세요."; 
    		 		}else {
    		 		document.getElementById('pwCheck').style.color = "blue";
    		 		document.getElementById('pwCheck').innerHTML = "암호가 확인 되었습니다."; 
    		 		} 			 
    	}	 
=======
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/main.css">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="resources/landy/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet" href="resources/landy/vendor/font-awesome/css/font-awesome.min.css">
<!-- Custom Font Icons CSS-->
<link rel="stylesheet"
	href="resources/landy/css/landy-iconfont.css">
<!-- Google fonts - Open Sans-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
<!-- owl carousel-->
<link rel="stylesheet"
	href="resources/landy/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet"
	href="resources/landy/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet"
	href="resources/landy/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="resources/landy/css/custom.css">
</head>
<body>
	<header class="header">
		<%@include file="../../../nav.jsp" %>
	</header>

		<div class="container-login100 " >
			<div class="wrap-login100 p-t-0 p-b-30 col-xs-4">
				
 		
			</div>
			
			<div class="wrap-login100 p-t-0 p-b-30 col-xs-8">
				<form class="login100-form validate-form" action="joinSccess.gt" method="post">
					<input type="hidden" id="duplicate" value="N">
					<input type="hidden" id="pwdConfirm" value="N">
					<div class="text-center p-t-55 p-b-30">
						<span class="txt1"> 회원가입 </span>
					</div>

					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" id="mem_id" name="mem_id"
							placeholder="아이디 입력"> <span class="focus-input100"></span>
						<input type="button" id="btn1" class="btn btn-sm btn-success" value="중복확인" onclick="duplCheck();">
					</div>
					<div id="idcheck">여기에 가능하다고 들어옴</div>
					<div class="wrap-input100 validate-input m-b-20" data-validate = "Please enter password">
						<span class="btn-show-pass">
							<i class="fa fa fa-eye"></i>
						</span>
						<input class="input100" type="password" id="mem_pw" name="mem_pw" placeholder="패스워드 입력">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-20" data-validate = "Please enter password">
						<span class="btn-show-pass">
							<i class="fa fa fa-eye"></i>
						</span>
						<input class="input100" type="password" id="mem_pw2" name="mem_pw2" placeholder="한번 더 입력하세요">
						<span class="focus-input100"></span>
					</div>
					<div id="pwdCheckMsg"></div>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="mem_name"
							placeholder="회원 이름을 입력하세요"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="email" name="mem_email"
							placeholder="이메일을 입력하세요"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="mem_phone"
							placeholder="전화번호를 입력하세요"> <span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn">
					<button  onclick="sample6_execDaumPostcode()">
					우편번호 찾기</button></div>
						<br>
					<div class="wrap-input100 validate-input m-b-20" >
						<input type="text" class="input100" name="mem_post" id="mem_post" placeholder="우편번호"> 
						<input type="text" class="input100" name="mem_address1" id="mem_address1" placeholder="주소"> 
						<input type="text" class="input100" name="mem_address2" id="mem_address2" placeholder="상세주소">
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="submit()">가입하기</button>
						<button class="login100-form-btn" onclick="history.back()">뒤로가기</button>
					</div>
				</form>
			</div>
		</div>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/Login_v7/js/main.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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
		                   }else if(data!="0"){
		                	   $("#idcheck").html('<p style="color:red"> 다른 사람이 사용중입니다.</p>');
		                   }
		              },    error: function(jqXHR, textStatus, errorThrown) {
		            	  console.log(jqXHR);
		            	  console.log(textStatus);
		            	  console.log(errorThrown);
		              }
		          });
			  }
		 	 
			function pwdCheck() {
				var m_pwd = $('#mem_pw').val();
				var m_pwdCheck = $('#mem_pw2').val();
				$('#pwdCheckMsg').html('비밀번호는 영문, 숫자 혼합 8자이상  20자 이하로 작성해주세요.').css('color', 'red');
				if (m_pwd.length >= 8 && m_pwdCheck.length >= 8){
					if (m_pwd != m_pwdCheck) {
						$('#pwdCheckMsg').html('비밀번호가 일치하지 않습니다.').css('color', 'red');
						$('#pwdConfirm').val('N');
					} else {
						$('#pwdCheckMsg').html('비밀번호가 일치합니다.').css('color', 'blue');
						$('#pwdConfirm').val('Y');
					}
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
>>>>>>> branch 'chanhee' of https://github.com/KangSeokhyung/gotthem.git
</script>
</body>
</html>