<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<footer class="layout-footer">

  <div class="footer-top_wrap">
  
  	<form style="display: none;" id ="SEARCH_FM" name = "SEARCH_FM" method = "post" action = "/goods/goods_searchView">
		<input type = "hidden" id = "QUICK_SEARCH_TEXT_FM" name = "QUICK_SEARCH_TEXT_FM">
		<input type = "submit" value = "검색하기" style="display: none;">
	</form>
  
    <div class="footer-top">
      <div class="site-policy">
        <ul>
          <li><a href="#">회사소개</a></li>
          <li><a href="#">이용약관</a></li>
          <li><a href="#">개인정보처리방침</a></li>
          <li><a href="#">보안서버(SSL)인증</a></li>
          <li><a href="#">공정거래위원회 표준약관 </a></li>
          <li><a href="#">KCP인터넷 지불서비스</a></li>
          <li><a href="#">대한민국 B2B마켓플레이스 대상</a></li>
        </ul>
      </div>
      <div class="familysite">
        <select name="" id="">
          <option>FAMILY SITE</option>
        </select>
      </div>
    </div>
  </div>
  <div class="footer-body_wrap">
    <div class="footer-navi_area">
      <div class="navi_list">
        <ul>
          <li><a href="#">자주하는 질문</a></li>
          <li><a href="#">1:1문의</a></li>
          <li><a href="#">고객의 소리</a></li>
          <li><a href="#">대량구매</a></li>
        </ul>
      </div>
      <div class="sns_area">
        <ul>
          <li class="facebook"><a href="#">페이스북</a></li>
          <li class="twiter"><a href="#">트위터</a></li>
          <li class="insta"><a href="#">인스타</a></li>
          <li class="blog"><a href="#">블로그</a></li>
        </ul>
      </div>
    </div>
    <div class="footer_body_inwrap">
      <div class="footer-body_left">
        <div class="cs-tel">
          <div class="cs-tel_row">고객센터 <a href="#">1577-0377</a></div>
          <div class="cs-tiem_info"><em>T</em> 1577-0377 <em>F</em>1577-0477 <em>M</em>iffice@iffice.com <span>평일 09:00 ~ 18:00</span> / <span>금요일 09:00 ~ 17:00</span> <span>점심시간 12:00 ~ 13:00</span></div>
        </div>

        <div class="company-info">
          <div class="address"><em>(주)골든플랫폼</em> <em>대표이사</em> 최 건 <em>본사</em> 서울특별시 중구 마른내로 156 광희빌딩 별관 4~5층 <em>중앙 물류센터</em> 경기도 평택시 서탄면 사리길 53 <em>창원HUB</em> 경상남도 창원시 성산구 공단로 52</div>
          <div class="info">
            <em>개인정보관리 책임자</em> 홍길동 <em>사업자등록번호</em> 591-86-00892 <a href="#">사업자 확인</a> <em>통신판매업신고</em> 2018-서울중구-0350 <em>의료기기판매업신고</em> 3155<br />
            <em>건강기능식품판매업신고</em> 2009-0030260 <em>호스팅 제공자</em> 주)골든플랫폼<br />
            <em>구매안전서비스(KCP)</em> 고객님은 안전거래를 위해 현금등으로 결제시 저희 쇼핑몰에서 가입한 구매안전서비스<a href="#">서비스가입 사실 확인 </a>
          </div>
          <div class="copyright">Copyright ⓒ GoldenPlatform.Corp. All right reserved.</div>
        </div>
      </div>
      <div class="footer-body_right">
        <div class="footer-logo">GP로고</div>
        <div class="footer-ismsp">
          <ul>
            <li><img src="/resources/images/common/footer/kisa_logo.png" alt=""></li>
            <li>[인증범위] 온라인 쇼핑몰 및 구매대행 서비스<br />
              [유효기간] 2019.05.02~2022.05.01</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</footer>
<!-- E : body -->
</div>
<!-- E : wrap -->

<div id = "popup_warp"></div><!--  팝업 WINDOW 유동적으로 동작시킨다 -->
<div id = "popup_sub_warp"></div><!--  팝업 WINDOW 유동적으로 동작시킨다 -->

<script type="text/javascript" src="/resources/js/scroll_table_script.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/TweenMax.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css">

<script>

/*
var socket = new WebSocket("ws://localhost/websocket");

socket.onopen = function (e) {
    console.log('open server!')
};

socket.onerror = function (e){
    console.log(e);
}

socket.onmessage = function (e) {
    console.log(e.data);
    let msgArea = document.querySelector('.msgArea');
    let newMsg = document.createElement('div');
    newMsg.innerText=e.data;
    msgArea.append(newMsg);
}

function sendMsg(obj) {
    //let content = document.querySelector('.content').value;
    console.log(obj);
    socket.send(obj);
}
*/

/*
var _data = "초기값";

var staticComp = {
    getData : function()
    {
        return _data;
    },
    setData : function(value)
    {
        _data = value;
    }
};
*/

/*글로벌 Popup 결과값 가져오기 */

var g_TFResultData = '';

/*글로벌 temp seq 값 */
var Temp_seq = '';

/* 사용 방법
var result = g_TFManager.popupDataLoad( id, search );
id : 각 검색 팝업 id
search : 검색어

GPIS_POPUP_LIST 테이블 참조

ID값 추가시
GPIS_PROC_POPUP_LIST 프로시저 참조

result 값으로 데이터 사용하면 가능
*/

var g_quick_search_btn_lst = [];

/* 카테고리 만들기 */
 function fn_menuOpen()
 {
	$('.menu_all').addClass('open');	//카테고리 열기
 }

 function fn_menuClose()
 {
	$('.menu_all').removeClass('open');	//카테고리 닫기
 }

 function fn_menuCateGorySearch( _categoryCode )
 {
	 var category_code = _categoryCode.substring(0,6);
	 var subCategory_code = _categoryCode;

	 var url = '/goods/category_searchView?category_code={category_code}&sub_category={subCategory_code}';
	 url = url.replace('{category_code}', category_code);
	 url = url.replace('{subCategory_code}', subCategory_code);
	 document.location.href=url;
 }

 
$(document).ready(function(){
	 
	$("#btn_search_c").on('click',function(){

		return false;

	});

	$("#QUICK_SEARCH_TEXT").on('keypress', function(e){

		if( e.keyCode == '13' )
		{
			$("#QUICK_SEARCH_TEXT").focus();
			fn_quickSearch();
		}
	});

	$.ajax({
		url : '/popup/getAllCateGoryList'
		,type : 'post'
		,dataType : 'json'
		,success : function( result )
		{
			var obj = $(".menu_all > .all_box > .gnb");
			$("obj").html('');

			var html = '';

			for( var i = 0 ; i < result.DEPTH1.length; ++i )
			{
				var item = result.DEPTH1[i];

				if( i%6 == 0 )
				{
					if( i != 0 )
					{
						html +='</ul>';
					}
					html +='<ul class="line">';
				}

				html +='<li>';
		        html +='<h3>';
		        html +='<span onclick="" style="cursor: pointer;">' + item.CATEGORY_NAME + '</span>';
		        html +='</h3>';
		        html +='<div class="depth1">';
			    html +='<div class="l_menu">';
			    html +='<ul>';

		        for ( var j = 0; j < result.DEPTH2[item.CATEGORY_CODE].length; ++j )
		        {
		        	var sub_item = result.DEPTH2[item.CATEGORY_CODE][j];

			        html +='<li>';
			        html +='<a href = "#" onclick="fn_menuCateGorySearch(' +"'"  + sub_item.CATEGORY_CODE + "'"+ ');">' + sub_item.CATEGORY_NAME + '</a>';
			        html +='</li>';
		        }

			    html +='</ul>';
		        html +='</div>';
		        html +='</div>';
		        html +='</li>';

		        if( i == ( result.DEPTH1.length - 1 ) )
		        {
		        	html +='</ul>';
		        }
			}
			$(obj).html( html );
			
			//index 페이지 일때만 index 상품추천 표시
			var link = document.location.pathname;
			if(link == '/' || link == '/index'){
				create_weconn_category(result);
			}
		}
	});

});

var g_TFManager = {

		popupWindow : function( id, _function, depth )
		{
			$.ajax({
				url : '/popup/PopupWindow'
				,dataType : 'html'
				,async: false
				,data :
				{
					'id' : id
					,'depth' : depth
					,'callBackFunction' : _function
				}
				,success : function( dom )
				{
					if( depth == '1' )
					{
						$("#popup_warp").html(dom);
					}
					else if( depth == '2' )
					{
						$("#popup_sub_warp").html(dom);
					}
				}
			});
		}
		,popupSearchWindow : function( param,  _function )
		{
			$.ajax({
				url : '/popup/PopupSearchWindow'
				,dataType : 'html'
				,data :
				{
					'id' : param['id']
					,'search' : param['search']
					,'depth' : param['depth']
					,'callBackFunction' : _function
				}
				,success : function( dom )
				{
					if( param['depth'] == '1' )
					{
						$("#popup_warp").html(dom);
					}
					else if( param['depth'] == '2' )
					{
						$("#popup_sub_warp").html(dom);
					}
				}
			});
		}
		,popupDataLoad : function ( searchId,searchParam )
		{
			this.popupAjaxData(searchId,searchParam);
			return g_TFResultData;
		}
		,popupAjaxData : function( searchId, searchParam)
		{
			$.ajax({
				url : '/popup/getPopup'
				,type : 'post'
				,data :
				{
					searchId : searchId
					,searchParam : searchParam
				}
				,dataType : 'json'
				,async: false
				,success : function( result ) {
					g_TFResultData =  result;
				}
			});

		}
		,excelDown : function ( _excelH, _data )
		{
			$.ajax({
				url : '/popup/createExcel'
				,type : 'post'
				,data :
				{
					'excelH' : _excelH
					,'excelDetail' : JSON.stringify( _data )
				}
				,success : function( result  )
				{
					location.href = '/popup/downloadExcel?fileName=' + result;
				}
			});
		}
		,close : function ( _depth )
		{
			if( _depth == 1 )
			{
				$('#popup_warp').html('');
			}
			else( _depth == 2 )
			{
				$('#popup_sub_warp').html('');
			}
		}
		,comma(str)
		{
	        str = String(str);
	        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	    }
		,getDelivery( _goodsList )
		{
			var delivery_day = {};

			$.ajax({
				url : '/popup/createDelivery'	//배송예정일 계산하기
				,type : 'post'
				,data :
				{
					'goodsList' : JSON.stringify( _goodsList )
				}
				,dataType : 'json'
				,async: false
				,success : function( result  )
				{
					delivery_day = result;
				}
			});

			return delivery_day;
		}
		,getItemUnitDeliveryPrice( _item_no, _cnt )		// 상품에 대한 판매가와 배송비를 가져온다
		{
			var jsonResult;

			$.ajax({
				url : '/popup/getItemUnitDeliveryPrice'
				,type : 'post'
				,data :
				{
					'ITEM_NO' : _item_no
					,'CNT' : _cnt
				}
				,dataType : 'json'
				,async: false
				,success : function( result ) {
					jsonResult = result;
				}
			});

			return jsonResult;
		}
		//붙일 ID, 게시판 글 총개수, 게시판 글자카운팅, 페이징 개수출력, 몇번째 페이지, 클릭시 호춣
		,makePageList( _id, _toTalCnt, _maxDataList, _pageListSize, _movePage, fn_nm )
		{
			var _obj = $('#' + _id);

			if(  $( _obj ).children().length != 0 )	//자식이 있으면 굳이 다시 새롭게 그리지 않는다
				return;


    		var html = '';
    		var pageTotal = Math.ceil( _toTalCnt/_maxDataList ); // 100/5/10 = 2
    		var maxPage = Math.ceil( pageTotal/_pageListSize );

    		_movePage -=1;

    		if( _movePage < 0 )
    		{
    			return false;
    		}
    		else if( _movePage >= maxPage )
    		{
    			return false;
    		}

    		$(_obj).html('');

    		html +='<a href="#" class="pagination_first" onclick = "return g_TFManager.pageMove(1,this);"> <span class="blind">처음 목록</span> </a>';
    		html +='<a href="#" class="pagination_previous"  onclick="return g_TFManager.pageMove(' + ( _movePage  ) + ', this);"> <span class="blind">이전 페이지 목록</span> </a>';
    		html +='<ul class="pagination-list" data-nowpage="1" data-fn_name= "' + fn_nm + '"  data-totalcnt = "' + _toTalCnt + '" data-max_dataList = "' + _maxDataList + '" data-pageList="' + _pageListSize + '">';

    		for( var i = 0 ; i < _pageListSize; ++i )
			{
				var page = _movePage  *  _pageListSize + ( i  + 1 );

				if( page > pageTotal )
					break;

				if( page == ( _movePage + 1 ) )
				{
					html +='<li class="on">';
				}
				else
				{
					html +='<li class="off">';
				}

				html +='<a href="#" class="pagination_link" data-page="'+ page +'"  onclick = "' + fn_nm + '(' + page + ');g_TFManager.selectedPage(this);return false;">';
    			html +=page;
    			html +='</a>';
    			html +='</li>';
			}
    		html +='</ul>';

    		html +='<a href="#" class="pagination_next"onclick="return g_TFManager.pageMove(' + ( _movePage + 2 ) + ',this);"><span class="blind">다음 페이지 목록</span> </a>';
    		html +='<a href="#" class="pagination_last" onclick ="return g_TFManager.pageMove(' + maxPage + ',this);"> <span class="blind">마지막 목록</span> </a>';

    		$(_obj).append( html );

    		return;
		}
		,pageMove( _page, _obj )
		{
			var ul = $(_obj).parent().find('ul');

			var toTalCnt = $(ul).data('totalcnt');
			var maxDataLength = $(ul).data('max_datalist');
			var pageList =  $(ul).data('pagelist');
			var fn_nm =  $(ul).data('fn_name');

			var pageTotal = Math.ceil( toTalCnt/maxDataLength ); //100 /5 = 20 PAGE
    		var maxPage = Math.ceil( pageTotal/pageList );			 // 20/6 = 4 PAGE

    		_page -= 1;

    		var classNm = $(_obj).attr('class');

    		var nowPage = $(ul).data('nowpage');

    		if( _page < 0 )
    		{
    			return false;
    		}
    		else if( _page > maxPage  - 1 )
    		{
    			return false;
    		}

    		if( _page > maxPage  - 2 )
    		{
    			$(_obj).parent().find('.pagination_last').attr('onclick', 'return g_TFManager.pageMove(' + ( maxPage + 1 ) + ',this);');
    		}
    		else
    		{
    			$(_obj).parent().find('.pagination_last').attr('onclick', 'return g_TFManager.pageMove(' + ( maxPage ) + ',this);');
    		}

    		var html = '';

    		for( var i = 0 ; i < pageList; ++i )
			{
				var page = _page  *  pageList + ( i  + 1 );

				if( page > pageTotal )
					break;

				if( nowPage == page )
				{
					html +='<li class="on">';
				}
				else
				{
					html +='<li class="off">';
				}


				html +='<a href="#" class="pagination_link" data-page="'+ page +'"  onclick = "' + fn_nm + '(' + page + ');g_TFManager.selectedPage(this);return false;">';
    			html +=page;
    			html +='</a>';
    			html +='</li>';
			}

    		$(ul).html(html);
    		$(_obj).parent().find('.pagination_previous').attr('onclick', 'return g_TFManager.pageMove(' + ( _page  ) + ', this);');
    		$(_obj).parent().find('.pagination_next').attr('onclick', 'return g_TFManager.pageMove(' + ( _page + 2 ) + ',this);');

    		return false;
		}
		,selectedPage( _obj )
		{
			var page = $(_obj).data('page');
			var parent = $(_obj).parent().parent(); //ul;

			$(parent).data('nowpage', page );

			$(parent).children().each(function(){

				$(this).attr('class','off');

			});

			$(_obj).parent().attr('class','on');
		}
		,setDate( _id )
		{
			$('#' + _id ).datepicker({

						dateFormat : 'yy-mm-dd' //달력 날짜 형태
						,showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
						,showMonthAfterYear : true // 월- 년 순서가아닌 년도 - 월 순서
						,changeYear : true //option값 년 선택 가능
						,changeMonth : true //option값  월 선택 가능
						,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
						//,buttonImage: "/resources/images/calendar/calendar.gif" //버튼 이미지 경로
						//,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
						,buttonText : "" //버튼 호버 텍스트
						,yearSuffix : "년" //달력의 년도 부분 뒤 텍스트
						,monthNamesShort : [ '1월', '2월', '3월', '4월',
								'5월', '6월', '7월', '8월', '9월',
								'10월', '11월', '12월' ] //달력의 월 부분 텍스트
						,monthNames : [ '1월', '2월', '3월', '4월',
								'5월', '6월', '7월', '8월', '9월',
								'10월', '11월', '12월' ] //달력의 월 부분 Tooltip
						,dayNamesMin : [ '일', '월', '화', '수', '목',
								'금', '토' ] //달력의 요일 텍스트
						,dayNames : [ '일요일', '월요일', '화요일', '수요일',
								'목요일', '금요일', '토요일' ] //달력의 요일 Tooltip
						,minDate : "-2Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
						,maxDate : "2y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
					}).datepicker("setDate", new Date());//

		}
		,getAutoSearchKeyword( _searchWord )	//자동완성
		{
			var autokeyword = "";

			$.ajax({
				url : 'http://10.10.100.129:5001/extensions/GoodsExtension'
				,type : 'get'
				,data :
				{
					'searchWord' : _searchWord
					,'type' : 'smartmaker'
				}
				,dataType : 'json'
				,async: false
				,success : function ( result )
				{
					autokeyword = result.resultSet.result[0].resultDocuments;
				}
			});

			return autokeyword;
		}
		,getInsaSearchKeyword( )	//인기 검색어
		{
			var insakeyword = "";

			$.ajax({
				url : 'http://10.10.100.129:5001/extensions/GoodsExtension'
				,type : 'get'
				,data :
				{
					'type' : 'trend'
				}
				,dataType : 'json'
				,async: false
				,success : function ( result )
				{
					insakeyword = result.resultSet.result[0].resultDocuments;
				}
			});

			return insakeyword;
		}
}


function fn_quickSearch()
{
	var DESCRIPTION = $.trim( $("#QUICK_SEARCH_TEXT").val()) == '' ? '' :  $.trim( $("#QUICK_SEARCH_TEXT").val());
	$('#QUICK_SEARCH_TEXT_FM').val(DESCRIPTION);
	$('#SEARCH_FM').submit();
	return false;
}

function fn_viewSearch()
{
	var html = '';

	for( var i = 0; i < g_quick_search_btn_lst.length; ++i )
	{
		html += '<li>';
		html +='<a href = "#" onclick ="return fn_quickSetSearch(' + "'" + g_quick_search_btn_lst[i]  + "'" + ');">' + g_quick_search_btn_lst[i].replace(/,/gi,' #')  +'</a>';
		html += '<li>';
	}
	
	$('#QUICK_SEARCH_BTN').html(html);
	/* $(html).appendTo("#QUICK_SEARCH_BTN").show(
			"slide", {direction: "down"},
			"3000"
	); */
	return false;
}

function fn_quickSetSearch( _search )
{
	$("#QUICK_SEARCH_TEXT").val(_search);
	fn_quickSearch();
}

function openMessage(obj){

	$.ajax({
 	   url: '/messageAlready?obj='+obj,
 	   type : 'POST',
 	   success : function(data){
 		  console.log(data);
 		  window.open('/message_list','win0','width=1002,height=700,status=no,toolbar=no,scrollbars=no,location=no,menubar=no');
 	   },
 	   fail: function(e){
 	       console.log("fail")
 	   }
   });// end ajax

}


</script>


</body>
</html>
