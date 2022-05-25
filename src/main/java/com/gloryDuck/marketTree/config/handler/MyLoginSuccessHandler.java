package com.gloryDuck.marketTree.config.handler;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.gloryDuck.marketTree.model.repositories.MemberRepository;
import com.gloryDuck.marketTree.model.service.MemberService;
import com.gloryDuck.marketTree.model.vo.MemberEntity;

@Configuration
public class MyLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
    private MemberRepository memberRepository;
	
	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private MemberService memberService;
	
	private static int TIME = 60 * 60 * 24; // 하루
	private String defaultUrl = "/index";

	private RequestCache reqCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
	String errormsg = "";
	
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        
        MemberEntity member = memberRepository.findByUserId(authentication.getName()).orElseThrow(() 
				-> new UsernameNotFoundException(authentication.getName()));
        
        // System.out.println("로그인 된 유저DTO : " + memberDTO);
     	HttpSession session = request.getSession();
     	session.setAttribute("member", member);
     	session.setAttribute("userId", authentication.getName());
     	session.setMaxInactiveInterval(TIME);
     	
     	
     	System.out.println(member);
        
     	boolean isUser = false;
        isUser = memberService.getIsUser(authentication.getName());
        MemberEntity EnableMember = memberService.getIsEnable(authentication.getName());
        
        int isEnable = EnableMember.getIsEnabled();
        int failCnt = memberService.getFailCnt(authentication.getName());
        
		if (isUser && ( isEnable != 1 || failCnt >= 5 ) ) {
				throw new LockedException("계정이 잠겨있습니다. 관리자에게 문의하세요.");
		}

         
		//로그인 성공시 Error Session 삭제
        clearAuthenticationAttributes(request);
        String lastLogin = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        memberService.lastLogin(lastLogin, authentication.getName());
        
        if (member.getPlatformRole().equals("M")) {
        	memberService.changeEnabled(authentication.getName());
			redirectStratgy.sendRedirect(request, response, "/adminManager/index");
		} else {
			memberService.changeEnabled(authentication.getName());
			resultRedirectStrategy(request, response, authentication);
		}
        
    }
    
    protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
		Authentication authentication) throws IOException, ServletException {
		SavedRequest savedRequest = reqCache.getRequest(request, response);
		
        /* 로그인 버튼 눌러 접속했을 경우의 데이터 get */
		String prevPage = (String) request.getSession().getAttribute("prevPage");
		
		if (prevPage != null) {
			request.getSession().removeAttribute("prevPage");
			redirectStratgy.sendRedirect(request, response, prevPage);
		} else if (savedRequest != null) {
			String targetUrl = savedRequest.getRedirectUrl();
			redirectStratgy.sendRedirect(request, response, targetUrl);
		} else {
			redirectStratgy.sendRedirect(request, response, defaultUrl);
		}
	}
    
    //로그인 성공시 Error Session을 지워주는 로직
    protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null)
			return;
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
}