<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>편의점 재고 검색 포털 Got them</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css?family=Work+Sans"rel="stylesheet">
<link rel="stylesheet" href="resources/indexTemplate/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/icomoon.css">
<link rel="stylesheet" href="resources/indexTemplate/css/animate.css">
<link rel="stylesheet" href="resources/indexTemplate/css/style.css">
  <link rel="stylesheet" href="resources/boardTemplate/assets/tether/tether.min.css">
  <link rel="stylesheet" href="resources/boardTemplate/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/boardTemplate/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="resources/boardTemplate/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="resources/boardTemplate/assets/theme/css/style.css">
  <link rel="stylesheet" href="resources/boardTemplate/assets/mobirise/css/mbr-additional.css" type="text/css">

</head>
<body>
	<header>
		<%@include file="nav.jsp"%>
	</header>


	<main role="main" class="probootstrap-main js-probootstrap-main">
		<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="index.html">GOT THEM</a>
		</div>
	</div>
	<section class="mbr-section form1 cid-qIWKYtQnJh" id="form1-r">
    <div class="container">
        <div class="row justify-content-center">
            <div class="title col-12 col-lg-8">
                <h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-2">
                    GOT THEM과 제휴맺기
                </h2>
                <h3 class="mbr-section-subtitle align-center mbr-light pb-3 mbr-fonts-style display-5">
                    이 양식을 작성하면 GOT THEM에 제휴 신청이 가능합니다.
                </h3>
                <h3 class="mbr-section-subtitle align-center mbr-light pb-3 mbr-fonts-style display-5">
                   제휴 신청 뒤 승인까지 약 3~5영업일이 소요될 수 있습니다.<br> 문의처 : 02-1234-5678
                </h3>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="media-container-column col-lg-8" data-form-type="formoid">
                    <div data-form-alert="" hidden="">
                        Thanks for filling out the form!
                    </div>
            
                    <form class="mbr-form" action="join.st" method="post" data-form-title="Mobirise Form">
                    <input type="hidden" name="email" data-form-email="true" value="v71UZV7rSGKmNdtMTJcCzvbgvRKs8I889PXLsAjbR6NuKJtPYoKYEe+DT90N7gqVmrsYQhYLqTnSDAVjImF7Eb8KP/1hIcQUbq5w77EmgcHnu38hK1G/QmJo9v9/aFIP" data-form-field="Email">
                        <div class="row row-sm-offset">
                            <div class="col-sm-8 multi-horizontal" data-for="id">
                                <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="name-form1-r">아이디</label>
                                    <input type="text" class="form-control" name="mem_id" data-form-field="Name" required=""
                                   id="mem_id" onkeyup="duplCheck()">
                                </div>
                            </div>
                           <div class="col-sm-12 multi-horizontal">
                          <p id="idcheck" class="text-mute">아이디를 입력해주세요</p>
                         </div>
                            <div class="col-sm-6 multi-horizontal" data-for="password">
                                <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="pass-form1-r">패스워드</label>
                                    <input type="password" id="mem_pw" class="form-control" name="mem_pw" data-form-field="Email" required="" >
                                </div>
                            </div>
                            <div class="col-sm-6 multi-horizontal" data-for="password2">
                                <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="pass-form1-r">패스워드 재입력</label>
                                    <input type="password" id="mem_pw2" class="form-control" name="mem_pw2" data-form-field="Phone"
                                    onkeyup="pwCheck()" > 
                                </div>
                            </div>
                          <div class="col-sm-12 multi-horizontal">
                          <p class="text-mute" id="pwdCheckMsg" >비밀번호를 입력해주세요</p>
                         </div>
                            <div class="col-sm-8 multi-horizontal" data-for="ownername">
                                <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="owner-form1-r">점주명</label>
                                    <input type="text" id="mem_name" class="form-control" name="mem_name" required="" data-form-field="owner" >
                                </div>
                         </div>
                         <div class="col-sm-8 multi-horizontal" data-for="storename">
                                <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="stoname-form1-r">점포명</label>
                                    <input type="text" class="form-control" name="sto_name" data-form-field="owner" required="" id="sto_name">
                                </div>
                         </div>
                          <div class="col-sm-8 multi-horizontal" data-for="email">
                          <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="email-form1-r">이메일</label>
                                    <input type="email" class="form-control" name="mem_email" data-form-field="Name" required="" id="mem_email">
                                </div>
                            </div>
                          <!--  ----  -->
                          <div class="col-sm-8 multi-horizontal" data-for="phone">
                           <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="phone-form1-r">전화번호</label><br>
                                    <input type="number" class="form-control col-sm-3" style="display:inline;" name="mem_phoneFirst" maxlength="3" data-form-field="Name" required="required" oninput="maxLengthCheck(this)"> - 
                                	<input type="number" class="form-control col-sm-4" style="display:inline;" name="mem_phoneMiddle" maxlength="4" data-form-field="Name" required="required" oninput="maxLengthCheck(this)"> - 
                                	<input type="number" class="form-control col-sm-4" style="display:inline;" name="mem_phoneLast" maxlength="4" data-form-field="Name" required="required" oninput="maxLengthCheck(this)">
                                </div>
                          </div>
                         <!--  ---- -->
                         <div class="col-sm-6 multi-horizontal" data-for="postcode">
                            <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="addr1-form1-r">우편번호</label>
                                    <input type="text" class="form-control" name="mem_addr1" data-form-field="Name" required="" id="sample6_postcode" readonly>
                                </div>
                            </div>
                         <div class="col-sm-6 multi-horizontal" data-for="findpostcode">
                            <div class="form-group" style="margin:23px 0px;">
                            <button onclick="sample6_execDaumPostcode()" class="btn btn-primary btn-form display-4" style="border-radius:4px !important;">우편번호찾기</button>
                           </div>
                         </div>
                        <div class="col-sm-12 multi-horizontal" data-for="address1">
                            <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="addr1-form1-r">매장 상세주소1</label>
                                    <input type="text" class="form-control" name="mem_addr2" data-form-field="Name" required="" id="sample6_address">
                                </div>
                            </div>
                         <div class="col-sm-12 multi-horizontal" data-for="address2">
                            <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="addr2-form1-r">매장 상세주소2</label>
                                    <input type="text" class="form-control" name="mem_addr3" data-form-field="Name" required="" id="sample6_address2">
                                </div>
                            </div>
                        </div>
                        <span class="input-group-btn">
                            <button type="submit" class="btn btn-primary btn-form display-4" style="border-radius:4px !important;">제휴신청</button>
                        </span>
                    </form>
            </div>
        </div>
    </div>
</section>

	</main>

	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/indexTemplate/js/bootstrap.min.js"></script>
	<script src="resources/indexTemplate/js/owl.carousel.min.js"></script>
	<script src="resources/indexTemplate/js/jquery.waypoints.min.js"></script>
	<script src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script>
	<script src="resources/indexTemplate/js/main.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	function maxLengthCheck(object){
	    if (object.value.length > object.maxLength){
	        object.value = object.value.slice(0, object.maxLength);
	    }    
	}
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
	</script>
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
        
	</script>
</body>
</html>