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
.ad{
 text-align:center;
    }
.kakaopay_layer {
    overflow: hidden;
    position: relative;
    width: 100%;
    min-width: 320px;
    min-height: 100%;
}
body, th, td, input, select, textarea, button {
    font-size: 14px;
    line-height: 1.5;
    font-family: '나눔스퀘어라운드 Regular',''Apple SD Gothic Neo','Malgun Gothic','맑은 고딕',sans-serif;
    color: #111;
}
.inner_kakaopay .layer_head {
    overflow: hidden;
    padding: 29px 30px 0;
}

.inner_kakaopay .layer_body {
    padding: 0 30px 30px;
}
</style>
<body>
<div class="kakaopay_layer">
		<div class="inner_kakaopay">
			<div class="layer_head">
				<img src="resources/image/payk.png"alt="카카오페이 로고이미지"  style="width:55px; height:18px" />
			</div>
			<div class="layer_body">
				<h2 style="color:#333;">결제가 완료되었습니다.<br>이용해 주셔서 감사합니다.</h2>				
			</div>
			<div class="layer_body" style="color:#e2a500;">
				<h3>구매 상품은<br>하루 안에 찾아가 주시기 바랍니다.<br>신선 제품이라 상할 위험이 있습니다.</h3>
			</div>
			<div class="layer_body">
				<div id="ViewTimer" class="ad"></div>
			</div>
		</div>

</div>
</body>
<script type="text/javascript">
var SetTime = 4;		// 최초 설정 시간(기본 : 초)

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
setTimeout('self.close()',5000);


</script>
</html>