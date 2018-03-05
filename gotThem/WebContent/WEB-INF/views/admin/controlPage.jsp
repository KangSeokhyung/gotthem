<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  %>
<!DOCTYPE html >
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/landy/vendor/bootstrap/css/bootstrap.min.css">
<body>
<article id="work">
	<hr>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-sm-3 col-md-2 hidden-xs-down bg-faded sidebar">
				<ul class="nav nav-pills flex-column">
					<li class="nav-item"><a class="nav-link active" href="#tab-1"
						data-toggle="tab">회원관리<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#tab-2"
						data-toggle="tab">점포관리</a></li>
					<li class="nav-item"><a class="nav-link" href="#tab-1"
						data-toggle="tab">게시판관리</a></li>
				</ul>
			</nav>

			<main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">
			<div class="tab-content">
				<div class="tab-pane fade show active" id="tab-1"></div>
				<div class="tab-pane fade" id="tab-2"></div>
				<div class="tab-pane fade" id="tabC">
					<p>and C</p>
				</div>
				<div class="tab-pane fade" id="tabD">
					<p>...D</p>
				</div>
				<div class="tab-pane fade" id="tabE">
					<p>Okay, last one E</p>
				</div>
			</div>
		</div>

	</div>
	</div>
</article>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="resources/landy/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script>
		$.get("./memcontrol.ad", function(data) {
			$('#tab-1').html(data);
		});
	</script>
	<script>
		$.get("./storecontrol.ad", function(data) {
			$('#tab-2').html(data);
		});
	</script>
</body>
</html>