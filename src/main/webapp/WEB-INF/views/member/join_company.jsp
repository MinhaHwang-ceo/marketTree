<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="com.gloryDuck.marketTree.model.vo.MemberEntity" %>
<%
Authentication auth = (Authentication)request.getUserPrincipal();
String userId = "";
if(auth == null){
	
}else{
	Object principal = auth.getPrincipal();
	if(principal != null && principal instanceof MemberEntity){
		userId = ((MemberEntity)principal).getUserId();
	}
}
%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,viewport-fit=cover">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>기업구매 회원 전환</title>
  <link rel="stylesheet" href="/resources/css/layout.css">
  <link rel="stylesheet" href="/resources/css/member.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>

<body class="member join">
  <div class="wrap">

    <!-- S : body -->
    <main>
      <div class="container">
        <div class="content">
          <!--S : 회원가입 정보-->
          <div class="layout-join_wrap __company">
            <h2><span>기업구매</span> 회원 전환</h2>
            <div class="join-area">
              <form>
                <!-- GP 기업회원 전환 -->
                <div class="form-title"><strong>기업정보</strong></div>
				<input type="hidden" id="enString" name="enString" value="${encodedString}">
				<div class="form-item">
                  <div class="form-head"><span class="form-name __required">사업자 번호 </span></div>
                  <div class="form-body">
                    <div class="form-area type-b"><input type="text" name="irsNo" id="irsNo" maxlength="10"  oninput="maxLengthCheck(this)" placeholder="10자리 숫자 입력" ><button type="button" class="" id="checkbuss" name="checkbuss" onclick="checkbussiness();" >사업자 조회</button></div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">사업자 명 </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="buyerName" id="buyerName" maxlength="20" oninput="maxLengthCheck(this)" placeholder="정보 조회시 자동입력" readonly ></div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">대표자 이름 </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="ceoUserName" id="ceoUserName" maxlength="20"  oninput="maxLengthCheck(this)" placeholder="정보 조회시 자동입력" readonly ></div>
                  </div>
                </div>

                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">대표 전화번호 </span></div>
                  <div class="form-body">
                    <div class="form-area type-b">
                      <select name="telephone"  id="telephone">
                        <option value="02">서울( 02 )</option>
                        <option value="051">부산( 051 )</option>
                        <option value="053">대구( 053 )</option>
                        <option value="032">인천( 032 )</option>
                        <option value="062">광주( 062 )</option>
                        <option value="042">대전( 042 )</option>
                        <option value="052">울산( 052 )</option>
                        <option value="044">세종( 044 )</option>
                        <option value="031">경기( 031 )</option>
                        <option value="033">강원( 033 )</option>
                        <option value="043">충북( 043 )</option>
                        <option value="041">충남( 041 )</option>
                        <option value="063">전북( 063 )</option>
                        <option value="061">전남( 061 )</option>
                        <option value="054">경북( 054 )</option>
                        <option value="055">경남( 055 )</option>
                        <option value="064">제주( 064 )</option>
                        <option value="070">070</option>
                        <option value="080">080</option>
                        <option value="0505">0505</option>
                        <option value="0303">0303</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                        <option value="0504">0504</option>
                      </select>
                    <input type="number" name="telNo" id="telNo" maxlength="8" oninput="maxLengthCheck(this)" placeholder="숫자만 입력" ></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name">대표 팩스번호</span></div>
                  <div class="form-body">
                    <div class="form-area type-b">
                      <select name="fax" id="fax" >
                        <option value="" >선택</option>
                        <option value="02">서울( 02 )</option>
                        <option value="051">부산( 051 )</option>
                        <option value="053">대구( 053 )</option>
                        <option value="032">인천( 032 )</option>
                        <option value="062">광주( 062 )</option>
                        <option value="042">대전( 042 )</option>
                        <option value="052">울산( 052 )</option>
                        <option value="044">세종( 044 )</option>
                        <option value="031">경기( 031 )</option>
                        <option value="033">강원( 033 )</option>
                        <option value="043">충북( 043 )</option>
                        <option value="041">충남( 041 )</option>
                        <option value="063">전북( 063 )</option>
                        <option value="061">전남( 061 )</option>
                        <option value="054">경북( 054 )</option>
                        <option value="055">경남( 055 )</option>
                        <option value="064">제주( 064 )</option>
                        <option value="070">070</option>
                        <option value="080">080</option>
                        <option value="0505">0505</option>
                        <option value="0303">0303</option>
                        <option value="0504">0504</option>
                      </select>
                     <input type="number" name="faxNo" id="faxNo" maxlength="9" oninput="maxLengthCheck(this)" placeholder="숫자만 입력" ></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                  </div>
                </div>

                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">사업자 등록 상 주소  </span></div>
                  <div class="form-body">
                    <div class="form-area type-b"><input type="text" name="zipcode" id="zipcode" maxlength="20"  readonly="readonly"> <button type="button" class="" id="addressOn" name="addressOn" >우편번호 검색</button></div>
                    <div class="form-area type-a">
                      <input class="input" type="text" name="address1" id="address1" value=""  title="주소 입력" readonly="readonly">
                      <input class="input" type="text" name="address2" id="address2" value="" maxlength="50"  oninput="maxLengthCheck(this)" placeholder="상세주소 입력" >
                      <input type="hidden" name="areaName" id="areaName" value="" >
                      </div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">업태 </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="businessType" id="businessType" maxlength="40"  oninput="maxLengthCheck(this)" placeholder="예)제조업" ></div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">업종 </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="industryType" id="industryType" maxlength="40"  oninput="maxLengthCheck(this)" placeholder="예)산업용기계 및 공구 " ></div>
                  </div>
                </div>

                <!--  세금계산서  -->
                <div class="form-title"><strong>세금계산서 수신자 정보</strong> <div class="checkbox __checkbox" id="same_check"><input type="checkbox" id="check_same" value="N"><label for="check_same" id="check_same_two">회원정보와 동일</label></div></div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">이메일 </span></div>
                  <div class="form-body">
                    <div class="form-area type-b"><input type="text" name="receiverEmail" id="receiverEmail" maxlength="40"  oninput="maxLengthCheck(this)" placeholder="이메일 입력" ></div>
                  </div>
                </div>

                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">수신자명</span></div>
                  <div class="form-body">
                    <input type="text" name="receiverName" id="receiverName" maxlength="20"  oninput="maxLengthCheck(this)" placeholder="2자 이상" >

                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">수신자 휴대폰번호 </span></div>
                  <div class="form-body">
                    <div class="form-area type-b"><select name="cellphone_f" id="cellphoneReceiver" class="form-elem valid">
                      <option>010</option>
                      <option>011</option>
                      <option>016</option>
                      <option>017</option>
                      <option>018</option>
                      <option>019</option>
                    </select> <input type="number" name="receiverCellNo" id="receiverCellNo" maxlength="8" oninput="maxLengthCheck(this)" placeholder="숫자만 입력" value=""></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">수신자 전화번호</span></div>
                  <div class="form-body">
                    <div class="form-area type-b">
                      <select name="telephoneReceiver" id="telephoneReceiver" >
                        <option value="" >선택</option>
                        <option value="02">서울( 02 )</option>
                        <option value="051">부산( 051 )</option>
                        <option value="053">대구( 053 )</option>
                        <option value="032">인천( 032 )</option>
                        <option value="062">광주( 062 )</option>
                        <option value="042">대전( 042 )</option>
                        <option value="052">울산( 052 )</option>
                        <option value="044">세종( 044 )</option>
                        <option value="031">경기( 031 )</option>
                        <option value="033">강원( 033 )</option>
                        <option value="043">충북( 043 )</option>
                        <option value="041">충남( 041 )</option>
                        <option value="063">전북( 063 )</option>
                        <option value="061">전남( 061 )</option>
                        <option value="054">경북( 054 )</option>
                        <option value="055">경남( 055 )</option>
                        <option value="064">제주( 064 )</option>
                        <option value="070">070</option>
                        <option value="080">080</option>
                        <option value="0505">0505</option>
                        <option value="0303">0303</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                        <option value="0504">0504</option>
                    </select>
                    <input type="number" name="receiverTelNo" id="receiverTelNo" maxlength="8"  oninput="maxLengthCheck(this)" placeholder="숫자만 입력" ></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                  </div>
                </div>
                <!-- 회원가입 버튼 -->
                <div class="form-btn-area type-b">
                  <button type="button" class="btn btn-black btn-previous" onclick="window.history.back()"><span>이전으로</span></button>
                  <button type="button" class="btn btn-blue btn-company"  onclick="AllCheck();"><span>기업회원 전환</span></button></div>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script type="text/javascript">
  
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
  
  var chk = false;
  var isBuyser = true;
  $(document).ready(function() {

	  	$("#same_check").click(function() {
	  		if ($('#check_same').is(':checked')) {
	  				$('#check_same').val("Y"); 
	  				chk = true;
	  		} else {
	  				$('#check_same').val("N"); 
	  				chk = false;
	  		} 
			
	  		sameInfo();
	  	});
	  	
  });
  window.onload = function(){
	    document.getElementById("addressOn").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	            	//console.log(data);
	            	$('#zipcode').val(data.zonecode);
	                $('#address1').val(data.address); // 주소 넣기
	                $('#areaName').val(data.sido +' '+ data.sigungu); 
	                document.querySelector("input[name=address2]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });

	}

  
  function maxLengthCheck(object){
      if (object.value.length > object.maxLength){
        object.value = object.value.slice(0, object.maxLength);
      }    
  }
  
  
  function AllCheck(){
  	
  	var buyerName = $('#buyerName').val(); //사업자명
  	var irsNo = $('#irsNo').val();	//사업자번호
  	var ceoUserName = $('#ceoUserName').val();	//대표자이름
  	var telNo =  $('#telephone').val()+''+ $('#telNo').val(); //대표 전화번호
  	var faxNo = $('#fax').val()+''+ $('#faxNo').val();
  	
  	var zipcode = $('#zipcode').val();	//우편번호
  	var address1 = $('#address1').val();	//주소
  	var address2 = $('#address2').val();	//상세주소
  	var areaName = $('#areaName').val();	//시군구
  	
  	var businessType = $('#businessType').val(); //업태
  	var industryType = $('#industryType').val(); //업종
  
  	var receiverEmail = $('#receiverEmail').val(); //세금계산서 수신자 이메일
  	var receiverName = $('#receiverName').val(); // 세금계산서 수신자 이름
  	var receiverTelNo = $('#telephoneReceiver').val()+''+ $('#receiverTelNo').val(); //세금계산서 수신자 번호
  	var receiverCellNo = $('#cellphoneReceiver').val()+''+ $('#receiverCellNo').val(); //세금계산서 수신자 번호
	var status = 'C';
  	
  	//name Check
  	var name = buyerName;
  	if(name.length < 2){
		Toast.fire({
             icon: 'error',
             title: '올바른 사업자명을 입력해주세요.'
        });
  	 	document.getElementById('buyerName').focus();
  	  	return;
  	 }
  	
  	var name = ceoUserName;
  	if(name.length < 2){
	   	 Toast.fire({
            icon: 'error',
            title: '올바른 이름을 입력해주세요.'
       	 });
	   	 document.getElementById('ceoUserName').focus();
	   	 return;
	 }
  	
    //일반 전화
	    var regExp = /^\d{3}-?\d{3,4}-?\d{4}$/;
	    var patternPhone = /01[016789][^0][0-9]{2,3}[0-9]{3,4}/;
	    if(!regExp.test(telNo))
	    {
	 	   if(!patternPhone.test(telNo))
		      {
		          Toast.fire({
		              icon: 'error',
		              title: '대표 전화번호를 확인 해주세요'
		         	 });
		          document.getElementById('telNo').focus();
		          return;
		      }
	    }
      
       //adress check
       if(zipcode.length < 1 || address1 == '' || address2 == ''){
    	  Toast.fire({
              icon: 'error',
              title: '주소를 정확히 입력해주세요'
         	 });
          document.getElementById('address2').focus();
          return;         
       }
       
   	   if(businessType.lenth < 1 || businessType == ''){
  		  Toast.fire({
            icon: 'error',
            title: '업태를 정확히 입력해주세요'
       	  });
      	  document.getElementById('businessType').focus();
       	  return;         
   	   }
       
   	   if(industryType.lenth < 1 || industryType == ''){
   		  Toast.fire({
            icon: 'error',
            title: '업종을 정확히 입력해주세요'
       	  });
       	  document.getElementById('industryType').focus();
          return;         
       }
       
       
       //mail Check
       var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
       if(!reg_email.test(receiverEmail)) {
      	  Toast.fire({
            icon: 'error',
            title: '세금계산서 수신자 이메일 주소를 정확히 입력해주세요'
       	  });
      	 document.getElementById('receiverEmail').focus();
      	  return;         
       }         
       
       
       if(!patternPhone.test(receiverTelNo))
       {
          Toast.fire({
              icon: 'error',
              title: '세금계산서 수신자 전화번호를 확인 해주세요'
         	  });
          document.getElementById('receiverTelNo').focus();
          return;
       }
       
       var name = receiverName;
       if(receiverName.length < 2){
  	   	  Toast.fire({
            icon: 'error',
            title: '올바른 세금계산서 수신자 명을 입력해주세요.'
       	  });
  	   	  document.getElementById('receiverName').focus();
  	   	  return;
  	   }
       
       //사업자 확인 api 추가시 정규식으로 체크로직 완료할 것
       if(checkCorporateRegistrationNumber(irsNo) == false){
   	  	  Toast.fire({
           icon: 'error',
           title: '올바른 사업자 번호를 입력해주세요.'
      	  });
  	   	  document.getElementById('irsNo').focus();
  	   	  return;
       }
       
       $.ajax({
	       	   url: '/buyer/getCompanyAlready',
	       	   type : 'GET',
	       	   data : {
	       		'irsNo' : irsNo 
	       	   },
	       	    success : function(result){
	       	    	 isBuyser = result;
	       	    	 //console.log(result);
	       	  		 if(result == true){
	       	  			 
	       	  		Swal.fire({
		                title: '이미 기업회원 정보가 있습니다?',
		                text: "동일 정보로 등록하시겠습니까?",
		                icon: 'question',
		                showCancelButton: true,
		                confirmButtonColor: '#3085d6',
		                cancelButtonColor: '#d33',
		                confirmButtonText: '등록',
		                cancelButtonText: '취소'
		            }).then((result) => {
		            	if (result.isConfirmed) {
		            		$.ajax({
			       		       	   url: '/buyer/setSameCompany',
			       		       	   type : 'POST',
			       		       	   data : {
			       		       		 'uid' : '${userId}',
			       		       	     'irsNo' : irsNo 
			       		       	   },
			       		       	    success : function(result){
			       		       	    	
				       		       	  Swal.fire({
		     		                        //title:'등록이 완료되었습니다.',
		     		                        text :'등록이 완료되었습니다.',
		     		                        icon: 'success'
		     		    		   	  });
				       		       	  
			       			    	  var u1 = '${userId}'; //security uid
			       					  var u2 = u1;
			       					  var enString = btoa(u2); //encoding
			       		       	 	  window.location.href='/buyer/joinCompanyEnd?enString='+enString+'&IrsNo='+irsNo;
			       		       	    },
			       	       	    fail: function(e){
			       	       	        //console.log("fail");
			       	       	    },
			       	       	    error:function(request, status, error){
			       	           		alert(error);
			       	    	    }
			       	      	});// end ajax
		            	}else{
	       	  				 return;
	       	  			}
		            });
	       	  		 var conMsg = '이미 기업회원 정보가 있습니다\n동일 정보로 등록하시겠습니까?';
	       	  			 if(confirm(conMsg)){
			       	  			$.ajax({
			       		       	   url: '/buyer/setSameCompany',
			       		       	   type : 'POST',
			       		       	   data : {
			       		       		 'uid' : '${userId}',
			       		       	     'irsNo' : irsNo 
			       		       	   },
			       		       	    success : function(result){
			       			    	  var u1 = '${userId}'; //security uid
			       					  var u2 = u1;
			       					  var enString = btoa(u2); //encoding
			       		       	 	  window.location.href='/buyer/joinCompanyEnd?enString='+enString+'&IrsNo='+irsNo;
			       		       	    },
			       	       	    fail: function(e){
			       	       	        //console.log("fail");
			       	       	    },
			       	       	    error:function(request, status, error){
			       	           		alert(error);
			       	    	    }
			       	      	});// end ajax
	       	  			 }else{
	       	  				 return;
	       	  			 }
	       	  			 
	       	  		 }else{
	       	  			 
	       		       $.ajax({
	       		    	   url: '/buyer/doCompanySignUp',
	       		    	   type : 'POST',
	       		    	   data : 
	       		    	   {
	       		    	   	'buyerName' : buyerName ,
	       		    	   	'addUserId' : '${userId}',
	       		    	   	'changeUserId' : '${userId}',
	       		    	   	'email' : '${userId}',
	       		    	   	'irsNo' : irsNo ,
	       		    	   	'ceoUserName' : ceoUserName ,
	       		    	   	'telNo' : telNo ,
	       		    	   	'faxNo' : faxNo ,
	       		    	   	'zipCode' : zipcode ,
	       		    		'address' : address1 ,
	       		    		'addressDetail' : address2 ,
	       		    		'areaName' : areaName,
	       		    		'businessType' : businessType,
	       		    		'industryType' : industryType,
	       		    		'receiverName' : receiverName,
	       		    		'receiverEmail' : receiverEmail,
	       		    		'receiverTelNo' : receiverTelNo,
	       		    		'receiverCellNo' : receiverCellNo,
	       		    		'status' : status
	       		    	   },
	       		    	   success : function(result){
	       		    		   
	       		    		   if(result == 0){
	       		    			   
	       		    			  Swal.fire({
	     		                        text :'등록이 완료되었습니다.',
	     		                        icon: 'success'
	     		    		   	  });
	       		    			 
	       		    			  $.ajax({
		       			  	       	   url: '/buyer/updateBuyerCode',
		       			  	       	   type : 'POST',
		       			  	       	   data : {
		       			  	       		'addUserId' : '${userId}',
		       			  	       		'irsNo' : irsNo 
		       			  	       	   },
		       			  	       	    success : function(result){
		       			  	       	   		  var u1 = '${userId}'; //security uid
		       		    					  var u2 = u1;
		       		    					  var enString = btoa(u2); //encoding
		       			  	       	  		 window.location.href='/buyer/joinCompanyEnd?enString='+enString+'&IrsNo='+irsNo;
		       			  	       	    },
		       				       	    fail: function(e){
		       				       	        //console.log("fail");
		       				       	    },
		       				       	    error:function(request, status, error){
		       				           		alert(error);
		       				    	    }
		       				      	  });// end ajax
	       		    		   }else{
	       		    			   
	       		    			 Swal.fire({
	     		                        text :'사업자 정보를 다시 확인해주세요',
	     		                        icon: 'error'
	     		    		   	  });
	       		    			 
	       		    			 return false;
	       		    		   }
	       		    		   
	       		    	   },
	       		    	   fail: function(e){
	       		    	        //console.log("fail");
	       		    	   },
	       		    	   error:function(request, status, error){
	       		        		alert(error);
	       		 	       }
	       		   	  });// end ajax
	       	  		 }
	       	    },
       	    fail: function(e){
       	        //console.log("fail");
       	    },
       	    error:function(request, status, error){
           		alert(error);
    	    }
      	});// end ajax
	
  }
  
	
  //사업자번호 정규식
  function checkCorporateRegistrationNumber(value) {
      var valueMap = value.replace(/-/gi, '').split('').map(function(item) {
          return parseInt(item, 10);
      });

      if (valueMap.length === 10) {
          var multiply = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5);
          var checkSum = 0;

          for (var i = 0; i < multiply.length; ++i) {
              checkSum += multiply[i] * valueMap[i];
          }

          checkSum += parseInt((multiply[8] * valueMap[8]) / 10, 10);
          return Math.floor(valueMap[9]) === (10 - (checkSum % 10));
      }

      return false;
  }
  
  function sameInfo(){
	  
	 
		  var u1 = '${userId}'; //security uid
		  var u2 = u1;
		  var enString = btoa(u2); //encoding
		  
		  if(u2 = ''){
			  //user 정보가 없는 채로 해당 페이지에 접근된 상태
			  //security 가 튕겨내지만 추가제어
			  Toast.fire({
	           icon: 'error',
	           title: '회원정보를 확인할 수 없습니다. 다시 로그인 해주시기 바랍니다.'
	      	  });
			  
			 // alert('회원정보를 확인할 수 없습니다. 다시 로그인 해주시기 바랍니다.');
			  window.location.href = '/index';
		  }
		  
		  $.ajax({
	   	   url: '/buyer/getInfo?enString='+enString,
	   	   type : 'GET',
	   	   success : function(data){
	   		   	 //console.log(data);
	   			 if(chk == true){
		   				 
		   		   	 $('#receiverEmail').val(data.userId);
		   		 	 $('#receiverName').val(data.userName);
		   			 $('#receiverTelNo').val(data.telNo.substring(3, data.telNo.length));
		   			 $('#telephoneReceiver').val(data.telNo.substring(0, 3));
		   			 $('#receiverCellNo').val(data.cellNo.substring(3, data.cellNo.length));
		   			 $('#cellphoneReceiver').val(data.cellNo.substring(0, 3));
	   			 
	   			 }else{
	   			  
		   			  $('#receiverEmail').val('');
		   			  $('#receiverName').val('');
		   			  $('#receiverTelNo').val('');
		   			  $('#telephoneReceiver').val('');
		   			  $('#receiverCellNo').val('');
		   			  $('#cellphoneReceiver').val('010');
	   		 	 }
	   			 
	   	   },
	   	   fail: function(exception){
	   	       //console.log("fail");
	   	   }
	   	 });// end ajax
	  
  }
  
  function checkbussiness(){
	  
	  var irsNo = $('#irsNo').val();	//사업자번호
	  
	  //name Check
	  if(irsNo.length != 10){
   	  	  Toast.fire({
           icon: 'error',
           title: '올바른 사업자 번호를 입력해주세요.'
      	  });
  	   	  document.getElementById('irsNo').focus();
  	   	  return;
       }
	  	
      var paramList = {
	    		'irsNo' : irsNo
	    	   };
      
 		$.ajax({
	    	   url: '/buyer/checkBussiness',
	    	   type : 'POST',
	    	   cache : false,
	    	   data : paramList 
	    	   ,
	    	   success : function(result){
	    		   
	    		   //console.log(result);
	    		   if(result.RETURN_CODE == '01'){
	    			   Toast.fire({
	    		           icon: 'success',
	    		           title: '조회에 성공했습니다'
	    		      	  });
	    			   $('#buyerName').val(result.RETURN_COMPNAME);
		    		   $('#ceoUserName').val(result.RETURN_REPNAME);
	    		   }else{
	    			   Toast.fire({
	    		           icon: 'error',
	    		           title: '올바른 사업자 번호를 입력해주세요'
	    		      	  });
	    			   document.getElementById('irsNo').focus();
	    		  	   return;
	    		   }
	    		   
	    		   
	    		   
	    	   },
	    	   fail: function(e){
	    	        //console.log("fail");
	    	   },
	    	   error:function(request, status, error){
	        		alert(error);
	 	       }
 		  
 		});
 		
  }
  </script>
  </body>
  </html>
