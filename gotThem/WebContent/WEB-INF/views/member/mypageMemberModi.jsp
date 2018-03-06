<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="resources/tableimage/png" href="resources/table/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<title>Fresh Bootstrap Table by Creative Tim</title>

	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    
    <link href="resources/table/css/bootstrap.css" rel="stylesheet" />
    <link href="resources/table/css/fresh-bootstrap-table.css" rel="stylesheet" />
     
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        
</head>

<body>
	<div class="service">
         <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          여기에서 회원정보 수정이 가능합니다..
        </div>
          <form action="passCheck.gt" method="post"class="probootstrap-form mb60">
            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="lname">아이디</label>
                  <input type="text" class="form-control" id="lname" value="${memberInfo.mem_id }" disabled="disabled">
                </div>
              </div>
              </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="lname">이름</label>
                  <input type="text" class="form-control" id="lname" value="${memberInfo.mem_name }">
                </div>
              </div>
            </div>
           <div class="row">
            <div class="col-md-6">
            <div class="form-group">
              <label for="email">이메일</label>
              <input type="email" class="form-control" id="email" name="new_pw2" value="${memberInfo.mem_email}">
            </div>
            </div>
            </div>
            <div class="row">
            <div class="col-md-6">
            <div class="form-group">
              <label for="email">핸드폰번호</label>
              <input type="text" class="form-control" id="email" name="new_pw2" value="${memberInfo.mem_phone}">
            </div>
            </div>
            </div>
             <div class="row">
            <div class="col-md-6">
            <div class="form-group">
              <label for="email">우편번호</label>
              <input type="text" class="form-control" id="email" name="new_pw2" value="${mem_post}">
            </div>
            </div>
            </div>
           <div class="row">
            <div class="col-md-9">
            <div class="form-group">
              <label for="email">상세주소1</label>
              <input type="text" class="form-control" id="email" name="new_pw2" value="${mem_address1}">
            </div>
            </div>
            </div>
            <div class="row">
            <div class="col-md-9">
            <div class="form-group">
              <label for="email">상세주소2</label>
              <input type="text" class="form-control" id="email" name="new_pw2" value="${mem_address2}">
            </div>
            </div>
            </div>                   
            <div class="form-group">
              <input type="submit" class="btn btn-primary" id="submit" name="submit" value="변경">
              <input type="reset" class="btn btn-primary" id="submit" value="취소">
            </div>              
          </form>
        </div> 
</body>
</html>