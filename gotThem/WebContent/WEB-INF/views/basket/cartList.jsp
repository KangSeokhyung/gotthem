<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>상품장바구니 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<link rel="stylesheet"
	href="resources/mainTemplate/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="resources/mainTemplate/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/mainTemplate/sweetalert/dist/sweetalert.css">
<link rel="stylesheet" href="resources/mainTemplate/css/stisla.css">
<style>
section{
background-size : cover;
}
</style>
</head>
<body>
	<header>
		<%@include file="/nav.jsp"%>
	</header>
	<h1>장바구니 목록</h1>
	<h2>장바구니 목록</h2>
<div class="container">
    <h2>장바구니 확인</h2>
    <c:choose>
        <c:when test="${map.count == 0}">
            장바구니가 비어있습니다.
        </c:when>
        <c:otherwise>     
        <form name="form1" id="form1" method="post" action="./update.gt">
         <table class="table">
               <tr>
                   <th><input type="checkbox" name="checkAll" id="th_checkAll" /></th> 
                   <th>상품명</th>
                   <th>단가</th>
                   <th>수량</th>
                   <th>금액</th>
                   <th>취소</th>
                   <th>결제</th>
               </tr>
             <c:forEach var="row" items="${map.list}" varStatus="i">
               <tr>                
                  <td><input type="checkbox" name="checkRow" class="chk" value="${row.bas_no}"/> 
                  </td>
                  <td> ${row.bas_proname}
                  </td>
                  <td style="width: 80px" align="right">
                       <fmt:formatNumber pattern="###,###,###" value="${row.bas_proprice}"/></td>
                  <td>
                     <input type="number" style="width: 40px" name="bas_prostock" value="${row.bas_prostock}" min="1">
                     <input type="hidden" name="bas_procode" value="${row.bas_procode}">
                     <!-- <button type="button" id="btnUpdate" onclick="modify();" >수정</button> -->
                     <button type="submit" id="btnUpdate" >수정</button></td>
                  <td style="width: 80px" align="right">
                       <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>
                  </td>
                  <td>                    
                       <input type="button" value="삭제" onclick="button_basDel(${row.bas_no});"></td>
                  <td>
                       <input type="hidden" name="money" value="${row.money}">
                       <input type="hidden" name="bas_proname" value="${row.bas_proname}">
                       <!-- <input type="submit" value="단건결제"> -->
                       <input type="button" value="단건결제" onclick="button_order('${row.bas_no}','${row.bas_proname}','${row.bas_procode}','${row.money}','${row.bas_prostock}');">
                   </td>
                </tr>
               </c:forEach>
                <tr>
                    <td colspan="5" align="right"> 장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/><br>
                        <%-- 배송료 : ${map.fee}<br>전체 주문금액  :<fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/> --%>
                    </td></tr>
            </table>
            <input type="hidden" name="count" value="${map.count}">
            <button type="button" value="상품목록2" id="btnList">상품목록</button>
          
            <input type="button" name="seDel" id="button_seDel" onclick="button_sedel();" value="선택삭제" />
            <!-- <input type="button" name="sedelete" id="button" onclick="delete01()" value="선택삭제" /> -->
            <!-- <img src="images/btn/list_del_btn.gif" width="114" height="49" onclick="delete01()"/> -->
        </form>
      </c:otherwise>
    </c:choose>
</div>    
	<footer>
		<div class="container">
			<figure>
				<img src="resources/mainTemplate/img/logo.png" alt="Logo">
			</figure>
			<p>Copyright &copy; 2018 스탑없으</p>
			<p>
				Made with <i class="ion-heart"></i> By Kodinger
			</p>
		</div>
	</footer>
</body>
	<script src="resources/mainTemplate/js/jquery.min.js"></script>
	<script src="resources/indexTemplate/js/popper.min.js"></script>
	<script src="resources/mainTemplate/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/mainTemplate/js/jquery.easeScroll.js"></script>
	<script src="resources/mainTemplate/sweetalert/dist/sweetalert.min.js"></script>
	<script src="resources/mainTemplate/js/stisla.js"></script>

<script type="text/javascript">

    $(document).ready(function(){
        // 리스트 페이지로 이동
        $("#btnList").click(function(){
            location.href="./productlist.gt";     
        });
        /* $("#btnOrd").click(function(){
            location.href="ord.gt?bas_no="+bas_no;
        }); */
    });
function button_basDel(bas_no){
    	alert(bas_no);
   if (confirm("정말 삭제하시겠습니까??")){    //확인
     location.href="delete.gt?bas_no="+bas_no;
   }else{   //취소.
       return;
      }
   }
   
function button_order(bas_no,bas_proname,bas_procode,money,bas_prostock){
   	alert(bas_no);
  if (confirm("결제 하시겠습니까??")){    //확인
    location.href="insertOrder.gt?bas_no="+bas_no+"&bas_proname="+bas_proname+
    		"&bas_procode="+bas_procode+"&money="+money+"&bas_prostock="+bas_prostock;
  }else{   //취소.
      return;
     }
  } 

<%-- function modify() {
	   var submitTest = document.form1;
	   submitTest.action="./update.gt";
	   submitTest.method="post";
	   submitTest.submit();
   }  --%>    

	$("#th_checkAll").click(function(){		
		var chk= $(this).is(":checked");
		if(chk){
			$('input[name*="checkRow"]').prop("checked", true);//체크박스 전체 선택
		} else{
	        $('input[name*="checkRow"]').prop("checked", false);//체크박스 전체 해지 
    	}
	});
	
 function button_sedel(){
	 var checkArr = [];
   $("input[name='checkRow']:checked").each(function(i) {
     checkArr.push($(this).val());
	   alert("배열" + checkArr);  }); 
	if (confirm("정말 삭제하시겠습니까??")){
		alert("배열" + checkArr);
		$.ajax({				
			url:"test_check.gt",
			type:"post",
			dataType: "text",
			data:{arrDel:checkArr
				},
			success:function(result){
				location.href="./list.gt";
			}	
			});	    	
		}else{   //취소.
		       return;
	      } 	
 		
      }  
/* 	 setTimeout(function(){
		  if(confirm("삭제 했습니다.")){
			  location.href="list.gt";
		  }else{
			  location.href="list.gt";
		  }
	}, 2000); */ 	

	
 /* 

//	  alert("넘어가는 값은="+data);
	$("input[name=seDel]").click(function() {
		var checkArray = "";
		var seperator = "";
		alert("삭제할 대상을 선택하세요.");
		$("input[name=checkRow]:checked").each(function() {
			checkArray += seperator + $(this).attr("bas_no");
			seperator = ",";
		});
		alert("checkArray는"+checkArray);
		console.log(checkArray);
		$.ajax({
			url : "./BoardDel.admin",
			type : "post",
			data : {"delSeqNo": checkArray},
			success : function(data) {
			}
		});
		return false;
	});

function deleteAction(){
  var checkRow = "";
  $( "input[name='checkRow']:checked" ).each (function (){
    checkRow = checkRow + $(this).val()+"," ;
  });
  checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
 
  if(checkRow == ''){
    alert("삭제할 대상을 선택하세요.");
    return false;
  }
  console.log("### checkRow => {}"+checkRow);
 
  if(confirm("정보를 삭제 하시겠습니까?")){
      
      //삭제처리 후 다시 불러올 리스트 url      
      var url = document.location.href;
      var page = $("#page").val();
      var saleType = $("#saleType").val();
      var schtype = $("#schtype").val();
      var schval = $("#schval").val();
      location.href="${rc.contextPath}/test_proc.do?idx="+checkRow+"&goUrl="+url+"&page="+page+"&saleType="+saleType+"schtype="+schtype+"schval="+schval;      
  } 
  */
</script>	
</html>