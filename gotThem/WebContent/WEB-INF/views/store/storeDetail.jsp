<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />
<title>편의점 재고 검색 - Got Them</title>
<link href="resources/mainTemplate/bootstrap3/css/bootstrap.css" rel="stylesheet" />
<link href="resources/mainTemplate/assets/css/ct-paper.css" rel="stylesheet"/>
<link href="resources/mainTemplate/assets/css/demo.css" rel="stylesheet" />
<link href="resources/mainTemplate/assets/css/examples.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
section{
background-size : cover;
}
#contentbody {
width: 90%;
margin: auto;
}
</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/mainTemplate/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).on('click', '#upCount', function(){
		var pro_stock = $(this).prev().val() * 1 + 1;
		$(this).prev().val(pro_stock);
		
		var pro_price = $(this).parents("td").next("td").text();
		var pro_price_fin = $(this).parents().siblings("#pro_stock_fin").val();
		
		$(this).parents("td").next("td").text("");
		$(this).parents("td").next("td").text(pro_price * 1 + pro_price_fin * 1);
		$("#pro_price").val(pro_price);
		
		var totalPay = $("#totalPay").val();
		$("#totalPay").val(totalPay*1 + pro_price_fin*1);
	});
	
	$(document).on('click', '#downCount', function(){
		var pro_stock = $(this).prev().prev().val() - 1;
		$(this).prev().prev().val(pro_stock);
		
		var pro_price = $(this).parents("td").next("td").text();
		var pro_price_fin = $(this).parents().siblings("#pro_stock_fin").val();
		
		$(this).parents("td").next("td").text("");
		$(this).parents("td").next("td").text(pro_price * 1 - pro_price_fin * 1);
		$("#pro_price").val(pro_price);
		
		var totalPay = $("#totalPay").val();
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
				/*---------------------------------------------------
				*	document on과는 다르게 가능한 소스
				*	$("#upCount"+idCount).unbind("click");
				*	$("#upCount"+idCount).bind("click", function(){
				*		alert("테스트");
				*		var pro_stock = $(this).prev().val();
				*		$(this).prev().val(pro_stock * 1 + 1);
				*	}); 
				-----------------------------------------------------*/
				
				$("#mySelectField").append(
					"<tr><input type='hidden' name='pro_name' value='" + pro_name + "'>" +
					"<input type='hidden' id='pro_price' name='pro_price' value='" + pro_price + "'>" +
					"<input type='hidden' id='pro_stock_fin' value='" + pro_price + "'>" +
					"<td id='myPro_name'>" + pro_name + "</td><td><input type='text' id='pro_stock' value='1'>" +
					"<input type='button' id='upCount' value='증가'> <input type='button' id='downCount' value='감소'>" + 
					"</td><td id='myPro_price' class='myPro_price'>" + pro_price + "</td>" +
					"<td><input type='button' id='deleteRow' value='x'></td></tr>"
				);
				
				var totalPay = $("#totalPay").val();
				$("#totalPay").val(totalPay*1 + pro_price*1);
			}
		});
	}); 
	
	$(document).on('click', '#deleteRow', function(){
		var tr = $(this).parents();
		
		var pro_price = $(this).parents().siblings("#myPro_price").text();
		alert(pro_price);
		
		var totalPay = $("#totalPay").val();
		$("#totalPay").val(totalPay*1 - pro_price*1);
		
	});
	
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
	<header>
	<%@include file="../../../nav.jsp" %>
	</header>
   
     <!-- 값 보낼때 사용할 Mem_no -->
     <input type="hidden" id="mem_no" name="mem_no" value="${mem_no}">

	<div class="wrapper">
		<div class="section section-light-blue">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<h1>${storeInfo.sto_name }</h1>
						<hr>
						<h2>
							<b>소개글</b>
						</h2>
						<p>소개글 값 테스트 : ${storeInfo.sto_comment }</p>
						<br>
						<h2>
							<b>아래쪽에 이미지가 출력된다.</b>
						</h2>
						<p>이미지 값 테스트 : ${storeInfo.sto_img }</p>
					</div>
				</div>
			</div>
		</div>
		<div class="main">
			<div class="section section-gray text-center landing-section">
				<div class="nav-tabs-navigation">
	                <div class="nav-tabs-wrapper">
		                <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
		                    <li class="active"><a href="#lunchbox" data-toggle="tab">도시락</a></li>
		                    <li><a href="#kimbob" data-toggle="tab">김밥</a></li>
		                    <li><a href="#sandwich" data-toggle="tab">샌드위치</a></li>
		                    <li><a href="#etc" data-toggle="tab">기타</a></li>
		                </ul>
	                </div>
                </div>
                <div class="tab-content text-center">
	                <div class="tab-pane active" id="lunchbox"></div>
	                <div class="tab-pane" id="kimbob"></div>
	                <div class="tab-pane" id="sandwich"></div>
              		<div class="tab-pane" id="etc"></div>
                </div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$.get("productList.gt", { "category" : "도시락", "mem_no" : "${mem_no}" }, function(data) {
		$('#lunchbox').html(data);
	});
	
	$.get("productList.gt", { "category" : "김밥", "mem_no" : "${mem_no}" }, function(data) {
		$('#kimbob').html(data);
	});
	
	$.get("productList.gt", { "category" : "샌드위치", "mem_no" : "${mem_no}" }, function(data) {
		$('#sandwich').html(data);
	});
	
	$.get("productList.gt", { "category" : "기타", "mem_no" : "${mem_no}" }, function(data) {
		$('#etc').html(data);
	});
	</script>
	
	<%-- Myselect 장바구니 구현 부분
	<div id="contentbody" class="section-body">
			<h1>제품 리스트 출력</h1>
			<h5> * 줄 단위로 클릭 시 나의 상품리스트로 들어가게 됩니다.</h5>
			<hr>
			<div class="row">
				<div class="col-sm-5">
					<input type="text" id="productSearch" class="form-control" placeholder="원하는 상품을 검색해주세요." 
							onkeypress="productSearch()">
				</div>
				<div class="col-sm-1">
					<input type="button" class="btn btn-default" onclick="productSearch()" value="검색">
				</div>
			</div>
				<div class="col-sm-4">	
					<table class="table custab">
					<caption></caption>
						<colgroup>
							<col width="30%" />
							<col width="25%" />
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
			           				<input type="hidden" name="totalPay"  value="0">
			           				총 금액 : <input type="text" id="totalPay" class="totalPay" value="0" readonly="readonly">
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
				</div> --%>
	
	<footer class="footer-demo section-dark">
        <div class="container">
            <nav class="pull-left">
                <ul>
                    <li>
                        <a href="http://www.creative-tim.com">
                            Creative Tim
                        </a>
                    </li>
                    <li>
                        <a href="http://blog.creative-tim.com">
                           Blog
                        </a>
                    </li>
                    <li>
                        <a href="http://www.creative-tim.com/product/rubik">
                            Licenses
                        </a>
                    </li>
                </ul>
            </nav>
            <div class="copyright pull-right">
                &copy; 2015, made with <i class="fa fa-heart heart"></i> by Creative Tim
            </div>
        </div>
    </footer>
</body>

<!--  Plugins -->
<script src="resources/mainTemplate/assets/js/ct-paper-checkbox.js"></script>
<script src="resources/mainTemplate/assets/js/ct-paper-radio.js"></script>
<script src="resources/mainTemplate/assets/js/bootstrap-select.js"></script>
<script src="resources/mainTemplate/assets/js/bootstrap-datepicker.js"></script>
<script src="resources/mainTemplate/assets/js/ct-paper.js"></script>

</html>
