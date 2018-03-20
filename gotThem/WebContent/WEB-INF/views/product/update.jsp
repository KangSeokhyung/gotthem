<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<title>Startup UI Kit - Free Sample</title>
<head>
<link href="https://fonts.googleapis.com/css?family=Work+Sans"
	rel="stylesheet">
<link rel="stylesheet"
	href="resources/indexTemplate/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/indexTemplate/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="resources/indexTemplate/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/indexTemplate/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/indexTemplate/css/icomoon.css">
<link rel="stylesheet" href="resources/indexTemplate/css/animate.css">
<link rel="stylesheet" href="resources/indexTemplate/css/style.css">
<link rel="stylesheet" href="resources/landy/css/style.default.css"
	id="theme-stylesheet">
<link rel="stylesheet" href="resources/landy/css/custom.css">
<style>
.btn-primary{
border-radius:4px;
margin:1px;
padding: 0.6rem 1rem;
}

label {
margin-bottom:0px;
}

.fileBox .fileName {display:inline-block;width:172px;height:30px;padding-left:10px;margin-right:5px;line-height:30px;border:1px solid #aaa;background-color:#fff;vertical-align:middle}
.fileBox .btn_file {background:#1FAD9F;color:#fff;border-radius:4px;display:inline-block;width:100px;height:30px;font-size:0.8em;line-height:30px;text-align:center;vertical-align:middle;}
.fileBox input[type="file"] {position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0}
.fileBox .btn_file:hover {color:#fff;background-color:#178277;}
</style>
<script type="text/javascript">
	function fnList() {
		location.href = "stock.st?pageNo=" + ${pageNo};
	}
</script>
<script type="text/javascript">
var uploadFile = $('.fileBox .uploadBtn');
	uploadFile.on('change', function(){
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$(this).siblings('.fileName').val(filename);
	});
</script>
</head>
<body>
	<header>
		<%@include file="../store/nav.jsp"%>
	</header>


	<main role="main" class="probootstrap-main js-probootstrap-main">
	<div class="probootstrap-bar">
		<a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span
			class="oi oi-menu"></span></a>
		<div class="probootstrap-main-site-logo">
			<a href="index.html">GOT THEM</a>
		</div>
	</div>

	<div class="cover-container pb-5">
		<div class="cover-inner container">
			<form method="post" action="update.st" enctype="multipart/form-data">

				<div class="row">
					<div class="col-sm-3">
						<img src="/img/${pro.pro_img }"
							style="width: 250px; height: 250px" />
					</div>
					<div class="col-sm-9">
						<input type="hidden" name="pro_code" value="${pro.pro_code }" />
						<input type="hidden" name="pageNo" value="${pageNo }" /> <input
							type="hidden" name="pro_img" value="${pro.pro_img}" />
						<table class="table table-user-information">
							<tr>
								<td><span>제품번호</span></td>
								<td>${pro.pro_code }</td>
							</tr>
							<tr>
								<td><span>제품명</span></td>
								<td><input type="text" name="pro_name"
									value="${pro.pro_name }" required="" maxlength="20"/></td>
							</tr>
							<tr>
								<td><span>분류</span></td>
								<td><select name="pro_category">
										<option value="도시락">도시락</option>
										<option value="김밥">김밥</option>
										<option value="삼각김밥">삼각김밥</option>
										<option value="샌드위치">샌드위치</option>
										<option value="햄버거">햄버거</option>
										<option value="주먹밥">주먹밥</option>
										<option value="과일">과일</option>
										<option value="셀러드">셀러드</option>
								</select>
							</tr>
							<tr>
								<td><span>가격</span></td>
								<td><input type="text" name="pro_price"
									value="${pro.pro_price }" required="" maxlength="10"/></td>
							</tr>
							<tr>
								<td><span>재고</span></td>
								<td><input type="text" name="pro_stock"
									value="${pro.pro_stock }" required="" maxlength="10"/></td>
							</tr>
							<tr>
								<td><span>상품사진</span></td>
								<td><%-- <input type="file" name="file" value="${pro.pro_img }" /> --%>
								<div class="fileBox">
									<input type="text" class="fileName" readonly="readonly">
									<label for="uploadBtn" class="btn_file">찾아보기</label>
									<input type="file" name="file" id="uploadBtn" class="uploadBtn">
								</div>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="submit" class="btn btn-primary"
									value="수정확인" /> <input type="button" value="되돌리기" class="btn btn-primary"
									onclick="reset()" /> <input type="button" value="수정취소" class="btn btn-primary"
									onclick="history.back()" /> <input type="button" value="목록으로" class="btn btn-primary"
									onclick="fnList()" /></td>
							</tr>
						</table>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="resources/indexTemplate/js/jquery-3.2.1.slim.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script> <script
		src="resources/indexTemplate/js/bootstrap.min.js"></script> <script
		src="resources/indexTemplate/js/owl.carousel.min.js"></script> <script
		src="resources/indexTemplate/js/jquery.waypoints.min.js"></script> <script
		src="resources/indexTemplate/js/imagesloaded.pkgd.min.js"></script> <script
		src="resources/indexTemplate/js/main.js"></script> <script
		type="text/javascript">
			
		</script>
</body>
</html>