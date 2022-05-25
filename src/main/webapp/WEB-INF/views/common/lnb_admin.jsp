<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/chart/core.js"></script>
<script type="text/javascript" src="/resources/js/chart/charts.js"></script>
<script type="text/javascript" src="/resources/js/chart/animated.js"></script>
<script type="text/javascript" src="/resources/js/paging.js"></script>

<div class="lnb">

  <ul class="depth01">
    <li class="home">
      <a href="index" class="home">홈</a>
      <!--<a href="#" class="btnSetting"> 환경설정</a>-->
      <!--<ul class="selecter">
        <li class="on"><a href="#">판매자</a></li>
        <li><a href="#">구매자</a></li>
      </ul>-->
    </li>
    <li class="on expandable collapsable ">
      <p class="groupTit">샵 관리</p>
      <a href="m01_1" class="order ">주문/상품</a>
      <ul class="depth02">
        <li id = "ADMIN_CHK" class="selected"><a href="/adminManager/m01_1">주문관리</a></li>
        <li id = "ADMIN_CHK" ><a href="/adminManager/m01_2">견적 및 계약관리</a></li>
        <!-- <li id = "ADMIN_CHK"><a href="/adminManager/m01_2_NEW">견적 및 계약관리_NEW(미정)</a></li> -->
        <li id = "ADMIN_CHK"><a href="/adminManager/m01_3">상품관리</a></li>
      </ul>
    </li>
    <li  id = "ADMIN_CHK"class="">
      <a href="/adminManager/m02_1" class="board">정산</a>
    </li>
    <li  id = "ADMIN_CHK"class="">
      <a href="/adminManager/m03_1" class="promotion">광고/이벤트</a>
    </li>
    <li class=" expandable collapsable ">
      <a href="/adminManager/m04_1"  class="member">회원/CS</a>
      <ul class="depth02">
        <li id = "ADMIN_CHK"><a href="/adminManager/m04_1">회원관리</a></li>
        <li id = "ADMIN_CHK"><a href="/adminManager/m04_2">운영사 게시판 관리</a></li>
        <li id = "ADMIN_CHK"><a href="/adminManager/m04_3">SELLER 게시판 관리</a></li>
      </ul>
    </li>
    <li  id = "ADMIN_CHK"class="">
      <a href="/adminManager/m05_1" class="calculate">통계</a>
    </li>
    <li  class=" expandable collapsable ">
      <a href="/adminManager/m06_1" class="Setting">환경설정</a>
      <ul class="depth02">
        <li id = "ADMIN_CHK"><a href="/adminManager/m06_1">관리자정보 관리</a></li>
        <li id = "ADMIN_CHK"><a href="/adminManager/m06_2">관리자 접속 IP설정</a></li>
        <li id = "ADMIN_CHK"><a href="/adminManager/m06_3">카테고리 관리1(없음)</a></li>
        <li id = "ADMIN_CHK"><a href="/adminManager/m06_4">카테고리 관리2(없음)</a></li>
        <li id = "ADMIN_CHK"><a href="/adminManager/m06_5">운영정책(없음)</a></li>
      </ul>
    </li>
  </ul>
</div>

<div id = "popup_warp"></div><!--  팝업 WINDOW 유동적으로 동작시킨다 -->
<div id = "popup_sub_warp"></div><!--  팝업 WINDOW 유동적으로 동작시킨다 -->

<script>

	$(document).ready(function(){
		
		var url_chk = $(location).attr('pathname')+""+$(location).attr('search');
		
		$("li[id=ADMIN_CHK]").each(function(){
			
			$(this).removeClass('selected');
			
			var url_link = $(this).children('a').attr('href');
			
			if( url_chk == url_link )
			{
				$(this).addClass('selected');
			}
			
		});
		
	});
	
	
	function fn_getExcelCreate( _obj )
	{
		var _table = $('.table_box');
		
		var _table_h = $(_table).find('thead');
		var _table_d = $(_table).find('tbody');
		
		alert('준비중');
		
		return false;
	}


</script>
