<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편의점 재고 검색 - Got Them</title>
	<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/main.css">
	 <link href="resources/mainTemplate/bootstrap3/css/bootstrap.css" rel="stylesheet" />
    <link href="resources/mainTemplate/assets/css/ct-paper.css" rel="stylesheet"/>
    <link href="resources/mainTemplate/assets/css/demo.css" rel="stylesheet" />
    <link href="resources/mainTemplate/assets/css/examples.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    
</head>
<body>
	<header class="header">
		<%@include file="../../../nav.jsp" %>
	</header>
  <div class="profile-background text-center"> 
  				<br><br><br><br><br><br><br>
  				<h2>GOT THEM 회원가입</h2>
        </div>
<body>
    <div class="section landing-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <form class="contact-form">
                                <div class="row">
                                    <div class="col-sm-5">
                                        <label>아이디</label>
                                       
            <div id="imaginary_container"> 
                <div class="input-group stylish-input-group">
                    <input type="text" class="form-control"  placeholder="아이디" >
                    <span class="input-group-addon">
                        <button >
                            <span>중복확인</span>
                        </button>  
                    </span>
                </div>
            </div>
 
                                       
                                       
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label>패스워드</label>
                                        <input type="password" class="form-control" placeholder="Name">
                                    </div>
                                    <div class="col-sm-6">
                                        <label>패스워드</label>
                                        <input type="password" class="form-control" placeholder="Name">
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-sm-6">
                                        <label>이름</label>
                                       <input type="text" class="form-control" placeholder="Name">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label>이메일</label>
                                       <input type="email" class="form-control" placeholder="Name">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label>우편번호</label>
                                       <input type="email" class="form-control" placeholder="Name">
                                    </div>
                                </div>
                                <button href="#fakelink" class="btn btn-danger">우편번호찾기</button>
                               <div class="row">
                                    <div class="col-sm-8">
                                        <label>상세주소1</label>
                                       <input type="email" class="form-control" placeholder="Name">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-8">
                                        <label>상세주소2</label>
                                       <input type="email" class="form-control" placeholder="Name">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>



</body>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/Login_v7/js/main.js"></script>
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