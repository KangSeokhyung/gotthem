<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>편의점 재고 검색 - Got Them</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/Login_v7/css/main.css">
<link href="resources/mainTemplate/bootstrap3/css/bootstrap.css" rel="stylesheet" />
<link href="resources/mainTemplate/assets/css/ct-paper.css" rel="stylesheet"/>
<link href="resources/mainTemplate/assets/css/demo.css" rel="stylesheet" />
<link href="resources/mainTemplate/assets/css/examples.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
</head>
<body>
	<header class="header">
		<%@include file="../../../nav.jsp" %>
	</header>
	  <div class="wrapper">
        <div class="register-background"> 
            <div class="filter-black"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1 ">
                            <div class="register-card">
                                <h3 class="title">GOT THEM?</h3>
                                <form class="register-form" action="<c:url value='/login.gt' />" method="post">
                                    <label>아이디</label>
                                    <input type="text" name="mem_id" class="form-control" placeholder="아이디">

                                    <label>비밀번호</label>
                                    <input type="password" name="mem_pw" class="form-control" placeholder="비밀번호">
                                    <button type="submit" class="btn btn-danger btn-block">로그인</button>
                                    
                                    <c:set var="errMsg" value="${errMsg}"/>
										<c:if test="${errMsg ne null}">
										<div>
											<span class="text-center txt1" style="color:red; ">${errMsg}</span>
										</div>
										</c:if>
                                </form>
                                <div class="forgot">
                                    <a href="findIDAndPW.gt" class="btn btn-simple btn-danger">ID나 PASSWORD를 분실하셨나요?</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>     
            <div class="footer register-footer text-center">
                    <h6>&copy; 2015, made with <i class="fa fa-heart heart"></i> by Creative Tim</h6>
            </div>
        </div>
    </div>      
</body>
</html>