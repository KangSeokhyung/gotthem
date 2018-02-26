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
<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/main.css">
<link href="https://fonts.googleapis.com/css?family=Work+Sans"
	rel="stylesheet">
<link rel="stylesheet" href="resources/indexTemplate/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/icomoon.css">
<link rel="stylesheet" href="resources/indexTemplate/css/animate.css">
<link rel="stylesheet" href="resources/indexTemplate/css/style.css">
<link rel="stylesheet" href="resources/landy/css/style.default.css" id="theme-stylesheet">
<link rel="stylesheet" href="resources/landy/css/custom.css">
</head>
<body>

	<aside class="probootstrap-aside js-probootstrap-aside">
		<a href="#"
			class="probootstrap-close-menu js-probootstrap-close-menu d-md-none"><span
			class="oi oi-arrow-left"></span> Close</a>
		<div class="probootstrap-site-logo probootstrap-animate"
			data-animate-effect="fadeInLeft">

			<a href="storeIndex.st" class="mb-2 d-block probootstrap-logo">GOTTHEM</a>
			<p class="mb-0">
				제휴 사이트 
			</p>
		</div>
		<div class="probootstrap-overflow">
			<nav class="probootstrap-nav">
				<ul>
					<li class="probootstrap-animate"
						data-animate-effect="fadeInLeft"><a href="/storeIndex">Got them?</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="store.st">점포관리</a></li>
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="stock.st">재고관리</a></li>
				<c:set var="sessionCheck"
					value="${sessionScope.SPRING_SECURITY_CONTEXT}" />
				<c:choose>
					<c:when test="${sessionCheck eq null}">
					<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a
						href="login.st">로그인</a></li>
					<li class="probootstrap-animate active" data-animate-effect="fadeInLeft"><a
						href="join.st">제휴맺기</a></li>
					</c:when>
					<c:otherwise>
						<li class="probootstrap-animate" data-animate-effect="fadeInLeft"><a href="logout.gt" class="nav-link">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			</nav>
			<footer class="probootstrap-aside-footer probootstrap-animate"
				data-animate-effect="fadeInLeft">
				<p>
					&copy; 2018 <a href="/gotThem" target="_blank">스탑없으 X Got Them</a>.
					<br> All Rights Reserved.
				</p>
			</footer>
		</div>
	</aside>


	<main role="main" class="probootstrap-main js-probootstrap-main">
		<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="index.html">Aside</a></a>
		</div>
	</div>
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

	<div class="container-fluid d-md-none">
		<div class="row">
			<div class="col-md-12">
				<ul class="list-unstyled d-flex probootstrap-aside-social">
					<li><a href="#" class="p-2"><span class="icon-twitter"></span></a></li>
					<li><a href="#" class="p-2"><span class="icon-instagram"></span></a></li>
					<li><a href="#" class="p-2"><span class="icon-dribbble"></span></a></li>
				</ul>
				<p>
					&copy; 2017 <a href="https://uicookies.com/" target="_blank">uiCookies:Aside</a>.
					<br> All Rights Reserved. Designed by <a
						href="https://uicookies.com/" target="_blank">uicookies.com</a>
				</p>
			</div>
		</div>
	</div>

	</main>

	<script src="resources/indexTemplate/js/jquery-3.2.1.slim.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/indexTemplate/js/bootstrap.min.js"></script>
	<script src="resources/indexTemplate/js/owl.carousel.min.js"></script>
	<script src="resources/indexTemplate/js/jquery.waypoints.min.js"></script>
	<script src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script>
	<script src="resources/indexTemplate/js/main.js"></script>
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