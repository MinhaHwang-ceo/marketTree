<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <%
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient(); 
    
    String sSiteCode = "BW319";			// NICE로부터 부여받은 사이트 코드
    String sSitePassword = "Uw8fbxDLZaOE";		// NICE로부터 부여받은 사이트 패스워드
    
    String sRequestNumber = "REQ0000000001";        	// 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 
                                                    	// 업체에서 적절하게 변경하여 쓰거나, 아래와 같이 생성한다.
    sRequestNumber = niceCheck.getRequestNO(sSiteCode);
  	session.setAttribute("REQ_SEQ" , sRequestNumber);	// 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
  	
   	String sAuthType = "M";      	// 없으면 기본 선택화면, M(휴대폰), X(인증서공통), U(공동인증서), F(금융인증서), S(PASS인증서), C(신용카드)
	String customize 	= "";		//없으면 기본 웹페이지 / Mobile : 모바일페이지
	
    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
	//리턴url은 인증 전 인증페이지를 호출하기 전 url과 동일해야 합니다. ex) 인증 전 url : http://www.~ 리턴 url : http://www.~
    String sReturnUrl = "https://www.weconn.co.kr/checkplus_success";      // 성공시 이동될 URL
    String sErrorUrl = "https://www.weconn.co.kr/checkplus_fail";          // 실패시 이동될 URL

    // 입력될 plain 데이타를 만든다.
    String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
                        "8:SITECODE" + sSiteCode.getBytes().length + ":" + sSiteCode +
                        "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
                        "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl +
                        "7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl +
                        "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize;
    
    System.out.println("sPlainData = " + sPlainData);
    String sMessage = "";
    String sEncData = "";
    
    int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
    if( iReturn == 0 )
    {
    	System.out.println("iReturn = " + iReturn);
        sEncData = niceCheck.getCipherData();
        System.out.println("sEncData = " + sEncData);
    }
    else if( iReturn == -1)
    {
        sMessage = "암호화 시스템 에러입니다.";
    }    
    else if( iReturn == -2)
    {
        sMessage = "암호화 처리오류입니다.";
    }    
    else if( iReturn == -3)
    {
        sMessage = "암호화 데이터 오류입니다.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "입력 데이터 오류입니다.";
    }    
    else
    {
        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
    }
%>
 --%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,viewport-fit=cover">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>회원가입</title>
  <link rel="stylesheet" href="/resources/css/layout.css">
  <link rel="stylesheet" href="/resources/css/member.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

  <style>
  .importantRule { display:block !important; }
  @keyframes slidein {
    from {
        margin-left: 1%;
    }

    to {
        margin-left: -1%;
    }
  }
  </style>
  
  <script language='javascript'>
	  const Toast = Swal.mixin({
	      toast: true,
	      position: 'center-center',
	      showConfirmButton: false,
	      timer: 1300,
	      timerProgressBar: true,
	      didOpen: (toast) => {
	      toast.addEventListener('mouseenter', Swal.stopTimer)
	      toast.addEventListener('mouseleave', Swal.resumeTimer)
	      }
	      });
	 
	window.name ="Parent_window";
	
	function fnPopup(){
		window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.target = "popupChk";
		document.form_chk.submit();

	}
	
	function notYet(){
		Toast.fire({
            icon: 'error',
            title: '휴대폰 인증으로 진행해주세요.',
       });
	}
	</script>
	
</head>

<body class="member join">
  <div class="wrap">

    <!-- S : body -->
    <main>
      <div class="container">
        <div class="content">
          <!--S : 회원가입 정보-->
          <div class="layout-join_wrap">
            <h2>회원가입</h2>
            <div class="join-area">
<%-- 			 <form method="post">
			      <input type="hidden" id="m" name="m" value="service" />
			      <input type="hidden" id="token_version_id" name="token_version_id" value="${reData.token_version_id}" />
			      <input type="hidden" id="enc_data" name="enc_data" value="${reData.reqDataEnc}" />
			      <input type="hidden" id="integrity_value" name="integrity_value" value="${reData.intigrety_value}" />
				</form> --%>
				
			<form name="form_chk" method="post">
				<input type="hidden" name="m" value="checkplusService">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
				<input type="hidden" name="EncodeData" value="<%-- <%=sEncData %> --%>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
				<!-- <a href="javascript:fnPopup();"> CheckPlus 안심본인인증 Click</a> -->
			</form>
              <form>
                <!-- GP 회원가입 -->
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">본인 인증 </span></div>
                  <div class="tab-list"><ul>
                    <li class="on" id="certification_cell"><a href="javascript:void(0);" onclick="javascript:fnPopup();" >휴대폰</a></li>
                    <li><a href="javascript:void(0);" onclick="javascript:notYet();" >아이핀</a></li>
                  </ul></div>
                  <div class="s_text">실명이 인증된 명의로 본인인증 절차를 진행해주세요.</div>
                </div>

                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">이름 </span></div>
                  <div class="form-body">
                    <div class="form-area type-a">
                    <input type="text" name="user_name" id="user_name" maxlength="20" placeholder="본인 인증을 진행해 주세요" value="">
                    <input type="hidden" name="only_param" id="only_param" value="">
                    <input type="hidden" name="auth_type" id="auth_type" value="">
                    <input type="hidden" name="birth" id="birth" value="">
                    <input type="hidden" name="mobile_co" id="mobile_co" value="">
                    <input type="hidden" name="gender" id="gender" value="">
                    </div>
    				<div class="form-noti username_noti_0">올바른 이름이 아닙니다.</div>
                  </div>
                </div>

                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">휴대폰 번호 </span></div>
                  <div class="form-body">
                    <div class="form-area type-b"><select name="cellphone_f" id="cellphone_f" class="form-elem valid" disabled>
                      <option>010</option>
                      <option>011</option>
                      <option>016</option>
                      <option>017</option>
                      <option>018</option>
                      <option>019</option>
                      <option>070</option>
                      <option>0503</option>
                    </select> <input type="number" name="cellphone" id="cellphone" maxlength="8" oninput="maxLengthCheck(this)" placeholder="본인 인증시 자동으로 입력됩니다" value=""></div>
                    <div class="form-noti cellphone_noti_0">올바른 번호가 아닙니다.</div>
                    <div class="form-noti cellphone_noti_1">이미 등록된 번호입니다.</div>
                    <div class="form-noti cellphone_noti_2">사용가능한 번호입니다.</div>
                  </div>
                </div>

                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">이메일 주소 </span></div>
                  <div class="form-body">
                    <div class="form-area type-b"><input type="text" name="writeMail" id="writeMail" maxlength="30" placeholder="이메일 주소는 골든플랫폼 로그인 아이디로 사용됩니다" value=""><button type="button" onclick="isMember()"class="">중복확인</button></div>

                    <div class="form-noti email_noti_0">이메일을 입력해 주세요.</div>
                    <div class="form-noti email_noti_1">이메일 형식이 올바르지 않습니다.</div>
                    <div class="form-noti email_noti_2">이미 사용중인 이메일입니다.</div>
                    <div class="form-noti email_noti_3">사용가능한 이메일입니다.</div>
                    <div class="form-noti email_noti_4">중복확인이 필요합니다.</div>
                  </div>
                </div>

                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">비밀번호 </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="password" value="" id="user_pass" name="user_pass" placeholder="예)영문/숫자/특수문자 2가지 이상 조합(8~20자)">
                    <input type="password" value="" id="user_pass_chk" name="user_pass_chk" placeholder="비밀번호를 한번 더 입력해주세요."></div>
                    <div class="form-noti password_noti_0">비밀번호를 입력해 주세요.</div>
                    <div class="form-noti password_noti_1">영문소문자, 숫자 포함 8~20자</div>
                    <div class="form-noti password_noti_2">비밀번호가 일치하지 않습니다.</div>
                  </div>
                </div>

                <div class="form-option">
              		<fieldset class="option-list">
              			<legend>약관동의 선택 서식</legend>
              			<div class="form-item">
                        	<div class="form-body">
                        		 <div class="form-noti terms_noti_0">필수 동의사항에 동의해주세요.</div>
                        	</div>
                        </div>
                       	<br>
              			<div class="option-item __checkbox">
              				<div class="option-head" name="cbx_chkAll" id="cbx_chkAll">
                        	<input type="checkbox" id="chkAll" name="chkAll"> <label for="check">골든플랫폼 이용약관에 모두 동의</label>
              				</div>
              				<div class="option-body">
                        <ul>
                          <li><input type="checkbox" id="marketServiceTerms" name="chk" value="N"> <label for="marketServiceTerms">골든플랫폼 이용약관(필수) </label> </li>
                          <li><input type="checkbox" id="marketFinancialTerms" name="chk" value="N"> <label for="marketFinancialTerms">전자금융거래 이용약관(필수)</label> </li>
                          <li><input type="checkbox" id="marketInformationCollection" name="chk" value="N"> <label for="marketInformationCollection">개인정보 수집 및 이용(필수)</label> </li>
                          <li><input type="checkbox" id="marketInformationMarketing" name="chk" value="N"> <label for="marketInformationMarketing">개인정보 활용 및 마케팅 정보 수신 동의(선택)</label> </li>
                        </ul>
              				</div>
              			</div>
              		</fieldset>
              	</div>
                <!-- 회원가입 버튼 -->
                <div class="no-member"><button type="button" class="btn btn-red btn-join" onclick="saveSns()"><span>가입하기</span></button></div>
                <!-- 회원가입 버튼 -->
              </form>
            </div>
          </div>

            <!--E : 회원가입 정보-->


          </div>
      </div>
    </main>
    <!-- E : body -->
    </div>
    <!-- E : wrap -->
<!--   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript">
 	var mailCheck = false;
 	var isMemberId = '';
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
      
  	//###########수신 동의 항목 및 메일주소 체크#################
		
		$("#cbx_chkAll").click(function() {
			if($("#chkAll").is(":checked") == false) {
				$("input[name=chkAll]").prop("checked", true);
				$("input[name=chk]").prop("checked", true);
				$('#marketServiceTerms').val("Y"); 
				$('#marketFinancialTerms').val("Y"); 
				$('#marketInformationCollection').val("Y"); 
				$('#marketInformationMarketing').val("Y"); 

			}else{
				$("input[name=chkAll]").prop("checked", false);
				$("input[name=chk]").prop("checked", false);
				$('#marketServiceTerms').val("N"); 
				$('#marketFinancialTerms').val("N"); 
				$('#marketInformationCollection').val("N"); 
				$('#marketInformationMarketing').val("N"); 
			}
			
		});
	
		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;
	
			if(total != checked) $("#chkAll").prop("checked", false);
			else $("#chkAll").prop("checked", true); 
		});

  	
  	$("#marketServiceTerms").click(function() {
  		if ($('#marketServiceTerms').is(':checked')) {
  				$('#marketServiceTerms').val("Y"); 
  		} else { 
  				$('#marketServiceTerms').val("N"); 
  		} 
  	});
  	$("#marketFinancialTerms").click(function() {
  		if ($('#marketFinancialTerms').is(':checked')) {
  				$('#marketFinancialTerms').val("Y"); 
  		} else { 
  				$('#marketFinancialTerms').val("N"); 
  		} 
  	});
  	$("#marketInformationCollection").click(function() {
  		if ($('#marketInformationCollection').is(':checked')) {
  				$('#marketInformationCollection').val("Y"); 
  		} else { 
  				$('#marketInformationCollection').val("N"); 
  		} 
  	});
  	$("#marketInformationMarketing").click(function() {
  		if ($('#marketInformationMarketing').is(':checked')) {
  				$('#marketInformationMarketing').val("Y"); 
  		} else { 
  				$('#marketInformationMarketing').val("N"); 
  		} 
  	});
  	
  	
    });
    
    function maxLengthCheck(object){
        if (object.value.length > object.maxLength){
          object.value = object.value.slice(0, object.maxLength);
        }    
      }
    
    function saveSns()
    {
    	
    	var uid = $('#writeMail').val();
    	var userName = $('#user_name').val();
    	var phone =  $('#cellphone_f').val()+''+ $('#cellphone').val();
    	var pass = $('#user_pass').val();
    	var pass_chk = $('#user_pass_chk').val();
    	var only_param = $('#only_param').val();
    	var auth_type = $('#auth_type').val();
    	var birth = $('#birth').val();
    	var mobile_co = $('#mobile_co').val();
    	var gender = $('#gender').val();
    	
    	//console.log(only_param);
    	//console.log(auth_type);
    	//console.log(birth);
    	//console.log(mobile_co);
    	//console.log(gender);
    	
    	var ret  = AllCheck();
    	
    	if(ret == false){
    		return;
    	}
    	
    	var marketServiceTerms = $('#marketServiceTerms').val(), //필수 선택
    		marketFinancialTerms = $('#marketFinancialTerms').val(), //필수 선택 / 전자 금융거래
    		marketInformationCollection = $('#marketInformationCollection').val(), //필수 선택 / 개인정보 수집
    		marketInformationMarketing = $('#marketInformationMarketing').val(); //선택 / 개인정보 활용 sms 등 
    		
    	
    	
    	if(marketServiceTerms == 'N' || marketFinancialTerms == 'N' || marketInformationCollection == 'N' ){
    			$('.option-list').attr('style', 'animation-duration: 0.1s; animation-name: slidein; animation-iteration-count:2; animation-direction: alternate;');
    			//$('.option-list').attr('style', 'animation-play-state : running');
    			$('.terms_noti_0').attr('style', 'display:block !important; color:red');
    			return;
    	}else{
    			$('.terms_noti_0').attr('style', 'display:none !important; color:red');
    	}
    		
    	if(isMemberId == '' || mailCheck == false){
    		 	$('.email_noti_0').attr('style', 'display:none !important; color:red');
      	  	 	$('.email_noti_1').attr('style', 'display:none !important; color:red');
      	  	 	$('.email_noti_2').attr('style', 'display:none !important; color:red');
      	  	 	$('.email_noti_3').attr('style', 'display:none !important;');
      	  		$('.email_noti_4').attr('style', 'display:block !important; color:red');
			   document.getElementById('writeMail').focus();
			   return;
		}
    	
    	//console.log('정상');
    		
			   $.ajax({
		    	   url: '/chkId?uid='+uid,
		    	   type : 'GET',
		    	   success : function(msg){
		    		   isMemberId = msg;
		    		   //console.log('init ' + msg);
		    		   if(isMemberId == 'true'){
		               	   $('.email_noti_0').attr('style', 'display:none !important; color:red');
		            	   $('.email_noti_1').attr('style', 'display:none !important; color:red');
		            	   $('.email_noti_2').attr('style', 'display:block !important; color:red');
		            	   $('.email_noti_3').attr('style', 'display:none !important;');
		            	   $('.email_noti_4').attr('style', 'display:none !important; color:red');
		    			   document.getElementById('writeMail').focus();
		    			   return;
		    		   }else{
		    			   $('.email_noti_0').attr('style', 'display:none !important; color:red');
		            	   $('.email_noti_1').attr('style', 'display:none !important; color:red');
		            	   $('.email_noti_2').attr('style', 'display:none !important; color:red');
		            	   $('.email_noti_3').attr('style', 'display:none !important;');
		            	   $('.email_noti_4').attr('style', 'display:none !important; color:red');
		            	   
		            	   //console.log('츨발');
		            	   
		            	   var sendData = {
		            			   'userId' : uid ,
						    	   	'userName' : userName ,
						    	   	'password' : pass ,
						    	   	'telNo' : phone ,
						    	   	'cellNo' : phone ,
						    	   	'snsOnly' : 'N' ,
						    		'smsFlag' : marketInformationMarketing ,
						    		'mailFlag' : marketInformationMarketing,
						    		'marketServiceTerms' : marketServiceTerms,
						    		'marketFinancialTerms' : marketFinancialTerms,
						    		'marketInformationCollection' : marketInformationCollection,
						    		'marketInformationMarketing' : marketInformationMarketing,
						    		'onlyParam' : only_param,
						    		'authType' : auth_type,
						    		'birth' : birth,
						    		'mobileCo' : mobile_co,
						    		'gender' : gender
		            	   };
		            	   $.ajax({
					    	   url: '/doSignUp',
					    	   type : 'POST',
					    	   data : sendData,
					    	   beforeSend : function(){
					    		 
					    		   ////console.log('보내기전 data 체크');
					    		  // //console.log(sendData);
					    		   
					    	   },
					    	   success : function(result){
					    		   
					    		   window.location.href='/signUpEnd';
					    		   
					    	   },
					    	   fail: function(e){ 
					    	       //console.log("fail")
					    	   },
					    	   error:function(request, status, error){
			    	            	var result = JSON.parse(request.responseText);
			    	        		Toast.fire({
			 			   	           icon: 'info',
						   	           title: result.message
						   	      	});
			    	        		window.location.href = '/login';
			    	        	}
					     });// end ajax
		    		   }
		    	   },
		    	   fail: function(e){
		    	       //console.log("fail")
		    	   }
		    	 });// end ajax
    		
	          	
    }//end function

    function isMember(){
    	   isMemberId = true;
    	   var uid = $('#writeMail').val();
    	
           if(uid == ''){
        	   $('.email_noti_0').attr('style', 'display:block !important; color:red');
        	   $('.email_noti_1').attr('style', 'display:none !important; color:red');
        	   $('.email_noti_2').attr('style', 'display:none !important; color:red');
        	   $('.email_noti_3').attr('style', 'display:none !important;');
        	   $('.email_noti_4').attr('style', 'display:none !important; color:red');
               document.getElementById('writeMail').focus();
               return;
           }
    	   
           var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 검증에 사용할 정규식 변수 regExp에 저장 
           if (uid.match(regExp) != null) { 
        	   
           }
           else {
           	   $('.email_noti_0').attr('style', 'display:none !important; color:red');
        	   $('.email_noti_1').attr('style', 'display:block !important; color:red');
        	   $('.email_noti_2').attr('style', 'display:none !important; color:red');
        	   $('.email_noti_3').attr('style', 'display:none !important;');
        	   $('.email_noti_4').attr('style', 'display:none !important; color:red');
               document.getElementById('writeMail').focus();
               return;         
           }

    	   
		   $.ajax({
	    	   url: '/chkId?uid='+uid,
	    	   type : 'GET',
	    	   success : function(msg){
	    		   isMemberId = msg;
	    		   if(isMemberId == 'true'){
	               	   $('.email_noti_0').attr('style', 'display:none !important; color:red');
	            	   $('.email_noti_1').attr('style', 'display:none !important; color:red');
	            	   $('.email_noti_2').attr('style', 'display:block !important; color:red');
	            	   $('.email_noti_3').attr('style', 'display:none !important;');
	            	   $('.email_noti_4').attr('style', 'display:none !important; color:red');
	    			   document.getElementById('writeMail').focus();
	    			   return;
	    		   }else{
	    			   if(isMemberId == '' || isMemberId=='false' ){
		               	   $('.email_noti_0').attr('style', 'display:none !important; color:red');
		            	   $('.email_noti_1').attr('style', 'display:none !important; color:red');
		            	   $('.email_noti_2').attr('style', 'display:none !important; color:red');
		            	   $('.email_noti_3').attr('style', 'display:block !important;');
		            	   $('.email_noti_4').attr('style', 'display:none !important; color:red');
	    			   }
	    			   mailCheck = true;
	    			   return;
	    		   }
	    	   },
	    	   fail: function(e){
	    	       //console.log("fail");
	    	   }
	    	 });// end ajax
    	
    }
    
    function AllCheck(){
    	
    	var uid = $('#writeMail').val();
    	var userName = $('#user_name').val();
    	var phone =  $('#cellphone_f').val()+''+ $('#cellphone').val();
    	var pass = $('#user_pass').val();
    	var pass_chk = $('#user_pass_chk').val();
    	var only_param = $('#only_param').val();
    	var auth_type = $('#auth_type').val();
    	var birth = $('#birth').val();
    	var mobile_co = $('#mobile_co').val();
    	var gender = $('#gender').val();
    	
    	//name Check
    	var name = userName;
    	if(name.length < 2){
    		$('.username_noti_0').attr('style', 'display:block !important; color:red');
	   	 	document.getElementById('user_name').focus();
	   	  	return false;
	   	 }else{
	   		$('.username_noti_0').attr('style', 'display:none !important;');
	   	 }
    	
    	//phone Check
    	 var patternPhone = /01[016789][^0][0-9]{2,3}[0-9]{3,4}/;
         if(!patternPhone.test(phone))
         {
        	 $('.cellphone_noti_0').attr('style', 'display:block !important; color:red');
             document.getElementById('cellphone').focus();
             return false;
         }else{
        	 $('.cellphone_noti_0').attr('style', 'display:none !important; color:red');
         }
         
         //mail Check
         var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
         if(!reg_email.test(uid)) {
         	 $('.email_noti_0').attr('style', 'display:none !important; color:red');
        	 $('.email_noti_1').attr('style', 'display:block !important; color:red');
        	 $('.email_noti_2').attr('style', 'display:none !important; color:red');
        	 $('.email_noti_3').attr('style', 'display:none !important;');
        	 $('.email_noti_4').attr('style', 'display:none !important; color:red');
        	 document.getElementById('writeMail').focus();
        	 return false;         
         }else{
        	 $('.email_noti_0').attr('style', 'display:none !important; color:red');
        	 $('.email_noti_1').attr('style', 'display:none !important; color:red');
        	 $('.email_noti_2').attr('style', 'display:none !important; color:red');
        	 $('.email_noti_3').attr('style', 'display:none !important;');
        	 $('.email_noti_4').attr('style', 'display:none !important; color:red');
         }       
         
         //password Check
         var pw = pass;
    	 var num = pw.search(/[0-9]/g);
    	 var eng = pw.search(/[a-z]/ig);
    	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    	 
    	 if(pw != pass_chk){
    		$('.password_noti_0').attr('style', 'display:none !important; color:red');
      	    $('.password_noti_1').attr('style', 'display:none !important; color:red');
      	    $('.password_noti_2').attr('style', 'display:block !important; color:red');
    		document.getElementById('user_pass').focus();
     	  	return false;
    	 }else if(pw.length < 8 || pw.length > 20){
     		$('.password_noti_0').attr('style', 'display:none !important; color:red');
      	    $('.password_noti_1').attr('style', 'display:block !important; color:red');
      	    $('.password_noti_2').attr('style', 'display:none !important; color:red');
    	 	document.getElementById('user_pass').focus();
    	 	return false;
    	 }else if(pw.search(/\s/) != -1){
      		$('.password_noti_0').attr('style', 'display:none !important; color:red');
      	    $('.password_noti_1').attr('style', 'display:block !important; color:red');
      	    $('.password_noti_2').attr('style', 'display:none !important; color:red');
    	  	document.getElementById('user_pass').focus();
    	  	return false;
    	 }else if(num < 0 || eng < 0 || spe < 0 ){
    	  	$('.password_noti_0').attr('style', 'display:none !important; color:red');
      	    $('.password_noti_1').attr('style', 'display:block !important; color:red');
      	    $('.password_noti_2').attr('style', 'display:none !important; color:red');
    	  	document.getElementById('user_pass').focus();
    	  	return false;
    	 }
                   
    }
    
    function searchFail(){
    	$('#only_param').val('');
    	$('#user_name').val('');
    	$('#cellphone').val('');
    	
    	Toast.fire({
            icon: 'error',
            title: '이미 가입된 휴대폰 번호입니다',
        });
    }
    
    function searchFail2(){
    	Toast.fire({
            icon: 'error',
            title: '다시 시도해주세요',
        });
    }
    </script>
  </body>
  </html>
