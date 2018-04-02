<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>편의점 재고 검색 GOT THEM!</title>
    <meta name="description" content="Free Bootstrap Theme by uicookies.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="resources/mainTemplate/css/styles-merged.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/custom.css">
    
     <!--[if lt IE 9]>
      <script src="resources/mainTemplate/js/vendor/html5shiv.min.js"></script>
      <script src="resources/mainTemplate/js/vendor/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
html, body {
    margin:0;
    padding:0;
    height:1200px;
}
#wrap {
	min-height: 100%; 
	position: relative;
}
footer {
	position: absolute !important;
	bottom: 0;
	width: 100%;
}
.probootstrap-footer.probootstrap-bg {
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    padding: 2em 0;
    position: relative;
    color: rgba(255,255,255,.9);
}

.table-responsive {
	margin-top: 80px;
	padding: 60px;
}

.container {
	width: 1400px;
}

.probootstrap-main-nav li a {
	font-size: 20px;
}
.probootstrap-main-nav li a:hover {
	font-size: 25px !important;
}
.probootstrap-main-nav{
	padding-top: 18px;
}

.probootstrap-header {
	padding-top: 20px;
	padding-bottom: 20px;
	background: #44B3C2;
}
.barunPenLogo{
	font-family:'나눔바른펜';
	font-size:40px;
	color:#fff;
}
.barunPen{
	font-family:'나눔바른펜';
	color:#fff !important;
}
.btn.btn-primary {
    border: 2px solid #44B3C2;
    background: #44B3C2;
    color: #fff;
    border-radius: 12px;
}
.btn.btn-primary:active, .btn.btn-primary:focus, .btn.btn-primary:hover {
    background: #9cfeff;
    color: #fff;
    border: 2px solid #9cfeff;
}
.pagination>li>a, .pagination>li>span {
    color: #44B3C2;
}
.textMiddle{
padding-top:3px;
}
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding-top: 20px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 1px solid #ddd;
}
.table>tbody>tr>td>button{
    padding-top: 10px;
    line-height: 1.42857143;
    border-top: 1px solid #ddd;
}
.probootstrap-footer.probootstrap-bg:before {
    position: absolute;
    content: "";
    background: #000;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 1;
    opacity:0.9;
}
.btn-magen{
 	border: 2px solid #fd3067;
    background: #fd3067;
    color: #fff;
    border-radius: 12px;
}
th{
font-size:20px;
}
tr{
font-size:18px;
}
.form-control {
    display: block;
    width: 250px;
}
.modal-body>section>div{
width:568px;
}
.btn-secondary{
	border: 2px solid #fd3067;
    background: #fd3067;
    color: #fff;
    border-radius: 12px;
}
.btn-secondary:hover{
	border: 2px solid #ff7b9e;
    background: #ff7b9e;
    color: #fff;
    border-radius: 12px;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#rowClick tr").click(function(event) {
			if(event.target.nodeName.toLowerCase() == "td") {
				$("#myModal").modal("show");
				
				var tr = $(this);
				var td = tr.children();
				
				console.log("클릭한 Row의 모든 데이터 : "+tr.text());
				
				var userid = td.eq(0).text();
				var username = td.eq(1).text();
				var email = td.eq(2).text();
				var phone = td.eq(3).text();
				var address = td.eq(4).text();
				addrarray = address.split('/');
				var addr1 = addrarray[0];
				var addr2 = addrarray[1];
				var addr3 = addrarray[2];
				var regdate = td.eq(5).text();		
				var enableParse = td.eq(6).text();
				enable = enableParse.match("탈퇴");
				
				$("#mem_id").val(userid);
				$("#mem_id2").val(userid);
				$("#mem_name").val(username);
				$("#mem_email").val(email);
				$("#mem_phone").val(phone);
				$("#sample6_postcode").val(addr1);
				$("#sample6_address").val(addr2);
				$("#sample6_address2").val(addr3);
				
				if (enable == "탈퇴") {
					$("[name='enable'][value='탈퇴']").attr("checked", true);
				}
			}
		});
		
		$("#mem_id_j").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
			}
		});
	});

	function sample6_execDaumPostcode(gubun) {
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
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						if (gubun == 1) {
							document.getElementById('sample6_postcode_j').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample6_address_j').value = fullAddr;

							document.getElementById('sample6_address2_j')
									.focus();
						}
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						document.getElementById('sample6_address2').focus();

					}
				}).open();
	}

	function duplCheck() {
		var mem_id = $('#mem_id_j').val();
		var idExp = /^[a-z0-9]{0,15}/;
		if (!idExp.test(mem_id)) {
			$('#mem_id').val("");
			$('#mem_id').focus();
			$('#duplicate').val('N');
			$('#idcheck').html('숫자와 영어를 조합하여 아이디를 입력하세요').css('color', 'red');
			return false;
		} else {
			$.ajax({
				type : 'post',
				url : 'duplCheck.gt',
				data : {
					"mem_id" : mem_id
				},
				success : function(data) {
					if (data == "0") {
						$("#idcheck").html(
								'<p style="color:blue"> 사용가능한 아이디입니다.</p>');
						$('#duplicate').val('Y');
					} else if (data != "0") {
						$("#idcheck").html(
								'<p style="color:red"> 이미 사용중입니다.</p>');
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
	
	function execution() {
		var duplicate = $("#duplicate").val();
		if (duplicate == "N") {
			alert("중복확인이 필요합니다.")
			return false;
		} else if (duplicate == "F") {
			alert("이미 사용중인 아이디입니다.")
			return false;
		}
		alert("회원가입 되었습니다.");
	}
	
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
</script>
  </head>
  <body style="padding-right: 0px !important">

  <!-- START: header -->
   <header role="banner" class="probootstrap-header">
    <div class="container">
        <a href="memcontrol.ad" class="probootstrap-logo"><span class="barunPenLogo">Got Them</span></a>
        
        <a href="#" class="probootstrap-burger-menu visible-xs" ><i>Menu</i></a>
        <div class="mobile-menu-overlay"></div>

        <nav role="navigation" class="probootstrap-nav hidden-xs">
          <ul class="probootstrap-main-nav">
            <li><a href="memcontrol.ad" class="barunPen">회원관리</a></li>
            <li><a href="storecontrol.ad" class="barunPen">점포관리</a></li>
            <li><a href="index.gt" class="barunPen">회원메인</a></li>
            <li><a href="logout.ad" class="barunPen">로그아웃</a></li>
          </ul>
        </nav>
    </div>
  </header>
  
<div id="wrap">
  <div class="probootstrap-loader"></div>
	<div class="table-responsive">
		<div style="text-align: center;">
			<div class="col-sm-8 col-sm-offset-2" style="font-size: 33px; color: #333;">
				<b>회원정보 관리 </b>
			</div>
			<div class="col-sm-2">
				<button class="btn btn-primary" data-toggle="modal" data-target="#myModal2">회원등록</button>
			</div>
		</div>
		<br><br><hr>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일</th>
					<th>계정상태</th>	
				</tr>
			</thead>
			<tbody id="rowClick">
			<c:forEach var="mlist" items="${requestScope.mlist}">
					<tr class="textMiddle">
						<td>${mlist.mem_id}</td>
						<td>${mlist.mem_name}</td>
						<td>${mlist.mem_email}</td>
						<td>${mlist.mem_phone}</td>
						<td>${mlist.mem_address}</td>
						<td>${mlist.mem_regdate}</td>
						<td><c:choose>
						<c:when test="${mlist.enabled eq 0 }">
						탈퇴</c:when>
						<c:when test="${mlist.enabled eq 1 }">
						가입</c:when>
						</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="paging">
			<c:if test="${totalPages ne 0}">
			<ul class="pagination pagination-danger">
				<c:choose>
					<c:when test="${prevPage ne 0}">
						<li class="page-item"><a class="page-link" 
							href="memcontrol.ad?pageNo=${prevPage}">&laquo;</a></li>
					</c:when>
				</c:choose>
					<c:forEach begin="${beginPage}" end="${endPage }" step="1" varStatus="status">
						<c:choose>
							<c:when test="${nowPage eq status.index}">
								<li class="page-item active"><a class="page-link" 
									href="memcontrol.ad?pageNo=${status.index }">${status.index }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" 
									href="memcontrol.ad?pageNo=${status.index }">${status.index }</a></li>
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
				<c:choose>
				
					<c:when test="${nextPage ne 0 }">
						<li class="page-item"><a class="page-link" 
							href="searchList.gt?pageNo=${nextPage }">&raquo;</a></li>
					</c:when>
				</c:choose>
				
			</ul>
			</c:if>
		</div>
		<form action="selectSearch.ad" method="get" style="height:80px; text-align: center;">
			<select name="select" style="font-size:20px; height:49px; border-radius: 12px;border:2px solid #44B3C2">
			    <option value="" selected="selected">선택</option>
			    <option value="mem_name">이름</option>
			    <option value="mem_phone">전화번호</option>
			    <option value="mem_address">주소</option>
			    <option value="enabled">계정상태</option>
			</select>
			<input type="text" name="search" pattern="[A-Z|a-z|0-9|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}"
				title="두글자 이상 입력해주세요." autocomplete="off" required="required"
				style="height:49px; border-radius: 12px; border:2px solid #44B3C2">
			<button type="submit" class="btn btn-primary">검색</button>
		</form>
	<hr>
	</div>
	
	<!-- 회원가입 모달 -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
                <div class="modal-content"> 
                 <div class="modal-header"> 
	                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
	                  <h4 class="modal-title" id="myModalLabel">회원정보수정</h4> 
                  </div> 
                  <div class="modal-body">
                 
					<section class="mbr-section form1 cid-qIWKYtQnJh" id="form1-r">
						<div class="container">
							<div class="row justify-content-center">
								
								<form action="joinSccess.gt" method="post" onsubmit="return execution();"
									data-form-title="Mobirise Form">
										
									<div class="row row-sm-offset">
										
										<input type="hidden" name="gubun" value="joinToAdmin">
										<input type="hidden" id="duplicate" value="N">
										<div class="col-sm-8 multi-horizontal" data-for="id">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="name-form1-r">아이디</label> <input type="text" required="required" autocomplete="false"
													pattern="[A-Za-z0-9]{0,15}" autofocus onkeyup="duplCheck()" maxlength="20"
 													name="mem_id" class="form-control" id="mem_id_j"> 
 													<p id="idcheck" class="text-mute">아이디를 입력해주세요</p>
											</div>
										</div>
										
										<div class="col-sm-8 multi-horizontal" data-for="ownername">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="owner-form1-r">회원명</label> <input type="text" required="required" maxlength="20"
													name="mem_name" id="mem_name_j" class="form-control">
											</div>
										</div>
										
										<div class="col-sm-12 multi-horizontal" data-for="email">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="email-form1-r">이메일</label> <br>
													<input maxlength="20" type="text" class="form-control" id="mem_emailid" required="required" name="mem_emailid" style="width:40%; display:inline;">&nbsp;@
                 									<input maxlength="20" type="text" class="form-control" id="mem_emailadd" required="required" name="mem_emailadd" style="width:40%; display:inline;">
											</div>
										</div>
										
										<div class="col-sm-12 multi-horizontal" data-for="phone">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="phone-form1-r">전화번호</label><br>
														<input type="text" class="form-control" maxlength="3" id="mem_phoneFront" name="mem_phoneFront" required="required" style="width:30%; display:inline;" onkeyup="removeChar(event)">&nbsp;-
										                <input type="text" class="form-control" maxlength="4" id="mem_phoneMiddle" name="mem_phoneMiddle" required="required" style="width:30%; display:inline;" onkeyup="removeChar(event)">&nbsp;-
										                <input type="text" class="form-control" maxlength="4" id="mem_phoneLast" name="mem_phoneLast" required="required" style="width:30%; display:inline;" onkeyup="removeChar(event)">
											</div>
										</div>
										
										<div class="col-sm-6 multi-horizontal" data-for="postcode">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="addr1-form1-r">우편번호</label> <input type="text"
													class="form-control address1" name="mem_addr1" required="required"
													id="sample6_postcode_j" readOnly>
											</div>
										</div>
										<div class="col-sm-6 multi-horizontal" data-for="findpostcode">
											<div class="form-group" style="margin: 23px 0px; padding-top: 4px;">
												<input type="button" onclick="sample6_execDaumPostcode(1)" name="mem_post"
													class="btn btn-primary btn-sm" value="우편번호 찾기">
											</div>
										</div>
										
										<div class="col-sm-12 multi-horizontal" data-for="address1">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="addr1-form1-r">상세주소1</label> <input type="text"
													class="form-control address2" name="mem_address1" required="required"
													style="width: 568px;" id="sample6_address_j" readOnly>
											</div>
										</div>
										<div class="col-sm-12 multi-horizontal" data-for="address2">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="addr2-form1-r">상세주소2</label> <input type="text" required="required"
													class="form-control address3" name="mem_address2" style="width: 568px;"
													id="sample6_address2_j">
											</div>
										</div>
										
										<div class="col-sm-12 multi-horizontal" data-for="button"
											style="width: 598px; text-align: center;">
												<button type="submit" class="btn btn-primary">가입</button>
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">취소</button>
										</div>
									</div>
								</form>
								
							</div>
						</div>
					</section>
					
				</div> 
  
                </div> 
        	</div> 
		</div>
	
	
	<!-- 회원정보 수정 모달 -->
	  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
                <div class="modal-content"> 
                 <div class="modal-header"> 
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
                  <h2 class="modal-title" id="myModalLabel">회원정보수정</h2> 
                  </div> 
                  <div class="modal-body">
                 
					<section class="mbr-section form1 cid-qIWKYtQnJh" id="form1-r">
						<div class="container">
							<div class="row justify-content-center">
								<div data-form-alert="" hidden=""></div>
								
								<form action="memmodify.ad" method="post"
									data-form-title="Mobirise Form">
									<input type="hidden" name="email" data-form-email="true"
										value="v71UZV7rSGKmNdtMTJcCzvbgvRKs8I889PXLsAjbR6NuKJtPYoKYEe+DT90N7gqVmrsYQhYLqTnSDAVjImF7Eb8KP/1hIcQUbq5w77EmgcHnu38hK1G/QmJo9v9/aFIP"
										data-form-field="Email">
										
									<div class="row row-sm-offset">
										<div class="col-sm-8 multi-horizontal" data-for="id">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="name-form1-r">아이디</label> <input type="text"
													name="mem_id" class="form-control" disabled="disabled"
													id="mem_id" value="${requestScope.mem_id }"> <input
													type="hidden" id="mem_id2" name="mem_id" value="">
											</div>
										</div>
										
										<div class="col-sm-8 multi-horizontal" data-for="ownername">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="owner-form1-r">회원명</label> <input type="text"
													name="mem_name" id="mem_name" class="form-control"
													value="${requestScope.mem_name}">
											</div>
										</div>
										
										<div class="col-sm-8 multi-horizontal" data-for="email">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="email-form1-r">이메일</label> <input type="email"
													class="form-control" name="mem_email" id="mem_email">
											</div>
										</div>
										
										<div class="col-sm-8 multi-horizontal" data-for="phone">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="phone-form1-r">전화번호</label> <input type="text"
													class="form-control" name="mem_phone"
													value="${stinfo.mem_phone}" id="mem_phone">
											</div>
										</div>
										
										<div class="col-sm-6 multi-horizontal" data-for="postcode">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="addr1-form1-r">우편번호</label> <input type="text"
													class="form-control address1" name="mem_addr1"
													id="sample6_postcode" value="${st_post }" readOnly>
											</div>
										</div>
										<div class="col-sm-6 multi-horizontal" data-for="findpostcode">
											<div class="form-group" style="margin: 23px 0px; padding-top: 4px;">
												<input type="button" onclick="sample6_execDaumPostcode(2)"
													class="btn btn-primary btn-sm" value="우편번호 찾기">
											</div>
										</div>
										
										<div class="col-sm-12 multi-horizontal" data-for="address1">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="addr1-form1-r">상세주소1</label> <input type="text"
													class="form-control address2" name="mem_addr2"
													value="${st_address1}" style="width: 568px;"
													id="sample6_address" readOnly>
											</div>
										</div>
										<div class="col-sm-12 multi-horizontal" data-for="address2">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="addr2-form1-r">상세주소2</label> <input type="text"
													class="form-control address3" name="mem_addr3"
													value="${st_address2}" style="width: 568px;"
													id="sample6_address2">
											</div>
										</div>
										
										<div class="col-sm-12 multi-horizontal" data-for="grade">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="addr2-form1-r">회원 상태</label> <br>
												<input type="radio" name="enable" value="가입" checked>가입
												<input type="radio" name="enable" value="탈퇴">탈퇴</div>
										</div>
										
										<div class="col-sm-12 multi-horizontal" data-for="button"
											style="width: 598px; text-align: center;">
											<button type="submit" class="btn btn-primary">정보수정</button>
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">취소</button>
										</div>
									</div>
								</form>
								
							</div>
						</div>
					</section>
				</div>    
                </div> 
        	</div> 
		</div>
		
<!-- START: footer -->
<%@include file="../../../footer.jsp" %>
<!-- END: footer -->

  <script src="resources/mainTemplate/js/scripts.min.js"></script>
  <script src="resources/mainTemplate/js/main.min.js"></script>
  <script src="resources/mainTemplate/js/custom.js"></script>
</div>
  </body>

</html>