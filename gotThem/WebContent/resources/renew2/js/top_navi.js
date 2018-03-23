function depth2HideAll(d1n){

	$('#naviBg').stop().animate({'height':'0'},300);
	$('#naviBg').css({'border-top':'0','border-bottom':'0'});
	$('ul[id^=topSubm]').stop().animate({'height':'0'},200);
	$('a[id^=topNavi]').removeClass('hover');


}


function depth2View(){

	var depId = this.id;
	var depClass = depId.substr(0,7);
	var depNum = depId.substr(7,8);

	$('ul[id^=topSubm]').css('display','block');

	if (depClass == 'topNavi') {
		$(this).addClass('hover');
	}

	if (depClass == 'topSubm') {
		targetDiv = $(this).siblings();
		targetDiv.addClass('hover');
	}

	$('#naviBg').stop().animate({'height':'214px'},300).css({'border-bottom':'2px #36c8b6 solid'});
	$('ul[id^=topSubm]').stop().animate({'height':'180px'},300);
	$('ul[id^=topSubm]').css('z-index','99');

}


function mnaviView(){
	$('ul[id^=topSubm]').css('display','none').css('height','auto');
	$(this).siblings('ul').css({'display':'block'}); 
}


function initTopMenu() {
	
	$('a[id^=topNavi]').each(function() {
		if( $('#top').is('.on') ){
			$(this).mouseenter(depth2View)
				   .focus(depth2View)
				   .mouseleave(depth2HideAll);
		} else {
			$(this).click(mnaviView)
			$(this).unbind('mouseenter mouseleave focus')
		}
	});
	
	$('ul[id^=topSubm]').each(function() {
		if( $('#top').is('.on') ){
			$(this).mouseenter(depth2View)
				   .focus(depth2View)
				   .mouseleave(depth2HideAll);
		} else {
			$(this).unbind('mouseenter mouseleave focus')
		}
	});

	$('#naviBg').each(function() {
		if( $('#top').is('.on') ){
			$(this).mouseenter(depth2View)
				   .focus(depth2View)
				   .mouseleave(depth2HideAll)
		} else {
			$(this).unbind('mouseenter mouseleave focus')
		}
	});
	
}



function navichk(){
	var winWidth = $(window).width();
	if(winWidth > 767){
		$('#top').addClass('on'); 
		$('#navi').css({'display':'block','left':'0'});
	} else if (winWidth < 768 && winWidth > 540){
		$('#top').removeClass('on');	
		$('#navi').css({'display':'none','left':'-410px'});			
	} else {
		$('#top').removeClass('on');
		$('#navi').css({'display':'none','left':'-240px'});		
	}

	initTopMenu();
}







$(function(){
	
	// width check link control
	var nControl = function(){
		var winWidth = Math.max( $(window).width(), window.innerWidth);
		if (winWidth < 768){ $('a[id^=topNavi]').attr('onclick', 'return false'); }
		else { $('a[id^=topNavi]').attr('onclick', 'return ture'); }
	}; nControl();


	// main check link & slide control
	if ( $('#MainSection').length > 0 ) { 		
		$('#topNavi1, #topNavi2').attr('href', 'javascript:;');

		$('#topSubm1 a, #fsubM01 a, #fNavi01').each(function (){ 
			$(this).attr('href', 'javascript:;');
			$(this).bind('click', function(){
				var clickIndex = $(this).parent().index();
				$('.mtabs02 a:eq('+ clickIndex +')').click();
				$('html, body').animate({
					scrollTop: $('#section02').offset().top
				}, 1000 );

				var winWidth = Math.max( $(window).width(), window.innerWidth);
				if (winWidth < 768) { $('#mnaviHead a').click(); }
			});
		});
		

		$('#topSubm2 a, #fsubM02 a, #fNavi02').each(function (){ 
			$(this).attr('href', 'javascript:;');
			$(this).bind('click', function(){
				var clickIndex = $(this).parent().index();
				$('.mtabs03 a:eq('+ clickIndex +')').click();
				$('html, body').animate({
					scrollTop: $('#section03').offset().top
				}, 1000 );
				
				var winWidth = Math.max( $(window).width(), window.innerWidth);
				if (winWidth < 768) { $('#mnaviHead a').click(); }
			});
		});
	}

	// 1depth control
	var naviSlideEvent = function () {
		var winWidth = Math.max( $(window).width(), window.innerWidth);
		if (winWidth < 768)
		{
			$('#topNavi1, #topNavi2').each(function (){
				$(this).unbind('click');
				$(this).bind('click', function(){
					$('ul[id^=topSubm]').css('display','none').css('height','auto');
					$(this).siblings('ul').css({'display':'block'}); 
				});
			});
			
		} else {
			$('#topNavi1, #topNavi2').each(function (){
				$(this).bind('click', function(){
					var depId = this.id;
					var depNum = parseInt(depId.substr(7,8)) + 1;
					$('.mtabs0'+ depNum +' a:eq(0)').click();
					$('html, body').animate({
						scrollTop: $('#section0'+ depNum +'').offset().top
					}, 1000 );
					
					var winWidth = Math.max( $(window).width(), window.innerWidth);
					if (winWidth < 768) { $('#mnaviHead a').click(); }
				});
			});
		}
	}; naviSlideEvent();

	

	// Mobile control
	$('#mnavi img').click(function(){
		var winHeight = $('#allwrap').height();
		$('#navi').css('display','block');	
		$('#navi').css({'display':'block','height':winHeight});
		$('#navi').stop().animate({'left':'0'},300);
		$('#allBg').css('display','block');
		$('ul[id^=topSubm]').css('display','none');		
	});
	$('#mnaviHead a').click(function(){
		var winWidth = Math.max( $(window).width(), window.innerWidth);
		if (winWidth < 769 && winWidth > 540){ $('#navi').stop().animate({'left':'-410px'},300); }
		else { $('#navi').stop().animate({'left':'-240px'},300);}
		setTimeout( function(){
			$('#navi').css('display','none'); 
			$('#allBg').css('display','none');
		},300);
	});
	

	// resize reset event
	var resizeResrtEvent = function () {
		$('#allBg').css('display','none');
		$('#navi').css({'height':'auto'});
		$('ul[id^=topSubm]').css('display','none')
	};
	

	// parameter control
	var address = unescape(location.href);
	var param = '';
	if(address.indexOf('qlink', 0) != -1) {
		param = address.substring(address.indexOf('qlink', 0) + 7) - 1;
		if (param < 4){ setTimeout( function(){ $('#topSubm1 a:eq('+ param +')').click(); } , 300);}
		else {	var param_change = param - 4; 
				setTimeout( function(){ $('#topSubm2 a:eq('+ param_change +')').click(); } , 300);				
			 }
	}


	$(window).resize(function () {
		var isiPad = /ipad/i.test(navigator.userAgent.toLowerCase());
		if(jQuery.browser.mobile)
			{ if ($(window).width() != windowWidth) { navichk(); }
			} else if (isiPad){ if ($(window).width() != windowWidth) { navichk(); }
			} else { navichk(); 
		}
		
		naviSlideEvent();
		nControl();
		resizeResrtEvent();

		$('#allBg').css('display','none');
		$('#navi').css({'height':'auto'});
		$('ul[id^=topSubm]').css('display','none')

	});

	$(window).on( "orientationchange", function( event ) { navichk(); } )


});



