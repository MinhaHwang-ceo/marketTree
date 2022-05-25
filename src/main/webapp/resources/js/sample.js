

$(document).ready(function() {

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 상단메뉴 스크롤 고정
var nav = $('header');
$(window).scroll(function() {
  if ($(this).scrollTop() > 100) {
    nav.addClass("scroll");
  } else {
    nav.removeClass("scroll");
  }
});

// 상단메뉴 검색
$('#btn_search_o').click(function() {
  $('#search_box').show();
  $('#btn_search_c').show();
  $('#btn_search_o').hide();
});
$('#btn_search_c').click(function() {
  $('#search_box').hide();
  $('#btn_search_c').hide();
  $('#btn_search_o').show();
});


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 상품리스트 필터

$('.filter-category ul li').eq(0).show();
$('.filter-category ul li a').bind('click',function(){
  r=$('.filter-category ul li a').index($(this));
  $('.filter-category ul li').eq(r).show();
  $(this).parent().toggleClass('on');
  return false;
});

/*
$('.c_depth03>ul>li').eq(0).show();
$('.c_depth03>ul>li>a').bind('click',function(){
  r=$('.c_depth03>ul>li>a').index($(this));
  $('.c_depth03>ul>li').eq(r).show();
  $(this).parent().toggleClass('on');
  return false;
});

$('.c_depth04>ul>li').eq(0).show();
$('.c_depth04>ul>li>a').bind('click',function(){
  r=$('.c_depth04>ul>li>a').index($(this));
  $('.c_depth04>ul>li').eq(r).show();
  $(this).parent().toggleClass('on');
  return false;
});


$('.fl-goods_filter>ul>li').eq(0).show();
$('.fl-goods_filter>ul>li>a').bind('click',function(){
  r=$('.fl-goods_filter>ul>li>a').index($(this));
  $('.fl-goods_filter>ul>li').eq(r).show();
  $(this).parent().toggleClass('on');
  return false;
});
*/

// 상품리스트 필터
$('.info_box>ul>li>div .btn_open').bind('click',function(){
  r=$('.info_box>ul>li>div').index($(this));
  $(this).parent().parent().toggleClass('on').siblings().removeClass('on');
  return false;
});

// 상품상세 펼침

$('.btn_detail_more').click(function() {
  $('.detail-toggle_more').toggleClass('on');
});



////////////////////////////////////////////////////////////////////////////////////////////////////////////////







// 상단메뉴 스크롤 고정

  $('.layout-cart_list>div>button').bind('click',function(){
    r=$('.layout-cart_list>div>button').index($(this));
    $(this).parent().parent().toggleClass('on');
    return false;
  });

  $('.layout-order_list>div>button').bind('click',function(){
    r=$('.layout-order_list>div>button').index($(this));
    $(this).parent().parent().toggleClass('on');
    return false;
  });



  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //비교견적 상세화면 샘플
  $('.btn_dopen').bind('click',function(){
    r=$('.btn_dopen').index($(this));
    $(this).parent().parent().parent().parent().parent().toggleClass('open');
    return false;
  });

//비교견적 상세화면 - 보기옵션

$('.__headerOpen').bind('click',function(){
  r=$('.__headerOpen').index($(this));
  $(this).parent().parent().toggleClass('on');
  return false;
});

//전체카테고리
$('.all_cate>a').click(function() {
  $('.menu_all').addClass('open');
  return false;
});

//전체카테고리 닫기
$('.btn-allmenu_close').click(function() {
  $('.menu_all').removeClass('open');
  return false;
});

// 비교견적 상세화면 - 셀러옵션 스크롤고정
$(window).scroll(function(){
    //스크롤의 위치가 상단에서 450보다 크면
    if($(window).scrollTop() > 370){
    /* if(window.pageYOffset >= $('원하는위치의엘리먼트').offset().top){ */
        $('.__fix_seller').addClass("__fixed");
        //위의 if문에 대한 조건 만족시 fix라는 class를 부여함
    }else {
        $('.__fix_seller').removeClass("__fixed");
        //위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함
    }
});




/*
// 상품평 상세보기 이미지
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide"
  });

});
*/

// 슬라이드 - 상품후기

$(document).ready(function () {
if($('.bxslider').length >0){
	
  $('.bxslider').bxSlider({ // 클래스명 주의!
      auto: true, // 자동으로 애니메이션 시작
      speed: 500,  // 애니메이션 속도
      pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
      mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
      autoControls: true, // 시작 및 중지버튼 보여짐
      pager: true, // 페이지 표시 보여짐
      captions: true, // 이미지 위에 텍스트를 넣을 수 있음
  	});
  }
});



// 모바일 - 카테고리메뉴

$('.mobile-all_cate').click(function() {
  $('.mobile-lnb').addClass('open');
  $('.mobile-header').addClass('__m_fixed');
  return false;
});


$('.button-footer-close').click(function() {
  $('.mobile-lnb').removeClass('open');
  $('.mobile-header').removeClass('__m_fixed');
  return false;
});


$('.mobile-all_cate').click(function() {
  $('.mobile-lnb').addClass('open');
  $('.mobile-header').addClass('__m_fixed');
  return false;
});


$('.__m_fmenu01').click(function() {
  $('.mobile-lnb').addClass('open');
  $('.mobile-header').addClass('__m_fixed');
  return false;
});




// 모바일 - 카테고리메뉴

$('.mobile-lnb_drawer>ul>li .m-item a').bind('click',function(){
  r=$('.mobile-lnb_drawer>ul>li .m-item a').index($(this));
  $(this).parent().parent().toggleClass('open').siblings().removeClass('open');
  return false;
});




// 상단메뉴 스크롤 고정
/*
  var fixed = $('.fr-detail_price_box');
  var fixedoffset = $('.fr-detail_price_box').offset();

  $(window).scroll(function(){
    if( $(this).scrollTop() > fixedoffset.top){
      fixed.addClass('scroll');

    }else {
      fixed.removeClass('scroll');
    }
  });
*/


//메인 파트너 팝업창
$('.btn_partner').click(function () {
  $('#layer_pop_partner').show();
});
$('#btn-close').click(function () {
  $('#layer_pop_partner').hide();
});




	//취급카테고리 브랜드 탭 슬라이드
	var $brandCount = $('.cate_brand_slide .swiper-wrapper > div').length;
	if ($brandCount <= 5){
		/*$('.cate_brand_slide_wrap .Pbox_arrow_box').css('display', 'none');*/
		var swiperCategory = new Swiper(".cate_brand_slide", {
			speed: 500,
			watchOverflow: true,
			centerInsufficientSlides: true,
			slidesPerView: "auto",
			spaceBetween: 20
		});
	}else {
		/*$('.cate_brand_slide_wrap .Pbox_arrow_box').css('display', 'block');*/
		var swiperCategory = new Swiper(".cate_brand_slide", {
			speed: 500,
			watchOverflow: true,
			centerInsufficientSlides: true,
			slidesPerView: 9,
			spaceBetween: 20,
			slidesOffsetAfter : 180,
			navigation: {
				nextEl: ".cate_brand_slide_wrap .swiper-button-next",
				prevEl: ".cate_brand_slide_wrap .swiper-button-prev"
			}
		});
	}

	$('.cate_brand_slide_wrap').css({"opacity":"1"});
	//브랜드 버튼 on
	$('.cate_brand_slide button').click(function() {
		$('.cate_brand_slide button').removeClass('on');
		$(this).toggleClass('on');
	});

	//브랜드 버튼 on
	$('.brand_pd_slide_wrap .s_category>ul>li>a').click(function() {
		$('.brand_pd_slide_wrap .s_category>ul>li>a').parents().addClass('on').siblings().removeClass('on');
		$(this).parents().toggleClass('on');
	});
	//취급카테고리 브랜드 탭 슬라이드//

  $(".s_category>ul>li>a").click(function(){
	
	  var swiperBrandPd = new Swiper(".brand_pd_slide", {
			loop: true,
			speed: 850,
			slidesPerView: 5,
			slidesPerGroup: 7,
      //페이징
      pagination: {
        //페이지 기능
        el: '.brand_pd_slide_wrap .swiper-pagination',  //클릭 가능여부
        clickable: true,
      },
        //방향표
			navigation: {
				nextEl: ".brand_pd_slide_wrap .swiper-button-prev",
				prevEl: ".brand_pd_slide_wrap .swiper-button-next"
			}

		});
      return false;
	})

//신상품
var swiper = new Swiper('.new_pd_box .swiper-container', {
  //기본 셋팅
  //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
  direction: 'horizontal',//한번에 보여지는 페이지 숫자
  slidesPerView: 5,  //페이지와 페이지 사이의 간격
  spaceBetween: 13,  //드레그 기능 true 사용가능 false 사용불가
  debugger: false,  //마우스 휠기능 true 사용가능 false 사용불가
  mousewheel: true,  //반복 기능 true 사용가능 false 사용불가
  loop: true,  //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가 djqt
  centeredSlides: true,  // 페이지 전환효과 slidesPerView효과와 같이 사용 불가  // effect: 'fade',


  //자동 스크를링
  autoplay: {//시간 1000 이 1초
    delay: 107500,
    disableOnInteraction: false,
   },

  //페이징
  pagination: {
    //페이지 기능
    el: '.new_pd_box .swiper-pagination',  //클릭 가능여부
    clickable: true,
  },
  //방향표
  navigation: {
    nextEl: '.new_pd_box .swiper-button-next',
    prevEl: '.new_pd_box .swiper-button-prev',
  },

});




});



$(document).ready(function () {
  $('#asidemenu, .aside-content-close__btn').on('click', function () {
    if ($('.aside').hasClass('open')) {
      $('.aside').removeClass('open');
    } else {
      $('.aside').addClass('open');
    }
  });
});
  $(document).on('mouseenter', '.aside-inner', function () {
    $(this).closest('.aside').addClass('__aside-open');
  });
  $(document).on('mouseleave', '.aside', function () {
    $(this).closest('.aside').removeClass('__aside-open');
  });
/*	.on('click', '#button-aside-community', function () {
    $(location).attr("href","#");
  })
  .on('click', '#button-aside-mall', function () {
    $(location).attr("href","#");
  })*/



