<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제승인</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
    div{
        text-align:center;
    }
</style>
<body>
<h2>결제가 완료되었습니다.<br> 이용해 주셔서 감사합니다</h2>
<div id="ViewTimer"></div>
</body>


<script type="text/javascript">
var SetTime = 2;		// 최초 설정 시간(기본 : 초)

function msg_time() {	// 1초씩 카운트
	m = (SetTime % 60);	// 남은 시간 계산
	var msg = "<font color='red'>" + m + "</font>초 후 자동으로 창이 닫힙니다.";
	document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 			
	SetTime--;					// 1초씩 감소
	if (SetTime < 0) {			// 시간이 종료 되었으면..
		clearInterval(tid);		// 타이머 해제
	}
	
}
window.opener.location="orderList.gt;"
window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };

/* opener=self; */
setTimeout('self.close()',3000);


</script>
</html>