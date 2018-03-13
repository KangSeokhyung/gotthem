<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <!--[if lt IE 9]>
      <script src="resources/mainTemplate/js/vendor/html5shiv.min.js"></script>
      <script src="resources/mainTemplate/js/vendor/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
#releatedField { position: absolute; width: 96%; }
#releatedField a { color: #66615b; text-decoration: none; }
</style>  
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
					alert(xmlHttpReq + "리퀘스트\n" + status + "상태\n" + error + "에러\n");
				}
			});
		}
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

<section class="probootstrap-section probootstrap-section-lighter">
	<div class="probootstrap-wrap-banner">
	  <div class="container">
	    <div class="row">
	      <div class="col-sm-12">
	      	<h1>지도 API 자리</h1>
	      </div>
	    </div>
	  </div>
  </div>
</section>

<section class="probootstrap-section">
  <div class="container">
  <form action="searchList.gt" method="get">
  	<div class="col-xs-8 col-sm-8">
		<input type="hidden" name="pageNo" value="1">
		<input type="text" class="form-control" name="search" autocomplete="off"
			id="search" onkeyup="relatedSearch()"
			placeholder="예) 김밥, 강남역" />
		<div id="releatedField"></div>
	</div>
	<div class="col-xs-1">
       	<input type="submit" class="btn btn-fill btn-danger" value="검색">
    </div>
    </form>
  </div>
  
  <div class="container">
  <hr>
   	<span><strong>${search }</strong> 검색결과</span>
   	<br><br>
   	<div class="row">
   		<table class="table table-bordered table-hover">
		<colgroup>
			<col width="15%" />
			<col width="25%" />
			<col width="25%" />
			<col width="35%" />
		</colgroup>
		<thead>
			<tr>
				<th></th>
				<th class="text-center">매장이름</th>
				<th class="text-center">상품명</th>
				<th class="text-center">매장주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${searchList }">
			<tr>
				<th class="text-center"><a href="storeDetail.gt?mem_no=${list.mem_no }">
						<img src="<%=request.getContextPath() %>/resources/join/images/img-01.png" 
							class="img-thumbnail img-responsive" height="130px" width="100px"
							title="${list.pro_img} 썸네일 매장 이미지" alt="썸네일 매장 이미지">
					</a>
				</th>
				<td class="text-center"><a href="storeDetail.gt?mem_no=${list.mem_no }">${list.sto_name }</a></td>
				<td class="text-center">${list.pro_name }</td>
				<td class="text-center">${list.mem_address }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
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
</section>

  <footer class="probootstrap-footer probootstrap-bg" style="background-image: url(img/slider_3.jpg)">
    <div class="container">
      <div class="row mb60">
        <div class="col-md-3">
          <div class="probootstrap-footer-widget">
            <h4 class="heading">About Haus.</h4>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
            <p><a href="#">Read more...</a></p>
          </div> 
        </div>
        <div class="col-md-3">
          <div class="probootstrap-footer-widget probootstrap-link-wrap">
            <h4 class="heading">Quick Links</h4>
            <ul class="stack-link">
              <li><a href="#">Property Listing</a></li>
              <li><a href="#">Rent Properties</a></li>
              <li><a href="#">Sell Properties</a></li>
              <li><a href="#">Agents</a></li>
              <li><a href="#">Testimonial</a></li>
            </ul>
          </div>
        </div>
        <div class="col-md-3">
          <div class="probootstrap-footer-widget">
            <h4 class="heading">Popular Cities</h4>
            <ul class="stack-link">
              <li><a href="#">New York <small>(320 properties)</small></a></li>
              <li><a href="#">San Francisco <small>(294 properties)</small></a></li>
              <li><a href="#">Brooklyn <small>(300 properties)</small></a></li>
              <li><a href="#">Chicago <small>(268 properties)</small></a></li>
              <li><a href="#">Los Angeles <small>(342 properties)</small></a></li>
            </ul>
          </div> 
        </div>
        <div class="col-md-3">
          <div class="probootstrap-footer-widget probootstrap-link-wrap">
            <h4 class="heading">Subscribe</h4>
            <p>Far far away behind the word mountains far from.</p>
            <form action="#">
              <div class="form-field">
                <input type="text" class="form-control" placeholder="Enter your email">
                <button class="btn btn-subscribe">Send</button>
              </div>
            </form>
          </div>
        </div>
      </div>
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