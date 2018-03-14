<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 비밀번호 확인</title>
</head>
<body>
 <section class="probootstrap-section">
         <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          여기에서 비밀번호 변경이 가능합니다.
        </div>
    <div class="container">
      <div class="row">
        <div class="col-md-8">
          <form action="passChange.gt" method="post" class="probootstrap-form mb60">
            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="mem_pw">현재 비밀번호</label>
                  <input type="password" class="form-control" id="mem_pw" name="mem_pw">
                </div>
              </div>
              </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="new_pw">새로운 비밀번호</label>
                  <input type="password" class="form-control" id="new_pw" name="new_pw">
                </div>
              </div>
            </div>
           <div class="row">
            <div class="col-md-6">
            <div class="form-group">
              <label for="new_pw2">새로운 비밀번호 확인</label>
              <input type="password" class="form-control" id="new_pw2" name="new_pw2">
            </div>
            </div>
            </div>            
            <div class="form-group">
              <input type="submit" class="btn btn-primary" id="submit" name="submit" value="비밀번호변경">
              <input type="reset" class="btn btn-primary" id="cancel" value="취소하기">
            </div>              
          </form>
        </div> 
	</div>
	</div>
  </section> 
</body>

<script>

	function backIndex(){

		location.href="index.gt";

	}

</script>

</html>