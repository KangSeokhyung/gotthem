$(document).ready(function(){
	// �곷떒 �곹뭹寃��� �덉씠�� �좉�
	$('.searchTopBtn').bind('click',function(){
		if($(this).hasClass('off')){
			$('.searchLayer').slideDown();
			$(this).removeClass('off').addClass('on');
		}else{
			$('.searchLayer').slideUp();
			$(this).removeClass('on').addClass('off');
		}
		return false;
	});
	// �곷떒 �ㅻ퉬寃뚯씠�� �쒕툕硫붾돱 �좉�
	$('#nav>li>a').bind('mouseover focus',function(){
		$('.depth2Wrap').hide();
		$(this).next().show();
	});
	$(document).bind('mouseover', function(e) {
		var $clicked = $(e.target);
		if (! $clicked.parents().hasClass("nav"))
		$(".depth2Wrap").hide();
	});
	// �섎떒 �⑤�由� �ъ씠�� �좉�
	$('.familyBtn').bind('click',function(){
		if($(this).hasClass('off')){
			$(this).next().show();
			$(this).removeClass('off').addClass('on');
		}else{
			$(this).next().hide();
			$(this).removeClass('on').addClass('off');
		}
		return false;
	});
	$(".familySite ul a").bind('click',function(){
		$(".familySite ul").hide();
	});
	$(document).bind('click', function(e) {
		var $clicked = $(e.target);
		if (! $clicked.parents().hasClass("familySite")){
			$(".familySite ul").hide();
			$('.familyBtn').removeClass('on').addClass('off');
		}
	});
	// �듬찓�� �뚮줈��
	var quick_menu = $('.quickArea');
    var quick_top = 182;
    var quick_speed = 1000;
    quick_menu.css('top', quick_top + "px");
    $(window).scroll(function(){
		if($(document).scrollTop()>=quick_top){
			quick_menu.stop();
			quick_menu.animate( { "top": $(document).scrollTop() +  "px" }, quick_speed );
			$('.seenProductArea').fadeOut(500);
		}else if($(document).scrollTop()<quick_top){
			quick_menu.stop();
			quick_menu.animate( { "top": quick_top +  "px" }, quick_speed );
		}
    });
	// �듬찓�� �щ씪�대뵫
	var $slideQuickUl = $('.seenProductArea .slideArea .slideUl');
	var $seenProductArea = $('.seenProductArea');
	var slideQuick = 0;
	var slideQuickMax = $slideQuickUl.find('li').length-2;
		//理쒖큹 3媛� �댁긽 �쒗뭹�� 踰꾪듉 �쒖꽦��
	if(slideQuickMax > 1){
		$seenProductArea.find('.nextBtn').find('img').attr('src',$seenProductArea.find('.nextBtn').find('img').attr('src').replace('_off.gif','_on.gif'));
	}
	$seenProductArea.find('.nextBtn').bind('click',function(){
		var nextQuickNum = slideQuick +1;
		if(slideQuickMax < 2){
			return false;
		}
		if(nextQuickNum == slideQuickMax){
			nextQuickNum = slideQuickMax-1;
		}
		if(nextQuickNum == slideQuickMax-1){
			$seenProductArea.find('.nextBtn').find('img').attr('src',$seenProductArea.find('.nextBtn').find('img').attr('src').replace('_on.gif','_off.gif'));
		}
		if(nextQuickNum > 0){
			$seenProductArea.find('.prevBtn').find('img').attr('src',$seenProductArea.find('.prevBtn').find('img').attr('src').replace('_off.gif','_on.gif'));
		}
		$slideQuickUl.stop();
		$slideQuickUl.animate({
			'left' : -(nextQuickNum*246)+'px'
		},1000);
		slideQuick = nextQuickNum;
		return false;
	});
	$seenProductArea.find('.prevBtn').bind('click',function(){
		var prevQuickNum = slideQuick -1;		
		if(slideQuickMax > 1){
			$seenProductArea.find('.nextBtn').find('img').attr('src',$seenProductArea.find('.nextBtn').find('img').attr('src').replace('_off.gif','_on.gif'));
		}
		if(prevQuickNum == -1){
			prevQuickNum = 0;
		}
		if(prevQuickNum == 0){			
			$seenProductArea.find('.prevBtn').find('img').attr('src',$seenProductArea.find('.prevBtn').find('img').attr('src').replace('_on.gif','_off.gif'));
		}
		$slideQuickUl.stop();
		$slideQuickUl.animate({
			'left' : -(prevQuickNum*246)+'px'
		},1000);
		slideQuick = prevQuickNum;
		return false;
	});
	// �ㅻ뒛 蹂� �곹뭹 �좉�
	$('.seenProductBtn').bind('click',function(){
		$(this).next().show();
		return false;
	});
	$('.seenProductArea .closeBtn').bind('click',function(){
		$(this).parent().hide();
		return false;
	});
	// �덉씠�� 諛곌꼍 �믪씠媛� 援ы븯湲�
	var docHeight = $(document).height();
	$('.whiteBg').css('height',docHeight);
	// �덉씠�� �リ린 踰꾪듉 怨듯넻
	$('.layerWrap .closeBtn').bind('click',function(){
		$('.whiteBg').hide();
		$(this).parentsUntil('.layerWrap').parent().hide();
	});
	// �덉씠�� �リ린 踰꾪듉 怨듯넻
	$('.layerWrap .closeBtn_1').bind('click',function(){
		$('.whiteBg').hide();
		$(this).parentsUntil('.layerWrap').parent().hide();
	});
	// �꾩씠�� 以묐났�뺤씤 �덉씠�� �좉�
	$('#jungbokBtn').bind('click',function(){
		$('.whiteBg,#idCheckLayer').show();
	});
	// �꾩씠�� 李얘린 �섏씠吏� �대찓�� �뺤씤 �덉씠�� �좉�
	$('#emailChBtn').bind('click',function(){
		$('.whiteBg,#emailCheckLayer').show();
	});
	$('#emailChBtn2,#emailChBtn3').bind('click',function(){
		$('.whiteBg,#emailCheckLayer2').show();
	});
	// 二쇱냼李얘린 踰꾪듉 �덉씠�� �좉�
		// 吏�踰� 二쇱냼 �대┃��
	$('.zipBtn1').bind('click',function(){
		$('.whiteBg').show();$('.zipLayerWrap').hide();$('#zipCodeLayer1').show();
	});
		// �꾨줈紐� 二쇱냼 �대┃��
	$('.zipBtn2').bind('click',function(){
		$('.whiteBg').show();$('.zipLayerWrap').hide();$('#zipCodeLayer2').show();		
	});
		// 二쇱냼 寃��됲��� ��찓�� �대┃��
	$('.zipTabWrap a').bind('click',function(){
		var clickedIdx = $(this).index()+1;
		$('.zipLayerWrap').hide();
		$('#zipCodeLayer'+clickedIdx).show();
	});
	// �꾩떆 �곹뭹 ��찓�� �쒖꽦�� �④낵
	$('.productTabWrap a').bind('click',function(){
		$('.productTabWrap a').removeClass('on');
		$(this).addClass('on');
		return false;
	});
	$('.productTabWrap2 a').bind('click',function(){
		$('.productTabWrap2 a').removeClass('on');
		$(this).addClass('on');
		return false;
	});
	// �꾩떆 �곹뭹 �곹뭹 sorting �쒖꽦�� �④낵
	$('.sortingWrap a').bind('click',function(){
		$('.sortingWrap a').removeClass('on');
		$(this).addClass('on');
		return false;
	});
	// �꾩떆 �곹뭹 �대�吏��� 由ъ뒪�몄뿉�� 留덉슦�ㅼ삤踰꾩떆 �쒖꽦��
	$('.productUl li').bind('mouseover',function(){
		var zIdx = 1;
		var thisImgSrc = $(this).find('.imgTypeImg img').attr('src');
		if(true){  // �몃꽕�� 2媛� �깅줉�� 議곌굔 �ｌ쑝�몄슂
			$(this).css('z-index',zIdx + 1);
			//$(this).find('.imgTypeImg').find('img').attr('src',thisImgSrc.replace('_off.gif','_on.gif'));
			$(this).find('.shadowLayer').show();
			$(this).find('.quick_shadow').show();
			$('.productUl li').removeClass('over');
			$(this).addClass('over');
		}
	});
	$('.productUl li').bind('mouseout',function(){
		var zIdx = 1;
		var thisImgSrc2 = $(this).find('.imgTypeImg img').attr('src');
		if(true){  // �몃꽕�� 2媛� �깅줉�� 議곌굔 �ｌ쑝�몄슂
			$(this).css('z-index',zIdx);
			//$(this).find('.imgTypeImg').find('img').attr('src',thisImgSrc2.replace('_on.gif','_off.gif'));
			$(this).find('.shadowLayer').hide();
			$(this).find('.quick_shadow').hide();
			$('.productUl li').removeClass('over');
		}
	});
	// �곹뭹 �뷀뀒�� �섏씠吏� �몃꽕�� �대┃�� 蹂�寃�
	$('.detailTopImgWrap .thumbUl a').bind('click',function(){
		var clickedSrc = $(this).find('img').attr('src');
		$('.bigOne img').attr('src',clickedSrc);
		return false;
	});
	// �곹뭹 由щ럭 ��찓�� �쒖꽦��
	$('.reviewTabWrap a').bind('click',function(){
		$('.reviewTabWrap a').removeClass('on');
		$(this).addClass('on');
		return  false;
	});
	// �곹뭹 �뷀뀒�� �섏씠吏� �곹뭹臾몄쓽 �좉�
	$('.questionTxt').bind('click',function(){
		var trueType = $(this).parentsUntil('tr').parent().next().hasClass('answerTr');
		if(trueType){
			if($(this).parentsUntil('tr').parent().next().find('td').css('display')!='none'){
				$('.colTable.questionT tbody td').css('background','#ffffff');
				$('.answerTr td').hide();
			}else{
				$('.answerTr td').hide();
				$(this).parentsUntil('tr').parent().next().find('td').show();
				$('.colTable.questionT tbody td').css('background','#ffffff');
				$(this).parentsUntil('tr').parent().find('td').css('background','#f5f5f5');
			}
		}
		return false;
	});
	// �곹뭹 �뷀뀒�� �섏씠吏� 諛⑸Ц�좎껌 �좉�
	$('.askHomeBtn').bind('click',function(){
		$('.homeLayer').fadeIn(1000);
		return false;
	});
	$('.closeHomeBtn').bind('click',function(){
		$('.homeLayer').fadeOut(1000);
		return false;
	});
	// �λ컮援щ땲 �섎웾 媛�媛�
	$('.quantiUpDown a.btns').bind('click',function(){
		var nowQuanti = parseInt($(this).parent().prev().val());
		var clickUpDown = $(this).index();
		if(clickUpDown == 0){
			var plusNum = nowQuanti +1;
			$(this).parent().prev().val(plusNum);
			nowQuanti = plusNum;
		}
		if(clickUpDown == 1){
			var minusNum = nowQuanti - 1;
			if(minusNum == 0){
				return false;
			}
			$(this).parent().prev().val(minusNum);
			nowQuanti = minusNum;
		}
		return false;
	});
	// 二쇰Ц �묒꽦�� �� 諛곗넚吏� �낅젰
	$('.newDeiveZipBtn').bind('click',function(){
		$('.baseZipTr td,.baseZipTr th').hide();
		$('.newZipTr td,.newZipTr th').show();
		$('.send_view').hide();
		$('.send_input').show();
		return false;
	});
	// 蹂대궡�� 遺� �섏젙 �대┃�� �좉�
	$('.chgSenderBtn').bind('click',function(){
		$('.whiteBg,#chgSenderLayer').show();
	});
	// 二쇰Ц諛곗넚吏� �좏깮 踰꾪듉 �쒖꽦��
	$('.selectDelivWrap a').bind('click',function(){
		$('.selectDelivWrap a').removeClass('blue24').addClass('gray24');
		$(this).removeClass('gray24').addClass('blue24');
		return false;
	});
	// 李몄뿬�뺣낫_�쇰컲由щ럭 �좉�
	$('.shownBtn').bind('click',function(){
		var shownType = $(this).parentsUntil('tr').parent().next().hasClass('showedArea');
		if(shownType){
			if($(this).parentsUntil('tr').parent().next().find('td').css('display')!='none'){
				$('.colTable.reviewTable tbody td').css('background','#ffffff');
				$('.showedArea td').hide();
			}else{
				$('.showedArea td').hide();
				$(this).parentsUntil('tr').parent().next().find('td').show();
				$('.colTable.reviewTable tbody td').css('background','#ffffff');
				$(this).parentsUntil('tr').parent().next().find('td').css('background','#f5f5f5');
			}
		}
		return false;
	});
	// 寃��� 移댄뀒怨좊━ �좏깮 �좉�,媛� �섍꺼二쇨린
	$('.categoryTxt').bind('click',function(){
		$(this).next().show();
	});
	$(document).bind('click', function(e) {
		var $clicked2 = $(e.target);
		if (! $clicked2.parents().hasClass("selectArea")){
			$(".categorySelectFake").hide();
		}
	});
	$('.categorySelectFake a').bind('click',function(){
		var clickedTxt = $(this).text();
		$('.categoryTxt').text(clickedTxt);
		$('#categorySelectTxt').val(clickedTxt);
		$(".categorySelectFake").hide();
	});	
	// 怨좉컼�쇳꽣 �� 硫붾돱 �쒖꽦��
	$('.faqTabWrap a').bind('click',function(){
		$('.faqTabWrap a').removeClass('on');
		$(this).addClass('on');
		return false;	
	});
	// 怨좉컼�쇳꽣 faq �좉�
	$('.faqToggleBtn').bind('click',function(){
		var faqshownType = $(this).parentsUntil('tr').parent().next().hasClass('faqAnswerTr');
		if(faqshownType){
			if($(this).parentsUntil('tr').parent().next().find('td').css('display')!='none'){
				$('.colTable.reviewTable tbody td').css('background','#ffffff');
				$('.faqAnswerTr td').hide();
				$('.faqTitleP').removeClass('on').addClass('off');
			}else{
				$('.faqAnswerTr td').hide();
				$(this).parentsUntil('tr').parent().next().find('td').show();
				$('.colTable.faqTable tbody td').css('background','#ffffff');
				$(this).parentsUntil('tr').parent().next().find('td').css('background','#f7f7f7');
				$(this).parent().removeClass('off').addClass('on');
			}
		}
		return false;
	});
	// �곹뭹 �⑥삤�� 
	$('.onoffImg').bind('mouseover',function(){
		var offSrc = $(this).find('img').attr('src');
		$(this).find('img').attr('src',offSrc.replace('_off.gif','_on.gif'));
	}).bind('mouseout',function(){
		var onSrc = $(this).find('img').attr('src');
		$(this).find('img').attr('src',onSrc.replace('_on.gif','_off.gif'));
	});

	//// �꾨옒濡� 硫붿씤�섏씠吏� �꾩슜
});