<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body{
	background: #44B3C2;
}
.login-main{
	margin-top: 150px;
    z-index: 1;
}
.heading-image{
	top: 0%;
    left: 50%;
    opacity: 0.9;
    height: 120px;
    width: 120px;
    border-radius: 100%;
    background: #2B5377;
    position: absolute;
    transform: translate(-50%, -50%);
}
.heading-image i{
	font-size: 60px;
	margin-top: 30px;
}
.input-group-prepend span{
	font-size: 20px;
	color: #9B9FAB;
}
.options{
	font-size: 15px;
}
.copyright-main{
	font-size: 13px;
}

/*Bubble Boxes Animation CSS*/

.bubble-boxes{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 40%;
}
.bubble-boxes li{
    position: absolute;
    list-style: none;
    display: flex;
    width: 20px;
    height: 20px;
    background: rgba(255,255,255,.2);
    animation: animate 25s linear infinite;
    bottom: -800px;
}
.bubble-boxes li:nth-child(1){
    left: 25%;
    width: 80px;
    height: 80px;
    animation-delay: 0;
}
.bubble-boxes li:nth-child(2){
    left: 10%;
    width: 20px;
    height: 20px;
    animation-delay: 2s;
    animation-duration: 12s;
}
.bubble-boxes li:nth-child(3){
    left: 70%;
    width: 20px;
    height: 20px;
    animation-delay: 4s;
}
.bubble-boxes li:nth-child(4){
    left: 40%;
    width: 60px;
    height: 60px;
    animation-delay: 0s;
    animation-duration: 18s;
}
.bubble-boxes li:nth-child(5){
    left: 65%;
    width: 20px;
    height: 20px;
    animation-delay: 0s;
}
.bubble-boxes li:nth-child(6){
    left: 75%;
    width: 110px;
    height: 110px;
    animation-delay: 3s;
}
.bubble-boxes li:nth-child(7){
    left: 35%;
    width: 150px;
    height: 150px;
    animation-delay: 7s;
}
.bubble-boxes li:nth-child(8){
    left: 50%;
    width: 25px;
    height: 25px;
    animation-delay: 15s;
    animation-duration: 45s;
}
.bubble-boxes li:nth-child(9){
    left: 20%;
    width: 15px;
    height: 15px;
    animation-delay: 2s;
    animation-duration: 35s;
}
.bubble-boxes li:nth-child(10){
    left: 85%;
    width: 150px;
    height: 150px;
    animation-delay: 0s;
    animation-duration: 12s;
}
@keyframes animate{
    0%{
        transform: translateY(0) rotate(0deg);
        opacity: 1;
        border-radius: 0;
    }
    100%{
        transform: translateY(-1000px) rotate(720deg);
        opacity: 1;
        border-radius: 50%;
    }
}
.barunPenLogo{
	font-family:'나눔바른펜';
	font-size:40px;
	color:#fff;
}
.mt-5, .my-5 {
    margin-top: 1em !important;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 col-10 offset-1 login-main border rounded pb-4 pt-5">
				<form method="post">
					<div class="row">
						<div class="col-md-4 col-12 heading-image text-white text-center">
					      	<i class="fa fa-users" aria-hidden="true"></i>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-12 mt-5" style="text-align:center;">
						<span class="barunPenLogo">Got Them</span><br><br>
					      	<div class="input-group">
					        	<div class="input-group-prepend">
					          		<span class="input-group-text bg-white border-0 p-3"><i class="fa fa-user"></i></span>
					        	</div>
					        	<input type="text" class="form-control border-0 pl-3" placeholder="아이디" aria-describedby="validationTooltipUsernamePrepend" 
					        	name="admin_id" required>
					      	</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-12 mt-3">
					      	<div class="input-group">
					        	<div class="input-group-prepend">
					          		<span class="input-group-text bg-white border-0 p-3" id="validationTooltipUsernamePrepend"><i class="fa fa-lock" aria-hidden="true"></i></span>
					        	</div>
					        	<input type="password" class="form-control border-0 pl-3 pb-0" id="validationTooltipUsername" placeholder="비밀번호" aria-describedby="validationTooltipUsernamePrepend"
					        	name="admin_pw" required>
					      	</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-12 mt-3" style="text-align:center;">
					      	<button type="submit" class="btn btn-info rounded-0 w-100">로그인</button><br><br>
					      	<span style="color:#fff;">이 페이지는 관리자만 로그인이 가능합니다.</span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-12 mt-3 options">
					      	<div class="row">
					      		<div class="col-md-6 col-12 pl-4">
					      			<div class="custom-control custom-checkbox mr-sm-2">
								        <input type="checkbox" class="custom-control-input" id="customControlAutosizing">
								    </div>
					      		</div>
					      	</div>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-4 offset-md-4 col-12 text-white text-center mt-2 copyright-main">
				<p>Copyright © 2018 스탑없으 Got Them 프로젝트. </p>
			</div>
		</div>
	</div>
	<ul class="bubble-boxes">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</body>
</html>