package com.gloryDuck.marketTree.config.handler;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.gloryDuck.marketTree.model.service.MemberService;
import com.gloryDuck.marketTree.model.vo.MemberEntity;

import lombok.Data;
import lombok.NoArgsConstructor;


@Configuration
@NoArgsConstructor
public @Data class MyLoginFailureHandler implements AuthenticationFailureHandler{
	
	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private MemberService memberService;
	
	String errormsg = "";
	
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        	 String username = request.getParameter("userId");
             String password = request.getParameter("password");
             errormsg = exception.getMessage();
             System.out.println("userId" + username);

             //########################################################################################
             /*
 				UsernameNotFoundException : 계정 없음
				BadCredentialsException : 비밀번호 불일치
				AccountExpiredException : 계정만료
				CredentialExpiredException : 비밀번호 만료
				DisabledException : 계정 비활성화
				LockedException : 계정잠김
              */
           //########################################################################################
            boolean isUser = false;
            isUser = memberService.getIsUser(username);
            
            boolean isSnsUser = false;
            isSnsUser = memberService.getIsSnsUser(username);
            
            System.out.println("isSnsUer" + isSnsUser);
            
            if(exception instanceof BadCredentialsException) {
            	// 잠긴계정인지 확인하여, errormsg변경해준다.
    			boolean userUnLock = true;
    			
    			userUnLock = failCnt(username, isUser);
    			System.out.println("isUser ? " + isUser);
    			if ( isUser && !userUnLock )
    				errormsg = messageSource.getMessage("AccountStatusUserDetailsChecker.disabled", null , Locale.KOREA);
    			else if(isUser && userUnLock)
    				errormsg = messageSource.getMessage("AbstractUserDetailsAuthenticationProvider.locked", null , Locale.KOREA);
    			else 
    				errormsg = messageSource.getMessage("AbstractUserDetailsAuthenticationProvider.badCredentials", null , Locale.KOREA);
		    } else if(exception instanceof InternalAuthenticationServiceException) {
				errormsg = messageSource.getMessage("AbstractUserDetailsAuthenticationProvider.InternalAuthentication", null , Locale.KOREA); 
			} else if(exception instanceof DisabledException) {
				errormsg = messageSource.getMessage("AccountStatusUserDetailsChecker.locked", null , Locale.KOREA);
			} else if(exception instanceof CredentialsExpiredException) {
				errormsg = messageSource.getMessage("AccountStatusUserDetailsChecker.expired", null , Locale.KOREA);
			} else if(exception instanceof UsernameNotFoundException) {
				Object[] args = new String[] { username } ;
				errormsg = messageSource.getMessage("DigestAuthenticationFilter.usernameNotFound", args , Locale.KOREA);
			} else if(exception instanceof AccountExpiredException) {
				errormsg = messageSource.getMessage("AbstractUserDetailsAuthenticationProvider.expired", null , Locale.KOREA);
			} else if(exception instanceof LockedException) {
				errormsg = messageSource.getMessage("AbstractUserDetailsAuthenticationProvider.locked", null , Locale.KOREA);
			} else
				errormsg = "알 수 없는 이유로 로그인에 실패했습니다. 관리자에게 문의하세요.";
            
            //SNS user인지 확인 후 안내절차 추가
            if(isSnsUser) {
            	errormsg = "소셜 회원 입니다. 소셜 로그인을 진행해주세요.";
            }
             //request.setAttribute("username", username);
             //request.setAttribute("password", password);
             request.setAttribute("exceptionMsgName", errormsg);
            
             // 로그인 페이지로 다시 포워딩
     		RequestDispatcher dispatcher = request.getRequestDispatcher("/login");
     		dispatcher.forward(request, response);
    }
    
    
    private boolean failCnt(String loginId, boolean isUser) throws ServletException, IOException {
		
		// 계정이 잠겼으면 추가로 실패횟수 증가시키지않고, true를 return한다.
		boolean userUnLock = true;
		
		if(isUser) {
			// 실패횟수 select
			MemberEntity member = memberService.getIsEnable(loginId);
			
			int isEnable = member.getIsEnabled();
			int failCnt = memberService.getFailCnt(loginId);
			
				System.out.println(userUnLock +", "+ isEnable);
				// 계정이 활성화 되어있는 경우에만 실패횟수와, Enabled설정을 변경한다.
				// Enabled설정은 실패횟수가 5이상일 때 바뀐다.
				if ( userUnLock && isEnable == 1 && failCnt < 5) {
					memberService.failCntUpdate(loginId);
					userUnLock = false;
				}
				
				failCnt = memberService.getFailCnt(loginId);
				
				if (failCnt >= 5) {
					memberService.failEnabled(loginId);
					userUnLock = true;
				}
				
		}
		return userUnLock;
	}
    
	
}
