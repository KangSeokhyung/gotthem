<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Got Them?</title>
<style type="text/css">
	@import url(http://weloveiconfonts.com/api/?family=entypo);
	@import url(https://fonts.googleapis.com/css?family=Roboto);

	[class*="entypo-"]:before {
	  font-family: 'entypo', sans-serif;
	}
	
	*, *:before, *:after {
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	  box-sizing: border-box; 
	}
	
	h2 {
	  color:rgba(255,255,255,.8);
	  margin-left:12px;
	}
	
	body {
	  background: #272125;
	  font-family: 'Roboto', sans-serif;
	  
	}
	
	form {
	  position:relative;
	  margin: auto;
	  width: 380px;
	  height: center;
	}
	
	input {
	  padding: 16px;
	  border-radius:7px;
	  border:0px;
	  background: rgba(255,255,255,.2);
	  display: block;
	  margin: 15px;
	  width: 300px;  
	  color:white;
	  font-size:18px;
	  height: 54px;
	}
	
	input:focus {
	  outline-color: rgba(0,0,0,0);
	  background: rgba(255,255,255,.95);
	  color: #e74c3c;
	}
	
	button {
	  float:right;
	  height: 121px;
	  width: 50px;
	  border: 0px;
	  background: #e74c3c;
	  border-radius:7px;
	  padding: 10px;
	  color:white;
	  font-size:22px;
	}
	
	.inputUserIcon {
	  position:absolute;
	  top:68px;
	  right: 80px;
	  color:white;
	}
	
	.inputPassIcon {
	  position:absolute;
	  top:136px;
	  right: 80px;
	  color:white;
	}
	
	input::-webkit-input-placeholder {
	  color: white;
	}
	
	input:focus::-webkit-input-placeholder {
	  color: #e74c3c;
	}
	
	div {
	
		margin: auto;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>
<body>
	<div>
		<form action="adminlogin.ad" method="post">
			<h2>
				<label><span class="entypo-login"></span> Login </label>
			</h2>
			<button class="submit">
				<span class="entypo-lock"></span>
			</button>
			<span class="entypo-user inputUserIcon"></span> 
			<input type="text" class="user" placeholder="Admin ID" autofocus="autofocus"
				 required="required" /> 
			<span class="entypo-key inputPassIcon"></span> 
			<input type="password" class="pass" placeholder="Admin Password" 
				 required="required" pattern="^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$"
				 title="영대소문자 8~20자 사이로 지정해주세요." />
		</form>
	</div>
	
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="<%=request.getContextPath() %>/resources/admin_login/js/index.js"></script>
</body>
</html>