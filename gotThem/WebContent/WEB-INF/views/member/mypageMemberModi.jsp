<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="description" content="Free Bootstrap Theme by uicookies.com">
<meta name="keywords"
	content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400"
	rel="stylesheet">
<link rel="stylesheet"
	href="resources/mainTemplate/css/styles-merged.css">
<link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
<link rel="stylesheet" href="resources/mainTemplate/css/custom.css">
<style>
.labelSize {
	font-size: 18px !important;
	font-weight: bold !important;
}
</style>
</head>
<body>
	<div class="service">
		<div class="alert alert-info alert-dismissable">
			<a class="panel-close close" data-dismiss="alert">×</a> 여기에서 회원정보 수정이
			가능합니다.
		</div>
		<form action="memberModi.gt" method="post"
			class="probootstrap-form mb60">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="lname" class="labelSize">이름</label> <input type="text"
							class="form-control" name="mem_name" id="mem_name"
							value="${memberInfo.mem_name }" autofocus>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="email" class="labelSize">이메일</label> <input
							type="email" class="form-control" name="mem_email" id="email"
							value="${memberInfo.mem_email}">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label for="email" class="labelSize">핸드폰번호</label><br> <input
							type="number" class="form-control col-md-3" name="mem_phoneFirst"
							id="mem_phone" maxlength="3" value="${mem_phoneFirst}"
							oninput="maxLengthCheck(this)" style="display: inline;">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
					<label for="email" class="labelSize">&nbsp;</label><br> 
						<input type="number" class="form-control col-md-3"
							name="mem_phoneMiddle" id="mem_phone" maxlength="4"
							value="${mem_phoneMiddle}" oninput="maxLengthCheck(this)"
							style="display: inline;">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
					<label for="email" class="labelSize">&nbsp;</label><br> 
						<input type="number"
							class="form-control col-md-3" name="mem_phoneLast" id="mem_phone"
							maxlength="4" value="${mem_phoneLast}"
							oninput="maxLengthCheck(this)" style="display: inline;">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<label for="lname" class="labelSize">우편번호</label>
					<div class="card-block">
						<div class="col-md-6 paddingRight30" style="padding-left: 0px;">
							<div class="form-group">
								<input type="text" class="form-control" id="mem_post"
									name="mem_post" value="${mem_post}" readOnly>
							</div>
						</div>
						<div class="col-md-6 padding0">
							<input type="button" class="btn btn-colorRed"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label for="email" class="labelSize">상세주소1</label> <input
							type="text" class="form-control" id="mem_address1"
							name="mem_address1" value="${mem_address1}" readOnly>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label for="email" class="labelSize">상세주소2</label> <input
							type="text" class="form-control" id="mem_address2"
							name="mem_address2" value="${mem_address2}">
					</div>
				</div>
			</div>
			<br>
			<div class="form-group">
				<center>
					<input type="submit" class="btn btn-colorRed" name="submit"
						value="변경"
						style="padding: 5px 0px; width: 36%; height: 49px; margin-right: 10px;">
					<input type="reset" class="btn btn-colorRed" value="되돌리기"
						style="padding: 5px; width: 36%; height: 49px;">
				</center>
			</div>
		</form>
	</div>


	<script src="resources/mainTemplate/js/scripts.min.js"></script>
	<script src="resources/mainTemplate/js/main.min.js"></script>
	<script src="resources/mainTemplate/js/custom.js"></script>
	<script>
  function maxLengthCheck(object){
	    if (object.value.length > object.maxLength){
	        object.value = object.value.slice(0, object.maxLength);
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
	       document.getElementById('mem_address2').value = null;
	       document.getElementById('mem_address2').focus();
	       
	      
	   }
	}).open();
	}
</script>
</body>


</html>