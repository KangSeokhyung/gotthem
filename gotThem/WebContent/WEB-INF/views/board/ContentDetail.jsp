<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="resources/mainTemplate/css/styles-merged.css">
<link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
<link rel="stylesheet" href="resources/mainTemplate/css/custom.css">
<script src="resources/mainTemplate/js/scripts.min.js"></script>
<script src="resources/mainTemplate/js/main.min.js"></script>
<script src="resources/mainTemplate/js/custom.js"></script>
</head>
<body>
	<!-- START: header -->
	<%@include file="../../../nav.jsp"%>
	<!-- END: header -->
<body>

	<c:set var="sessionCheck"
		value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.authorities}" />
	<c:choose>
		<c:when test="${sessionCheck eq '[ROLE_ADMIN]'}">
		
			<div class="container">
				<div class="wrapper" style="margin-top: 120px;">
					<br> 
					<span class="fontSize">제목</span> <input
						class="form-control" name="not_title" value="${content.not_title}" />
					<span class="fontSize">작성일</span> <input
						class="form-control" name="not_date" readOnly value="${content.not_date}" /><br>
					<span class="fontSize">내용</span>
					<form name="updateform" id="updateform" action="contentUpdate.gt" method="POST">
					<textarea class="form-control" name="not_content" style="height: 350px;">${content.not_content}</textarea>
					<br> 
					<input type="hidden" name="not_no" value="${content.not_no}">
					<input type="hidden" name="not_title" value="${content.not_title}">
					<div class="col-md-4" style="padding: 5px;">
						<button class="btn btn-primary col-md-12" style="font-size: 20px;"
							onclick="contentUpdate(${content.not_no})">수정</button>
					</div></form>
					<div class="col-md-4" style="padding: 5px;">
						<button class="btn btn-primary col-md-12" style="font-size: 20px;"
							onclick="back2()">뒤로가기</button>
					</div>
					
					<div class="col-md-4" style="padding: 5px;">
						<button class="btn btn-primary col-md-12" style="font-size: 20px;"
							onclick="contentDelete(${content.not_no})">삭제</button>
					</div>
					
				</div>
			</div>
		
		</c:when>
		<c:otherwise>
			<div class="container">
				<div class="wrapper">
					<h2 class="form-signin-heading" style="margin-top: 120px;">${content.not_title}</h2>
					<hr class="colorgraph">
					<br> <span class="fontSize">작성일</span> <input
						class="form-control" readOnly value="${content.not_date}" /><br>
					<span class="fontSize">내용</span>
					<textarea class="form-control" readOnly style="height: 350px;">${content.not_content}</textarea>
					<br> <input type="hidden" name="not_writer" value="관리자" />
					<button class="btn btn-primary btn-block col-md-6"
						style="font-size: 20px;" onclick="history.back();">뒤로가기</button>
				</div>
			</div>

		</c:otherwise>
	</c:choose>
	<script>
	function contentDelete(not_no){
		if(confirm('이 게시물을 삭제하시겠습니까?')==true){
			location.href="contentDelete.gt?not_no="+ not_no;
		}else{
			history.go(0);	
		}
		
	}
	function contentUpdate(not_no){
		if(confirm('이대로 수정하시겠습니까?')==true){
			document.getElementById('updateform').submit();
		}else{
			history.go(0);	
		}
	}
	function back2(){
		location.href="notice.gt";
	}
	</script>
</body>
</html>