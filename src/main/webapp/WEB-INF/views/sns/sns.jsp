<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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
                <legend>주문정보 수신용 이메일 필수입력</legend>
                <div class="form-item">
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
    	            	
    	            	 window.location.href='/signUpEnd';
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
