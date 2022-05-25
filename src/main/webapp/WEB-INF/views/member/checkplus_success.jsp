<%-- <%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%	//인증 후 결과값이 null로 나오는 부분은 관리담당자에게 문의 바랍니다.
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

    String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");

    String sSiteCode = "BW319";				// NICE로부터 부여받은 사이트 코드
    String sSitePassword = "Uw8fbxDLZaOE";			// NICE로부터 부여받은 사이트 패스워드

    String sCipherTime = "";			// 복호화한 시간
    String sRequestNumber = "";			// 요청 번호
    String sResponseNumber = "";		// 인증 고유번호
    String sAuthType = "";				// 인증 수단
    String sName = "";					// 성명
    String utf8_sName = "";					// 성명
    String sDupInfo = "";				// 중복가입 확인값 (DI_64 byte)
    String sConnInfo = "";				// 연계정보 확인값 (CI_88 byte)
    String sBirthDate = "";				// 생년월일(YYYYMMDD)
    String sGender = "";				// 성별
    String sNationalInfo = "";			// 내/외국인정보 (개발가이드 참조)
	String sMobileNo = "";				// 휴대폰번호
	String sMobileCo = "";				// 통신사
    String sMessage = "";
    String sPlainData = "";
    
    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

    if( iReturn == 0 )
    {
        sPlainData = niceCheck.getPlainData();
        sCipherTime = niceCheck.getCipherDateTime();
        
        // 데이타를 추출합니다.
        java.util.HashMap mapresult = niceCheck.fnParse(sPlainData);
        
        sRequestNumber  = (String)mapresult.get("REQ_SEQ");
        sResponseNumber = (String)mapresult.get("RES_SEQ");
        sAuthType		= (String)mapresult.get("AUTH_TYPE");
        sName			= (String)mapresult.get("NAME");
		utf8_sName			= (String)mapresult.get("UTF8_NAME"); //charset utf8 사용시 주석 해제 후 사용
        sBirthDate		= (String)mapresult.get("BIRTHDATE");
        sGender			= (String)mapresult.get("GENDER");
        sNationalInfo  	= (String)mapresult.get("NATIONALINFO");
        sDupInfo		= (String)mapresult.get("DI");
        sConnInfo		= (String)mapresult.get("CI");
        sMobileNo		= (String)mapresult.get("MOBILE_NO");
        sMobileCo		= (String)mapresult.get("MOBILE_CO");
        
        String session_sRequestNumber = (String)session.getAttribute("REQ_SEQ");
        if(!sRequestNumber.equals(session_sRequestNumber))
        {
            sMessage = "세션값 불일치 오류입니다.";
            sResponseNumber = "";
            sAuthType = "";
        }
    }
    else if( iReturn == -1)
    {
        sMessage = "복호화 시스템 오류입니다.";
    }    
    else if( iReturn == -4)
    {
        sMessage = "복호화 처리 오류입니다.";
    }    
    else if( iReturn == -5)
    {
        sMessage = "복호화 해쉬 오류입니다.";
    }    
    else if( iReturn == -6)
    {
        sMessage = "복호화 데이터 오류입니다.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "입력 데이터 오류입니다.";
    }    
    else if( iReturn == -12)
    {
        sMessage = "사이트 패스워드 오류입니다.";
    }    
    else
    {
        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
    }

%>
<%!

	public String requestReplace (String paramValue, String gubun) {

        String result = "";
        
        if (paramValue != null) {
        	
        	paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

        	paramValue = paramValue.replaceAll("\\*", "");
        	paramValue = paramValue.replaceAll("\\?", "");
        	paramValue = paramValue.replaceAll("\\[", "");
        	paramValue = paramValue.replaceAll("\\{", "");
        	paramValue = paramValue.replaceAll("\\(", "");
        	paramValue = paramValue.replaceAll("\\)", "");
        	paramValue = paramValue.replaceAll("\\^", "");
        	paramValue = paramValue.replaceAll("\\$", "");
        	paramValue = paramValue.replaceAll("'", "");
        	paramValue = paramValue.replaceAll("@", "");
        	paramValue = paramValue.replaceAll("%", "");
        	paramValue = paramValue.replaceAll(";", "");
        	paramValue = paramValue.replaceAll(":", "");
        	paramValue = paramValue.replaceAll("-", "");
        	paramValue = paramValue.replaceAll("#", "");
        	paramValue = paramValue.replaceAll("--", "");
        	paramValue = paramValue.replaceAll("-", "");
        	paramValue = paramValue.replaceAll(",", "");
        	
        	if(gubun != "encodeData"){
        		paramValue = paramValue.replaceAll("\\+", "");
        		paramValue = paramValue.replaceAll("/", "");
            	paramValue = paramValue.replaceAll("=", "");
        	}
        	
        	result = paramValue;
            
        }
        return result;
  }
%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>


	$(document).ready(function() {
		
		
		var mob_no = `<%= sMobileNo %>`;
		
		var mob_f = mob_no.substr(0,3);
		mob_no = mob_no.substr(3);
		
		var msgTF = '';
		//핸드폰 번호 유효성 체크////
		$.ajax({
    	   url: '/chkPhone?phone='+ mob_f + mob_no,
    	   type : 'GET',
    	   success : function(msg){
    		   msgTF = msg;
    		 	//여기 확인
    			if(msgTF == 'true' || msgTF == true){
    				 var parent = window.opener;
    				 
    				 parent.document.getElementById('only_param').value = `<%= sDupInfo %>`;
    				 parent.document.getElementById('user_name').value = `<%= sName %>`;
    				 parent.document.getElementById('cellphone').value = mob_f + mob_no;
    				 window.opener.searchFail();
    				 window.self.close();
    		    }else{
    		    	 
    				var parent = window.opener;
    				
    		        parent.document.getElementById('user_name').value = `<%= sName %>`;
    		        parent.document.getElementById('cellphone_f').value = mob_f;
    		        parent.document.getElementById('cellphone').value = mob_no;
    		        parent.document.getElementById('only_param').value = `<%= sDupInfo %>`;
    		        parent.document.getElementById('auth_type').value = `<%= sAuthType %>`;
    		        parent.document.getElementById('birth').value = `<%= sBirthDate %>`;
    		        parent.document.getElementById('mobile_co').value = `<%= sMobileCo %>`;
    		        parent.document.getElementById('gender').value = `<%= sGender %>`;
    		        
    		        parent.document.getElementById('user_name').readOnly = true;
    		        parent.document.getElementById('cellphone_f').disabled = true;
    		        parent.document.getElementById('cellphone').readOnly = true;
    		        
    		        window.self.close();
    		    }
    			
    	   },
    	   fail: function(e){
    	       //console.log("fail")
    	   }
    	 });// end ajax
		
	    
	});
</script> --%>