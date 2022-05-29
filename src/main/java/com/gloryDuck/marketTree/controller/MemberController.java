package com.gloryDuck.marketTree.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.SocketException;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.script.ScriptException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.RedirectView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.gloryDuck.marketTree.model.repositories.MemberRepository;
import com.gloryDuck.marketTree.model.service.BackedLoginService;
import com.gloryDuck.marketTree.model.service.IsMemberException;
import com.gloryDuck.marketTree.model.service.KakaoAPI;
import com.gloryDuck.marketTree.model.service.MemberService;
import com.gloryDuck.marketTree.model.service.NaverLoginBO;
import com.gloryDuck.marketTree.model.vo.MemberEntity;
import com.gloryDuck.marketTree.model.vo.QMemberEntity;
import com.google.gson.JsonObject;
import com.querydsl.jpa.impl.JPAQueryFactory;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MemberController {
	
	 @Autowired
	 private BackedLoginService backedLoginService;
	 
	 @Autowired
	 private MemberService memberService;
	 
	 @Autowired
	 private MemberRepository memberRepository;
	 
	 /* NaverLoginBO */
	 private NaverLoginBO naverLoginBO;

	 @Autowired
	 private KakaoAPI kakao;
	 
	 @PersistenceContext
	 private EntityManager em;
		
	 
	 @Autowired
	 private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	     this.naverLoginBO = naverLoginBO;
	 }

	 
	    
    //로그인 페이지
	//Request Mapping으로 해야지 GET, POST 모두 사용가능 ( 필요에 의해 사용할 것 )
    @RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
    public String getLoginForm(@RequestParam(value="myId", defaultValue="") String myId,Model model, HttpSession session, HttpServletRequest request) {

    	session.setAttribute("signUp", "N");
    	
    	/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        //네이버 
        model.addAttribute("naverUrl", naverAuthUrl);
        //카카오
        model.addAttribute("kakaoUrl", "https://kauth.kakao.com/oauth/authorize?client_id=c29af8a8adfc0e089b9fd1d54a273733&client_secret=gZW0bIUreTCB3STiOEo45omXXd756MVk&redirect_uri=https://www.weconn.co.kr/kakao&response_type=code");
        
        System.out.println("init session ================" + session.getId());
        
		// 요청 시점의 사용자 URI 정보를 Session의 Attribute에 담아서 전달(잘 지워줘야 함)
		// 로그인이 틀려서 다시 하면 요청 시점의 URI가 로그인 페이지가 되므로 조건문 설정
		String uri = request.getHeader("Referer");
		boolean uri_b = uri == null ? true : false;
		
		if(uri_b) {
			
		}else if (!uri.contains("/login")) {
			request.getSession().setAttribute("prevPage", request.getHeader("Referer"));
		}
		
		if(!myId.equals("")) {
			model.addAttribute("myId", myId);
			request.getSession().setAttribute("prevPage", "/index");
		}
        
        return "member/login";
    }
    
    //로그인 페이지를 거치지 않고 바로 로그인
    @RequestMapping("/loginWithoutForm")
    public ModelAndView loginWithoutForm(@RequestParam(value="userName",defaultValue="") String userName,HttpServletRequest request, Model model) {
    	
      Map<String, ?> flashMap =RequestContextUtils.getInputFlashMap(request);
      String userId = "";
      
      if(userName.equals("")) {
    	  if(flashMap!=null) {
              
          	userId = (String) flashMap.get("userId");
         }
      }else {
    	  userId = userName;
      }
      
      
      if(userId != null && !userId.equals("")) {
    	 MemberEntity member = memberRepository.findByUserId(userId).orElseThrow(() 
    				-> new UsernameNotFoundException("유저를 찾지 못했습니다"));
          
        List<GrantedAuthority> roles = new ArrayList<>(1);
        roles.add(new SimpleGrantedAuthority(member.getPlatformRole()));
        
        
        User user = new User(member.getUserId(), member.getPassword(), Arrays.asList(new SimpleGrantedAuthority(member.getPlatformRole())));
        
        Authentication auth = new UsernamePasswordAuthenticationToken(user, null, roles);
        SecurityContextHolder.getContext().setAuthentication(auth);
        
        if(userName.equals("")) {
        	 ModelAndView mav = new ModelAndView();
             
             RedirectView rv = new RedirectView();
             rv.setUrl("/index");
             rv.setExposeModelAttributes(false);
             
             mav.setView(rv);
             
             return mav;
        }else {
        	 ModelAndView mav = new ModelAndView();
             
             RedirectView rv = new RedirectView();
             rv.setUrl("/buyer/m6_0301");
             rv.setExposeModelAttributes(false);
             
             mav.setView(rv);
             
             return mav;
        }
        
       
        
      }else{
    	 model.addAttribute("exceptionMsgName","연동계정으로 로그인에 실패했습니다 플랫폼 계정으로 로그인 해주세요");
    	 ModelAndView mav = new ModelAndView();
         
         RedirectView rv = new RedirectView();
         rv.setUrl("member/login");
         rv.setExposeModelAttributes(false);
         
         mav.setView(rv);
         
         return mav;
      }
      
     
    }
    
    //로그아웃
    @GetMapping("/doLogout")
    public String getLogout(HttpServletRequest request, HttpServletResponse response) {
      new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
      return "redirect:/login";
    }
    
    //회원가입 페이지
    @GetMapping("/signUp")
    public String getSignForm(Model model,HttpSession session ) throws Exception {
    	
    	//api 개발
    	/*
    	String access_token = niceTestAPI.getAccessToken(session);
    	System.out.println("access_token = " + access_token);
    	
    	HashMap<String,String> reData = niceTestAPI.getCryptoToken("info",access_token,session);
    	model.addAttribute("reData", reData);
    	
    	model.addAttribute("CLIENT_ID", "c7b9455d-5093-4e41-ad05-e144132690dd");
    	model.addAttribute("CLIENT_SECRET", "697a0867627323a995253287e9a4b743");
    	*/
        return "member/join";
    }
    
    
    @GetMapping("/memberSignUp")
    public String getSign(@RequestBody JsonObject result, Model model ,HttpSession session ) throws NoSuchAlgorithmException {
    	
    	model.addAttribute("result", result);
    	System.out.println(result);
    	
    	return "member/join";
    }
    
    @RequestMapping(value="/checkplus_success")
    public String checkplus_success(@RequestParam(value="EncodeData") String EncodeData, Model model ,HttpSession session, HttpServletRequest request, HttpServletResponse response ) throws NoSuchAlgorithmException, UnsupportedEncodingException {
    	
    	request.setAttribute("EncodeData", EncodeData);
			
    	return "member/checkplus_success";
    }
    
    @RequestMapping(value="/checkplus_fail")
    public String checkplus_fail(@RequestParam(value="EncodeData") String EncodeData, Model model ,HttpSession session, HttpServletRequest request ) throws NoSuchAlgorithmException {
    	
    	request.setAttribute("EncodeData", EncodeData);
    	
    	return "member/checkplus_fail";
    }
    
    @RequestMapping(value="/checkplus_idpw_success")
    public String checkplus_idpw_success(@RequestParam(value="EncodeData") String EncodeData, Model model ,HttpSession session, HttpServletRequest request, HttpServletResponse response ) throws NoSuchAlgorithmException, UnsupportedEncodingException {
    	
    	request.setAttribute("EncodeData", EncodeData);
    	
    	return "member/checkplus_idpw_success";
    }
    
    @RequestMapping("/checkplus_idpw_fail")
    public String checkplus_idpw_fail(@RequestParam(value="EncodeData") String EncodeData, Model model ,HttpSession session, HttpServletRequest request ) throws NoSuchAlgorithmException {
    	
    	request.setAttribute("EncodeData", EncodeData);
    	
    	return "member/checkplus_idpw_fail";
    }
    
    @RequestMapping(value="/searchMyInfo")
    @ResponseBody
    public HashMap<String, Object> searchMyInfo(@RequestParam HashMap<String, String> data, Model model ,HttpSession session, HttpServletRequest request, HttpServletResponse response ) throws NoSuchAlgorithmException, UnsupportedEncodingException {
    	
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = "";
		name = auth.getName();
		String principal = auth.getName();
		
		HashMap<String , Object> retVal = new HashMap<String, Object>();
		JPAQueryFactory jpaQueryFactory = new JPAQueryFactory(em);
	   
	    QMemberEntity member = QMemberEntity.memberEntity;
	    
	    List<MemberEntity> memberEntity = null;
	    
	    String userName = data.get("user_name");
	    String mobNo = data.get("mob_no");
	    String onlyParam = data.get("only_param");
	    String birth = data.get("birth");
	    String gender = data.get("gender");
	     
	    memberEntity = jpaQueryFactory
	 			.select(member)
	 			.from(member)
	 		.where(member.cellNo.eq(mobNo),member.onlyParam.eq(onlyParam),
	 				member.birth.eq(birth),member.gender.eq(gender))
	 		.fetch();
	    
	    System.out.println("member ==== " + memberEntity);
	    
	    retVal.put("info", memberEntity);
	    
	    if(memberEntity == null) {
	    	
	    }else {
	    	
	    }
	    	
	    return retVal;
    	
    }
    
    //idpw_search 페이지
    @RequestMapping("/idpw_search")
    public String idpw_search() {
        return "member/idpw";
    }
    
    
    @RequestMapping(value="/checkAccount")
    @ResponseBody
    public HashMap<String,String> checkAccount(@RequestParam HashMap<String,String> paramList, Model model ,HttpSession session, HttpServletRequest request) throws Exception {
     	
    	/************************************************************************************************
		NICE평가정보 Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
		
		서비스명 : 계좌확인 서비스 
		페이지명 : 계좌확인 인증요청 페이지

		방화벽 이용 시 아래 IP와 Port를 오픈해주셔야 합니다
		IP : 121.162.155.160 / Port : 80, 443
    	 *************************************************************************************************/

		String niceUid = "NID205053";				// NICE에서 발급받은 사이트코드
		String svcPwd  = "68743065";				// NICE에서 발급받은 사이트 패스워드
		String strCharset = "UTF-8";		// 인증서버의 한글 인코딩 (EUC-KR, UTF-8)
    	
		// 한글 인코딩 설정
		request.setCharacterEncoding("utf-8");
		//request.setCharacterEncoding("euc-kr");
		
		// 입력 페이지에서 전달된 입력값 취득
		String service		= paramList.get("service");		// 서비스구분
		String svcGbn		= paramList.get("svcGbn");		// 업무구분
		String strGbn		= paramList.get("strGbn");		// 계좌구분 (1:개인계좌, 2:법인계좌)
		String strBankCode	= paramList.get("strBankCode");	// 은행코드
		String strAccountNo	= paramList.get("strAccountNo");	// 계좌번호

		
	    // 예금주명 초기화 및 취득
		String strNm = "";
		if(request.getParameter("name") != null){
			strNm = request.getParameter("name");
			
			// 한글이 깨져서 들어오는 경우 한글 인코딩을 직접 변환
			// strNm = new String(request.getParameter("name").getBytes(strCharset));	

			// URL 인코딩 처리	
			strNm = URLEncoder.encode(strNm, strCharset);
		}

		// 생년월일 초기화 및 취득 (개인-생년월일 6자리, 법인-사업자번호 10자리)
		String strResId = "";
		if(request.getParameter("birth") != null){
			strResId = request.getParameter("birth");
		}
		
		// 주문번호 설정 (중복값 설정 불가, 소스 수정 불필요)	
		String strOrderNo = new SimpleDateFormat("yyyyMMdd").format(new Date()) + (Math.round(Math.random() * 10000000000L) + "");  	

		// 조회사유 설정 (10:회원가입 20:기존회원인증 30:성인인증 40:비회원확인 90:기타)	
		String inq_rsn = paramList.get("inq_rsn");;			

		// 계좌인증 처리
		String bcResult = bankCheck(strCharset, niceUid, svcPwd, service, svcGbn, strGbn, strBankCode, strAccountNo, strNm, strResId, inq_rsn, strOrderNo); 

		// 결과값 분할
		String[] bcResults = bcResult.split("\\|");
		
		// 결과값 추출
		String resultOrderNo = bcResults[0];	// 주문번호
		String resultCode    = bcResults[1];	// 결과코드
		String resultMsg     = bcResults[2];	// 결과메세지
		
		// 결과값 출력
		System.out.println("주문번호  : "  + resultOrderNo + "<br>");
		System.out.println("결과코드  : "  + resultCode + "<br>");
		System.out.println("결과메시지 : " + resultMsg + "<br>");
		
		HashMap<String,String> retVal = new HashMap<String,String>();
		
		retVal.put("resultOrderNo", resultOrderNo);
		retVal.put("resultCode", resultCode);
		retVal.put("resultMsg", resultMsg);
    	
     	return retVal;
     }
    
	//계좌인증 소켓-POST 함수
	public String bankCheck(String strCharset, String niceUid, String svcPwd, String service, String svcGbn, String strGbn, String strBankCode, String strAccountNo, String strNm, String strResId, String inq_rsn, String strOrderNo)
	{
		// 결과값 초기화
		String result = "";
		
		// NICE 계좌인증 호스트
		String host = "secure.nuguya.com";

		// NICE 계좌인증 URL(EUC-KR)																													
		String target = "https://secure.nuguya.com/nuguya/service/realname/sprealnameactconfirm.do";
		if (strCharset.equals("UTF-8")){
			// NICE 계좌인증 URL(UTF-8)
			target = "https://secure.nuguya.com/nuguya2/service/realname/sprealnameactconfirm.do";
		}	
		
		// 계좌인증 파라미터 설정
		String postValues = "niceUid" 				+ "=" + niceUid	
							+ "&" + "svcPwd"		+ "=" + svcPwd	
							+ "&" + "service"		+ "=" + service	
							+ "&" + "svcGbn"		+ "=" + svcGbn	
							+ "&" + "strGbn"		+ "=" + strGbn	
							+ "&" + "strBankCode"	+ "=" + strBankCode	
							+ "&" + "strAccountNo"	+ "=" + strAccountNo	
							+ "&" + "strNm"			+ "=" + strNm	
							+ "&" + "strResId"		+ "=" + strResId	
							+ "&" + "inq_rsn"		+ "=" + inq_rsn	
							+ "&" + "strOrderNo"	+ "=" + strOrderNo;
		
		// URL 및 파라미터 확인
		System.out.println("URL:\n" + target);
		System.out.println("POST:\n" + postValues);
		
		// 소켓 포트 설정 (HTTP:80, HTTPS:443)
		int port = 443;
		
		// 소켓 타임아웃 (10초)
		int timeout = 10;
		
		// 스트림 객체 초기화
    	BufferedReader in = null;
      	PrintWriter out = null;

      	try{
            // 결과 버퍼 생성
            StringBuffer sbResult = new StringBuffer();
      		
      		// 소켓통신 오픈
        	SSLSocketFactory factory = (SSLSocketFactory)SSLSocketFactory.getDefault();
          	SSLSocket soc = (SSLSocket)factory.createSocket(host, port);

            // 소켓통신 설정 
            soc.setSoTimeout(timeout * 1000);
        	soc.setSoLinger(true, 10);	
            soc.setKeepAlive(true);		           
      		
            // 스트림 객체 생성
            out = new PrintWriter(soc.getOutputStream());
            in  = new BufferedReader(new InputStreamReader(soc.getInputStream()), 8 * 1024);
            
	        // 요청 헤더 생성
            out.println("POST " + target + " HTTP/1.1");
            out.println("Host: " + host);
            out.println("Connection: Keep-Alive");
            out.println("Content-Type: application/x-www-form-urlencoded");
            out.println("Content-Length: " + postValues.length());
            out.println();
            out.println(postValues);
            out.flush();            
            
            // 응답헤더 초기화
            String line = null;

	        // 소켓통신 처리
			int i=0;
            boolean notYet = true;
            while((line = in.readLine())!= null){
                i++;
                if (notYet && line.indexOf("HTTP/1.") == -1 ){
                	continue;
                }
                if (notYet && line.indexOf("HTTP/1.") > -1 ){
                	notYet = false;
                }
                
                if (line.indexOf("HTTP/1.") > -1 ){
                	notYet = false;
                }
                if (line.startsWith("0") || line == null){
                    break;
                }
             	
                // 9번째 라인 추출
                if(i==9) {
                	sbResult.append(line);
                }
            }
            
            // 소켓통신 종료
            out.close();
            in.close();
            soc.close();

            // 결과값 설정
            result = sbResult.toString();
            
        }
      	// 소켓오류 처리
      	catch(SocketException e){
        	System.out.println("[계좌확인 소켓오류] " + e.getMessage());
        	result = strOrderNo + "|E999|소켓연결에 실패하였습니다.";
        }
      	// 기타 시스템 오류 처리
      	catch (Exception e){
        	System.out.println("[계좌확인 기타오류] " + e.getMessage());
        	e.printStackTrace();
        }
      	
      	// 오류 메세지 설정
      	if(result.equals("")){
        	result = strOrderNo + "|E999|소켓통신 중 오류가 발생했습니다.";
      	}
      	
		return result;
	}
    
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
    	
    
    //기존회원
    @RequestMapping("/getTimeStamp")
    @ResponseBody
    public String getTimeStamp() {
    	
    	Date currentDate = new Date();
    	long current_timestamp = currentDate.getTime() /1000;
        String timeStamp = String.valueOf(current_timestamp);
    	System.out.println(current_timestamp);
    	
        return timeStamp;
    }
    
    
    //seller회원 전환 완료
    @GetMapping("/signUpEnd")
    public String getSignEnd() {
        return "member/join_end";
    }

    //sns 회원가입 페이지
    @GetMapping("/snsSignUp")
    public String getSnsSignForm(HttpServletRequest request, HttpServletResponse response) {
    	
    	response.setContentType("text/html;charset=utf-8");
    	
        return "sns/snsSignUp";
    }
    
    //snsLogin 페이지
    @GetMapping("/snsLogin")
    public String getSnsLogin(HttpServletRequest request, HttpServletResponse response) {
    	
    	response.setContentType("text/html;charset=utf-8");
    	
        return "sns/snsLogin";
    }
    
    
    //회원가입
    @PostMapping("/doSignUp")
    public String getSignUp(MemberEntity member,HttpServletRequest request, HttpServletResponse response) throws IsMemberException,Exception {
    	backedLoginService.save(member,request,response);
        return "redirect:/signUpEnd";
    }
    
    //회원가입
    @PostMapping("/changeMyPass")
    @ResponseBody
    public String changeMyPass(@RequestParam(value="pw1") String pw1 , @RequestParam(value="pw2") String pw2 ,@RequestParam(value="myId") String myId ,HttpServletRequest request, HttpServletResponse response) throws IsMemberException,Exception {
    	
    	MemberEntity member = memberRepository.findByEmail(myId);
    	
    	if(member != null) {
    		backedLoginService.modify(member,pw1,pw2,request,response);
            return "success";
    	}else {
    		return "fail";
    	}
    	
    	
    }
    
    //admin 페이지
    @GetMapping("/admin")
    public String getAdmin() {
        return "admin/login";
    }
    
    //기존회원
    @RequestMapping("/chkId")
    @ResponseBody
    public String getUser(@RequestParam("uid") String uid) {
    	
    	String msg = "";
    	boolean isUser = false;
        isUser = memberService.getIsUser(uid);
        if(isUser) {
        	msg = "true";
        }else {
        	msg = "false";
        }
        
        return msg;
    }
    
    //기존회원
    @RequestMapping("/chkPhone")
    @ResponseBody
    public String getPhone(@RequestParam("phone") String phone) {
    	
    	String msg = "";
    	boolean isUser = false;
        isUser = memberService.getPhone(phone, phone);
        if(isUser) {
        	msg = "true";
        }else {
        	msg = "false";
        }
        
        System.out.println(isUser + ", "+ msg);
        
        return msg;
    }
    
    //기존회원 
    @RequestMapping("/linkedMyData")
    @ResponseBody
    @Transactional 
    public String linkedMyData(@RequestParam HashMap<String,String> data) {

   	 	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
   	 	String name = "";
        String principal = auth.getName();
        
        if(principal.equals("annonymouseUser") || principal.contains("annonymouseUser")){
        	return "redirect:/login";
          	
        }else{
        	
        	name = principal;
        	String onlyParam = data.get("onlyParam"); 
        	JPAQueryFactory jpaQueryFactory = new JPAQueryFactory(em);
         	QMemberEntity AlreadyMember = QMemberEntity.memberEntity;
         	
         	String nick = data.get("userName");
         	MemberEntity member = memberRepository.findByOnlyParam(onlyParam);
         	MemberEntity isMe = memberRepository.findByEmail(name);
         	
         	if(member != null) {
         		long result = 0;
         		String sns = data.get("sns");
         		if(sns.equals("naver")) {
         			
         			result = jpaQueryFactory
        			    	.update(AlreadyMember)
        			    	.set(AlreadyMember.changeUserId, member.getUserId())
        			    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        			    	.set(AlreadyMember.snsOnly,"N")
        			    	.set(AlreadyMember.snsLoginNaver, isMe.getSnsLoginNaver())
        			    	.set(AlreadyMember.snsLoginNaverMail, isMe.getSnsLoginNaverMail())
        			    	.set(AlreadyMember.snsLoginNaverName, isMe.getSnsLoginNaverName())
        			    	.set(AlreadyMember.snsLoginNaverDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        			    	.set(AlreadyMember.authType, member.getAuthType())
        			    	.set(AlreadyMember.birth, member.getBirth())
        			    	.set(AlreadyMember.mobileCo, member.getMobileCo())
        			    	.set(AlreadyMember.gender, member.getGender())
        			    	.where(AlreadyMember.userId.eq(member.getUserId()))
        			    	.execute();
         			

                 	result = jpaQueryFactory
        			    	.update(AlreadyMember)
        			    	.set(AlreadyMember.changeUserId, member.getUserId())
        			    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        			    	.set(AlreadyMember.snsOnly,"N")
        			    	.set(AlreadyMember.authType, member.getAuthType())
        			    	.set(AlreadyMember.birth, member.getBirth())
        			    	.set(AlreadyMember.mobileCo, member.getMobileCo())
        			    	.set(AlreadyMember.gender, member.getGender())
        			    	.where(AlreadyMember.userId.eq(isMe.getUserId()))
        			    	.execute();
                 	
                 	return "success";
         			
         		}else if(sns.equals("kakao")) {
         			
         			result = jpaQueryFactory
        			    	.update(AlreadyMember)
        			    	.set(AlreadyMember.changeUserId, member.getUserId())
        			    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        			    	.set(AlreadyMember.snsOnly,"N")
        			    	.set(AlreadyMember.snsLoginKakao, isMe.getSnsLoginKakao())
        			    	.set(AlreadyMember.snsLoginKakaoMail, isMe.getSnsLoginKakaoMail())
        			    	.set(AlreadyMember.snsLoginKakaoName, isMe.getSnsLoginKakaoName())
        			    	.set(AlreadyMember.snsLoginKakaoDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        			    	.set(AlreadyMember.authType, member.getAuthType())
        			    	.set(AlreadyMember.birth, member.getBirth())
        			    	.set(AlreadyMember.mobileCo, member.getMobileCo())
        			    	.set(AlreadyMember.gender, member.getGender())
        			    	.where(AlreadyMember.userId.eq(member.getUserId()))
        			    	.execute();
         			

                 	result = jpaQueryFactory
        			    	.update(AlreadyMember)
        			    	.set(AlreadyMember.changeUserId, member.getUserId())
        			    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        			    	.set(AlreadyMember.snsOnly,"N")
        			    	.set(AlreadyMember.authType, member.getAuthType())
        			    	.set(AlreadyMember.birth, member.getBirth())
        			    	.set(AlreadyMember.mobileCo, member.getMobileCo())
        			    	.set(AlreadyMember.gender, member.getGender())
        			    	.where(AlreadyMember.userId.eq(isMe.getUserId()))
        			    	.execute();
                 	
                 	return "success";
         			
         		}else {
         			
         			return "fail";
         			
         		}
             	
               	
         	}else {
         		
         		return "fail";
         		
         	}
         	
         	
         }
      
        
        
    }
    
    //기존회원
    @RequestMapping("/delMyLinked")
    @ResponseBody
    @Transactional
    public String delMyLinked(@RequestParam HashMap<String,String> data) {

   	 	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
   	 	String name = "";
        String principal = auth.getName();
        
        if(principal.equals("annonymouseUser") || principal.contains("annonymouseUser")){
        	return "redirect:/login";
          	
        }else{
        	
        	name = principal;
        	JPAQueryFactory jpaQueryFactory = new JPAQueryFactory(em);
         	QMemberEntity AlreadyMember = QMemberEntity.memberEntity;
         	
         	MemberEntity member = memberRepository.findByEmailAndOnlyParamNotNull(name);
         	
         	if(member != null) {
         		
         		long result = 0;
         		
         		String sns = data.get("sns");
         		
         		if(sns.equals("naver")) {
         			

                 	result = jpaQueryFactory
        			    	.update(AlreadyMember)
        			    	.set(AlreadyMember.changeUserId, "")
        			    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        			    	.set(AlreadyMember.snsOnly,"Y")
        			    	.set(AlreadyMember.authType, "")
        			    	.set(AlreadyMember.birth, "")
        			    	.set(AlreadyMember.mobileCo,"")
        			    	.set(AlreadyMember.gender, "")
        			    	.where(AlreadyMember.userId.eq(member.getSnsLoginNaverMail()),
        			    			AlreadyMember.snsLoginNaverMail.eq(member.getSnsLoginNaverMail()),
        			    			AlreadyMember.onlyParam.eq("").or(null))
        			    	.execute();
                 	
         			result = jpaQueryFactory
        			    	.update(AlreadyMember)
        			    	.set(AlreadyMember.changeUserId, member.getUserId())
        			    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        			    	.set(AlreadyMember.snsOnly,"N")
        			    	.set(AlreadyMember.snsLoginNaver, "")
        			    	.set(AlreadyMember.snsLoginNaverMail,  "")
        			    	.set(AlreadyMember.snsLoginNaverName,  "")
        			    	.set(AlreadyMember.snsLoginNaverDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        			    	.where(AlreadyMember.userId.eq(member.getUserId()),
        			    			AlreadyMember.onlyParam.ne("").and(null))
        			    	.execute();
         		
                 	
                 	return "success";
         			
         		}else if(sns.equals("kakao")) {
         			
                 	result = jpaQueryFactory
        			    	.update(AlreadyMember)
        			    	.set(AlreadyMember.changeUserId, "")
        			    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        			    	.set(AlreadyMember.snsOnly,"Y")
        			    	.set(AlreadyMember.authType, "")
        			    	.set(AlreadyMember.birth, "")
        			    	.set(AlreadyMember.mobileCo,"")
        			    	.set(AlreadyMember.gender, "")
        			    	.where(AlreadyMember.userId.eq(member.getSnsLoginKakaoMail()),
        			    			AlreadyMember.snsLoginKakaoMail.eq(member.getSnsLoginKakaoMail()),
        			    			AlreadyMember.onlyParam.eq("").or(null))
        			    	.execute();
                 	
         			result = jpaQueryFactory
        			    	.update(AlreadyMember)
        			    	.set(AlreadyMember.changeUserId, member.getUserId())
        			    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        			    	.set(AlreadyMember.snsOnly,"N")
        			    	.set(AlreadyMember.snsLoginKakao, "")
        			    	.set(AlreadyMember.snsLoginKakaoMail,  "")
        			    	.set(AlreadyMember.snsLoginKakaoName,  "")
        			    	.set(AlreadyMember.snsLoginKakaoDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        			    	.where(AlreadyMember.userId.eq(member.getUserId()),
        			    			AlreadyMember.onlyParam.ne("").and(null))
        			    	.execute();
                 	
                 	return "success";
         			
         		}else {
         			
         			return "fail";
         			
         		}
             	
               	
         	}else {
         		
         		return "fail";
         		
         	}
         	
         	
         }
      
        
        
    }
    
    
    
    //회원가입 페이지
    @RequestMapping("/intro")
    public String getintro(Model model, HttpSession session) {
    	
    	session.setAttribute("signUp", "Y");
    	
    	/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //네이버 
        model.addAttribute("naverUrl", naverAuthUrl);
        //카카오
        model.addAttribute("kakaoUrl", "https://kauth.kakao.com/oauth/authorize?client_id=c29af8a8adfc0e089b9fd1d54a273733&client_secret=gZW0bIUreTCB3STiOEo45omXXd756MVk&redirect_uri=https://www.weconn.co.kr/kakaoSignUp&response_type=code");
        
        return "member/intro";
    }
    
    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping("/naver")
    public String callback(@RequestParam(value="code") String code, @RequestParam(value="state") String state,
    		Model model,HttpSession session, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr )
            throws  ServletException,IOException {
    	
    	HashMap<String, Object> userInfo = new HashMap<>();
    	
    	System.out.println("session =====================" + session.getId());
        System.out.println("code =====================" + code);
        System.out.println("state =====================" + state);
    	
        OAuth2AccessToken access_Token;
        access_Token = naverLoginBO.getAccessToken(session, code, state);
        
        
        //로그인 사용자 정보를 읽어온다.
        userInfo = naverLoginBO.getUserInfo(access_Token, session);
        
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            Object email = userInfo.get("email");
            String userId = (String) email;
            
            boolean isUser = false;
            boolean isLinkedUser = false;
            
            isUser = memberService.getIsSnsUser(userId);
            isLinkedUser = memberService.getIsLinkedUser(userId);
            
            model.addAttribute("userId", userInfo.get("email")); //userId
            model.addAttribute("phone", userInfo.get("phone")); //phone
            model.addAttribute("userName", userInfo.get("nickname")); //phone
            model.addAttribute("sns", "Naver");
            model.addAttribute("isUser", isUser);
            model.addAttribute("access_Token", access_Token);
            model.addAttribute("token", "sns");
           
            //회원인 경우
            if(isUser) {
        		return "sns/snsLogin";
        		
            }else if(isLinkedUser) {
            	  
            	  MemberEntity member = memberRepository.findBySnsLoginNaverMailAndOnlyParamNotNull((String)userInfo.get("email"));
            	  userId = member.getEmail();
            	  rttr.addFlashAttribute("userId",userId);
            	  return "redirect:/loginWithoutForm";
            	  
              }
              //회원이 아닌경우 ( 회원정보를 알 수 없는 경우 )
              else if(!isUser) {
            	  MemberEntity member = memberRepository.findByEmail((String)userInfo.get("email"));
                  
              	//동일한 아이디가 있는 경우
                  if(member != null && member.getUserId().equals(userId)) {
                  	  
                  	model.addAttribute("exceptionMsgName","동일한 계정이 존재합니다 연동을 통해 진행해주세요");
              	  	return "member/login";
                  	
                  }else{

              		return "sns/snsSignUp";
                  }
              }
        }
        	 //아무동작도 없을경우에 denied
            return "redirect:/index";
        
       
    }
    
    //네이버 회원가입 
    @RequestMapping("/naverSignUp")
    public String callbackSignUp(@RequestParam(value="code") String code, @RequestParam(value="state") String state, 
    		Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr )
            throws  ServletException,IOException {
    	
    	HashMap<String, Object> userInfo = new HashMap<>();
    	
        OAuth2AccessToken access_Token;
        access_Token = naverLoginBO.getAccessToken(session, code, state);
        
        //로그인 사용자 정보를 읽어온다.
        userInfo = naverLoginBO.getUserInfo(access_Token, session);
        
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            Object email = userInfo.get("email");
            String userId = (String) email;
            
            boolean isUser = false;
            boolean isLinkedUser = false;
            
            isUser = memberService.getIsSnsUser(userId);
            isLinkedUser = memberService.getIsLinkedUser(userId);
            
            model.addAttribute("userId", userInfo.get("email")); //userId
            model.addAttribute("phone", userInfo.get("phone")); //phone
            model.addAttribute("userName", userInfo.get("nickname")); //phone
            model.addAttribute("sns", "Naver");
            model.addAttribute("isUser", isUser);
            model.addAttribute("access_Token", access_Token);
            model.addAttribute("token", "sns");
            
            response.setContentType("text/html;charset=utf-8");
            
            //회원인 경우
            if(isUser) {
            		  return "sns/snsLogin";
	        	  
            }else if(isLinkedUser) {
          	  
          	  MemberEntity member = memberRepository.findBySnsLoginNaverMailAndOnlyParamNotNull((String)userInfo.get("email"));
          	  userId = member.getEmail();
          	  rttr.addFlashAttribute("userId",userId);
          	  return "redirect:/loginWithoutForm";
          	  
            }
            //회원이 아닌경우 ( 회원정보를 알 수 없는 경우 )
            else if(!isUser) {
          	  MemberEntity member = memberRepository.findByEmail((String)userInfo.get("email"));
                
            	//동일한 아이디가 있는 경우
                if(member != null && member.getUserId().equals(userId)) {
                	  
                	model.addAttribute("exceptionMsgName","동일한 계정이 존재합니다 연동을 통해 진행해주세요");
            	  	return "member/login";
                	
                }else{

            		return "sns/snsSignUp";
                }
            }
        }
        	//아무동작도 없을경우에 denied
            return "redirect:/index";
        
        
    }

    
    //kakao 회원가입
    @RequestMapping("/kakao")
    public String getKakao(@RequestParam(value="code") String code, HttpSession session, 
    		Model model,HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr ) throws ServletException, IOException, NoSuchMethodException, ScriptException{
      String access_Token = kakao.getAccessToken(code, session);
      
      HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
      
      //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
      if (userInfo.get("email") != null) {
          Object email = userInfo.get("email");
          String userId = (String) email;
          
          boolean isUser = false;
          boolean isLinkedUser = false;
          
          isUser = memberService.getIsSnsUser(userId);
          isLinkedUser = memberService.getIsLinkedUser(userId);
          
          model.addAttribute("userId", userInfo.get("email")); //userId
          model.addAttribute("phone", userInfo.get("phone")); //phone
          model.addAttribute("userName", userInfo.get("nickname")); //phone
          model.addAttribute("sns", "Kakao");
          model.addAttribute("isUser", isUser);
          model.addAttribute("access_Token", access_Token);
          model.addAttribute("token", "sns");
          
          response.setContentType("text/html;charset=utf-8");
          
          //회원인 경우
          if(isUser) {
          		return "sns/snsLogin";
          		
          }else if(isLinkedUser) {
        	  
        	  MemberEntity member = memberRepository.findBySnsLoginKakaoMailAndOnlyParamNotNull((String)userInfo.get("email"));
        	  userId = member.getEmail();
        	  rttr.addFlashAttribute("userId",userId);
        	  return "redirect:/loginWithoutForm";
        	  
          }
          //회원이 아닌경우 ( 회원정보를 알 수 없는 경우 )
          else if(!isUser) {
        	  MemberEntity member = memberRepository.findByEmail((String)userInfo.get("email"));
              
          	//동일한 아이디가 있는 경우
              if(member != null && member.getUserId().equals(userId)) {
              	  
              	model.addAttribute("exceptionMsgName","동일한 계정이 존재합니다 연동을 통해 진행해주세요");
          	  	return "member/login";
              	
              }else{

          		return "sns/snsSignUp";
              }
          }
      }
      //아무동작도 없을경우에 denied
      return "redirect:/index";
    }
    
    
    //kakao 회원가입
    @RequestMapping("/kakaoSignUp")
    public String getKakaoSignUp(@RequestParam(value="code") String code, HttpSession session, Model model,
    		HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr ) throws ServletException, IOException, NoSuchMethodException, ScriptException{
      String access_Token = kakao.getAccessToken(code, session);
      
      HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
      
      //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
      if (userInfo.get("email") != null) {
          Object email = userInfo.get("email");
          String userId = (String) email;
          
          boolean isUser = false;
          boolean isLinkedUser = false;
          
          isUser = memberService.getIsSnsUser(userId);
          isLinkedUser = memberService.getIsLinkedUser(userId);
          
           model.addAttribute("userId", userInfo.get("email")); //userId
           model.addAttribute("phone", userInfo.get("phone")); //phone
           model.addAttribute("userName", userInfo.get("nickname")); //phone
           model.addAttribute("sns", "Kakao");
           model.addAttribute("isUser", isUser);
           model.addAttribute("access_Token", access_Token);
           model.addAttribute("token", "sns");

          response.setContentType("text/html;charset=utf-8");
          
          //회원인 경우
          if(isUser) {
          	  return "sns/snsLogin";
          }else if(isLinkedUser) {
        	  
        	  MemberEntity member = memberRepository.findBySnsLoginKakaoMailAndOnlyParamNotNull((String)userInfo.get("email"));
        	  userId = member.getEmail();
        	  rttr.addFlashAttribute("userId",userId);
        	  return "redirect:/loginWithoutForm";
        	  
          }
          //회원이 아닌경우 ( 회원정보를 알 수 없는 경우 )
          else if(!isUser) {
        	  MemberEntity member = memberRepository.findByEmail((String)userInfo.get("email"));
              
          	//동일한 아이디가 있는 경우
              if(member != null && member.getUserId().equals(userId)) {
              	  
              	model.addAttribute("exceptionMsgName","동일한 계정이 존재합니다 연동을 통해 진행해주세요");
          	  	return "member/login";
              	
              }else{

          		return "sns/snsSignUp";
              }
          }
      }
      //아무동작도 없을경우에 denied
      return "redirect:/index";
    }
    
    
    //kakao연동
	@RequestMapping("/kakaoLink")
    @Transactional
    public String kakaoLink(@RequestParam(value="code") String code, HttpSession session, Model model,HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException, NoSuchMethodException, ScriptException{
      
    	System.out.println("code =" + code);
    	
    String access_Token = kakao.getAccessToken(code, session);
      
      HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
      
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	  String name = "";
      String principal = auth.getName();
      
      if(principal.equals("annonymouseUser") || principal.contains("annonymouseUser")){
      	return "redirect:/login";
      	
      }else{
    	  
    	  //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
          if (userInfo.get("email") != null) {
              Object email = userInfo.get("email");
              String userId = (String) email;
    	  	  
              name = principal;
              
              boolean isUser = false;
              isUser = memberService.getIsSnsUser(userId);
              
              //회원인 경우
              if(isUser) {
            	  	  //기존 sns 계정이 있는경우에는 각 정보 동기화
            	  	  JPAQueryFactory jpaQueryFactory = new JPAQueryFactory(em);
            	  
            	  	  MemberEntity member = memberRepository.findByEmail(name);
            	  	  QMemberEntity AlreadyMember = QMemberEntity.memberEntity;
            	  	  

                      Object nickname = userInfo.get("nickname");
            	  	  String nick = (String) nickname;
            	  	
            	  	  long result = jpaQueryFactory
    				    	.update(AlreadyMember)
    				    	.set(AlreadyMember.changeUserId, member.getUserId())
    				    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
    				    	.set(AlreadyMember.snsLoginKakaoDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
    				    	.set(AlreadyMember.snsOnly,"N")
    				    	.set(AlreadyMember.snsLoginKakao, "Y")
    				    	.set(AlreadyMember.snsLoginKakaoMail, userId)
    				    	.set(AlreadyMember.snsLoginKakaoName, nick)
    				    	//.set(AlreadyMember.onlyParam, member.getOnlyParam())
    				    	.set(AlreadyMember.authType, member.getAuthType())
    				    	.set(AlreadyMember.birth, member.getBirth())
    				    	.set(AlreadyMember.mobileCo, member.getMobileCo())
    				    	.set(AlreadyMember.gender, member.getGender())
    				    	.where(AlreadyMember.userId.eq(userId))
    				    	.execute();
            	  	  
            	  	  result = jpaQueryFactory
    				    	.update(AlreadyMember)
    				    	.set(AlreadyMember.changeUserId, member.getUserId())
    				    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
    				    	.set(AlreadyMember.snsLoginKakaoDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
    				    	.set(AlreadyMember.snsOnly,"N")
    				    	.set(AlreadyMember.snsLoginKakao, "Y")
    				    	.set(AlreadyMember.snsLoginKakaoMail, userId)
    				    	.set(AlreadyMember.snsLoginKakaoName, nick)
    				    	//.set(AlreadyMember.onlyParam, member.getOnlyParam())
    				    	.set(AlreadyMember.authType, member.getAuthType())
    				    	.set(AlreadyMember.birth, member.getBirth())
    				    	.set(AlreadyMember.mobileCo, member.getMobileCo())
    				    	.set(AlreadyMember.gender, member.getGender())
    				    	.where(AlreadyMember.userId.eq(member.getUserId()))
    				    	.execute();
            	  
              		  return "redirect:/buyer/m6_0301";
    	        	  
              }
              //회원이 아닌경우 ( 회원정보를 알 수 없는 경우 )
              else if(!isUser) { 
            	  // 기존 회원이 아니므로 신규 가입로직 + 기존 정보에 update
            	  
            	  JPAQueryFactory jpaQueryFactory = new JPAQueryFactory(em);
            	  QMemberEntity AlreadyMember = QMemberEntity.memberEntity;
            	  
            	  Object nickname = userInfo.get("nickname");
        	  	  String nick = (String) nickname;
        	  	  MemberEntity myInfo = memberRepository.findByEmail(name);
            	  MemberEntity member = new MemberEntity(name);
            	  member.setUserId(userId);
            	  member.setUserName(nick);
            	  member.setPassword("sns");
            	  member.setTelNo((String)userInfo.get("phone"));
            	  member.setCellNo((String)userInfo.get("phone"));
            	  member.setSnsLoginKakao("Y");
            	  member.setSnsLoginKakaoMail(userId);
            	  member.setSnsLoginKakaoName(nick);
            	  member.setSmsFlag(myInfo.getSmsFlag());
            	  member.setMailFlag(myInfo.getMailFlag());
            	  member.setMarketServiceTerms(myInfo.getMarketServiceTerms());
            	  member.setMarketFinancialTerms(myInfo.getMarketFinancialTerms());
            	  member.setMarketInformationCollection(myInfo.getMarketInformationCollection());
            	  member.setMarketInformationMarketing(myInfo.getMarketInformationMarketing());
            	  try {
					backedLoginService.save(member,request,response);
					 
	            	  long result = jpaQueryFactory
	  				    	.update(AlreadyMember)
	  				    	.set(AlreadyMember.changeUserId, myInfo.getUserId())
	  				    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
	  				    	.set(AlreadyMember.snsLoginKakaoDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
	  				    	.set(AlreadyMember.snsOnly,"N")
	  				    	.set(AlreadyMember.snsLoginKakao, "Y")
	  				    	.set(AlreadyMember.snsLoginKakaoMail, userId)
	  				    	.set(AlreadyMember.snsLoginKakaoName, nick)
	  				    	//.set(AlreadyMember.onlyParam, myInfo.getOnlyParam())
	  				    	.set(AlreadyMember.authType, myInfo.getAuthType())
	  				    	.set(AlreadyMember.birth, myInfo.getBirth())
	  				    	.set(AlreadyMember.mobileCo, myInfo.getMobileCo())
	  				    	.set(AlreadyMember.gender, myInfo.getGender())
	  				    	.where(AlreadyMember.userId.eq(userId))
	  				    	.execute();
	          	  	  
	          	  	  result = jpaQueryFactory
	  				    	.update(AlreadyMember)
	  				    	.set(AlreadyMember.changeUserId, myInfo.getUserId())
	  				    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
	  				    	.set(AlreadyMember.snsLoginKakaoDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
	  				    	.set(AlreadyMember.snsOnly,"N")
	  				    	.set(AlreadyMember.snsLoginKakao, "Y")
	  				    	.set(AlreadyMember.snsLoginKakaoMail, userId)
	  				    	.set(AlreadyMember.snsLoginKakaoName, nick)
	  				    	//.set(AlreadyMember.onlyParam, myInfo.getOnlyParam())
	  				    	.set(AlreadyMember.authType, myInfo.getAuthType())
	  				    	.set(AlreadyMember.birth, myInfo.getBirth())
	  				    	.set(AlreadyMember.mobileCo, myInfo.getMobileCo())
	  				    	.set(AlreadyMember.gender, myInfo.getGender())
	  				    	.where(AlreadyMember.userId.eq(myInfo.getUserId()))
	  				    	.execute();
	            	  		
					
            	  } catch (IsMemberException e) {
					e.printStackTrace();
            	  } catch (Exception e) {
					e.printStackTrace();
            	  }
            	  
              	  return "redirect:/buyer/m6_0301";
              }
          }
      }
     
      //아무동작도 없을경우에 denied
      return "redirect:/buyer/index";
    }
    
    //네이버 연동
	@RequestMapping("/naverLink")
    @Transactional
    public String naverLink(@RequestParam(value="code") String code, @RequestParam(value="state") String state, 
    		Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response)
            throws  ServletException,IOException {
    	
    	HashMap<String, Object> userInfo = new HashMap<>();
    	
    	 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	 String name = "";
         String principal = auth.getName();
         
         
         if(principal.equals("annonymouseUser") || principal.contains("annonymouseUser")){
           	return "redirect:/login";
           	
          }else{
        	  OAuth2AccessToken access_Token;
              access_Token = naverLoginBO.getAccessToken(session, code, state);
              
              //로그인 사용자 정보를 읽어온다.
              userInfo = naverLoginBO.getUserInfo(access_Token, session);
              
              //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
              if (userInfo.get("email") != null) {
                  Object email = userInfo.get("email");
                  String userId = (String) email;
                  
                  name = principal;
                  
                  boolean isUser = false;
                  isUser = memberService.getIsSnsUser(userId);
                  
                  //회원인 경우
                  if(isUser) {
                	  	  //기존 sns 계정이 있는경우에는 각 정보 동기화
                	  	  JPAQueryFactory jpaQueryFactory = new JPAQueryFactory(em);
                	  
                	  	  MemberEntity member = memberRepository.findByEmail(name);
                	  	  QMemberEntity AlreadyMember = QMemberEntity.memberEntity;
                	  	  

                	  	  Object nickname = userInfo.get("nickname");
                	  	  String nick = (String) nickname;
                	  	
                	  	  long result = jpaQueryFactory
        				    	.update(AlreadyMember)
        				    	.set(AlreadyMember.changeUserId, member.getUserId())
        				    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        				    	.set(AlreadyMember.snsLoginNaverDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        				    	.set(AlreadyMember.snsOnly,"N")
        				    	.set(AlreadyMember.snsLoginNaver, "Y")
        				    	.set(AlreadyMember.snsLoginNaverMail, userId)
        				    	.set(AlreadyMember.snsLoginNaverName, nick)
        				    	//.set(AlreadyMember.onlyParam, member.getOnlyParam())
        				    	.set(AlreadyMember.authType, member.getAuthType())
        				    	.set(AlreadyMember.birth, member.getBirth())
        				    	.set(AlreadyMember.mobileCo, member.getMobileCo())
        				    	.set(AlreadyMember.gender, member.getGender())
        				    	.where(AlreadyMember.userId.eq(userId))
        				    	.execute();
                	  	  
                	  	  result = jpaQueryFactory
        				    	.update(AlreadyMember)
        				    	.set(AlreadyMember.changeUserId, member.getUserId())
        				    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        				    	.set(AlreadyMember.snsLoginNaverDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
        				    	.set(AlreadyMember.snsOnly,"N")
        				    	.set(AlreadyMember.snsLoginNaver, "Y")
        				    	.set(AlreadyMember.snsLoginNaverMail, userId)
        				    	.set(AlreadyMember.snsLoginNaverName, nick)
        				    	//.set(AlreadyMember.onlyParam, member.getOnlyParam())
        				    	.set(AlreadyMember.authType, member.getAuthType())
        				    	.set(AlreadyMember.birth, member.getBirth())
        				    	.set(AlreadyMember.mobileCo, member.getMobileCo())
        				    	.set(AlreadyMember.gender, member.getGender())
        				    	.where(AlreadyMember.userId.eq(member.getUserId()))
        				    	.execute();
                	  
                  		  return "redirect:/buyer/m6_0301";
        	        	  
                  }
                  //회원이 아닌경우 ( 회원정보를 알 수 없는 경우 )
                  else if(!isUser) { 
                	  // 기존 회원이 아니므로 신규 가입로직 + 기존 정보에 update
                	  
                	  JPAQueryFactory jpaQueryFactory = new JPAQueryFactory(em);
                	  QMemberEntity AlreadyMember = QMemberEntity.memberEntity;
                	  
                	  Object nickname = userInfo.get("nickname");
            	  	  String nick = (String) nickname;
            	  	  MemberEntity myInfo = memberRepository.findByEmail(name);
                	  MemberEntity member = new MemberEntity(name);
                	  member.setUserId(userId);
                	  member.setUserName(nick);
                	  member.setPassword("sns");
                	  member.setTelNo((String)userInfo.get("phone"));
                	  member.setCellNo((String)userInfo.get("phone"));
                	  member.setSnsLoginNaver("Y");
                	  member.setSnsLoginNaverMail(userId);
                	  member.setSnsLoginNaverName(nick);
                	  member.setSmsFlag(myInfo.getSmsFlag());
                	  member.setMailFlag(myInfo.getMailFlag());
                	  member.setMarketServiceTerms(myInfo.getMarketServiceTerms());
                	  member.setMarketFinancialTerms(myInfo.getMarketFinancialTerms());
                	  member.setMarketInformationCollection(myInfo.getMarketInformationCollection());
                	  member.setMarketInformationMarketing(myInfo.getMarketInformationMarketing());
                	  try {
      					backedLoginService.save(member,request,response);
      					 
      	            	  long result = jpaQueryFactory
      	  				    	.update(AlreadyMember)
      	  				    	.set(AlreadyMember.changeUserId, myInfo.getUserId())
      	  				    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
      	  				    	.set(AlreadyMember.snsLoginNaverDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
      	  				    	.set(AlreadyMember.snsOnly,"N")
      	  				    	.set(AlreadyMember.snsLoginNaver, "Y")
      	  				    	.set(AlreadyMember.snsLoginNaverMail, userId)
      	  				    	.set(AlreadyMember.snsLoginNaverName, nick)
      	  				    	//.set(AlreadyMember.onlyParam, myInfo.getOnlyParam())
      	  				    	.set(AlreadyMember.authType, myInfo.getAuthType())
      	  				    	.set(AlreadyMember.birth, myInfo.getBirth())
      	  				    	.set(AlreadyMember.mobileCo, myInfo.getMobileCo())
      	  				    	.set(AlreadyMember.gender, myInfo.getGender())
      	  				    	.where(AlreadyMember.userId.eq(userId))
      	  				    	.execute();
      	          	  	  
      	          	  	  result = jpaQueryFactory
      	  				    	.update(AlreadyMember)
      	  				    	.set(AlreadyMember.changeUserId, myInfo.getUserId())
      	  				    	.set(AlreadyMember.changeDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
      	  				    	.set(AlreadyMember.snsLoginNaverDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
      	  				    	.set(AlreadyMember.snsOnly,"N")
      	  				    	.set(AlreadyMember.snsLoginNaver, "Y")
      	  				    	.set(AlreadyMember.snsLoginNaverMail, userId)
      	  				    	.set(AlreadyMember.snsLoginNaverName, nick)
      	  				    	//.set(AlreadyMember.onlyParam, myInfo.getOnlyParam())
      	  				    	.set(AlreadyMember.authType, myInfo.getAuthType())
      	  				    	.set(AlreadyMember.birth, myInfo.getBirth())
      	  				    	.set(AlreadyMember.mobileCo, myInfo.getMobileCo())
      	  				    	.set(AlreadyMember.gender, myInfo.getGender())
      	  				    	.where(AlreadyMember.userId.eq(myInfo.getUserId()))
      	  				    	.execute();
      	            	  		
      					
                	  } catch (IsMemberException e) {
      					e.printStackTrace();
                	  } catch (Exception e) {
      					e.printStackTrace();
                	  }
                	  
                  	  return "redirect:/buyer/m6_0301";
                  }
      	    }
          }
       
	    //아무동작도 없을경우에 denied
	    return "redirect:/buyer/index";
	        
    }

}








