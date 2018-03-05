<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/mainTemplate/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="resources/mainTemplate/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/mainTemplate/sweetalert/dist/sweetalert.css">
<link rel="stylesheet" href="resources/mainTemplate/css/stisla.css">
<style>
.middle {
    overflow: hidden;
    width: 900px;
    margin: 0 auto;
    background: transparent url(https://ssl.nx.com/S2/membership/2011/manage/bg_middle.gif) repeat-y 189px top;
}
.sideSec {
    float: left;
    width: 189px;
}

.sideSec .sideNav1 {
    background: url(https://ssl.nx.com/S2/membership/2011/manage/navsub_manage1.gif) no-repeat left -62px;
}

.sideSec .sideNav1 {
    margin-top: 15px;
}

html, body, div, span, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, acronym, address, big, cite, code, img, ins, kbd, q, s, samp, small, strike, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
    margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
    font-size: 100%;
    vertical-align: baseline;
    background: transparent;
}
div {
    display: block;
}
a {
    color: #666666;
    text-decoration: none;
}
a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}
</style>
</head>
<body>
	<header>
		<%@include file="../../../nav.jsp"%>
	</header> 
	<div class="middle">
		<div class="sideSec">
			<h2>
				<span>내정보관리</span>
			</h2>
			<ul class="sideNav1">
				<li class="sub1"><a href="" title="개인정보변경"><span>회원정보확인</span></a></li>
				<li class="sub2"><a href="" title="회원정보수정"><span>회원정보수정</span></a></li>
				<li class="sub3"><a href="" title="비밀번호 변경"><span>비밀번호 변경</span></a></li>
				<li class="sub4"><a href="" title="회원 탈퇴"><span>회원 탈퇴</span></a></li>
			</ul>
			<ul class="sideNav2">
				<li><strong>구매 정보</strong></li>
				<li class="sub1"><a href="" title="찾아갈 상품"><span>찾아갈 상품</span></a></li>
				<li class="sub2"><a href="" title="구매한 상품"><span>구매한 상품</span></a></li>
				<li class="sub3"><a href="" title="장바구니"><span>장바구니</span></a></li>
			</ul>
		</div>
		<div class="mainSec">
			
		</div>
	</div>
	
	
</body>
</html>