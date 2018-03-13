<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/stlogin/tether/tether.min.css">
  <link rel="stylesheet" href="resources/stlogin/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/stlogin/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="resources/stlogin/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="resources/stlogin/theme/css/style.css">
  <link rel="stylesheet" href="resources/stlogin/mobirise/css/mbr-additional.css" type="text/css">
</head>
<body>
	<section class="mbr-section form1 cid-qIWKYtQnJh" id="form1-r">
    <div class="container">
        <div class="row justify-content-center">
            <div class="media-container-column col-lg-8" data-form-type="formoid">
                    <div data-form-alert="" hidden="">
                        Thanks for filling out the form!
                    </div>      
                    <form class="mbr-form" action="storemodify.ad" method="post" data-form-title="Mobirise Form">
                    <input type="hidden" name="email" data-form-email="true" value="v71UZV7rSGKmNdtMTJcCzvbgvRKs8I889PXLsAjbR6NuKJtPYoKYEe+DT90N7gqVmrsYQhYLqTnSDAVjImF7Eb8KP/1hIcQUbq5w77EmgcHnu38hK1G/QmJo9v9/aFIP" data-form-field="Email">
                        <div class="row row-sm-offset">
                            <div class="col-sm-8 multi-horizontal" data-for="id">
                                <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="name-form1-r">아이디</label>
                                    <input type="text" class="form-control"  data-form-field="Name" required=""
                                   id="mem_id" value="${stinfo.mem_id }" disabled="disabled">
                                   <input type="hidden" name="mem_id" value="${memberInfo.mem_id }">
                                </div>
                            </div>
                            <div class="col-sm-8 multi-horizontal" data-for="ownername">
                                <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="owner-form1-r">점주명</label>
                                    <input type="text" id="mem_name" class="form-control" name="mem_name" 
                                    value="${stinfo.mem_name }" required="" data-form-field="owner" >
                                </div>
                         </div>
                         <div class="col-sm-8 multi-horizontal" data-for="storename">
                                <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="stoname-form1-r">점포명</label>
                                    <input type="text" class="form-control" name="sto_name" 
                                    value="${stinfo.sto_name }" data-form-field="owner" required="" id="sto_name">
                                </div>
                         </div>
                          <div class="col-sm-8 multi-horizontal" data-for="email">
                          <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="email-form1-r">이메일</label>
                                    <input type="email" class="form-control" name="mem_email" 
                                    value="${stinfo.mem_email}" data-form-field="Name" required="" id="mem_email">
                                </div>
                            </div>
                          <div class="col-sm-8 multi-horizontal" data-for="phone">
                           <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="phone-form1-r">전화번호</label>
                                    <input type="text" class="form-control" name="mem_phone" 
                                    value="${stinfo.mem_phone}" data-form-field="Name" required="" id="mem_phone">
                                </div>
                            </div>
                         <div class="col-sm-6 multi-horizontal" data-for="postcode">
                            <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="addr1-form1-r">우편번호</label>
                                    <input type="text" class="form-control" name="mem_addr1" data-form-field="Name" required="" id="sample6_postcode"
                                    value="${st_post }">
                                </div>
                            </div>
                         <div class="col-sm-6 multi-horizontal" data-for="findpostcode">
                            <div class="form-group" style="margin:23px 0px;">
                            <button onclick="sample6_execDaumPostcode()" class="btn btn-primary btn-form display-4">우편번호찾기</button>
                           </div>
                         </div>
                        <div class="col-sm-12 multi-horizontal" data-for="address1">
                            <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="addr1-form1-r">매장 상세주소1</label>
                                    <input type="text" class="form-control" name="mem_addr2" 
                                     value="${st_address1}" data-form-field="Name" required="" id="sample6_address">
                                </div>
                            </div>
                         <div class="col-sm-12 multi-horizontal" data-for="address2">
                            <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="addr2-form1-r">매장 상세주소2</label>
                                    <input type="text" class="form-control" name="mem_addr3" 
                                    value="${st_address2}" data-form-field="Name" required="" id="sample6_address2">
                                </div>
                            </div>
                        <div class="col-sm-12 multi-horizontal" data-for="grade">
                            <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="addr2-form1-r">회원 상태</label>
                                        <br><input type="radio" name="enable" value="승인완료" checked>승인완료
       									<input type="radio" name="enable" value="승인대기" >승인대기
                                </div>
                            </div>
                           
                        <span class="input-group-btn">
                            <button type="submit"
                            class="btn btn-primary btn-form display-4">수정하기</button>
                        	<button class="btn btn-primary btn-form display-4">비활성화</button>
                        </span>
                    </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>