<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
</head>
<body>
<section class="probootstrap-section">
         <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <h4 style="color:red;">주의!!</h4>회원탈퇴 전에 구매한 상품을 수령해주세요. 수령받지 않으시면 탈퇴할 수 없습니다
        </div>
    <div class="container">
      <div class="row">
        <div class="col-md-8">
          <form id="form1" action="mypageMemberDel.gt" method="post" class="probootstrap-form mb60">
            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="fname">현재 비밀번호</label>
                  <input type="password" class="form-control" id="fname" name="mem_pw">
                </div>
              </div>
              </div>
                       
            <div class="form-group">
              <input type="button" class="btn btn-primary" value="탈퇴하기" onclick="memberDel()">
              <input type="button" class="btn btn-primary" onclick="histiry.back()" value="돌아가기">
            </div>              
          </form>
        </div> 
	</div>
	</div>
  </section> 
	
</body>
<script>
	function memberDel(){
		if(confirm('수령하지 않은 제품이 있으면 탈퇴 할 수 없습니다. 정말 탈퇴하시겠습니까?')== true){
			document.form1.submit();
		}else{
			alert('회원탈퇴가 취소되었습니다');
			history.go(0);
		}
	}
</script>
</html>