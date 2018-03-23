<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제승인 중</title>
</head>
<style>
    div{
        padding-left: 200px;
    }
</style>
<body>
<h1>결제 진행중이오니 잠시 기다려주세요</h1>
</body>

<script src='../node_modules/jquery/dist/jquery.min.js'></script>
<script src='../node_modules/popper.js/dist/umd/popper.min.js'></script>
<script src='../node_modules/bootstrap/dist/js/bootstrap.min.js'></script>
<script type="text/javascript">
load();
function load(){
    
    index = location.href.indexOf('?');
    qs = location.href.substr(index + 1);
    arr = qs.split('=');
    console.log(arr[1]);
    $.ajax('../json/item/approve',{
       data:{
           pg_Token: arr[1]
       },
       method:"POST",
       dataType:"json",
       success:(result)=>{
           alert("결제가 완료되었습니다");
        
    },
         error:()=>{
             alert("결제에 실패했습니다 다시 시도해주세요")
         }
       
        });
}
</script>
</html>