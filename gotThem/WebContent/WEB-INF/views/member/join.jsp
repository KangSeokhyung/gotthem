<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>편의점 재고 검색 GOT THEM!</title>
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="resources/mainTemplate/css/styles-merged.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/custom.css">

    <!--[if lt IE 9]>
      <script src="resources/mainTemplate/js/vendor/html5shiv.min.js"></script>
      <script src="resources/mainTemplate/js/vendor/respond.min.js"></script>
    <![endif]-->
    <style>
    header{
    padding-bottom:80px;
    }
    #sample6_postcode{
    margin-left: -10px;
    }
    
    input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
	text-align:center;
}
.paddingRight30{
	padding-right:30px;
}
.padding0{
	padding-left:0px;
}
    </style>
  </head>
<body>
<!-- START: header -->
   <header>
		<%@include file="../../../nav.jsp"%>
	</header>
  <section class="probootstrap-slider flexslider2 page-inner">
    <div class="overlay"></div>
    <div class="probootstrap-wrap-banner">
      <div class="container">
        <div class="row">
          <div class="col-md-8">

            <div class="page-title probootstrap-animate">
              <div class="probootstrap-breadcrumbs">
                <a href="#">Home</a><span>Sign up</span>
              </div>
              <h1>회원가입</h1>
            </div>

          </div>
        </div>
      </div>
    </div>
    <ul class="slides">
      <li style="background-image: url(resources/mainTemplate/img/slider_1.jpg);"></li>
      <li style="background-image: url(resources/mainTemplate/img/slider_4.jpg);"></li>
      <li style="background-image: url(resources/mainTemplate/img/slider_2.jpg);"></li>
    </ul>
  </section>
  <!-- END: slider  -->
  
  	<section class="probootstrap-section">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
			<h4>WELCOME TO GOT THEM</h4>
          <ul class="with-icon colored">
            <li>아이디는 자 이내의 영문, 숫자만<br>가능합니다.</li>
            <li>gotthem@gmail.com</li>
            <li>02-123-4567</li>
          </ul>

          <h4>문의사항이 있으신가요?</h4>
          <p>저희 Gotthem은 평일 오전 09:00 ~ 17:00 까지 전화문의가 가능합니다</p>
          <p><a href="#">Learn More</a></p>
        </div>
        <div class="col-md-8 col-md-push-1">
           <form action="joinSccess.gt" method="post" class="probootstrap-form mb60">
            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="fname">아이디</label>
                  <input type="text" class="form-control" title="영어,숫자를 조합하여 아이디를 입력해 주세요 "
                  pattern="[A-Za-z0-9]{0,15}" id="mem_id" name="mem_id" autofocus onkeyup="duplCheck()" maxlength="20">
                   <p id="idcheck" class="text-mute">아이디를 입력해주세요</p>
                </div>
              </div>
              </div>
              <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="lname">비밀번호</label>
                  <input type="password" class="form-control" id="mem_pw" name="mem_pw" maxlength="15">
                   <p class="text-mute" id="pwdCheckMsg" >비밀번호를 입력해주세요</p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="lname">비밀번호 확인</label>
                  <input type="password" class="form-control" id="mem_pw2" name="mem_pw2" onkeyup="pwCheck()" maxlength="15">
                </div>
                </div>
            </div>
           <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="lname">이름</label>
                  <input type="text" class="form-control" id="mem_name" name="mem_name" maxlength="20">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="lname">이메일</label><br>
                  <input maxlength="20" type="text" class="form-control" id="mem_emailid" name="mem_emailid" style="width:45%; display:inline;">&nbsp;@
                  <input maxlength="20" type="text" class="form-control" id="mem_emailadd" name="mem_emailadd" style="width:46%; display:inline;">
                </div>
              </div>
            </div>
           <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="lname">전화번호</label><br>
                  <input type="text" class="form-control" maxlength="3" id="mem_phoneFront" name="mem_phoneFront" style="width:30%; display:inline;">&nbsp;-
                  <input type="text" class="form-control" maxlength="4" id="mem_phoneMiddle" name="mem_phoneMiddle" style="width:30%; display:inline;">&nbsp;-
                  <input type="text" class="form-control" maxlength="4" id="mem_phoneLast" name="mem_phoneLast" style="width:30%; display:inline;">
                </div>
              </div>
            </div>
             <div class="row">
              <div class="col-md-10">
                <label for="lname">우편번호</label>
                <div class="card-block">
									<div class="col-md-6 paddingRight30" style="padding-left: 0px;">
										<div class="form-group">
											<input type="text" value="" id="mem_post" readonly="readonly"
												class="form-control" maxlength="5">
										</div>
									</div>
									<div class="col-md-6 padding0">
										<input type="button" class="btn btn-primary"
											onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
									</div>
								</div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-9">
                <div class="form-group">
                  <label for="lname">상세주소1</label>
                  <input type="text" class="form-control" id="mem_address1" name="sample6_address" readonly="readonly" maxlength="30">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-9">
                <div class="form-group">
                  <label for="lname">상세주소2</label>
                  <input type="text" class="form-control" id="mem_address2" name="sample6_address2" maxlength="30">
                </div>
              </div>
            </div>
            <div class="form-group">
              <input type="submit" class="btn btn-primary" id="submit" name="submit" value="가입하기">
            </div>        
          </form>
        </div>
      </div>
    </div>
  </section>  
  
</body>
    <!-- Javascript files-->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
     <script src="resources/mainTemplate/js/scripts.min.js"></script>
  	<script src="resources/mainTemplate/js/main.min.js"></script>
  	<script src="resources/mainTemplate/js/custom.js"></script>
  	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		/* function duplCheck(){ 
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
			  } */
		function duplCheck() {	
			var mem_id = $('#mem_id').val();
				var idExp = /^[a-z0-9]{0,15}/;
				if (!idExp.test(mem_id)){
					$('#mem_id').val("");
					$('#mem_id').focus();
					$('#duplicate').val('N');
					$('#idcheck').html('숫자와 영어를 조합하여 아이디를 입력하세요').css('color', 'red');
	                return false;
				} else {
				 $.ajax({ 
		                type : 'post',
		                url  : 'duplCheck.gt',
		                data : {"mem_id": mem_id},
		                success : function(data){
			                   if(data=="0"){
			                	   $("#idcheck").html('<p style="color:blue"> 사용가능한 아이디입니다.</p>');
			                	   $('#duplicate').val('Y');
			                   }else if(data!="0"){
			                	   $("#idcheck").html('<p style="color:red"> 이미 사용중입니다.</p>');
			                	   $('#duplicate').val('F');
			                   }
			             },
		                error : function(jqXHR, textStatus, errorThrown) { 
		                	alert('시스템 문제발생');
		                	console.log(jqXHR);
		            	 	console.log(textStatus);
		            	 	console.log(errorThrown);
		                }
		           }); 
				}
			}
			function pwCheck() {
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
   		
		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}
		
		//한글입력 안되게 처리
		$(document).ready(function(){
			  $("input[name=mem_id]").keyup(function(event){ 
			   if (!(event.keyCode >=37 && event.keyCode<=40)) {
			    var inputVal = $(this).val();
			    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
			   }
			  });
			});
  
</script>
</body>
</html>
