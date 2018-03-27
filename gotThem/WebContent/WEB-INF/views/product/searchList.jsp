<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>편의점 재고 검색 GOT THEM!</title>
    <meta name="description" content="Free Bootstrap Theme by uicookies.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="resources/mainTemplate/css/styles-merged.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/style.min.css">
    <link rel="stylesheet" href="resources/mainTemplate/css/custom.css">
	<link rel="stylesheet" href="resources/autocomplete/auto-complete.css">

    <!--[if lt IE 9]>
      <script src="resources/mainTemplate/js/vendor/html5shiv.min.js"></script>
      <script src="resources/mainTemplate/js/vendor/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
#marginChg { 
	padding-bottom: 10px; 
	margin-top: 340px; 
	background: none;
	-webkit-box-shadow: none;
	box-shadow: none;
}
#btnColor { background: #fe490f; }
.pad { padding: 0px; }
#map { margin-top: 90px; height: 400px; }
#hide { display: none; }
</style>  
<script src="resources/autocomplete/auto-complete.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function relatedSearch() {
		$("#releatedField").html("");
		var search = $("#search").val();
		if(search != ""){
			$.ajax({
				url : "relatedSearch.gt",
				data : { "search" : search },
				type : "post",
				success : function(relatedData) {
					var ob = JSON.parse(relatedData);
					var innerHtml = "<div class='list-group'>";
					$("#releatedField").html("");
					for (var i = 0; i < 5; i++) {
						if (typeof(ob["search" + i]) != "undefined") {
							innerHtml += "<a href='searchList.gt?search=" +  ob["search" + i] 
									  + "&pageNo=1' class='list-group-item list-group-item-action'>" 
									  +  ob["search" + i] + "</a>";
						}
					}
					innerHtml += "</div>"
					$("#releatedField").append(innerHtml);
				},
				error : function(xmlHttpReq, status, error) {
				}
			});
		}
	}
	
	// Google Map API
	window.onload = function() {
		initmap();
		codeAddress();
	}
	
	var geocoder;
	var map;
	var storeNameList = [];
	var addrList = [];
	var numList = [];
	
	function initmap() {
		geocoder = new google.maps.Geocoder();
		var latlng = new google.maps.LatLng(37.494602, 127.028017);
		var mapOptions = {
			zoom : 15,
			center : latlng
		}
		map = new google.maps.Map(document.getElementById('map'), mapOptions);
	}

	function codeAddress() {
		var storeName = "";
		var addr = "";
		var num = "";
		
		$(".rowCount").each(function() {
			var td = $(this).children();
			storeNameList.push(td.eq(1).text());
			addrList.push(td.eq(2).text());
			numList.push(td.eq(4).text());
		});
		
		for (var i = 0; i < addrList.length; i++) {
			storeName = storeNameList[i];
			addr = addrList[i];
			num = numList[i];
			mapAction(storeName, addr, num);
		}
	}
	
	function mapAction(storeName, addr, num) {
	
		geocoder.geocode({ 'address' : addr }, function(results, status) {
			if (status == 'OK') {
				map.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker(
					{
						map : map,
						position : results[0].geometry.location,
						title : storeName
					});
			} else {
				alert(status + '\n 등록된 주소가 올바르지 않거나 시스템 오류입니다.');
			}
			
			var contentString = "<strong><a href='storeDetail.gt?mem_no=" + num + "'>" + storeName + "</a></strong>";

			var infowindow = new google.maps.InfoWindow({
				content : contentString
			});
			
			infowindow.open(map, marker);
			
			marker.addListener('click', function() {
				infowindow.open(map, marker);
			});
			
			google.maps.event.addListener(map, 'click', function(event) {
				infowindow.close(map, marker);
		    });
		});
	}
	
</script>
</head>
<body>

<div class="probootstrap-loader"></div>
<!-- START: header -->
<header>
<%@include file="../../../nav.jsp" %>
</header>
  <!-- END: header -->

<section id="map" class="probootstrap-section probootstrap-section-lighter">
	<div class="probootstrap-wrap-banner">
	  <div class="container">
	    <div class="row">
	      <div class="col-sm-12">
			<div id="map"></div>
	      </div>
	    </div>
	  </div>
  </div>
</section>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIBJw0ula3rE8CFX12w0CTcwEWIxjYCZA&callback"
    async defer></script>

<section class="probootstrap-section">
  <div class="container">
  	<div class="row">
  	<div class="col-sm-12">
	  <form action="searchList.gt" method="get">
       	<input type="hidden" name="pageNo" value="1">
		<div class="col-xs-9 col-sm-5 pad">
			<input type="text" class="form-control" id="autoComplete" name="search"
				required="required" style="border-radius: 0px;"
				placeholder="예) 도시락, 서초, 강남  김밥" />
		</div>
		<div class="col-xs-3 col-sm-3 pad">
			<input type="submit" id="btnColor" class="btn btn-sm btn-success" value="검색">
		</div>
	  </form>
	</div>
	</div>
	<script type="text/javascript">
	  var ac = new autoComplete({
		    selector: "#autoComplete",
		  	minChars: 0,
		    source: function(term, suggest){
		    	term = term.toLocaleUpperCase();
		    	$.ajax({
					url : "relatedSearch.gt",
					data : { "search" : term },
					type : "post",
					success : function(relatedData) {
						if (term != "") {
							var suggestions = [];	
							var ob = JSON.parse(relatedData);
							for (var i = 0; i < 5; i++) {
								if (typeof(ob["search" + i]) != "undefined") {
									suggestions.push(ob["search" + i]);
								}
							}
							suggest(suggestions);
						}
					},
					error : function(xmlHttpReq, status, error) {
					}
				});
		     }
	  });  
  	</script>
   	<div class="row">
   	<div class="col-sm-12">
   	<h4><strong>${search }</strong> 상품 판매 편의점 : <strong>${totalRows }</strong>건</h4>
   		<table class="table table-bordered table-hover">
		<colgroup>
			<col width="17%" />
			<col width="25%" />
			<col width="45%" />
			<col width="13%" />
		</colgroup>
		<thead>
			<tr>
				<th></th>
				<th class="text-center">매장이름</th>
				<th class="text-center">매장주소</th>
				<th class="text-center">전화번호</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${totalRows eq 0 }" >
				<tr>
					<td colspan="5"><h2 style="color:#7C769E ">검색 결과가 없습니다.</h2></td>
				</tr>
			</c:if>
			<c:forEach var="list" items="${searchList }">
			<tr class="rowCount">
				<td class="text-center"><a href="storeDetail.gt?mem_no=${list.mem_no }">
						<img src="/img/store/${list.sto_img }" 
							class="img-thumbnail img-responsive" height="50px" width="150px"
							title="${list.sto_name } 매장 이미지" alt="${list.sto_name } 매장 이미지">
					</a>
				</td>
				<td class="text-center"><a href="storeDetail.gt?mem_no=${list.mem_no }">${list.sto_name }</a></td>
				<td class="text-center">${list.mem_address }</td>
				<td class="text-center">${list.mem_phone }</td>
				<td id="hide">${list.mem_no }</td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
	<div class="col-sm-12">
		<div id="paging">
			<c:if test="${totalPages ne 0}">
			<ul class="pagination pagination-danger">
				<c:choose>
					<c:when test="${prevPage ne 0}">
						<li class="page-item"><a class="page-link" 
							href="searchList.gt?search=${search }&pageNo=${prevPage }">&laquo;</a></li>
					</c:when>
				</c:choose>
					<c:forEach begin="${beginPage }" end="${endPage }" step="1" varStatus="status">
						<c:choose>
							<c:when test="${nowPage eq status.index }">
								<li class="page-item active"><a class="page-link" 
									href="searchList.gt?search=${search }&pageNo=${status.index }">${status.index }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" 
									href="searchList.gt?search=${search }&pageNo=${status.index }">${status.index }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				<c:choose>
					<c:when test="${nextPage ne 0 }">
						<li class="page-item"><a class="page-link" 
							href="searchList.gt?search=${search }&pageNo=${nextPage }">&raquo;</a></li>
					</c:when>
				</c:choose>
			</ul>
			</c:if>
		</div>
	</div>
   	</div>
   </div>
</section>

  <footer class="probootstrap-footer probootstrap-bg" style="heigth:100px">
    <div class="container">
      <div class="row copyright">
        <div class="col-md-6">
          <div class="probootstrap-footer-widget">
            <p>&copy; 2017 <a href="https://uicookies.com/">uiCookies:Haus</a>. Designed by <a href="https://uicookies.com/">uicookies.com</a> <br> Demo Photos from <a href="https://pixabay.com/">Pixabay</a> &amp; <a href="https://unsplash.com/">Unsplash</a></p>
          </div>
        </div>
        <div class="col-md-6">
          <div class="probootstrap-footer-widget right">
            <ul class="probootstrap-footer-social">
              <li><a href="#"><i class="icon-twitter"></i></a></li>
              <li><a href="#"><i class="icon-facebook"></i></a></li>
              <li><a href="#"><i class="icon-instagram2"></i></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </footer>

  <div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-chevron-thin-up"></i></a>
  </div>
  

  <script src="resources/mainTemplate/js/scripts.min.js"></script>
  <script src="resources/mainTemplate/js/main.min.js"></script>
  <script src="resources/mainTemplate/js/custom.js"></script>

  </body>
</html>
