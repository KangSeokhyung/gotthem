<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>상품 목록</title>
<link rel="stylesheet"
	href="resources/mainTemplate/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="resources/mainTemplate/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/mainTemplate/sweetalert/dist/sweetalert.css">
<link rel="stylesheet" href="resources/mainTemplate/css/stisla.css">
<style>
section{
background-size : cover;
}
</style>
</head>
<body>
	<header>
		<%@include file="/nav.jsp"%>
	</header>
<div class="container">	
 <h2>상품목록</h2>
 <h1>상품목록</h1>
 <h1>상품목록</h1>
 
  	<form name="form1" id="form1" method="post" action="./update.gt">
           <table class="table">
               <tr>
                   <th>상품코드</th>
                   <th>상품명</th>
                   <th>상품가격</th>
               </tr>
             <c:forEach var="row" items="${map.list}" varStatus="i">
               <tr>
                 <td>${row.pro_code}</td>
                 <td><a href="detail/${row.pro_code}.gt">${row.pro_name}</a></td>
                 <td><fmt:formatNumber value="${row.pro_price}" pattern="###,###,###"/></td>
                </tr>
               </c:forEach>
            </table>
          <%--   <input type="hidden" name="count" value="${map.count}"> --%>
        </form>
<!--     <button type="button" value="상품목록2" id="btnList">상품목록</button> -->
</div>
	<footer>
		<div class="container">
			<figure>
				<img src="resources/mainTemplate/img/logo.png" alt="Logo">
			</figure>
			<p>Copyright &copy; 2018 스탑없으</p>
			<p>
				Made with <i class="ion-heart"></i> By Kodinger
			</p>
		</div>
	</footer>
</body>
	<script src="resources/mainTemplate/js/jquery.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/mainTemplate/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/mainTemplate/js/jquery.easeScroll.js"></script>
	<script src="resources/mainTemplate/sweetalert/dist/sweetalert.min.js"></script>
	<script src="resources/mainTemplate/js/stisla.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    // 리스트 페이지로 이동
    $("#btnList").click(function(){
        location.href="./productlist.gt";     
    });
    /* $("#btnOrd").click(function(){
        location.href="ord.gt?bas_no="+bas_no;
    }); */
});
</script>
</html>