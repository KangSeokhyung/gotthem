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
<style>
/* 푸터 css */
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
font-size:22px;
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
  </head>
  <body>
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
            <li><a href="index.gt" class="barunPen">고객모드</a></li>
            <li><a href="logout.ad" class="barunPen">로그아웃</a></li>
          </ul>
        </nav>
    </div>
  </header>

  <div class="probootstrap-loader"></div>
	<div class="table-responsive">
		<table class="table">
		<center><h1 style="display:inline;"><b>회원정보 관리</b></h1></center>
		<button style="float:right; margin-right:25px;"class="btn btn-magen">회원등록</button>
		<hr>
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일</th>
					<th>계정상태</th>	
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
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
						<td><button type="button" class="btn btn-primary edit" data-toggle="modal"
        				data-target="#myModal">수정</button></td>
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
					<center><form style="height:80px;">
					<select name="select" style="font-size:20px; height:49px; border-radius: 12px;border:2px solid #44B3C2">
					    <option value="" selected="selected">선택</option>
					    <option value="이름">이름</option>
					    <option value="전화번호" >전화번호</option>
					    <option value="승인대기">승인대기</option>
					    <option value="승인">승인</option>
					    <option value="승인거부">승인거부</option>
					</select>
					<input type="text" style="height:49px;border-radius: 12px; border:2px solid #44B3C2">
					<button type="submit" class="btn btn-primary">검색</button>
					</form></center>
					<hr>
				</div>
				
		
	</div>
	
	
	
	
	  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
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
                    <div data-form-alert="" hidden="">
                    </div>      
                    <form class="mbr-form" action="memmodify.ad" method="post" data-form-title="Mobirise Form">
                    <input type="hidden" name="email" data-form-email="true" value="v71UZV7rSGKmNdtMTJcCzvbgvRKs8I889PXLsAjbR6NuKJtPYoKYEe+DT90N7gqVmrsYQhYLqTnSDAVjImF7Eb8KP/1hIcQUbq5w77EmgcHnu38hK1G/QmJo9v9/aFIP" data-form-field="Email">
                        <div class="row row-sm-offset">
                            <div class="col-sm-8 multi-horizontal" data-for="id">
                                <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="name-form1-r">아이디</label>
                                    <input type="text" name="mem_id" class="form-control" disabled="disabled" 
                                   id="mem_id" value="${requestScope.mem_id }">
                                  <input type="hidden" id="mem_id2" name="mem_id" value="" >
                                </div>
                            </div>
                            <div class="col-sm-8 multi-horizontal" data-for="ownername">
                                <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="owner-form1-r">회원명</label>
                                    <input type="text" name="mem_id" id="mem_name" class="form-control" name="mem_name" 
                                    value="${requestScope.mem_name}" >
                                </div>
                         </div>
                          <div class="col-sm-8 multi-horizontal" data-for="email">
                          <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="email-form1-r">이메일</label>
                                    <input type="email" class="form-control" name="mem_email" 
                                     id="mem_email">
                                </div>
                            </div>
                          <div class="col-sm-8 multi-horizontal" data-for="phone">
                           <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="phone-form1-r">전화번호</label>
                                    <input type="text" class="form-control" name="mem_phone" 
                                    value="${stinfo.mem_phone}" id="mem_phone">
                                </div>
                            </div>
                         <div class="col-sm-6 multi-horizontal" data-for="postcode">
                            <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="addr1-form1-r">우편번호</label>
                                    <input type="text" class="form-control address1" name="mem_addr1" id="sample6_postcode"
                                    value="${st_post }" readOnly>
                                </div>
                            </div>
                         <div class="col-sm-6 multi-horizontal" data-for="findpostcode">
                            <div class="form-group" style="margin:23px 0px;">
                            <button onclick="sample6_execDaumPostcode()" class="btn btn-primary btn-form display-4">우편번호찾기</button>
                           </div>
                         </div>
                        <div class="col-sm-12 multi-horizontal" data-for="address1">
                            <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="addr1-form1-r">상세주소1</label>
                                    <input type="text" class="form-control address2" name="mem_addr2" 
                                     value="${st_address1}" style="width:568px;" id="sample6_address" readOnly>
                                </div>
                            </div>
                         <div class="col-sm-12 multi-horizontal" data-for="address2">
                            <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="addr2-form1-r">상세주소2</label>
                                    <input type="text" class="form-control address3" name="mem_addr3" 
                                    value="${st_address2}" style="width:568px;" id="sample6_address2">
                                </div>
                            </div>
                        <div class="col-sm-12 multi-horizontal" data-for="grade">
                            <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="addr2-form1-r">회원 상태</label>
                                        <br><input type="radio" name="enable" value="가입" checked>가입
       									<input type="radio" name="enable" value="탈퇴" >탈퇴
                                </div>
                            </div>
                             <div class="col-sm-12 multi-horizontal" data-for="button" style="width:598px; align:center;">

                             <center> <button type="submit"  class="btn btn-primary" >정보수정</button>
          					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button></center>       
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
<script>
    $(".edit").click(function(){ 
		
		var str = ""
		var edit = $(this);
		
		// checkBtn.parent() : checkBtn의 부모는 <td>이다.
		// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
		var tr = edit.parent().parent();
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
		
		console.log(addrarray);
		
		$("#mem_id").val(userid);
		$("#mem_id2").val(userid);
		$("#mem_name").val(username);
		$("#mem_email").val(email);
		$("#mem_phone").val(phone);
		$("#sample6_postcode").val(addr1);
		$("#sample6_address").val(addr2);
		$("#sample6_address2").val(addr3);
	});
    </script>
  <script src="resources/mainTemplate/js/scripts.min.js"></script>
  <script src="resources/mainTemplate/js/main.min.js"></script>
  <script src="resources/mainTemplate/js/custom.js"></script>

  </body>

</html>