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
    .table-responsive{
    margin-top: 80px;
    padding: 50px;
    }
    </style>
  </head>
  <body>

  <!-- START: header -->
   <header role="banner" class="probootstrap-header">
    <div class="container">
        알아서 로고 넣으셈
        
        <a href="#" class="probootstrap-burger-menu visible-xs" ><i>Menu</i></a>
        <div class="mobile-menu-overlay"></div>

        <nav role="navigation" class="probootstrap-nav hidden-xs">
          <ul class="probootstrap-main-nav">
            <li><a href="memcontrol.ad">회원관리</a></li>
            <li><a href="storecontrol.ad">점포관리</a></li>
            <li><a href="#">게시판관리</a></li>
          </ul>
        </nav>
    </div>
  </header>

  <div class="probootstrap-loader"></div>
	<div class="table-responsive">
		<table class="table">
		<h2>회원정보 관리</h2>
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
					<tr>
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
				</div>
		<hr>
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
                        Thanks for filling out the form!
                    </div>      
                    <form class="mbr-form" action="memmodify.ad" method="post" data-form-title="Mobirise Form">
                    <input type="hidden" name="email" data-form-email="true" value="v71UZV7rSGKmNdtMTJcCzvbgvRKs8I889PXLsAjbR6NuKJtPYoKYEe+DT90N7gqVmrsYQhYLqTnSDAVjImF7Eb8KP/1hIcQUbq5w77EmgcHnu38hK1G/QmJo9v9/aFIP" data-form-field="Email">
                        <div class="row row-sm-offset">
                            <div class="col-sm-8 multi-horizontal" data-for="id">
                                <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="name-form1-r">아이디</label>
                                    <input type="text" class="form-control" data-form-field="name" disabled="disabled" 
                                   id="mem_id" >
                                  <input type="hidden" id="mem_id2" name="mem_id" value="" >
                                </div>
                            </div>
                            <div class="col-sm-8 multi-horizontal" data-for="ownername">
                                <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="owner-form1-r">회원명</label>
                                    <input type="text" id="mem_name" class="form-control" name="mem_name" 
                                    required="" data-form-field="owner" >
                                </div>
                         </div>
                          <div class="col-sm-8 multi-horizontal" data-for="email">
                          <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="email-form1-r">이메일</label>
                                    <input type="email" class="form-control" name="mem_email" 
                                    data-form-field="Name" required="" id="mem_email">
                                </div>
                            </div>
                          <div class="col-sm-8 multi-horizontal" data-for="phone">
                           <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="phone-form1-r">전화번호</label>
                                    <input type="text" class="form-control" name="mem_phone" 
                                    value="${stinfo.mem_phone}" data-form-field="Name" required="" id="mem_phone">
                                </div>
                            </div>
                         <div class="col-sm-6 multi-horizontal" data-for="postcode">
                            <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="addr1-form1-r">우편번호</label>
                                    <input type="text" class="form-control address1" name="mem_addr1" data-form-field="Name" required="" id="sample6_postcode"
                                    value="${st_post }">
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
                                     value="${st_address1}" data-form-field="Name" required="" id="sample6_address">
                                </div>
                            </div>
                         <div class="col-sm-12 multi-horizontal" data-for="address2">
                            <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="addr2-form1-r">상세주소2</label>
                                    <input type="text" class="form-control address3" name="mem_addr3" 
                                    value="${st_address2}" data-form-field="Name" required="" id="sample6_address2">
                                </div>
                            </div>
                        <div class="col-sm-12 multi-horizontal" data-for="grade">
                            <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="addr2-form1-r">회원 상태</label>
                                        <br><input type="radio" name="enable" value="가입" checked>가입
       									<input type="radio" name="enable" value="탈퇴" >탈퇴
                                </div>
                            </div>
                             <div class="col-sm-8 multi-horizontal" data-for="button">

                              <button type="submit"  class="btn btn-primary">정보수정</button>
          					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>       
                   			</div>
                    </form>          
        </div>       
    </div>
</section>
                 	</div>    
                </div> 
        	</div> 
		</div>
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