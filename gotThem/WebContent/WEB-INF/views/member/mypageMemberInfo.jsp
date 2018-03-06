<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="resources/tableimage/png" href="resources/table/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<title> </title>

	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
     <link rel="stylesheet" href="resources/memberinfo/css/style.css">
     
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        
</head>
<body>
 	<div class="service text-center">
            <div class="icon"><i class="icon-magnifying-glass"></i></div>
            <h1 class="heading">${memberInfo.mem_id }님의 회원정보</h1>
             <h2 class="heading">아이디</h2>
            <p>${memberInfo.mem_id }</p>
            <h2 class="heading">이름</h2>
            <p>${memberInfo.mem_name }</p>
             <h2 class="heading">이메일</h2>
            <p>${memberInfo.mem_email}</p>
            <h2 class="heading">핸드폰 번호</h2>
            <p>${memberInfo.mem_phone}</p>
             <h2 class="heading">주소</h2>
            <p>${memberInfo.mem_address}</p>
             <h2 class="heading">가입일</h2>
            <p>${memberInfo.mem_regdate}</p>
          </div>      
<body>
</body>
</html>