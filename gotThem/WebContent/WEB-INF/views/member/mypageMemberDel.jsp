<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
<style>
.labelSize{
font-size:18px !important;
font-weight:bold !important;
}

</style>
</head>
<body>
<section class="probootstrap-section">
         <center><div class="alert alert-info alert-dismissable" style="word-break:keep-all;">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <h4 style="color:red;"><strong>주의!!</strong></h4>회원탈퇴 전에 구매한 상품을 수령해주세요. 수령받지 않으시면 탈퇴할 수 없습니다
        </div></center>
    <div class="container">
      <div class="row">
        <div class="col-md-8">
          <form id="memberDeleteForm" action="mypageMemberDel.gt" method="post" class="probootstrap-form mb60">
            <div class="row">
              <div class="col-sm-12">
                <div class="form-group">
                  <center><label for="fname" class="labelSize">현재 비밀번호</label>
                  <input type="password" class="form-control" name="mem_pw" style="width:280px;"></center>
                </div>
              </div>
              </div>
                       
            <div class="form-group">
             <center> <input type="button" class="btn btn-colorRed" style="width:280px;" value="탈퇴하기" onclick="memberDel()"></center>
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
			$('#memberDeleteForm').submit();
		}else{
			alert('회원탈퇴가 취소되었습니다');
			history.go(0);
		}
	}
</script>
</html>