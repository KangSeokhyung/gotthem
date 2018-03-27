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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     <!--[if lt IE 9]>
      <script src="resources/mainTemplate/js/vendor/html5shiv.min.js"></script>
      <script src="resources/mainTemplate/js/vendor/respond.min.js"></script>
    <![endif]-->
  </head>
<style type="text/css">
#releatedField { position: absolute; width: 63%; }
#releatedField a { color: #66615b; text-decoration: none; }
.overlay{opacity:1;}
.buttonBackgroundColor{
background-color:#fe490f;
}
.buttonBackgroundColor:hover{
background-color:#ff990f;
color:#fff;
}
.probootstrap-section.probootstrap-bg:before {
    position: absolute;
    content: "";
    background: rgba(255, 255, 255, 0.6);
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: -1;
}
.colorCyan{
color:#1fad9f !important;
}
.btn.btn-primary {
    border: 2px solid #1fad9f;
    background: #1fad9f;
    color: #fff;
}
.btn.btn-primary:hover {
	border: 2px solid #1fffff;
    background: #1fffff;
    color: #fff;
}
.probootstrap-footer.probootstrap-bg {
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    padding: 2em 0;
    position: relative;
    color: rgba(255,255,255,.9);
}
.probootstrap-home-search {
    padding: 30px;
    margin-top: 300px;
    color: #fff;
    text-align: center;
    float: left;
    width: 100%;
    border-radius: 0px;
    -webkit-box-shadow: 0 6px 68px -6px rgba(0,0,0,.7);
    box-shadow: 0 6px 68px -6px rgba(0,0,0,.7);
}

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
					var innerHtml = "";
					$("#releatedField").html("");
					for (var i = 0; i < 5; i++) {
						if (typeof(ob["search" + i]) != "undefined") {
							innerHtml += "<div class='list-group'>"
									  + "<a href='searchList.gt?search=" +  ob["search" + i] 
									  + "&pageNo=1' class='list-group-item list-group-item-action'>" 
									  +  ob["search" + i] + "</a>";
				 					  + "</div>"
						}
					}
					
					$("#releatedField").append(innerHtml);
				},
				error : function(xmlHttpReq, status, error) {
				}
			});
		}
	}
   	$().ready(function(){
   		var msg= '${resultMsg}';
   		var str;
   		if(msg!=null){
   			if(msg=='fail1'){
   				str="현재 비밀번호가 맞지 않습니다. 다시 확인해주세요";
   			}else if(msg=='fail2'){
   				str="새로운 비밀번호를 정확히 입력하여 주세요";
   			}else if(msg=='fail3'){
   				str="비밀번호 변경이 실패하였습니다";
   			}else if(msg=='success'){
   				str="비밀번호 변경이 성공하였습니다.";
   			}else if(msg=='DelSuccess'){
   				str="회원탈퇴 성공하였습니다. 이용해 주셔서 감사합니다";
   			}else if(msg=='DelFail'){
   				str="회원탈퇴에 실패했습니다. 비밀번호를 확인해주세요";
   			}
   			if(str!=null)
   				alert(str);
   		}
   	});
</script>
  <body>
<!-- START: header -->
<%@include file="nav.jsp" %>
<!-- END: header -->

  <section class="probootstrap-slider flexslider">
    <div class="probootstrap-wrap-banner">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-md-offset-2">
				<form action="searchList.gt" method="get" class="probootstrap-home-search probootstrap-animate">
					<input type="hidden" name="pageNo" value="1">
					<h2 class="heading" style="padding-bottom: 10px;">드시고 싶은
						즉석식품을 검색하세요</h2>
					<div class="probootstrap-field-group">
						<div class="probootstrap-fields">
							<div class="form-field">
								<input type="text" class="form-control" name="search"
									autocomplete="off" id="search" onkeyup="relatedSearch()"
									required="required" placeholder="예) 김밥, 강남역" />
							</div>
							<div id="releatedField"></div>
						</div>
						<input type="submit" class="btn btn-fill buttonBackgroundColor"
							value="검색">
					</div>
				</form>

          </div>
        </div>
      </div>
    </div>
    <ul class="slides">
      <li style="background-image: url(resources/mainTemplate/img/slider_1.jpg);" class="overlay"></li>
      <li style="background-image: url(resources/image/711.jpg);" class="overlay"></li>
      <li style="background-image: url(resources/image/withme.jpg);" class="overlay"></li>
      <li style="background-image: url(resources/image/gs25.jpg);" class="overlay"></li>
      <li style="background-image: url(resources/image/CU2.jpg);" class="overlay"></li>
     
      
    </ul>
  </section>
  <!-- END: slider  -->
  <section class="probootstrap-section probootstrap-bg" style="background:#fff; background-size:cover;">
    <div class="container text-center probootstrap-animate" data-animate-effect="fadeIn">
      <h2 class="heading colorCyan"><b>저희와 제휴를 원하시나요?</b></h2><br>
      <div style="width: 300px; height: auto; overflow: hidden; margin-left: auto; margin-right: auto; ">
	    <img src="resources/image/캐릭터.png" style="width:150px; height: auto; margin-left: auto; margin-right: auto; display: block;">
	  </div><br>
      <p class="sub-heading colorCyan">많은 점주 분들이 <strong>GOT THEM</strong> 과 제휴 한 이후로 매출이 상승했습니다.<br>
      당신도 이제 <strong>GOT THEM</strong> 과 제휴를 맺고 급격한 매출상승을 이루어보세요! </p>
      <p><a href="storeIndex.st" class="btn btn-primary mb10">제휴페이지</a></p>
    </div>
  </section>

<!-- START: footer -->
<%@include file="footer.jsp" %>
<!-- END: footer -->
  
  <div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-chevron-thin-up"></i></a>
  </div>
  
  <script src="resources/mainTemplate/js/scripts.min.js"></script>
  <script src="resources/mainTemplate/js/main.min.js"></script>
  <script src="resources/mainTemplate/js/custom.js"></script>

  </body>

</html>

