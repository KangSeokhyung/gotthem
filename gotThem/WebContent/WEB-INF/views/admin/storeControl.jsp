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
    height:1000px;
}
#wrap {
	min-height: 100%; 
	position: relative;
}
footer {
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
th{
font-size:20px;
}
tr{
font-size:18px;
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
    padding-top: 22px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 1px solid #ddd;
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
				var stoname = td.eq(2).text();
				var email = td.eq(3).text();
				var phone = td.eq(4).text();
				var address = td.eq(5).text(); 
				addrarray = address.split('/');
				var addr1 = addrarray[0];
				var addr2 = addrarray[1];
				var addr3 = addrarray[2];
				var enable = td.eq(7).children().val();
				
				if (enable == "승인대기") {
					$("[name='sto_permitstatus'][value='승인대기']").prop("checked", true);
					$("#enabled").val(0);
				} else if (enable == "승인거부") {
					$("[name='sto_permitstatus'][value='승인거부']").prop("checked", true);
					$("#enabled").val(0);
				} else if (enable == "승인완료") {
					$("[name='sto_permitstatus'][value='승인완료']").prop("checked", true);
					$("#enabled").val(1);
				}
				
				$("#mem_id").val(userid);
				$("#mem_id2").val(userid);
				$("#sto_name").val(stoname);
				$("#mem_name").val(username);
				$("#mem_email").val(email);
				$("#mem_phone").val(phone);
				$("#sample6_postcode").val(addr1);
				$("#sample6_address").val(addr2);
				$("#sample6_address2").val(addr3);
			}
		});
		
		$("[name=sto_permitstatus]").click(function(){
			var status = $(this).val();
			if (status == "승인완료") {
				$("#enabled").val(1);
			} else {
				$("#enabled").val(0);
			}
		})
		
	});
	
	function sample6_execDaumPostcode(gubun) {
		new daum.Postcode({
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
				document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('sample6_address').value = fullAddr;
				
				document.getElementById('sample6_address2').focus();
			}
		}).open();
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
  <body>

  <!-- START: header -->
   <header role="banner" class="probootstrap-header">
    <div class="container" style="width: 1400px;">
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
	<div class="table-responsive">
		<div style="text-align: center;">
			<span style="font-size: 33px; color: #333;"><b>점포정보 관리</b></span>
		</div>
		<hr>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>점포아이디</th>
					<th>점주명</th>
					<th>점포명</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일</th>
					<th>계정상태</th>
				</tr>
			</thead>
			<tbody id="rowClick"> 
				<c:forEach var="stlist" items="${requestScope.mlist}">
					<tr>
						<td>${stlist.mem_id}</td>
						<td>${stlist.mem_name}</td>
						<td>${stlist.sto_name }</td>
						<td>${stlist.mem_email}</td>
						<td>${stlist.mem_phone}</td>
						<td>${stlist.mem_address}</td>
						<td>${stlist.mem_regdate}</td>
						<td>
							<c:choose>
								<c:when test="${stlist.sto_permitstatus eq '승인완료' }">
									승인완료<input type="hidden" value="승인완료">
								</c:when>
								<c:when test="${stlist.sto_permitstatus eq '승인대기' }">
									승인대기<input type="hidden" value="승인대기">
								</c:when>
								<c:when test="${stlist.sto_permitstatus eq '승인거부' }">
									승인거부<input type="hidden" value="승인거부">
								</c:when>
							</c:choose>
						</td>
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
							href="storecontrol.ad?pageNo=${prevPage}">&laquo;</a></li>
					</c:when>
				</c:choose>
					<c:forEach begin="${beginPage}" end="${endPage }" step="1" varStatus="status">
						<c:choose>
							<c:when test="${nowPage eq status.index}">
								<li class="page-item active"><a class="page-link" 
									href="storecontrol.ad?pageNo=${status.index }">${status.index }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" 
									href="storecontrol.ad?pageNo=${status.index }">${status.index }</a></li>
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
		<input type="hidden" name="gubun" value="점포">
		<select name="select" style="font-size:20px; height:49px; border-radius: 12px;border:2px solid #44B3C2">
		    <option value="" selected="selected">선택</option>
		    <option value="mem_name">이름</option>
		    <option value="mem_phone">전화번호</option>
		    <option value="sto_name">점포명</option>
		    <option value="sto_permitstatus">계정상태</option>
		</select>
		<input type="text" name="search" style="height:49px;border-radius: 12px; border:2px solid #44B3C2">
		<button type="submit" class="btn btn-primary">검색</button>
		</form>
		<hr>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="myModalLabel">회원정보수정</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<section class="mbr-section form1 cid-qIWKYtQnJh" id="form1-r">
						<div class="container-fluid">
							<div class="row justify-content-center">
							
								<form action="storemodify.ad" method="post"
									data-form-title="Mobirise Form">
									
									<div class="row row-sm-offset">
									
										<div class="col-sm-8 multi-horizontal" data-for="id">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="name-form1-r">아이디</label> <input type="text"
													class="form-control" data-form-field="name"
													disabled="disabled" id="mem_id" value="${stinfo.mem_id}">
												<input type="hidden" id="mem_id2" name="mem_id">
											</div>
										</div>
									
										<div class="col-sm-8 multi-horizontal" data-for="ownername">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="owner-form1-r">점주명</label> <input type="text" 
													id="mem_name" class="form-control" name="mem_name"
													value="${stinfo.mem_name }" required="required"
													data-form-field="owner">
											</div>
										</div>
										
										<div class="col-sm-8 multi-horizontal" data-for="storename">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="stoname-form1-r">점포명</label> <input type="text"
													class="form-control" name="sto_name"
													value="${stinfo.sto_name }" data-form-field="owner"
													required="required" id="sto_name">
											</div>
										</div>
										
										<div class="col-sm-8 multi-horizontal" data-for="email">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="email-form1-r">이메일</label> <input type="email"
													class="form-control" name="mem_email"
													value="${stinfo.mem_email}" data-form-field="Name"
													required="required" id="mem_email">
											</div>
										</div>
										
										<div class="col-sm-8 multi-horizontal" data-for="phone">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="phone-form1-r">전화번호</label> <input type="text"
													class="form-control" name="mem_phone" onkeyup="removeChar(event);"
													value="${stinfo.mem_phone}" data-form-field="Name"
													required="required" id="mem_phone">
											</div>
										</div>
										
										<div class="col-sm-6 multi-horizontal" data-for="postcode">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="addr1-form1-r">우편번호</label> <input type="text"
													class="form-control address1" name="mem_addr1"
													data-form-field="Name" required="required" id="sample6_postcode"
													value="${st_post }">
											</div>
										</div>
										
										<div class="col-sm-6 multi-horizontal" data-for="findpostcode">
											<div class="form-group" style="margin: 23px 0px;">
												<button onclick="sample6_execDaumPostcode()"
													class="btn btn-primary btn-form display-4">우편번호찾기</button>
											</div>
										</div>
										
										<div class="col-sm-12 multi-horizontal" data-for="address1">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="addr1-form1-r">매장 상세주소1</label> <input type="text"
													class="form-control address2" name="mem_addr2"
													value="${st_address1}" data-form-field="Name" required="required"
													id="sample6_address">
											</div>
										</div>
										
										<div class="col-sm-12 multi-horizontal" data-for="address2">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="addr2-form1-r">매장 상세주소2</label> <input type="text"
													class="form-control address3" name="mem_addr3"
													value="${st_address2}" data-form-field="Name" required="required"
													id="sample6_address2">
											</div>
										</div>
										
										<div class="col-sm-12 multi-horizontal" data-for="grade">
											<div class="form-group">
												<label class="form-control-label mbr-fonts-style display-7"
													for="addr2-form1-r">회원 상태</label> <br> 
												<input type="radio" name="sto_permitstatus" value="승인완료">승인완료
												<input type="radio" name="sto_permitstatus" value="승인대기">승인대기
												<input type="radio" name="sto_permitstatus" value="승인거부">승인거부
												<input type="hidden" id="enabled" name="enabled">
											</div>
										</div>
										<hr><hr><hr><hr>
										<div class="col-sm-12 multi-horizontal" data-for="button" style="text-align: center;">
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
</div>
</body>

<!-- START: footer -->
<%@include file="../../../footer.jsp" %>
<!-- END: footer -->

  <script src="resources/mainTemplate/js/scripts.min.js"></script>
  <script src="resources/mainTemplate/js/main.min.js"></script>
  <script src="resources/mainTemplate/js/custom.js"></script>
  
</html>