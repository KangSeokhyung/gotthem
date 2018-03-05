<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  %>
<!DOCTYPE html >
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="resources/landy/vendor/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>NO</th>
					<th>점포아이디</th>
					<th>점주명</th>
					<th>점포명</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일</th>
					<th>계정상태</th>	
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="stlist" items="${requestScope.stlist}">
					<tr>
						<td>${stlist.mem_no}</td>
						<td>${stlist.mem_id}</td>
						<td>${stlist.mem_name}</td>
						<td>${stlist.sto_name }</td>
						<td>${stlist.mem_email}</td>
						<td>${stlist.mem_phone}</td>
						<td>${stlist.mem_address}</td>
						<td>${stlist.mem_regdate}</td>
						<td><c:choose>
						<c:when test="${stlist.enabled eq 0 }">
						승인대기</c:when>
						<c:when test="${stlist.enabled eq 1 }">
						승인완료</c:when>
						</c:choose></td>
						<td><button type="button" class="btn btn-primary edit" data-toggle="modal"
        				data-target="#myModal1">수정</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	  <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
                <div class="modal-content"> 
                 <div class="modal-header"> 
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
                  <h4 class="modal-title" id="myModalLabel">회원정보수정</h4> 
                  </div> 
                 <div class="modal-body">  
       <form action="storemodify.ad" method="POST">
      <input type="text" id="id" class="fadeIn second" name="mem_id"  value=""
      maxlength="10" pattern="^[_A-z0-9]{1,}$" readonly><br>
       <input type="text" id="name" class="fadeIn second" name="mem_name" value="" 
       data-toggle="tooltip" data-placement="right" ><br>
       <input type="text" id="stname" class="fadeIn second" name="sto_name" value="" 
       data-toggle="tooltip" data-placement="right" ><br>
       <input type="text" id="email" class="fadeIn second" name="mem_email" value="" required="requried"><br>
        <input type="text" id="phone" class="fadeIn second" name="mem_phone" value="" required="requried"><br>
       <input type="text"  id="sample6_postcode" class ="fadeIn fourth address1" name="mem_addr1" value="" >
       <input type="button" onclick="sample6_execDaumPostcode()" class="postcode btn btn-primary" value="주소찾기" ><br>
       <input type="text" id="sample6_address" class ="fadeIn fourth address2" name="mem_addr2" value="" ><br>
       <input type="text" id="sample6_address2" class ="fadeIn fourth address3" name="mem_addr3" value=""><br>
       <input type="radio" name="enable" value="승인완료" checked>승인완료
       <input type="radio" name="enable" value="승인대기" >승인대기 <br><br>
       <br>
          <button type="submit" class="btn btn-primary">정보수정</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
       </form> 
                 	</div>    
                </div> 
        	</div> 
		</div>
</body>
<script>
    $(".edit").click(function(){ 
		
		var str = ""
		var edit = $(this);
		
		// checkBtn.parent() : checkBtn의 부모는 <td>이다.
		// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
		var tr = edit.parent().parent();
		var td = tr.children();
		
		console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		
		var userid = td.eq(1).text();
		var username = td.eq(2).text();
		var stoname = td.eq(3).text();
		var email = td.eq(4).text();
		var phone = td.eq(5).text();
		var address = td.eq(6).text();
		addrarray = address.split('/');
		var addr1 = addrarray[0];
		var addr2 = addrarray[1];
		var addr3 = addrarray[2];
		
		console.log(addrarray);
		
		$("#id").val(userid);
		$("#name").val(username);
		$("#stname").val(stoname);
		$("#email").val(email);
		$("#phone").val(phone);
		$(".address1").val(addr1);
		$(".address2").val(addr2);
		$(".address3").val(addr3);
	});
    </script>
</html>