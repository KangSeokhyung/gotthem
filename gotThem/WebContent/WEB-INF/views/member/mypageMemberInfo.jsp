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
table.type07 thead {
    border-right: 1px solid #ccc;
    border-left: 1px solid #ccc;
    background: #fa2848;
}
table.type07 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
}
table.type07 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: center;
    border-bottom: 1px solid #ccc;
    background: #999;
    color: #fff;
}
table.type07 tbody{
border-top:1px solid #ccc;
border-right:1px solid #ccc;
}
table.type07 td {
    width: 80%;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table{
font-size:16px;
color:#111;
}
th{
font-size:16px;
}
table.type07 thead th {
font-size:22px;
text-align:center;
}
.textBreak{
word-break:keep-all;
}
</style>
</head>
<body>
 	<div class="service text-center2">
            <h1 class="heading"><Strong style="color:#337ab7; font-size:25px;">${memberInfo.mem_name }</Strong> 님 정보입니다.</h1>
            <br>
            
		<table class="type07">
			<tbody>
				<tr>
					<th scope="row" class="col-sm-12 textBreak">이메일</th>
					<td class="col-sm-12">${memberInfo.mem_email}</td>
				</tr>
				<tr>
					<th scope="row" class="col-sm-12 textBreak">핸드폰 번호</th>
					<td class="col-sm-12">${memberInfo.mem_phone}</td>
				</tr>
				<tr>
					<th scope="row" class="col-sm-12">주소</th>
					<td class="col-sm-12 textBreak">${mem_post}<br>${mem_address1} &nbsp; ${mem_address2}</td>
				</tr>
				<tr>
					<th scope="row" class="col-sm-12 textBreak">가입일</th>
					<td class="col-sm-12">${memberInfo.mem_regdate}</td>
				</tr>
			</tbody>
		</table>
          </div>      
<body>
</body>
</html>