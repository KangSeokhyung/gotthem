<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>Startup UI Kit - Free Sample</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="resources/ownerindex/images/favicon.ico">
		<link rel="stylesheet" href="resources/ownerindex/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" href="resources/ownerindex/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/ownerindex/css/style.css">
		<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i|Montserrat:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	</head>
	<body>
		<section class="cover-1 text-center">
		<%@include file ="storeNav.jsp"%>
			<div class="cover-container pb-5">
				<div class="cover-inner container">
		 <div class="row marketing">
        <div class="col-lg-6">
          <h1 class="jumbotron-heading">지금 <strong>Got them에</strong> 점포를	<strong>등록하세요</strong></h1>
			<p class="lead">got them에 대해 궁금하신가요?</p>
        </div>

        <div class="col-lg-6">
         <div class="container">
                <div class="col-xs-12 mx-auto">
                    <div class="card border-secondary">
                        <div class="card-body">
                            <form class="form" action="join.st" role="form" autocomplete="off" method="post">
                                    <label for="inputName">아이디</label>
                                    <input type="text" class="form-control" id="sto_id" name="sto_id" placeholder="아이디를 입력해주세요">                           
                                    <label for="inputPassword3">Password</label>
                                    <input type="password" class="form-control" id="inputPassword3" name="sto_pw" placeholder="비밀번호를 입력하세요" title="At least 6 characters with letters and numbers" required="">
                                    <label for="inputVerify3">Verify</label>
                                    <input type="password" class="form-control" id="inputVerify3" placeholder="한번 더 입력해주세요" required="">
                                    <label for="inputEmail3">점주명</label>
                                    <input type="text" class="form-control" id="sto_owner" name="sto_owner" placeholder="점주명을 입력해주세요" required="">
                                    <label for="inputEmail3">점포명</label>
                                    <input type="text" class="form-control" id="sto_name" name="sto_name" placeholder="점포명을 입력해주세요" required="">
                                    <label for="inputEmail3">점포주소</label>
                                  	<span><input type="text" style="width:40%;"class="form-control" id="sample6_postcode" name="sto_addr1" placeholder="우편번호" required="">
                                    <button  onclick="sample6_execDaumPostcode()">우편번호 찾기</button></span> 
                                    <input type="text" class="form-control" id="sample6_address" name="sto_addr2" placeholder="점포 도로명주소" required="">
                                    <input type="text" class="form-control" id="sample6_address2" name="sto_addr3"placeholder="점포 상세주소" required="">
                                    <label for="inputEmail3">사업자 번호</label>
                                    <input type="text" class="form-control" id="inputEmail3"name="sto_registno"  placeholder="사업자 번호를 입력해주세요" required="">
                                     <label for="inputEmail3">점주 이메일</label>
                                    <input type="text" class="form-control" id="sto_email" name="sto_email" placeholder="이메일을 입력해주세요" required="">
                                    <label for="inputEmail3">점주 폰번호</label>
                                    <input type="text" class="form-control" id="sto_phone" name="sto_phone" placeholder="전화번호 입력해주세요" required="">
                                     <br>
                                     <button type="submit" class="btn btn-success btn-lg float-right">등록하기</button>
                                     </form>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/row-->
        </div>
        <!--/col-->
   		</div>
		</div>
</section>

		<footer class="footer-3">
			<div class="container-fluid">
				<div class="divider"></div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-6 text-center text-md-left mt-2 mb-3 pt-1">
						<p>Copyright &copy; YourStartup. All rights reserved.</p>
					</div>
					<div class="col-md-6 text-center text-md-right mb-4">
						<ul class="social">
							<li><a href="#" title="Facebook" class="fa fa-facebook"></a></li>
							<li><a href="#" title="Twitter" class="fa fa-twitter"></a></li>
							<li><a href="#" title="Google+" class="fa fa-google"></a></li>
							<li><a href="#" title="Dribbble" class="fa fa-dribbble"></a></li>
							<li><a href="#" title="Instagram" class="fa fa-instagram"></a></li>
							<div class="clear"></div>
						</ul>
					</div>
				</div>
			</div>
		</footer>
		
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
		<script src="resources/ownerindex/bootstrap/js/bootstrap.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
   		 function sample6_execDaumPostcode() {
       		 new daum.Postcode({
          	  oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
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
	                   if(data=="0"){test.store
	                	   $("#idcheck").html('<p style="color:blue"> 사용가능한 아이디입니다.</p>');
	                   }else if(data=="1"){
	                	   $("#idcheck").html('<p style="color:red"> 다른 사람이 사용중입니다.</p>');
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
    			    document.getElementById('pwCheck').innerHTML = "동일한 암호를 입력하세요."; 
    		 		}else {
    		 		document.getElementById('pwCheck').style.color = "blue";
    		 		document.getElementById('pwCheck').innerHTML = "암호가 확인 되었습니다."; 
    		 		} 			 
    		 } 	  */
</script>
	</body>
</html>
