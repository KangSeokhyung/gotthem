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
<body>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>NO</th>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일</th>
					<th>회원등급</th>
					<th>계정상태</th>	
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="mlist" items="${requestScope.mlist}">
					<tr>
						<td>${mlist.mem_no}</td>
						<td>${mlist.mem_id}</td>
						<td>${mlist.mem_name}</td>
						<td>${mlist.mem_email}</td>
						<td>${mlist.mem_phone}</td>
						<td>${mlist.mem_address}</td>
						<td>${mlist.mem_regdate}</td>
						<td>${mlist.mem_status}</td>
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
	</div>
	  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
                <div class="modal-content"> 
                 <div class="modal-header"> 
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
                  <h4 class="modal-title" id="myModalLabel">회원정보수정</h4> 
                  </div> 
                 <div class="modal-body">  
       <form action="memmodify.ad" method="POST">
      <input type="text" id="mem_id" class="fadeIn second" name="mem_id"  value=""
      maxlength="10" pattern="^[_A-z0-9]{1,}$" readonly><br>
       <input type="text" id="mem_name" class="fadeIn second" name="mem_name" value="" 
       data-toggle="tooltip" data-placement="right" ><br>
       <input type="text" id="mem_email" class="fadeIn second" name="mem_email" value="" required="requried"><br>
        <input type="text" id="mem_phone" class="fadeIn second" name="mem_phone" value="" required="requried"><br>
       <input type="text"  id="sample6_postcode" class ="fadeIn fourth" name="mem_addr1" value="" >
       <input type="button" onclick="sample6_execDaumPostcode()" class="postcode btn btn-primary" value="주소찾기" ><br>
       <input type="text" id="sample6_address" class ="fadeIn fourth" name="mem_addr2" value="" ><br>
       <input type="text" id="sample6_address2" class ="fadeIn fourth" name="mem_addr3" value=""><br>
       <input type="radio" name="enable" value="가입" checked>가입
       <input type="radio" name="enable" value="탈퇴">탈퇴<br><br>
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
		var email = td.eq(3).text();
		var phone = td.eq(4).text();
		var address = td.eq(5).text();
		addrarray = address.split('/');
		var addr1 = addrarray[0];
		var addr2 = addrarray[1];
		var addr3 = addrarray[2];
		var regdate = td.eq(6).text();
		
		console.log(addrarray);
		
		$("#mem_id").val(userid);
		$("#mem_name").val(username);
		$("#mem_email").val(email);
		$("#mem_phone").val(phone);
		$("#sample6_postcode").val(addr1);
		$("#sample6_address").val(addr2);
		$("#sample6_address2").val(addr3);
	});
    </script>
</html>