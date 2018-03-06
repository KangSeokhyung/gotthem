<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="resources/tableimage/png" href="resources/table/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<title>Fresh Bootstrap Table by Creative Tim</title>

	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    
    <link href="resources/table/css/bootstrap.css" rel="stylesheet" />
    <link href="resources/table/css/fresh-bootstrap-table.css" rel="stylesheet" />
     
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        
</head>

<body>
	<div class="service">
         <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          여기에서 회원정보 수정이 가능합니다..
        </div>
          <form action="passCheck.gt" method="post"class="probootstrap-form mb60">
            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="lname">아이디</label>
                  <input type="text" class="form-control" id="lname" value="${memberInfo.mem_id }" disabled="disabled">
                </div>
              </div>
              </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="lname">이름</label>
                  <input type="text" class="form-control" id="lname" value="${memberInfo.mem_name }">
                </div>
              </div>
            </div>
           <div class="row">
            <div class="col-md-6">
            <div class="form-group">
              <label for="email">이메일</label>
              <input type="email" class="form-control" id="email" name="new_pw2" value="${memberInfo.mem_email}">
            </div>
            </div>
            </div>
            <div class="row">
            <div class="col-md-6">
            <div class="form-group">
              <label for="email">핸드폰번호</label>
              <input type="text" class="form-control" id="email" name="new_pw2" value="${memberInfo.mem_phone}">
            </div>
            </div>
            </div>
             <div class="row">
            <div class="col-md-6">
            <div class="form-group">
              <label for="email">우편번호</label>
              <input type="text" class="form-control" id="email" name="new_pw2" value="${mem_post}">
            </div>
            </div>
            </div>
           <div class="row">
            <div class="col-md-9">
            <div class="form-group">
              <label for="email">상세주소1</label>
              <input type="text" class="form-control" id="email" name="new_pw2" value="${mem_address1}">
            </div>
            </div>
            </div>
            <div class="row">
            <div class="col-md-9">
            <div class="form-group">
              <label for="email">상세주소2</label>
              <input type="text" class="form-control" id="email" name="new_pw2" value="${mem_address2}">
            </div>
            </div>
            </div>                   
            <div class="form-group">
              <input type="submit" class="btn btn-primary" id="submit" name="submit" value="변경">
              <input type="reset" class="btn btn-primary" id="submit" value="취소">
            </div>              
          </form>
        </div> 
</body>

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
                document.getElementById('mem_post').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('mem_address1').value = fullAddr;
				
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('mem_address2').focus();
                
               
            }
        }).open();
    }
</script>
</html>