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
    <style>
    header{
    padding-bottom:80px;
    }
    div .navbar{
    border: 1px;
    }
    a.colorBl {
    color: #666;
    font-size:20px;
}
.btn-colorRed {
	border-radius: 4px;
    border: 2px solid #fa2848;
    background:#fa2848;
    color: #fff;
}

.hoverColor:active, .hoverColor:hover, .hoverColor:focus, .hoverColor:after  {
 	text-decoration:underline;
 	width: 50px;
  	border-bottom: red;
  	padding:10px;
}
    .probootstrap-header {
    padding-top: 10px !important;
    padding-bottom: 10px !important;
    width: 100%;
    background: #fff;
    z-index: 12;
    position: absolute;
    top: 0;
    -webkit-box-shadow: 0 6px 68px -6px rgba(0,0,0,.2);
    box-shadow: 0 6px 68px -6px rgba(0,0,0,.2);
}
.barunPenLogo{
	font-family:'나눔스퀘어라운드' !important;
	font-weight:400;
	font-size:40px;
	color:#fa2848;
}
.probootstrap-logo {
    font-size: 40px !important;
    float: left;
    color: #fa2848;
    padding-left: 20px;
    display: block;
    text-transform: uppercase;
    font-weight: 400 !important;
}
.alert-info {
    color: #333 !important;
    background-color: #fdd !important;
    border-color: #fdd !important; 
}
.probootstrap-main-nav {
    padding: 20px 0 !important;
}
#navbar{
padding:0px !important;
}
.probootstrap-main-nav li a {
    text-transform: none !important;
    font-size: 15px !important;
}
    </style>
  </head>
<body>

<!-- START: header -->
   <header>
		<%@include file="../../../nav.jsp"%>
	</header>
<!-- END: header -->
  <section class="probootstrap-slider flexslider2 page-inner">
    <div class="overlay"></div>
    <div class="probootstrap-wrap-banner">
      <div class="container">
        <div class="row">
          <div class="col-md-8">

            <div class="page-title probootstrap-animate">
              <div class="probootstrap-breadcrumbs">
                <a href="#">Home</a><span>Mypage</span>
              </div>
              <h1>회원정보</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
    <ul class="slides">
      <li style="background-image: url(resources/mainTemplate/img/slider_1.jpg);"></li>
      <li style="background-image: url(resources/image/진열대2.jpg);"></li>
      <li style="background-image: url(resources/image/도시락3.jpg);"></li>
    </ul>
  </section>
  <!-- END: slider  -->
	 <section class="probootstrap-section">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
			<h1><strong>&nbsp;&nbsp;&nbsp;마이페이지</strong></h1>
			<div class="navbar">
          <ul class="with-icon colored">
             <li><i class="xi-user"></i><span>
            <a href="#tab-1" data-toggle="tab" class="hoverColor colorBl">회원정보 확인</a>
            </span></li>
             <li><i class="xi-pen"></i><span>
            <a href="#tab-2" data-toggle="tab" class="hoverColor colorBl">회원정보 수정</a>
            </span></li>
            <li><i class="xi-key"></i><span>
            <a href="#tab-3" data-toggle="tab" class="hoverColor colorBl">비밀번호 변경</a>
            </span></li>
            <li><i class="xi-airplay"></i><span>
            <a href="#tab-4" data-toggle="tab" class="hoverColor colorBl">회원 탈퇴</a>
            </span></li>
             <li><i class="xi-cart"></i><span>
            <a href="listBasket.gt" class="hoverColor colorBl" >장바구니</a>
            </span></li>
             <li><i class="xi-truck"></i><span>
            <a href="orderList.gt" class="hoverColor colorBl">결제 정보</a>
            </span></li>
           	
          </ul>
          </div>
        </div>
        <div class="col-sm-8">
       <div class="tab-content">
	<div class="tab-pane active" id="tab-1"></div>
				<div class="tab-pane fade" id="tab-2"></div>
				<div class="tab-pane fade" id="tab-3">
				</div>
				<div class="tab-pane fade" id="tab-4">
				</div>
				<!-- <div class="tab-pane fade" id="tab-5">	
				</div>
				<div class="tab-pane fade" id="tab-6">	
				</div> -->


			</div>
        </div>
      </div>
    </div>
  </section>
<!-- START: footer -->
<%@include file="../../../footer.jsp" %>
<!-- END: footer -->
  
</body>
    <!-- Javascript files-->
      <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
     <script src="resources/mainTemplate/js/scripts.min.js"></script>
  	<script src="resources/mainTemplate/js/main.min.js"></script>
  	<script src="resources/mainTemplate/js/custom.js"></script>
   	<script>
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
		$.get("mypageMemberInfo.gt", function(data) {
			$('#tab-1').html(data);
		});
		$.get("mypageMemberModi.gt", function(data) {
			$('#tab-2').html(data);
		});
		$.get("passChange.gt", function(data) {
			$('#tab-3').html(data);
		});
		$.get("mypageMemberDel.gt", function(data) {
			$('#tab-4').html(data);
		});
	</script>
</html>