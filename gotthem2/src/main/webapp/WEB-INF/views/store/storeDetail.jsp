<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Landy: Bootstrap 4 landing page template by
	Bootstrapious.com</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="resources/landy/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="resources/landy/vendor/font-awesome/css/font-awesome.min.css">
<!-- Custom Font Icons CSS-->
<link rel="stylesheet" href="resources/landy/css/landy-iconfont.css">
<!-- Google fonts - Open Sans-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
<!-- owl carousel-->
<link rel="stylesheet"
	href="resources/landy/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet"
	href="resources/landy/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="resources/landy/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="resources/landy/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="favicon.png">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<title>Got Them?</title>
<style type="text/css">
	/* #sort { float: left; }
	#sortClear { clear: both; } */
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).on('click', '#upCount', function(){
		var pro_stock = $(this).prev().val() * 1 + 1;
		$(this).prev().val(pro_stock);
		
		var pro_price_fin = 
		pro_price = $(this).parents("td").next("td").text() * 1  + ;
		$(this).parents("td").next("td").text("");
		$(this).parents("td").next("td").text(pro_price);
	});
	
	$(document).on('click', '#downCount', function(){
		var pro_stock = $(this).prev().prev().val() - 1;
		$(this).prev().prev().val(pro_stock);
		var pro_price = $(this).parents("td").next("td").text() * 1
						- $(this).parents("td").next("td").text() * 1;
		alert(pro_price);
		$(this).parents("td").next("td").text("");
		$(this).parents("td").next("td").text(pro_price);
	});
	
	$(function(){
		var idCount = 1;
		var rowAddDel = $("#searchTemplate tr").click(function(){
			
			var tr = $(this);
			var td = tr.children('td');
			
			var pro_name = td.eq(0).text();
			var pro_stock = td.eq(2).text();
			var pro_price = td.eq(3).text();
				
			var exist = "no";
			
			$("#mySelectField tr").each(function() {
				var myPro_name = $(this).find("#myPro_name").html();
				if (pro_name == myPro_name) {
					exist = "yes";
					return false;
				} 
			});
			
			if (exist == "yes") {
				alert("이미 존재하는 옵션입니다.");
			} else {
				/* $("#upCount"+idCount).unbind("click");
				$("#upCount"+idCount).bind("click", function(){
					alert("테스트");
					var pro_stock = $(this).prev().val();
					$(this).prev().val(pro_stock * 1 + 1);
				}); */
				
				$("#mySelectField").append(
					"<tr><input type='hidden' name='pro_name' value='" + pro_name + "'>" +
					"<input type='hidden' name='pro_price' value='" + pro_price + "'>" +
					"<td id='myPro_name'>" + pro_name + "</td><td><input type='text' id='pro_stock' value='1'>" +
					"<input type='button' id='upCount' value='증가'> <input type='button' id='downCount' value='감소'>" + 
					"</td><td id='myPro_price'>" + pro_price + "</td>" +
					"<td><input type='button' id='deleteRow' value='x' onclick='deleteMySelect()'></td></tr>"
				);
				
				idCount = idCount + 1;
			}
		});
	}); 
	
	function deleteMySelect() {
		var tr = $("#deleteRow").parents("td").parents("tr");
		$(tr).remove();
	}
	
	function productSearch() {
		rowAddDel();
		var productSearch = $("#productSearch").val();
		var mem_no = $("#mem_no").val();
		$.ajax({
			url : "productSearch.gt",
			data : { "productSearch" : productSearch, "mem_no" : mem_no },
			type : "post",
			success : function(searchData) {
				$("#searchTemplate").html("");
				var ob = JSON.parse(searchData);
				$.each(ob, function(index, column){
					$("#searchTemplate").append(
						"<input type='hidden' name='pro_code' id='pro_code' value='"+ column.pro_code +"'>"
					);
					$("#searchTemplate").append(
						"<tr><td>" + column.pro_name +"</td><td>" + column.pro_category + "</td>" +
						"<td>" + column.pro_stock + "</td><td>" + column.pro_price + "</td></tr>"
					);
				});
			},
			error : function(xmlHttpReq, status, error) {
				alert(xmlHttpReq + "리퀘스트\n" + status + "상태\n" + error + "에러\n");
			}
		});
	}
</script>
</head>
<body>
	<!-- Header -->
	<header>
		<%@include file="../nav.jsp" %>
	</header>
	
	<input type="hidden" id="mem_no" name="mem_no" value="${mem_no}">
	
	<section class="bg-gray">
		<div class="container">
			<div>
				<h1>${storeInfo.sto_name }</h1>
				<hr>
				<h3>소개글</h3> 
				<p>${storeInfo.sto_comment }</p>
				<br>
				<h3>이미지 테스트</h3>
				<p>${storeInfo.sto_img }</p>
			</div>
		</div>
	</section>

	<section>
		<h1>제품 리스트 출력</h1>
		<h5> * 줄 단위로 클릭 시 나의 상품리스트로 들어가게 됩니다.</h5>
		<div class="row">
			<div class="col-sm-5">
				<input type="text" id="productSearch" class="form-control" placeholder="원하는 상품을 검색해주세요." 
						onkeypress="productSearch()">
			</div>
			<div class="col-sm-1">
				<input type="button" class="btn btn-default" onclick="productSearch()" value="검색">
			</div>
		</div>
		<form>
			<div class="row">
			<div class="col-sm-8">
				<table class="table table-bordered table-hover">
					<colgroup>
						<col width="25%" />
						<col width="25%" />
						<col width="25%" />
						<col width="25%" />
					</colgroup>
					<thead>
						<tr>
							<th class="text-center" scope="col">상품명</th>
							<th class="text-center" scope="col">분류</th>
							<th class="text-center" scope="col">수량</th>
							<th class="text-center" scope="col">금액</th>
						</tr>
					</thead>
					<tbody id="searchTemplate">
						<c:forEach var="list" items="${productInfo }">
							<input type="hidden" name="pro_code" id="pro_code" value="${list.pro_code }">
						<tr>
							<td>${list.pro_name }</td>
							<td>${list.pro_category }</td>
							<td>${list.pro_stock }</td>
							<td>${list.pro_price }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-sm-4">	
				<table class="table custab">
					<colgroup>
						<col width="40%" />
						<col width="15%" />
						<col width="25%" />
						<col width="15%" />
					</colgroup>
				    <thead>
				        <tr>
				            <th>상품명</th>
				            <th>수량</th>
				            <th>금액</th>
				            <th></th>
				        </tr>
				    </thead>
				    <tbody id="mySelectField">
		           	</tbody>
		           	<tfoot>
		           		<tr>
		           			<td colspan="4">
		           				<input type="number" id="">
		           				<input type="hidden" name="totalPay" id="totalPay">
		           				총 금액 : 
		           			</td>
		           		</tr>
		           	</tfoot>
			    </table>
			</div>
			</div>
			<div class="row">
				<input type="button" class="btn btn-success" value="바로구매" onclick="">&nbsp;
				<input type="button" class="btn btn-primary" value="장바구니" onclick="">&nbsp;
				<input type="reset" class="btn btn-default" value="취소">
			</div>
		</form>
	</section>
	
	
	<!-- Javascript files-->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="resources/landy/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/landy/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="resources/landy/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="resources/landy/js/front.js"></script> 
</body>
</html>