<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Landy: Bootstrap 4 landing page template by Bootstrapious.com</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="resources/landy/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="resources/landy/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom Font Icons CSS-->
    <link rel="stylesheet" href="resources/landy/css/landy-iconfont.css">
    <!-- Google fonts - Open Sans-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
    <!-- owl carousel-->
    <link rel="stylesheet" href="resources/landy/vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="resources/landy/vendor/owl.carousel/assets/owl.theme.default.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="resources/landy/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="resources/landy/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<style type="text/css">
	#releatedField { position: absolute; width: 100%;}
	#releatedField a { color: #66615b; }
	#apiSection { background-color: #ECEDED; }
	#mainSection { background-color: #F5F6F6; }
</style>
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
	<header>
	<%@include file="../../../nav.jsp" %>
	</header>
	
	<section id="apiSection">
      <div class="container">
        <div class="row">
        	<h1>지도 API 자리</h1>
        </div>
      </div>
    </section>
    
    <section id="mainSection">
    	<div class="container">
	        <div class="row">
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
	        </div>
	        <hr>
	     </div>
	     
	     <div class="container">
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
    
	<footer class="main-footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6"><a href="#" class="brand">Landy</a>
            <ul class="contact-info list-unstyled">
              <li><a href="mailto:sales@landy.com">Sales@Landy.com</a></li>
              <li><a href="tel:123456789">+00 123 456 789</a></li>
            </ul>
            <ul class="social-icons list-inline">
              <li class="list-inline-item"><a href="#" target="_blank" title="Facebook"><i class="fa fa-facebook"></i></a></li>
              <li class="list-inline-item"><a href="#" target="_blank" title="Twitter"><i class="fa fa-twitter"></i></a></li>
              <li class="list-inline-item"><a href="#" target="_blank" title="Instagram"><i class="fa fa-instagram"></i></a></li>
              <li class="list-inline-item"><a href="#" target="_blank" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
            </ul>
          </div>
          <div class="col-lg-3 col-md-6">
            <h5>Selected Cases</h5>
            <ul class="links list-unstyled">
              <li> <a href="#">Guess Conntect</a></li>
              <li> <a href="#">Postly</a></li>
              <li> <a href="#">Iris Vor Arnim</a></li>
              <li> <a href="#">Yapital</a></li>
            </ul>
          </div>
          <div class="col-lg-3 col-md-6">
            <h5>Selected Cases</h5>
            <ul class="links list-unstyled">
              <li> <a href="#">Guess Conntect</a></li>
              <li> <a href="#">Postly</a></li>
              <li> <a href="#">Iris Vor Arnim</a></li>
              <li> <a href="#">Yapital</a></li>
            </ul>
          </div>
          <div class="col-lg-3 col-md-6">
            <h5>Selected Cases</h5>
            <ul class="links list-unstyled">
              <li> <a href="#">Guess Conntect</a></li>
              <li> <a href="#">Postly</a></li>
              <li> <a href="#">Iris Vor Arnim</a></li>
              <li> <a href="#">Yapital</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="copyrights">
        <div class="container">
          <div class="row">
            <div class="col-md-7">
              <p>&copy; 2018 gotThem.co.kr 스탑없으. All rights reserved.                        </p>
            </div>
            <div class="col-md-5 text-right">
              <p>Template By <a href="https://bootstrapious.com/" class="external">Bootstrapious</a>  </p>
              <!-- Please do not remove the backlink to Bootstrapious unless you support us at http://bootstrapious.com/donate. It is part of the license conditions. Thanks for understanding :) -->
            </div>
          </div>
        </div>
      </div>
    </footer>
    
    <!-- Javascript files-->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"> </script>
    <script src="resources/landy/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="resources/landy/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="resources/landy/vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="resources/landy/js/front.js"></script>
    
  </body>
</html>
