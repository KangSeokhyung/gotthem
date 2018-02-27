<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<th>점포번호</th>
					<th>점주아이디</th>
					<th>점주명</th>
					<th>점포명</th>
					<th>점포주소</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>가입일</th>
					<th>사업자번호</th>
					<th>승인상태</th>
					<th>수정하기</th>
					<th>비활성화</th>			
				</tr>
			</thead>
			<tbody>
			<c:forEach var="stlist" items="${requestScope.stlist}">
					<tr>
						<td>${stlist.mem_no}</td>
						<td>${stlist.mem_id}</td>
						<td>${stlist.mem_name }</td>
						<td>${stlist.sto_name }</td>
						<td>${stlist.mem_email}</td>
						<td>${stlist.mem_phone}</td>
						<td>${stlist.mem_address}</td>
						<td>${stlist.mem_regdate}</td>
						<td>${stlist.mem_status}</td>
						<td>${stlist.enabled}</td>
						<td><button type="button" class="btn btn-primary" data-toggle="modal"  ,
        				data-target="#myModal">수정</button></td>
						<td><button type="button" class="btn btn-danger">비활성</button></td>
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
       <form>
      <input type="text" id="id" class="fadeIn second" name="mem_id"  value=""
      maxlength="10" pattern="^[_A-z0-9]{1,}$" readonly><br>
       <input type="text" id="phone" class="fadeIn second" name="mem_name" value="" 
       data-toggle="tooltip" data-placement="right" ><br>
       <input type="text" id="e-mail" class="fadeIn second" name="sto_name" value="" required="requried"><br>
       <input type="text" id="e-mail" class="fadeIn second" name="mem_email" value="" required="requried">
       <input type="text" id="e-mail" class="fadeIn second" name="mem_phone" value="" required="requried">
       <input type="text"  id="sample6_postcode" class ="fadeIn fourth" name="mem_addr1" value="" >
       <input type="button" onclick="sample6_execDaumPostcode()" class="postcode btn btn-primary" value="주소찾기" ><br>
       <input type="text" id="sample6_address" class ="fadeIn fourth" name="m_ADDR2" value="" ><br>
       <input type="text" id="sample6_address2" class ="fadeIn fourth" name="m_ADDR3" value=""><br>
        <input type="text" id="sample6_address2" class ="fadeIn fourth" name="enabled" value=""><br><br>
       <br>
       </form> 
                 </div> 
                <div class="modal-footer">
                <button type="button"  onclick = "location.href='./MemberDeleteAction.aq'" class="btn btn-primary">정보수정</button>
          		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            	 </div>       
                </div> 
        	</div> 
		</div>
</body>
</html>