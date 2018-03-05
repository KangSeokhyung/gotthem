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
	#releatedField { position: absolute; width: 100%;}
	#releatedField a { color: #66615b; }
	#mainContent { height: 350px; }
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
    <div class="wrapper">
        <div id="mainContent" class="section section-light-blue">
            <div class="container">
                <div class="motto">
                    <h1>지도 API 자리</h1>
                </div>
            </div>
        </div>
        <div class="main">
			<div class="section">
				<div class="container tim-container">
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
				
				<div class="container tim-container">
					<span><strong>${search }</strong> 검색결과</span>
					<br><br>
					<div class="section-body">
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
			</div>
		</div>
	</div>

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

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/mainTemplate/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
<!--  Plugins -->
<script src="resources/mainTemplate/assets/js/ct-paper-checkbox.js"></script>
<script src="resources/mainTemplate/assets/js/ct-paper-radio.js"></script>
<script src="resources/mainTemplate/assets/js/bootstrap-select.js"></script>
<script src="resources/mainTemplate/assets/js/bootstrap-datepicker.js"></script>
<script src="resources/mainTemplate/assets/js/ct-paper.js"></script>

</html>
