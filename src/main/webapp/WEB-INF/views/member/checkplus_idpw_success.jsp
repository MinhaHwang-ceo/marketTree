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
		var parent = window.opener;
		
		$.ajax({
	    	   url: '/searchMyInfo',
	    	   type : 'POST',
	    	   data : {
	    		   'user_name' : `<%= sName %>`,
	    		   'mob_no'    : `<%= sMobileNo %>`,
	    		   'only_param': `<%= sDupInfo %>`,
	    		   'birth'     : `<%= sBirthDate %>`,
	    		   'gender'    : `<%= sGender %>`
	    	   },
	    	   success : function(result){
	    		   
	    		   
	    		   //console.log(result);
	    		   //console.log(result.info[0].email);
	    		   
	    		   var pw_id =  parent.document.getElementById('pw_id').value ?? '';
	    		   
	    		   if(pw_id != ''){
	    			   if(pw_id == result.info[0].email){
	    				   
	    				   parent.document.getElementsByClassName('btn_idpw')[1].style.display = 'none';
	    				   parent.document.getElementById('change_pw_div').style.display = 'block';
	    				   parent.document.getElementById('search_id_pw').value = result.info[0].email;
	    				   parent.document.getElementById('search_id').value = result.info[0].email;
	    				   window.self.close();
	    				   
	    			   }else{
	    				   
	    				   parent.notFound();
	    				   window.self.close();
	    				   
	    			   }
	    		   }
	    		   
	    		   if( pw_id == '' && result.info[0].email != null && result.info[0].email != undefined && result.info[0].email != '' ){
	    			   parent.document.getElementById('search_id').value = result.info[0].email;
	    			   parent.document.getElementById('service_agree').innerHTML = result.info[0].serviceAgreedDate;
	    			   
	    			   parent.document.getElementsByClassName('btn_idpw')[0].style.display = 'none';
	    			   parent.document.getElementById('none_id_div').style.display = 'none';
	    			   parent.document.getElementById('search_id_div').style.display = 'block';
	    			   
	    			   window.self.close();
	    			  
	    		   }else if(pw_id == ''){
	    			   parent.document.getElementById('search_id_div').style.display = 'none';
	    			   parent.document.getElementById('none_id_div').style.display = 'block';
	    			   
	    			   window.self.close();
	    		   }
	    	       
	    	   },
	    	   fail: function(e){
	    	       //console.log("fail");
	    	   }
	    });// end ajax
 
		var mob_no = `<%= sMobileNo %>`;
		
		var mob_f = mob_no.substr(0,3);
		var mob_no = mob_no.substr(3);
		
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
	});
</script>
<html>
<body>
    <center>
    <p><p><p><p>
    본인인증이 완료 되었습니다.<br>
    <table border=1>
        <tr>
            <td>복호화한 시간</td>
            <td><%= sCipherTime %> (YYMMDDHHMMSS)</td>
        </tr>
        <tr>
            <td>요청 번호</td>
            <td><%= sRequestNumber %></td>
        </tr>            
        <tr>
            <td>NICE응답 번호</td>
            <td><%= sResponseNumber %></td>
        </tr>            
        <tr>
            <td>인증수단</td>
            <td><%= sAuthType %></td>
        </tr>
		<tr>
            <td>성명</td>
            <td><%= sName %></td>
        </tr>
        <tr>
            <td>성명</td>
            <td><%= utf8_sName %></td>
        </tr>
		<tr>
            <td>중복가입 확인값(DI)</td>
            <td><%= sDupInfo %></td>
        </tr>
		<tr>
            <td>연계정보 확인값(CI)</td>
            <td><%= sConnInfo %></td>
        </tr>
		<tr>
            <td>생년월일(YYYYMMDD)</td>
            <td><%= sBirthDate %></td>
        </tr>
		<tr>
            <td>성별</td>
            <td><%= sGender %></td>
        </tr>
				<tr>
            <td>내/외국인정보</td>
            <td><%= sNationalInfo %></td>
        </tr>
        </tr>
			<td>휴대폰번호</td>
            <td><%= sMobileNo %></td>
        </tr>
		<tr>
			<td>통신사</td>
			<td><%= sMobileCo %></td>
        </tr>
		<tr>
			<td colspan="2">인증 후 결과값은 내부 설정에 따른 값만 리턴받으실 수 있습니다. <br>
			일부 결과값이 null로 리턴되는 경우 관리담당자 또는 계약부서(02-2122-4615)로 문의바랍니다.</td>
		</tr>
		</table><br><br>        
    <%= sMessage %><br>
    </center>
</body>
</html> --%>