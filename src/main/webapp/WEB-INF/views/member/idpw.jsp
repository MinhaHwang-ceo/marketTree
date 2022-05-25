<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
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
    String sReturnUrl = "https://www.weconn.co.kr/checkplus_idpw_success";      // 성공시 이동될 URL
    String sErrorUrl = "https://www.weconn.co.kr/checkplus_idpw_fail";          // 실패시 이동될 URL

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

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,viewport-fit=cover">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>아이디/패스워드 찾기</title>
  <link rel="stylesheet" href="/resources/css/layout.css">
  <link rel="stylesheet" href="/resources/css/member.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <style>
  .btn-login{ 
  	height: 50px !important; 
  	background: #ea4f17 !important; 
  	color: #fff !important; 
  	border: 1px solid #d4430e !important; 
  	font-weight: 500 !important; 
  	font-size: 17px !important; 
  	border-radius: 5px !important; 
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
	
	function fnPopup_pw(){
		
		var pw_id = $('#pw_id').val() ?? '';
		
		//console.log(pw_id);
		
		if(pw_id == ''){
			Toast.fire({
	            icon: 'error',
	            title: '아이디를 입력해주세요',
	       }); 
			
			return;
		}
		
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 검증에 사용할 정규식 변수 regExp에 저장 
        //console.log(pw_id.match(regExp));
		if (pw_id.match(regExp) != null) { 
     	   
        }
        else {
        	Toast.fire({
	            icon: 'error',
	            title: '이메일 양식으로 입력해주세요',
	       }); 
            return;         
        }
		
		document.getElementById('pw_id').readOnly = true;
		window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.target = "popupChk";
		document.form_chk.submit();

	}
	
	function notFound(){
		Toast.fire({
            icon: 'error',
            title: '일치하는 정보가 없습니다',
       }); 
	}
	
	function notYet(){
		Toast.fire({
            icon: 'error',
            title: '휴대폰 인증으로 진행해주세요',
       }); 
	}
	</script>
	
</head>

<body class="member login">
  <div class="wrap">

    <!-- S : body -->
    <main>
      <div class="container">
        <div class="content">
          <!--S : 로그인 정보-->
          <div class="layout-login_wrap">
            <h2><a href="/views/index.jsp"><span class="blind">로그인</span></a></h2>

            <div class="login-area">
			<form name="form_chk" method="post">
				<input type="hidden" name="m" value="checkplusService">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
				<input type="hidden" name="EncodeData" value="<%=sEncData %>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
				<!-- <a href="javascript:fnPopup();"> CheckPlus 안심본인인증 Click</a> -->
			</form>
              <form>
                <!-- 아이디 찾기 -->
                <div class="login-box">
                   <div class="tab">
                     <ul>
                       <li class="on"><a href="javascript:void(0);" id="tab_id">아이디 찾기</a></li>
                       <li><a href="javascript:void(0);"  id="tab_pw">비밀번호 찾기</a></li>
                     </ul>
                   </div>
                   <div class="id_box">
                   <div class="id_input" id="search_id_div" style="display:none;">
                   	<h5 id="find_name">황민하<span id="find_text">님의 계정은 아래와 같습니다</span></h5>
                 	 <span>정보 제공 동의일</span>
                  	 <span id="service_agree">2022-01-01</span>
                  	 <br>
                  	 <input type="text" placeholder="" value="" readonly  class="search_id" id="search_id" style="border:none;">
                   	 <br>
                   	 <button onclick="goToLogin(); return false;" class="btn btn-login">로그인 하러가기</button>
                   	 <br>
                   </div>
                   <div class="id_input" id="none_id_div" style="display:none;">
                   	<h5 id="find_name">정보와 일치하는 계정이 존재하지 않습니다</h5>
                   </div>
                   <!--   <div class="birth_input"><input type="text" placeholder="생년월일 8자리" class=""> </div> -->
                    <!--  <div class="call_input">
                       <select name="telephone">
                         <option value="010">010</option>
                         <option value="011">011</option>
                         <option value="016">016</option>
                         <option value="017">017</option>
                         <option value="018">018</option>
                         <option value="019">019</option>
                       </select>
                       <input type="number" name="cellphone" maxlength="9" placeholder="숫자만 입력">
                    </div> -->
                     <button onclick="javascript:fnPopup(); return false;" class="btn btn_idpw"> 휴대폰번호 인증하고 찾기</button>
                    </div>
                  <!-- 아이디 찾기 -->
                  <!-- 비밀번호 찾기 -->
                   <div class="pw_box" style="display:none;">
                     <div class="id_input"><input type="text" placeholder="아이디를 입력해주세요." id="pw_id" value="" class=""> </div>
                     <div class="id_input" id="change_pw_div" style="display:none;">
                    	 <h5 id="find_name">변경할 패스워드를 8자 이상 1개 이상의 숫자와 특수문자를 사용해서 입력해주세요</h5>
                     	<input type="password" placeholder="변경할 비밀번호" value="" class="search_id" id="change_pw" >
                     	<input type="password" placeholder="비밀번호 확인" value="" class="search_id" id="change_pw_check">
                     	<input type="hidden" placeholder="" value="" readonly  class="search_id" id="search_id_pw" style="border:none;">
                     	<button onclick="changeMyPass(); return false;" class="btn btn-login">비밀번호 변경</button>
                     </div>
                     <div class="id_input" id="success_chagne" style="display:none;">
                      <button onclick="goToLogin(); return false;" class="btn btn-login">로그인 하러가기</button>
                     </div>
                     <button  onclick="javascript:fnPopup_pw(); return false;" class="btn btn_idpw"> 휴대폰번호 인증하고 찾기</button>
                     <p class="idpw_text">
                          입력하신 정보는 본인 확인을 위해 신용평가사에 제공되며, 본인확인 용도 외에 사용되거나 저장되지 않습니다.<br>
                          위 방법으로 비밀번호를 찾을 수 없는 고객님께서는
                          <span>고객센터(0000-0000)</span>로 연락 주시기 바랍니다.
                      </p>
                    </div>
                  </div>
                  <!-- 비밀번호 찾기 -->
                <!-- 연동 로그인-->
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
   <!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
    <script type="text/javascript">
    //아이디 비밀번호 찾기
    $('#tab_id').click(function () {
      $('.id_box').show();
      $('.pw_box').hide();
      $('.btn_idpw').css('display','block');
      document.getElementById('none_id_div').style.display = 'none';
      document.getElementById('search_id_div').style.display = 'none';
      document.getElementById('success_chagne').style.display = 'none';
      $('.tab>ul>li>#tab_id').parent().addClass('on').siblings().removeClass('on');

    });
    $('#tab_pw').click(function () {
      $('.pw_box').show();
      $('.id_box').hide();
      $('.btn_idpw').css('display','block');
      document.getElementById('none_id_div').style.display = 'none';
      document.getElementById('search_id_div').style.display = 'none';
      document.getElementById('success_chagne').style.display = 'none';
      $('.tab>ul>li>#tab_pw').parent().addClass('on').siblings().removeClass('on');
    });
      </script>
      <script>

		function goToLogin(){
			
			var newForm = document.createElement('form');
			newForm.name = 'form';
	    	newForm.id = 'form';
	    	newForm.method = 'post';
	    	newForm.action = '/login';
	    	
	    	var input1 = document.createElement('input');
	    	
	    	input1.setAttribute("type", "hidden");
	    	input1.setAttribute("name", "myId");
	    	input1.setAttribute("id", "myId");
	    	input1.setAttribute("value", $('#search_id').val());
	    	
	    	newForm.appendChild(input1);
	    	
	    	document.body.appendChild(newForm);
	    	newForm.submit();
	    	
			//window.location.href = '/login?myId='+$('#search_id').val();
			
		}
		
		function changeMyPass(){
			
			var pw1 = $('#change_pw').val();
			var pw2 = $('#change_pw_check').val();
			var myId = $('#search_id_pw').val();

			var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/i; // 검증에 사용할 정규식 변수 regExp에 저장 
	        if (pw1.match(regExp) != null) { 
	        	
	        	if(pw1 == pw2){
	        		
	        		$.ajax({
	     	    	   url: '/changeMyPass',
	     	    	   type : 'POST',
	     	    	   data : {
	     	    		   'pw1' : pw1,
	     	    		   'pw2' : pw2,
	     	    		   'myId' : myId
	     	    	   },
	     	    	   success : function(result){
	     	    		   
	     	    		   if(result == 'success'){
	     	    			  Toast.fire({
	     				            icon: 'success',
	     				            title: '비밀번호 변경에 성공했습니다',
	     				       }); 
	     	    			  
	     	    			 document.getElementById('change_pw_div').style.display = 'none';
	     	    			 document.getElementById('success_chagne').style.display = 'block';
	     	    			  
	     	    		   }else if(result == 'fail'){
	     	    			  Toast.fire({
	     				            icon: 'error',
	     				            title: '비밀번호 변경에 실패했습니다',
	     				       }); 
	     	    			  
	     	    			 document.getElementById('pw_id').readOnly = false;
	     	    			  
	     	    		   }
	     	    		   
	     	    	   },fail: function(e){
	    	    	       //console.log("fail");
	    	    	   }
	     	    	 });
	        		
	        	}else{
	        		Toast.fire({
			            icon: 'error',
			            title: '비밀번호 재입력값이 일치하지 않습니다',
			       }); 
		            return;  
	        	}
	     	   
	        }else {
	        	Toast.fire({
		            icon: 'error',
		            title: '비밀번호 양식에 맞춰 입력해주세요',
		       }); 
	            return;         
	        }
			
			
		}
		
		</script>
</body>
</html>
 --%>