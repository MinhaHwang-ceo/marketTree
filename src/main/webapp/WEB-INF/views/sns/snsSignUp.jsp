<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
           <c:if test="${sns=='Kakao'}">
            	<h2 class="kakao_gp"><span class="blind">카카오 연결</span>소셜계정으로 회원가입을 진행합니다.</h2>
			</c:if>
			<c:if test="${sns=='Naver'}">
            	<h2 class="naver_gp"><span class="blind">네이버 연결</span>소셜계정으로 회원가입을 진행합니다.</h2>
			</c:if>
           
            <div class="s_txt">이메일입력과 약관동의 후 골든플랫폼 회원으로 가입됩니다.<br/>이후, 소셜계정으로 간편로그인하세요.</div>

            <div class="join-area">
              <form>
                <legend>주문정보 수신용 정보 필수입력</legend>
                <div class="form-item">
               	   <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="myName" id="myName" value="${userName}" maxlength="20" placeholder="${userName}"></div>
                  </div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="writeMail" id="writeMail" value="${userId}" maxlength="20" placeholder="주문정보 수신용 이메일 필수입력" readonly></div>
                    <div class="form-noti email_noti_0">이메일을 입력해 주세요.</div>
                    <div class="form-noti email_noti_1">이메일 형식이 올바르지 않습니다.</div>
                    <div class="form-noti email_noti_2">이미 사용중인 이메일입니다.</div>
                  </div>
                </div>
                <div class="form-option">
                  <fieldset class="option-list">
                    <legend>약관동의 선택 서식</legend>
                    <div class="option-item __checkbox">
                      <div class="option-head" id="cbx_chkAll" >
                        <input type="checkbox" id="chkAll" name="chkAll" > <label for="check">골든플랫폼 이용약관에 모두 동의</label>
                        <button type="button" class="btn_all icon_arrow_up"><span class="blind">약관 목록 펼치기</span></button>
                      </div>

                      <div class="option-body">
                        <ul class="check_list">
                          <li>
                            <div class="check-head">
                              <input type="checkbox" id="gpisServiceTerms" name="chk" value="N"> <label for="gpisServiceTerms">골든플랫폼 이용약관 <span>(필수)</span> </label>
                              <button type="button" class="btn_view icon_arrow_right"><span class="blind">약관보기</span></button>
                            </div>
                            <!--동의 내용 -->
                            <div class="laypop_terms">
                              <h3 class="tit">골든플랫폼 이용약관</h3><iframe src="" frameborder="0" scrolling="no" class="ifrm_rules" title="골든플랫폼 이용약관"></iframe><button type="button" class="btn_close  icon_close"><span class="blind">닫기</span></button>
                            </div>
                            <!--동의 내용 -->
                          </li>
                          <li>
                            <div class="check-head">
                              <input type="checkbox" id="gpisFinancialTerms" name="chk" value="N"> <label for="gpisFinancialTerms">전자금융거래 이용약관<span>(필수)</span></label>
                              <button type="button" class="btn_view icon_arrow_right"><span class="blind">약관보기</span></button>
                            </div>
                            <!--동의 내용 -->
                            <div class="laypop_terms">
                              <h3 class="tit">골든플랫폼 이용약관</h3><iframe src="" frameborder="0" scrolling="no" class="ifrm_rules" title="전자금융거래 이용약관"></iframe><button type="button" class="btn_close icon_close"><span class="blind">닫기</span></button>
                            </div>
                            <!--동의 내용 -->
                          </li>
                          <li>
                            <div class="check-head">
                              <input type="checkbox" id="gpisInformationCollection" name="chk" value="N"> <label for="gpisInformationCollection">개인정보 수집 및 이용<span>(필수)</span></label>
                              <button type="button" class="btn_view icon_arrow_right"><span class="blind">약관보기</span></button>
                            </div>
                            <!--동의 내용 -->
                            <div class="laypop_terms">
                              <h3 class="tit">골든플랫폼 이용약관</h3><iframe src="" frameborder="0" scrolling="no" class="ifrm_rules" title="전자금융거래 이용약관"></iframe><button type="button" class="btn_close icon_close"><span class="blind">닫기</span></button>
                            </div>
                            <!--동의 내용 -->
                          </li>
                          <li>
                            <div class="check-head">
                              <input type="checkbox" id="gpisInformationMarketing" name="chk" value="N"> <label for="gpisInformationMarketing">개인정보 활용 및 마케팅 정보 수신 동의(선택)</label>
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
  <script type="text/javascript" src="/resources/js/sweetalert2.js"></script>
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
  
  	var uid = '${userId}';
	var userName = '${userName}';
	var writeMail = $('#writeMail').val();
	var phone = '${phone}';
	var pass = Math.random();
	var isUser = '${isUser}';
	var sns = '${sns}';
	
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
				$('#gpisServiceTerms').val("Y"); 
				$('#gpisFinancialTerms').val("Y"); 
				$('#gpisInformationCollection').val("Y"); 
				$('#gpisInformationMarketing').val("Y"); 

			}else{
				$("input[name=chkAll]").prop("checked", false);
				$("input[name=chk]").prop("checked", false);
				$('#gpisServiceTerms').val("N"); 
				$('#gpisFinancialTerms').val("N"); 
				$('#gpisInformationCollection').val("N"); 
				$('#gpisInformationMarketing').val("N"); 
			}
			
		});
	
		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;
	
			if(total != checked) $("#chkAll").prop("checked", false);
			else $("#chkAll").prop("checked", true); 
		});

  	
	  	$("#gpisServiceTerms").click(function() {
	  		if ($('#gpisServiceTerms').is(':checked')) {
	  				$('#gpisServiceTerms').val("Y"); 
	  		} else { 
	  				$('#gpisServiceTerms').val("N"); 
	  		} 
	  	});
	  	$("#gpisFinancialTerms").click(function() {
	  		if ($('#gpisFinancialTerms').is(':checked')) {
	  				$('#gpisFinancialTerms').val("Y"); 
	  		} else { 
	  				$('#gpisFinancialTerms').val("N"); 
	  		} 
	  	});
	  	$("#gpisInformationCollection").click(function() {
	  		if ($('#gpisInformationCollection').is(':checked')) {
	  				$('#gpisInformationCollection').val("Y"); 
	  		} else { 
	  				$('#gpisInformationCollection').val("N"); 
	  		} 
	  	});
	  	$("#gpisInformationMarketing").click(function() {
	  		if ($('#gpisInformationMarketing').is(':checked')) {
	  				$('#gpisInformationMarketing').val("Y"); 
	  		} else { 
	  				$('#gpisInformationMarketing').val("N"); 
	  		} 
	  	});
  	
  	
    });
    

  //############sns 계정 회원가입 및 로그인 진행###########
    function saveSns()
    {
    	
    	var gpisServiceTerms = $('#gpisServiceTerms').val(), //필수 선택
    		gpisFinancialTerms = $('#gpisFinancialTerms').val(), //필수 선택 / 전자 금융거래
    		gpisInformationCollection = $('#gpisInformationCollection').val(), //필수 선택 / 개인정보 수집
    		gpisInformationMarketing = $('#gpisInformationMarketing').val(); //선택 / 개인정보 활용 sms 등 
    		
    	
    	if(gpisServiceTerms == 'N' || gpisFinancialTerms == 'N' || gpisInformationCollection == 'N' ){
    		Toast.fire({
	 	           icon: 'error',
	 	           title: '필수 동의사항에 동의하지 않으셨습니다'
	 	      	});
    		return;
    	}
    	
    	
    	
    	if(uid != null && (isUser == false || isUser == 'false')){
    		
    		
    		if(sns != null && sns != '' && (sns == 'Kakao' || sns == 'Naver')){
    			   
    			if(userName != $('#myName').val()){
    				userName = $('#myName').val();
    			}
    			
    	         $.ajax({
    	            url: '/doSignUp',
    	            type : 'POST',
    	            data : 
    	            {
    	            	'userId' : writeMail ,
    	            	'userName' : userName ,
    	            	'password' : '${token}' ,
    	            	'telNo' : phone ,
    	            	'cellNo' : phone ,
    					'snsLogin${sns}' : 'Y' ,
    					'snsLogin${sns}Mail' : uid ,
    					'snsLogin${sns}Name' : userName ,
    					'smsFlag' : gpisInformationMarketing ,
			    		'mailFlag' : gpisInformationMarketing,
			    		'gpisServiceTerms' : gpisServiceTerms,
			    		'gpisFinancialTerms' : gpisFinancialTerms,
			    		'gpisInformationCollection' : gpisInformationCollection,
			    		'gpisInformationMarketing' : gpisInformationMarketing
    	            },
    	            success : function(result){
    	            	
    	            	 window.location.href='/signUpEnd';
    	            },
    	            fail: function(e){
    	                 //console.log("fail");
    	            },
    	            error:function(request, status, error){
    	            	var result = JSON.parse(request.responseText);
    	        		alert(result.message);
    	        		window.location.href = '/login';
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
