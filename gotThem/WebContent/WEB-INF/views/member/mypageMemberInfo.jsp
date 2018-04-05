<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <style>
        .text-center2 {
    text-align: left !important;
}
table.type07 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    margin: 0px;
    border-radius: 30px;
}
table.type07 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: center;
    border-bottom: 1px solid #ccc;
    background: #fa2848;
    color: #fff;
}
table.type07 tbody{
border-top:1px solid #ccc;
border-right:1px solid #ccc;
}
table.type07 td {
    width: 80%;
    padding: 15px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table{
font-size:16px;
color:#111;
}
th{
align:center;
font-size:16px;
}
.textBreak{
word-break:keep-all;
}
.text-center{
text-align:center;
}
.leftPd10{
padding-left:10px;
}
</style>
</head>
<body>
 	<div class="service text-center2">
            <h1 class="heading"><Strong style="color:#8e646b; font-size:25px;">${memberInfo.mem_name }</Strong> 님 정보입니다.</h1>
            <br>
            
		<table class="type07">
			<tbody>
				<tr>
					<th scope="row" class="col-sm-12 textBreak text-center">이메일</th>
					<td class="col-sm-12">${memberInfo.mem_email}</td>
				</tr>
				<tr>
					<th scope="row" class="col-sm-12 textBreak text-center">핸드폰 번호</th>
					<td class="col-sm-12">${memberInfo.mem_phone}</td>
				</tr>
				<tr>
					<th scope="row" class="col-sm-12 text-center">주소</th>
					<td class="col-sm-12 textBreak">${mem_address1} &nbsp; ${mem_address2}</td>
				</tr>
				<tr>
					<th scope="row" class="col-sm-12 textBreak text-center">가입일</th>
					<td class="col-sm-12"><fmt:formatDate pattern="yyyy년  MM월 dd일" value="${memberInfo.mem_regdate}"/></td>
				</tr>
			</tbody>
		</table>
          </div>      
<body>
</body>
</html>