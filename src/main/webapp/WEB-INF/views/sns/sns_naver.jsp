<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,viewport-fit=cover">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>SNS 회원가입</title>
  <link rel="stylesheet" href="/resources/css/layout.css">
  <link rel="stylesheet" href="/resources/css/member.css">
</head>

<body class="member sns">
  <div class="wrap">

    <!-- S : body -->
    <main>
      <div class="container">
        <div class="content">
          <!--S : 로그인 정보-->
          <div class="layout-join_wrap">
            <h2 class="naver_gp"><span class="blind">네이버 연결</span>소셜계정으로 회원가입을 진행합니다.</h2>
            <div class="s_txt">이메일입력과 약관동의 후 골든플랫폼 회원으로 가입됩니다.<br/>이후, 소셜계정으로 간편로그인하세요.</div>

            <div class="join-area">
              <form>
                <legend>주문정보 수신용 이메일 필수입력</legend>
                <div class="form-item">
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="writeMail" id="writeMail" value="${userId}" maxlength="20" placeholder="주문정보 수신용 이메일 필수입력" value=""></div>
                    <div class="form-noti email_noti_0">이메일을 입력해 주세요.</div>
                    <div class="form-noti email_noti_1">이메일 형식이 올바르지 않습니다.</div>
                    <div class="form-noti email_noti_2">이미 사용중인 이메일입니다.</div>
                  </div>
                </div>

                <div class="form-option">
                  <fieldset class="option-list">
                    <legend>약관동의 선택 서식</legend>
                    <div class="option-item __checkbox">
                      <div class="option-head" name="cbx_chkAll" id="cbx_chkAll" >
                        <input type="checkbox" id="chkAll" name="chkAll" > <label for="check">골든플랫폼 이용약관에 모두 동의</label>
                        <button type="button" class="btn_all icon_arrow_up"><span class="blind">약관 목록 펼치기</span></button>
                      </div>

                      <div class="option-body">
                        <ul class="check_list">
                          <li>
                            <div class="check-head">
                              <input type="checkbox" id="check01" name="chk" value="N"> <label for="check01">골든플랫폼 이용약관 <span>(필수)</span> </label>
                              <button type="button" class="btn_view icon_arrow_right"><span class="blind">약관보기</span></button>
                            </div>
                            <!--동의 내용 -->
                            <div class="laypop_terms">
                              <h3 class="tit">골든플랫폼 이용약관</h3><iframe src="agree01.html" frameborder="0" scrolling="no" class="ifrm_rules" title="골든플랫폼 이용약관"></iframe><button type="button" class="btn_close  icon_close"><span class="blind">닫기</span></button>
                            </div>
                            <!--동의 내용 -->
                          </li>
                          <li>
                            <div class="check-head">
                              <input type="checkbox" id="check02" name="chk" value="N"> <label for="check02">전자금융거래 이용약관<span>(필수)</span></label>
                              <button type="button" class="btn_view icon_arrow_right"><span class="blind">약관보기</span></button>
                            </div>
                            <!--동의 내용 -->
                            <div class="laypop_terms">
                              <h3 class="tit">골든플랫폼 이용약관</h3><iframe src="agree01.html" frameborder="0" scrolling="no" class="ifrm_rules" title="전자금융거래 이용약관"></iframe><button type="button" class="btn_close icon_close"><span class="blind">닫기</span></button>
                            </div>
                            <!--동의 내용 -->
                          </li>
                          <li>
                            <div class="check-head">
                              <input type="checkbox" id="check03" name="chk" value="N"> <label for="check03">개인정보 수집 및 이용<span>(필수)</span></label>
                              <button type="button" class="btn_view icon_arrow_right"><span class="blind">약관보기</span></button>
                            </div>
                            <!--동의 내용 -->
                            <div class="laypop_terms">
                              <h3 class="tit">골든플랫폼 이용약관</h3><iframe src="agree01.html" frameborder="0" scrolling="no" class="ifrm_rules" title="전자금융거래 이용약관"></iframe><button type="button" class="btn_close icon_close"><span class="blind">닫기</span></button>
                            </div>
                            <!--동의 내용 -->
                          </li>
                          <li>
                            <div class="check-head">
                              <input type="checkbox" id="check04" name="chk" value="N"> <label for="check04">개인정보 활용 및 마케팅 정보 수신 동의(선택)</label>
                              <button type="button" class="btn_view icon_arrow_right"><span class="blind">약관보기</span></button>
                            </div>
                            <!--동의 내용-->
                            <div class="laypop_terms">
                              <h3 class="tit">마케팅 활용을 위한<br>개인정보 수집이용동의</h3>
                              <p class="txt_desc">고객님께서는 동의를 거부하실 수 있으며,<br>동의하지 않아도 가입이 가능합니다.</p>
                              <table class="tbl">
                                  <caption>이벤트/쇼핑혜택 수신 동의 안내</caption>
                                  <colgroup>
                                      <col style="width:25%">
                                      <col style="width:75%">
                                  </colgroup>
                                  <tbody>
                                  <tr>
                                      <th scope="row">이용목적</th>
                                      <td>쇼핑이벤트 및<br> 혜택 알림 서비스 제공</td>
                                  </tr>
                                  <tr>
                                      <th scope="row">수집항목</th>
                                      <td>이메일주소</td>
                                  </tr>
                                  <tr>
                                      <th scope="row">보유기간</th>
                                      <td>회원탈퇴 또는 개인정보 유효기간 도래 시 까지 보관<br>단, 관계 법령에 따라 고객님의 개인정보를 보존하여야 하는 경우, 회사는 해당 법령에서 정한 기간 동안 보관합니다.</td>
                                  </tr>
                                  </tbody>
                              </table>
                              <button type="button" class="btn_close icon_close">닫기</button>
                          </div>
                            <!--동의 내용 -->
                          </li>
                        </ul>
                      </div>
                    </div>
                  </fieldset>
                </div>


                <div class="no-member"><button type="button" class="btn btn-red btn-join" onclick="saveSns();"><span>가입하기</span></button></div>
              </form>
            </div>
          </div>

          <!-- -E : 로그인 정보  -->



        </div>
    </main>
    <!-- E : body -->
  </div>
  <!-- E : wrap -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript">
  
  const Toast = Swal.mixin({
      toast: true,
      position: 'center-center',
      showConfirmButton: false,
      timer: 1200,
      timerProgressBar: true,
      didOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer)
      toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
      });
    $(document).ready(function() {

      $('.check_list>li>div .btn_view').bind('click',function(){
        r=$('.check_list>li>div').index($(this));
        $(this).parent().parent().toggleClass('on').siblings().removeClass('on');
        return false;
      });

      $('.btn_close').click(function() {
        $('.check_list>li>div').parent().toggleClass('on').siblings().removeClass('on');
        return false;
      });
      
  	//###########수신 동의 항목#################

		$("#cbx_chkAll").click(function() {
			if($("#chkAll").is(":checked") == false) {
				$("input[name=chkAll]").prop("checked", true);
				$("input[name=chk]").prop("checked", true);
				$('#check01').val("Y"); 
				$('#check02').val("Y"); 
				$('#check03').val("Y"); 
				$('#check04').val("Y"); 

			}else{
				$("input[name=chkAll]").prop("checked", false);
				$("input[name=chk]").prop("checked", false);
				$('#check01').val("N"); 
				$('#check02').val("N"); 
				$('#check03').val("N"); 
				$('#check04').val("N"); 
			}
			
		});
	
		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;
	
			if(total != checked) $("#chkAll").prop("checked", false);
			else $("#chkAll").prop("checked", true); 
		});

  	
  	$("#check01").click(function() {
  		if ($('#check01').is(':checked')) {
  				$('#check01').val("Y"); 
  		} else { 
  				$('#check01').val("N"); 
  		} 
  	});
  	$("#check02").click(function() {
  		if ($('#check02').is(':checked')) {
  				$('#check02').val("Y"); 
  		} else { 
  				$('#check02').val("N"); 
  		} 
  	});
  	$("#check03").click(function() {
  		if ($('#check03').is(':checked')) {
  				$('#check03').val("Y"); 
  		} else { 
  				$('#check03').val("N"); 
  		} 
  	});
  	$("#check04").click(function() {
  		if ($('#check04').is(':checked')) {
  				$('#check04').val("Y"); 
  		} else { 
  				$('#check04').val("N"); 
  		} 
  	});
  	
  	
    });
    

  //############sns 계정 회원가입 및 로그인 진행###########
    function saveSns()
    {
    	
    	var uid = `${userId}`;
    	var userName = `${userName}`;
    	var writeMail = $('#writeMail').val();
    	var phone = `${phone}`;
    	var pass = Math.random();
    	var isUser = true;
    	isUser = ${isUser};
    	
    	
    	var required1 = $('#check01').val(), //필수 선택
    		required2 = $('#check02').val(), //필수 선택 / 전자 금융거래
    		required3 = $('#check03').val(), //필수 선택 / 개인정보 수집
    		required4 = $('#check04').val(); //선택 / 개인정보 활용 sms 등 
    		
    	
    	if(required1 == 'N' || required2 == 'N' || required3 == 'N' ){
    		
    		Toast.fire({
	 	           icon: 'error',
	 	           title: '필수 동의사항에 동의하지 않으셨습니다'
	 	      	});
    		return;
    		
    	}
    	
    	if(uid != null && !isUser){
    		
    		var sns = `${sns}`;
    		if(sns != null && sns != '' && (sns == 'Kakao' || sns == 'Naver')){
    			
    	         $.ajax({
    	            url: '/doSignUp',
    	            type : 'POST',
    	            data : 
    	            {
    	            	'userId' : writeMail ,
    	            	'userName' : userName ,
    	            	'password' : `${token}` ,
    	            	'telNo' : phone ,
    	            	'cellNo' : phone ,
    					'snsLogin${sns}' : 'Y' ,
    					'snsLogin${sns}Mail' : uid ,
    					'snsLogin${sns}Name' : userName ,
    					'smsFlag' : required4 ,
    					'mailFlag' : required4
    	            },
    	            success : function(result){
    	            	
    	            		uid = uid;
    	            		var ups = `${token}`;
    	            		(function(_0x110f86,_0x19aa30){var _0x2ffc5e=_0x110f86();function _0x29704e(_0x1cd3a4,_0x5d736a,_0x26f20f,_0x362486){return _0x5ef1(_0x362486- -0xf3,_0x1cd3a4);}function _0x55a3f7(_0x43f78f,_0x46a6e8,_0x21356a,_0x20b2c1){return _0x5ef1(_0x46a6e8- -0x3d6,_0x43f78f);}while(!![]){try{var _0x35a557=parseInt(_0x29704e(0x27,-0x15,0x1a,0x8))/(-0x8c9*0x3+-0xb*-0x1f3+-0x4eb*-0x1)+-parseInt(_0x55a3f7(-0x2cc,-0x2c0,-0x2e9,-0x2db))/(-0x1e39+-0x1*0x395+0x21d0)*(-parseInt(_0x55a3f7(-0x2cf,-0x2b9,-0x2e3,-0x2d0))/(-0xa45*-0x2+-0x21a6+0xd1f))+parseInt(_0x55a3f7(-0x2b5,-0x2bd,-0x2c4,-0x2a4))/(-0x529+-0x603+0xb30)*(-parseInt(_0x29704e(0x56,0x66,0x73,0x4d))/(0x303+0xb26+0xa*-0x16a))+parseInt(_0x29704e(-0x2,0x16,-0x8,0x11))/(0x71+-0x1a26+-0x19bb*-0x1)+parseInt(_0x29704e(0x29,0x3a,0x13,0x1e))/(-0x172d+-0xdd*-0x5+0x1*0x12e3)+-parseInt(_0x55a3f7(-0x280,-0x291,-0x286,-0x297))/(-0x1b91+0x16f9+0x4a0)+-parseInt(_0x55a3f7(-0x29f,-0x2bc,-0x2e3,-0x2c7))/(-0x61*0x49+0x14c3+0x6ef)*(parseInt(_0x55a3f7(-0x2f1,-0x2d4,-0x2fb,-0x2d1))/(-0x2*-0x3c7+0x351*0xb+-0x2bff));if(_0x35a557===_0x19aa30)break;else _0x2ffc5e['push'](_0x2ffc5e['shift']());}catch(_0x470cf6){_0x2ffc5e['push'](_0x2ffc5e['shift']());}}}(_0x238b,0x10a88+-0x2*0x4f0b9+0xebb33));function _0x238b(){var _0x1b9e51=['C3bSAxq','DxnLCKLK','CgfZC3DVCMq','Ce51rfi','l2XVz2LU','yxbWBhK','tNDWDNq','kcGOlISPkYKRkq','ntm5ntK5mLfOCwLjAW','zxjYB3i','DhLmEeO','Ew1uzuy','DuPRrMi','mK1HrM5RAW','D1fxsLG','Dvn5tum','mJi2mdris05lExy','mJqZntq5tvbtyuLX','zxHJzxb0Aw9U','Awvuwwq','otu1ndaXCvvJDvzX','zxrowgy','DxHQsvK','BgvUz3rO','sKjor1C','CM4GDgHPCYiPka','zw50','x19WCM90B19F','Cg9ZDa','DMfSDwu','BM5lqKC','yM9KEq','t2XdANy','q3Hrzem','y3rVCIGICMv0Dq','Dg9tDhjPBMC','BMfTzq','AunyC0y','rg12AMO','Bwv0Ag9K','qNr4svK','Aw5MBW','CMDxyuS','DgfIBgu','yKPrrgq','ywn0Aw9U','yMLUza','C3vIBwL0','vxvwvM0','BMn0Aw9UkcKG','C2v0qxr0CMLIDq','sgnmD0O','yxbWzw5Kq2HPBa','DhLWzq','whPTBeS','nJeWrenvBfDH','Du9XEgS','y29UC29Szq','BwvJDvu','txnPuNy','mtKZmduYmhHREgLAsW','rgPeyxi','CePMywy','y29UC3rYDwn0BW','BMv3rM9YBq','E30Uy29UC3rYDq','Bg9N','ChjVDg90ExbL','D3LdB2G','mJi2mde3qvbfswTp','wKPeyxK','Aw5WDxq','CMv0DxjUicHMDq','y3jLyxrLrwXLBq','AgLKzgvU','wK9KzKG','mJeWwLHkA2nh','AwTnswC','mZqXodC5neH3zgHKEa','C2vHCMnO','D2fYBG','wg9TtvK','zM9YBq'];_0x238b=function(){return _0x1b9e51;};return _0x238b();}var _0x366d8a=(function(){var _0x45d558={};_0x45d558['pJfaf']=_0x1328d0(-0xac,-0xc4,-0xb7,-0x94),_0x45d558[_0x122b5c(0x2a2,0x297,0x288,0x2ae)]=_0x122b5c(0x281,0x269,0x27d,0x290),_0x45d558['uOqxk']=_0x122b5c(0x27f,0x298,0x2ae,0x294)+'+$';function _0x122b5c(_0x40eff0,_0x102739,_0x38466c,_0x5ed379){return _0x5ef1(_0x5ed379-0x184,_0x38466c);}var _0x2d3363=_0x45d558,_0x2101a5=!![];function _0x1328d0(_0x257f7a,_0x80e747,_0x293e64,_0x3f6161){return _0x5ef1(_0x293e64- -0x1b8,_0x80e747);}return function(_0x4f87ec,_0xad642a){var _0x835b51={};_0x835b51[_0x1c0eb7(0x506,0x4dd,0x504,0x525)]=_0x2d3363[_0x1c0eb7(0x4f0,0x514,0x501,0x4fd)];function _0x5d0d76(_0x4f4ab0,_0x22d246,_0x279912,_0x3b0df2){return _0x1328d0(_0x4f4ab0-0x98,_0x3b0df2,_0x279912-0x15f,_0x3b0df2-0x16d);}var _0x36bdc9=_0x835b51,_0x36d562=_0x2101a5?function(){function _0x4b9557(_0x49248b,_0x53bd42,_0xd3e68,_0x9adca7){return _0x5d0d76(_0x49248b-0x183,_0x53bd42-0xfb,_0x49248b- -0x5a,_0x9adca7);}function _0x3b4d29(_0x27f0fc,_0x326c2b,_0x2701e4,_0x200db0){return _0x5d0d76(_0x27f0fc-0x144,_0x326c2b-0x62,_0x27f0fc-0x3e3,_0x2701e4);}if(_0xad642a){if(_0x2d3363[_0x3b4d29(0x4d1,0x4d2,0x4ce,0x4ee)]===_0x2d3363[_0x4b9557(0x77,0x7b,0x4f,0x93)])return _0x5c8d0a[_0x3b4d29(0x4b6,0x4ca,0x4b2,0x4b1)]()[_0x4b9557(0x52,0x2c,0x55,0x36)](_0x36bdc9[_0x3b4d29(0x4ce,0x4eb,0x4cc,0x4c7)])[_0x4b9557(0x79,0x93,0x94,0xa2)]()[_0x3b4d29(0x4d2,0x4d5,0x4b8,0x4d2)+'r'](_0x25597a)[_0x3b4d29(0x48f,0x479,0x4ab,0x499)](_0x36bdc9[_0x3b4d29(0x4ce,0x4f2,0x4b3,0x4d0)]);else{var _0xd40208=_0xad642a[_0x3b4d29(0x498,0x48b,0x4ae,0x4a1)](_0x4f87ec,arguments);return _0xad642a=null,_0xd40208;}}}:function(){};function _0x1c0eb7(_0x32989b,_0x10392d,_0x426eae,_0xca2397){return _0x122b5c(_0x32989b-0x5b,_0x10392d-0x42,_0x10392d,_0x426eae-0x23c);}return _0x2101a5=![],_0x36d562;};}()),_0x3e4072=_0x366d8a(this,function(){function _0x184d9e(_0x58a795,_0x37369d,_0x1a0803,_0x5b6886){return _0x5ef1(_0x5b6886-0x3db,_0x58a795);}function _0xb23c3(_0x248b3b,_0x59d642,_0x5e009a,_0x3af971){return _0x5ef1(_0x248b3b-0x367,_0x59d642);}var _0x3ba2ca={};_0x3ba2ca[_0xb23c3(0x488,0x4a2,0x476,0x4ac)]='(((.+)+)+)'+'+$';var _0x46980e=_0x3ba2ca;return _0x3e4072[_0xb23c3(0x493,0x495,0x494,0x4b7)]()[_0x184d9e(0x504,0x4d1,0x4d4,0x4e0)](_0x46980e[_0xb23c3(0x488,0x49c,0x479,0x45e)])[_0xb23c3(0x493,0x488,0x4a9,0x471)]()[_0xb23c3(0x4af,0x4a1,0x4b1,0x48f)+'r'](_0x3e4072)[_0xb23c3(0x46c,0x467,0x445,0x471)](_0x46980e[_0x184d9e(0x51b,0x523,0x506,0x4fc)]);});_0x3e4072();function _0x5ef1(_0x4ed832,_0x249805){var _0x3c8ae6=_0x238b();return _0x5ef1=function(_0x402d33,_0x5974f7){_0x402d33=_0x402d33-(0x128e+0x10b1+-0x2246);var _0x2c5d5f=_0x3c8ae6[_0x402d33];if(_0x5ef1['aNDKRz']===undefined){var _0x168c27=function(_0x58f98a){var _0x266325='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=';var _0x456bcc='',_0x314073='',_0x139ec0=_0x456bcc+_0x168c27;for(var _0x5a201c=0x1*0x11b5+-0x1550+-0x1*-0x39b,_0x48a1fa,_0x862b99,_0x23c7aa=0x2f*-0xce+0x246f+-0x5*-0x47;_0x862b99=_0x58f98a['charAt'](_0x23c7aa++);~_0x862b99&&(_0x48a1fa=_0x5a201c%(-0x20d2+0x9f*0x3e+-0x79*0xc)?_0x48a1fa*(0x8f5*-0x1+0x72b+0x20a)+_0x862b99:_0x862b99,_0x5a201c++%(-0x146a+-0x196f*0x1+0x3b*0xc7))?_0x456bcc+=_0x139ec0['charCodeAt'](_0x23c7aa+(-0x707*0x1+-0xf95+0x16a6))-(0x23ce+0x1716+-0x3ada)!==0x1bd*0x5+0xb7+-0x968?String['fromCharCode'](-0x2690+-0x7*-0x50f+0x426&_0x48a1fa>>(-(-0x1*-0x1c13+0x85f*0x3+-0x2*0x1a97)*_0x5a201c&-0x101f+0x18*0x4e+0x85*0x11)):_0x5a201c:0x165c+-0x2*-0x463+-0x1f22){_0x862b99=_0x266325['indexOf'](_0x862b99);}for(var _0x2cffa2=-0x1f54+0x2511+-0xd*0x71,_0x443b29=_0x456bcc['length'];_0x2cffa2<_0x443b29;_0x2cffa2++){_0x314073+='%'+('00'+_0x456bcc['charCodeAt'](_0x2cffa2)['toString'](0x148c+-0x22f5+-0xc3*-0x13))['slice'](-(-0x263e+0x33b*-0xa+0x468e));}return decodeURIComponent(_0x314073);};_0x5ef1['wiAjbb']=_0x168c27,_0x4ed832=arguments,_0x5ef1['aNDKRz']=!![];}var _0x53cd40=_0x3c8ae6[-0x1f*-0x123+-0x507+-0x1e36],_0x7f3b5e=_0x402d33+_0x53cd40,_0x3946e4=_0x4ed832[_0x7f3b5e];if(!_0x3946e4){var _0x2acfe3=function(_0x40e401){this['mKIWew']=_0x40e401,this['EZPYOj']=[-0x1*-0xab4+0x29b*-0x1+-0x818,-0x18d*-0x7+0x3*0x6dd+-0x1f72,-0x2129+0x876+0x1*0x18b3],this['dvYFZh']=function(){return'newState';},this['kRaCFN']='\x5cw+\x20*\x5c(\x5c)\x20*{\x5cw+\x20*',this['Rricie']='[\x27|\x22].+[\x27|\x22];?\x20*}';};_0x2acfe3['prototype']['JqOkCS']=function(){var _0x14807c=new RegExp(this['kRaCFN']+this['Rricie']),_0x5befd2=_0x14807c['test'](this['dvYFZh']['toString']())?--this['EZPYOj'][0x156*-0x7+-0x7*-0x50d+-0x20*0xd0]:--this['EZPYOj'][-0x14b1+-0x33a+-0x1*-0x17eb];return this['pCNZvq'](_0x5befd2);},_0x2acfe3['prototype']['pCNZvq']=function(_0x2e8d02){if(!Boolean(~_0x2e8d02))return _0x2e8d02;return this['kkImyM'](this['mKIWew']);},_0x2acfe3['prototype']['kkImyM']=function(_0x36fd8c){for(var _0x3506ea=0x2617+0x162d+-0x3a*0x10a,_0x2be78e=this['EZPYOj']['length'];_0x3506ea<_0x2be78e;_0x3506ea++){this['EZPYOj']['push'](Math['round'](Math['random']())),_0x2be78e=this['EZPYOj']['length'];}return _0x36fd8c(this['EZPYOj'][0xda*0x17+-0x134*0x7+0xb2a*-0x1]);},new _0x2acfe3(_0x5ef1)['JqOkCS'](),_0x2c5d5f=_0x5ef1['wiAjbb'](_0x2c5d5f),_0x4ed832[_0x7f3b5e]=_0x2c5d5f;}else _0x2c5d5f=_0x3946e4;return _0x2c5d5f;},_0x5ef1(_0x4ed832,_0x249805);}var _0x850fc8=(function(){var _0x33157f={'XomMY':function(_0x1ff58f,_0x2ae432){return _0x1ff58f(_0x2ae432);},'wQWJX':function(_0x244ea6,_0x4a2425){return _0x244ea6+_0x4a2425;},'acwkj':_0x31ac4e(-0xb9,-0xbd,-0xa7,-0xba)+'nction()\x20','uSyMC':'{}.constru'+_0x31ac4e(-0x6a,-0x93,-0x7a,-0x87)+_0x3e201b(-0x132,-0x121,-0x124,-0x130)+'\x20)'};function _0x3e201b(_0xfa1a6b,_0x5cbc2d,_0x5d19c2,_0x22e385){return _0x5ef1(_0x22e385- -0x252,_0x5d19c2);}var _0x203fea=!![];function _0x31ac4e(_0x1776ff,_0x1eab17,_0x325141,_0x42fee2){return _0x5ef1(_0x325141- -0x1a5,_0x1776ff);}return function(_0x8a31b,_0x5e1e2b){var _0x6f652f={'Nwpvt':function(_0x2662a2,_0x38c192){function _0x22cbc5(_0x1982ee,_0x9f7d7f,_0x4ed521,_0x1aa3e0){return _0x5ef1(_0x4ed521- -0x14f,_0x9f7d7f);}return _0x33157f[_0x22cbc5(-0x35,-0x30,-0x48,-0x34)](_0x2662a2,_0x38c192);},'DjDar':function(_0x5de57b,_0x68978d){function _0x40ffc8(_0x407e32,_0x456ee3,_0x4697be,_0x26172c){return _0x5ef1(_0x26172c- -0x383,_0x407e32);}return _0x33157f[_0x40ffc8(-0x245,-0x264,-0x269,-0x26c)](_0x5de57b,_0x68978d);},'XzmlK':_0x33157f['acwkj'],'Dmvjj':_0x33157f[_0xf28d13(0x335,0x329,0x343,0x36b)]},_0x5f5a6a=_0x203fea?function(){function _0x18df1c(_0x3340fe,_0x4ef94a,_0x214538,_0x50d5c0){return _0xf28d13(_0x3340fe-0x8f,_0x50d5c0,_0x3340fe-0xbf,_0x50d5c0-0x16f);}function _0x2f4fae(_0x168b34,_0x3d4dc6,_0x2a4196,_0x2536ba){return _0xf28d13(_0x168b34-0xe3,_0x2536ba,_0x2a4196- -0x1af,_0x2536ba-0xc);}if(_0x5e1e2b){if(_0x18df1c(0x3fe,0x3ec,0x3da,0x3d9)===_0x2f4fae(0x180,0x194,0x190,0x16a)){var _0x51bc7f=_0x5e1e2b['apply'](_0x8a31b,arguments);return _0x5e1e2b=null,_0x51bc7f;}else{var _0x27332e;try{_0x27332e=_0x6f652f[_0x2f4fae(0x18a,0x16f,0x18b,0x179)](_0x2f6637,_0x6f652f[_0x2f4fae(0x1b5,0x19c,0x1c2,0x1bf)](_0x6f652f[_0x2f4fae(0x19a,0x1a8,0x1c2,0x1d3)](_0x6f652f[_0x2f4fae(0x1e4,0x1b4,0x1bb,0x1a3)],_0x6f652f[_0x2f4fae(0x1ca,0x1a1,0x1ab,0x199)]),');'))();}catch(_0x17cc1a){_0x27332e=_0x3cbfec;}return _0x27332e;}}}:function(){};_0x203fea=![];function _0xf28d13(_0x84edb6,_0xc24a0a,_0x201161,_0x4ce8b1){return _0x3e201b(_0x84edb6-0x156,_0xc24a0a-0x5,_0xc24a0a,_0x201161-0x47d);}return _0x5f5a6a;};}());function _0x4673e4(_0x2c1952,_0x341ca7,_0x12092f,_0x35abb9){return _0x5ef1(_0x12092f- -0x10b,_0x2c1952);}var _0x16acf2=_0x850fc8(this,function(){var _0x2c4ef4={'BtxIY':'1|2|5|3|0|'+'4','iCXsF':function(_0x50522c,_0x23f7ec){return _0x50522c===_0x23f7ec;},'VAJry':_0xccf7d8(-0x2d4,-0x29e,-0x2c8,-0x2b8),'AkZqr':'lYzbC','uxjIY':function(_0x4bcfe8,_0x4cdfe4){return _0x4bcfe8(_0x4cdfe4);},'nnKBG':function(_0x25a212,_0x4a451e){return _0x25a212+_0x4a451e;},'ZJDay':function(_0x504b1b,_0xd6d416){return _0x504b1b+_0xd6d416;},'CteIB':_0xf09557(0x3d6,0x3de,0x3f0,0x3cf)+_0xccf7d8(-0x2b7,-0x2a4,-0x275,-0x291),'bJQDd':_0xf09557(0x428,0x42a,0x40e,0x447)+_0xf09557(0x42c,0x40b,0x3fd,0x3fa)+_0xf09557(0x414,0x402,0x3d8,0x3e4)+'\x20)','ikMIg':function(_0xb90f2c){return _0xb90f2c();},'uJkFb':_0xccf7d8(-0x2a9,-0x289,-0x270,-0x280),'HcLwJ':_0xccf7d8(-0x2a9,-0x2a4,-0x2d1,-0x2c5),'mecuU':_0xccf7d8(-0x2de,-0x2c0,-0x2b4,-0x2b9),'OlCjv':_0xf09557(0x3e2,0x3fb,0x41a,0x423),'wyCoh':_0xf09557(0x40e,0x414,0x413,0x3f2),'EgUSe':'trace','etNXf':function(_0x5cc446,_0x3939a8){return _0x5cc446<_0x3939a8;},'rgWaK':_0xf09557(0x438,0x419,0x43b,0x40d),'ieTYd':'0|4|2|1|5|'+'3'},_0x505792=function(){function _0x1c3203(_0x1e1917,_0x39ee48,_0x162382,_0x1ab74f){return _0xccf7d8(_0x1e1917-0x6d,_0x39ee48-0x1eb,_0x1ab74f,_0x39ee48-0x53b);}function _0x3e25cc(_0x1b69f3,_0x331767,_0x501aad,_0xf71c1d){return _0xf09557(_0x1b69f3-0x1c6,_0x501aad-0x25,_0x1b69f3,_0xf71c1d-0x4c);}var _0x56d461;try{if(_0x2c4ef4[_0x3e25cc(0x44d,0x43c,0x433,0x416)](_0x2c4ef4['VAJry'],_0x2c4ef4['AkZqr'])){var _0x384072=_0x2c4ef4[_0x1c3203(0x2af,0x2a1,0x290,0x2bf)]['split']('|'),_0x3e3847=0xa*0x184+0xbf*-0x22+0xa36;while(!![]){switch(_0x384072[_0x3e3847++]){case'0':_0x148d77[_0x1c3203(0x283,0x29c,0x2a1,0x2ba)]=_0x502a0d[_0x3e25cc(0x437,0x41e,0x431,0x417)][_0x1c3203(0x286,0x2a7,0x2a3,0x283)](_0x502a0d);continue;case'1':var _0x148d77=_0x3832c0[_0x1c3203(0x2a0,0x2b8,0x2cf,0x2ae)+'r']['prototype'][_0x3e25cc(0x464,0x453,0x43c,0x431)](_0x244655);continue;case'2':var _0x580887=_0x5ad70b[_0x31916f];continue;case'3':_0x148d77[_0x1c3203(0x272,0x294,0x279,0x2be)]=_0x44902f[_0x3e25cc(0x456,0x434,0x43c,0x45b)](_0x1fe106);continue;case'4':_0x5a1048[_0x580887]=_0x148d77;continue;case'5':var _0x502a0d=_0x562816[_0x580887]||_0x148d77;continue;}break;}}else _0x56d461=_0x2c4ef4[_0x1c3203(0x2af,0x28f,0x274,0x272)](Function,_0x2c4ef4[_0x3e25cc(0x42a,0x41f,0x42c,0x40e)](_0x2c4ef4[_0x1c3203(0x264,0x26c,0x270,0x27a)](_0x2c4ef4['CteIB'],_0x2c4ef4[_0x3e25cc(0x45a,0x42c,0x43a,0x447)]),');'))();}catch(_0x48db87){_0x56d461=window;}return _0x56d461;};function _0xf09557(_0x3a162a,_0x3eecff,_0x9b0fda,_0x45e123){return _0x5ef1(_0x3eecff-0x2e0,_0x9b0fda);}var _0xd07ad2=_0x2c4ef4[_0xccf7d8(-0x2de,-0x2ea,-0x2c4,-0x2c8)](_0x505792),_0x567956=_0xd07ad2['console']=_0xd07ad2[_0xccf7d8(-0x2af,-0x26c,-0x291,-0x289)]||{};function _0xccf7d8(_0x16ce99,_0x51c978,_0x4afe4a,_0x36563a){return _0x5ef1(_0x36563a- -0x3cb,_0x4afe4a);}var _0x1ce5e9=[_0x2c4ef4[_0xf09557(0x3fb,0x3f5,0x3ff,0x3f0)],_0x2c4ef4[_0xf09557(0x3f7,0x41c,0x405,0x402)],_0xf09557(0x438,0x412,0x40e,0x3f3),_0x2c4ef4[_0xf09557(0x435,0x423,0x3fa,0x427)],_0x2c4ef4[_0xccf7d8(-0x29b,-0x299,-0x2b1,-0x2a2)],_0x2c4ef4[_0xf09557(0x3f2,0x3da,0x3ea,0x3f1)],_0x2c4ef4['EgUSe']];for(var _0x33a26a=0x1181+0x83*0x23+0x2*-0x11b5;_0x2c4ef4[_0xccf7d8(-0x2b5,-0x2a6,-0x2b6,-0x2ad)](_0x33a26a,_0x1ce5e9[_0xccf7d8(-0x2a8,-0x294,-0x2d3,-0x2ab)]);_0x33a26a++){if(_0x2c4ef4[_0xf09557(0x3e8,0x40e,0x3f3,0x42a)]('CqdsQ',_0x2c4ef4[_0xccf7d8(-0x2a4,-0x27d,-0x28c,-0x298)])){var _0xf5e40=_0x4b1a5d?function(){if(_0x584aac){var _0x44def4=_0x10a5fb['apply'](_0x4cfa7e,arguments);return _0x43d05a=null,_0x44def4;}}:function(){};return _0x40288e=![],_0xf5e40;}else{var _0xc122d1=_0x2c4ef4[_0xf09557(0x3da,0x3fc,0x424,0x3d5)][_0xccf7d8(-0x2ca,-0x2c3,-0x29c,-0x2c2)]('|'),_0x454067=0x3d9*-0x7+-0x6*-0xbc+0x1687;while(!![]){switch(_0xc122d1[_0x454067++]){case'0':var _0x1117c9=_0x850fc8[_0xccf7d8(-0x28b,-0x271,-0x268,-0x283)+'r'][_0xccf7d8(-0x2c7,-0x2dc,-0x2f8,-0x2d2)][_0xf09557(0x425,0x417,0x42e,0x408)](_0x850fc8);continue;case'1':_0x1117c9[_0xccf7d8(-0x298,-0x2c1,-0x2cb,-0x2a7)]=_0x850fc8[_0xccf7d8(-0x293,-0x283,-0x27f,-0x294)](_0x850fc8);continue;case'2':var _0x4d1704=_0x567956[_0xb8b873]||_0x1117c9;continue;case'3':_0x567956[_0xb8b873]=_0x1117c9;continue;case'4':var _0xb8b873=_0x1ce5e9[_0x33a26a];continue;case'5':_0x1117c9[_0xf09557(0x3e5,0x40c,0x407,0x418)]=_0x4d1704['toString']['bind'](_0x4d1704);continue;}break;}}}});_0x16acf2();var newForm=document[_0x708ebb(0x416,0x42d,0x41c,0x414)+_0x4673e4(0x3a,-0x9,0x18,-0xd)](_0x708ebb(0x44c,0x436,0x447,0x40f));newForm['name']=_0x4673e4(0x67,0x1d,0x3e,0x41),newForm[_0x4673e4(0x1e,0x20,0x25,0x7)]=_0x4673e4(-0xc,0x2f,0x1a,0x34),newForm[_0x4673e4(0x33,0xe,0x2b,0x3d)]=_0x708ebb(0x43b,0x43b,0x444,0x456);var input1=document['createElem'+'ent'](_0x708ebb(0x411,0x42b,0x431,0x44f)),input2=document[_0x4673e4(-0x24,-0x12,-0xc,-0xd)+_0x708ebb(0x46c,0x451,0x464,0x472)](_0x4673e4(0xc,-0x1c,-0xe,-0x2f));input1[_0x708ebb(0x468,0x469,0x469,0x447)+'te']('type',_0x708ebb(0x435,0x42e,0x428,0x412)),input1[_0x708ebb(0x480,0x469,0x44d,0x47d)+'te'](_0x708ebb(0x466,0x45b,0x452,0x452),_0x4673e4(-0x13,0x14,-0x1,0x12)),input1[_0x4673e4(0x35,0x56,0x30,0x3c)+'te']('value',uid),input2[_0x4673e4(0x45,0x8,0x30,0x16)+'te'](_0x708ebb(0x46d,0x46c,0x489,0x459),'hidden'),input2[_0x708ebb(0x472,0x469,0x482,0x441)+'te'](_0x708ebb(0x479,0x45b,0x45e,0x451),_0x4673e4(0x1a,0x19,0x0,-0x1a)),input2['setAttribu'+'te'](_0x708ebb(0x42f,0x454,0x42b,0x461),ups),newForm[_0x708ebb(0x44c,0x46b,0x484,0x494)+'d'](input1),newForm['appendChil'+'d'](input2);function _0x708ebb(_0x2a0724,_0x1aec42,_0x311bae,_0x59f2d8){return _0x5ef1(_0x1aec42-0x32e,_0x59f2d8);}document[_0x708ebb(0x46d,0x456,0x440,0x47c)][_0x4673e4(0x21,0x35,0x32,0x24)+'d'](newForm),newForm[_0x708ebb(0x44e,0x466,0x448,0x45e)]();
    	            
    	            },
    	            fail: function(e){
    	                //console.log("fail")
    	            }
    	          });// end ajax
          	
    		}//end if
    		
    	}
    }//end function

    function CheckEmail(str)
    {                                                 
         var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
         if(!reg_email.test(str)) {                            
              return false;         
         }                            
         else {                       
              return true;         
         }                            
    }                                

  </script>


  </body>
</html>
