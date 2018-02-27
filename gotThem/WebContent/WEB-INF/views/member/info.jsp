<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="../../../resources/Login_v7/css/util.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/Login_v7/css/main.css">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="../../../resources/landy/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="../../../resources/landy/vendor/font-awesome/css/font-awesome.min.css">
<!-- Custom Font Icons CSS-->
<link rel="stylesheet"
	href="../../../resources/landy/css/landy-iconfont.css">
<!-- Google fonts - Open Sans-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
<!-- owl carousel-->
<link rel="stylesheet"
	href="../../../resources/landy/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet"
	href="../../../resources/landy/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet"
	href="../../../resources/landy/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="../../../resources/landy/css/custom.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/simpleAccordion/styles/style.css">
</head>
<body>
 <header>
<%@include file="../../../nav.jsp" %>
</header>
	<div class="container-login100 ">
		<div class="wrap-login100 p-t-0 p-b-30 col-xs-4"></div>

		<div class="wrap-login100 p-t-0 p-b-30 col-xs-8">
			<form class="login100-form validate-form">

				<div class="text-center p-t-55 p-b-30">
					<span class="txt1"> íì ì ë³´ ìì </span>
				</div>

				<div class="wrap-input100 validate-input m-b-16">
					<input class="input100" type="text" name="email"
						placeholder="ìì´ë ìë ¥"> <span class="focus-input100"></span>
				</div>
				<div class="example2">
					<div class="panel panel-default">
						<div class="panel-heading txt1 text-center" data-acc-link="demo2" >ë¹ë°ë²í¸ ë³ê²½ì
							ìíë©´ í´ë¦­</div><br>
						<div class="panel-body" data-acc-content="demo2">
							<div class="wrap-input100 validate-input m-b-20"
								data-validate="Please enter password">
								<span class="btn-show-pass"> <i class="fa fa fa-eye"></i>
								</span> <input class="input100" type="password" name="pass"
									placeholder="ë³ê²½í  ë¹ë°ë²í¸ ìë ¥"> <span class="focus-input100"></span>
							</div>
							<div class="wrap-input100 validate-input m-b-20"
								data-validate="Please enter password">
								<span class="btn-show-pass"> <i class="fa fa fa-eye"></i>
								</span> <input class="input100" type="password" name="pass"
									placeholder="íë² ë ìë ¥íì¸ì"> <span class="focus-input100"></span>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input100" type="text" name="email"
						placeholder="íì ì´ë¦ì ìë ¥íì¸ì"> <span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input100" type="email" name="email"
						placeholder="ì´ë©ì¼ì ìë ¥íì¸ì"> <span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input100" type="text" name="email"
						placeholder="ì íë²í¸ë¥¼ ìë ¥íì¸ì"> <span class="focus-input100"></span>
				</div>
				<div class="container-login100-form-btn">
					<button onclick="sample6_execDaumPostcode()">ì°í¸ë²í¸ ì°¾ê¸°</button>
				</div>
				<br>
				<div class="wrap-input100 validate-input m-b-20">
					<input type="text" class="input100" id="sample6_postcode"
						placeholder="ì°í¸ë²í¸"> <input type="text" class="input100"
						id="sample6_roadAddress" placeholder="ëë¡ëªì£¼ì"> <input
						type="text" class="input100" id="sample6_jibunAddress"
						placeholder="ì§ë²ì£¼ì">
				</div>
				<div class="container-login100-form-btn">
					<button class="login100-form-btn">ê°ìíê¸°</button>
				</div>
			</form>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="../../../resources/Login_v7/js/main.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="../../../resources/simpleAccordion/src/jquery.accordion.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.example1').accordion({
				multiOpen : false
			});

			$('.example2').accordion();

			$('.example3').accordion();
		});
	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		$(document)
				.on(
						'click',
						'.panel-heading span.clickable',
						function(e) {
							var $this = $(this);
							if (!$this.hasClass('panel-collapsed')) {
								$this.parents('.panel').find('.panel-body')
										.slideUp();
								$this.addClass('panel-collapsed');
								$this.find('i').removeClass(
										'glyphicon-chevron-up').addClass(
										'glyphicon-chevron-down');
							} else {
								$this.parents('.panel').find('.panel-body')
										.slideDown();
								$this.removeClass('panel-collapsed');
								$this.find('i').removeClass(
										'glyphicon-chevron-down').addClass(
										'glyphicon-chevron-up');
							}
						})
	</script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// íììì ê²ìê²°ê³¼ í­ëª©ì í´ë¦­íìë ì¤íí  ì½ëë¥¼ ìì±íë ë¶ë¶.

							// ê° ì£¼ìì ë¸ì¶ ê·ì¹ì ë°ë¼ ì£¼ìë¥¼ ì¡°í©íë¤.
							// ë´ë ¤ì¤ë ë³ìê° ê°ì´ ìë ê²½ì°ì ê³µë°±('')ê°ì ê°ì§ë¯ë¡, ì´ë¥¼ ì°¸ê³ íì¬ ë¶ê¸° íë¤.
							var fullAddr = ''; // ìµì¢ ì£¼ì ë³ì
							var extraAddr = ''; // ì¡°í©í ì£¼ì ë³ì

							// ì¬ì©ìê° ì íí ì£¼ì íìì ë°ë¼ í´ë¹ ì£¼ì ê°ì ê°ì ¸ì¨ë¤.
							if (data.userSelectedType === 'R') { // ì¬ì©ìê° ëë¡ëª ì£¼ìë¥¼ ì ííì ê²½ì°
								fullAddr = data.roadAddress;

							} else { // ì¬ì©ìê° ì§ë² ì£¼ìë¥¼ ì ííì ê²½ì°(J)
								fullAddr = data.jibunAddress;
							}

							// ì¬ì©ìê° ì íí ì£¼ìê° ëë¡ëª íìì¼ë ì¡°í©íë¤.
							if (data.userSelectedType === 'R') {
								//ë²ì ëëªì´ ìì ê²½ì° ì¶ê°íë¤.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// ê±´ë¬¼ëªì´ ìì ê²½ì° ì¶ê°íë¤.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// ì¡°í©íì£¼ìì ì ë¬´ì ë°ë¼ ììª½ì ê´í¸ë¥¼ ì¶ê°íì¬ ìµì¢ ì£¼ìë¥¼ ë§ë ë¤.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}

							// ì°í¸ë²í¸ì ì£¼ì ì ë³´ë¥¼ í´ë¹ íëì ë£ëë¤.
							document.getElementById('sample6_postcode').value = data.zonecode; //5ìë¦¬ ìì°í¸ë²í¸ ì¬ì©
							document.getElementById('sample6_address').value = fullAddr;

							// ì»¤ìë¥¼ ìì¸ì£¼ì íëë¡ ì´ëíë¤.
							document.getElementById('sample6_address2').focus();
						}
					}).open();
		}
		/* function checkId(){ 
		     $.ajax({
		         url : "./MemberIdCheckAction.aq",
		         type: "POST",
		         data : {"id":$('#m_id').val()},	              
		         success : function(data){
		              if(data=="0"){
		           	   $("#idcheck").html('<p style="color:blue"> ì¬ì©ê°ë¥í ìì´ëìëë¤.</p>');
		              }else if(data=="1"){
		           	   $("#idcheck").html('<p style="color:red"> ë¤ë¥¸ ì¬ëì´ ì¬ì©ì¤ìëë¤.</p>');
		              }
		         },    error: function(jqXHR, textStatus, errorThrown) {
		       	  console.log(jqXHR);
		       	  console.log(textStatus);
		       	  console.log(errorThrown);
		         }
		     });
		 }
		
		function pwCheck(){
		var pw1 = document.getElementById("m_pass1").value;
		var pw2 = document.getElementById("m_pass2").value;
		 if(pw1 != pw2){
			 	document.getElementById('pwCheck').style.color = "red";
			    document.getElementById('pwCheck').innerHTML = "ëì¼í ìí¸ë¥¼ ìë ¥íì¸ì."; 
		 		}else {
		 		document.getElementById('pwCheck').style.color = "blue";
		 		document.getElementById('pwCheck').innerHTML = "ìí¸ê° íì¸ ëììµëë¤."; 
		 		} 			 
		 } 	  */
	</script>
</body>
</html>