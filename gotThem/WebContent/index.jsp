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
#releatedField a {
color: #66615b;
}
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
	<%@include file="nav.jsp" %>
	</header>
    <div class="wrapper">
        <div class="landing-header" style="background-image: url('resources/mainTemplate/assets/paper_img/mainimage.jpg');">
            <div id="maincontent"class="container">
                <div class="motto">
                    <h2 >편의점 즉석식품 재고 검색 GOT THEM</h2>
                    <h3 >여기에서 원하는 상품을 검색해보세요</h3>
                    <br/>
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
            </div>
        </div>
	</div>

