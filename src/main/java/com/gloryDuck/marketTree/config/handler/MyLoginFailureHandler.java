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
 				UsernameNotFoundException : ?????? ??????
				BadCredentialsException : ???????????? ?????????
				AccountExpiredException : ????????????
				CredentialExpiredException : ???????????? ??????
				DisabledException : ?????? ????????????
				LockedException : ????????????
              */
           //########################################################################################
            boolean isUser = false;
            isUser = memberService.getIsUser(username);
            
            boolean isSnsUser = false;
            isSnsUser = memberService.getIsSnsUser(username);
            
            System.out.println("isSnsUer" + isSnsUser);
            
            if(exception instanceof BadCredentialsException) {
            	// ?????????????????? ????????????, errormsg???????????????.
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
				errormsg = "??? ??? ?????? ????????? ???????????? ??????????????????. ??????????????? ???????????????.";
            
            //SNS user?????? ?????? ??? ???????????? ??????
            if(isSnsUser) {
            	errormsg = "?????? ?????? ?????????. ?????? ???????????? ??????????????????.";
            }
             //request.setAttribute("username", username);
             //request.setAttribute("password", password);
             request.setAttribute("exceptionMsgName", errormsg);
            
             // ????????? ???????????? ?????? ?????????
     		RequestDispatcher dispatcher = request.getRequestDispatcher("/login");
     		dispatcher.forward(request, response);
    }
    
    
    private boolean failCnt(String loginId, boolean isUser) throws ServletException, IOException {
		
		// ????????? ???????????? ????????? ???????????? ?????????????????????, true??? return??????.
		boolean userUnLock = true;
		
		if(isUser) {
			// ???????????? select
			MemberEntity member = memberService.getIsEnable(loginId);
			
			int isEnable = member.getIsEnabled();
			int failCnt = memberService.getFailCnt(loginId);
			
				System.out.println(userUnLock +", "+ isEnable);
				// ????????? ????????? ???????????? ???????????? ???????????????, Enabled????????? ????????????.
				// Enabled????????? ??????????????? 5????????? ??? ?????????.
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
