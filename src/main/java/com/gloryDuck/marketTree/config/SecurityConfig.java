package com.gloryDuck.marketTree.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.gloryDuck.marketTree.config.handler.MyLoginFailureHandler;
import com.gloryDuck.marketTree.config.handler.MyLoginSuccessHandler;
import com.gloryDuck.marketTree.model.service.BackedLoginService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private BackedLoginService backedLoginService;
	
	 public void configure(WebSecurity webSecurity) throws Exception {
		  webSecurity.ignoring().antMatchers("/resources/**", "/css/**", "/fonts/**", "/js/**", "/less/**", "/scss/**", "/images/**", "/webjars/**"); 
	}
	 
    @Override
    protected void configure(HttpSecurity http) throws Exception{
    	
	        CharacterEncodingFilter filter = new CharacterEncodingFilter();
	        filter.setEncoding("UTF-8");
	        filter.setForceEncoding(true);
	        http.addFilterBefore(filter,CsrfFilter.class);
	        // ?????? ??????????????? iframe ????????? ??????????????? X-Frame-Options??? sameOrigin?????? ??????
    		http.headers().frameOptions().sameOrigin();
    		//USER_TYPE = Buyer ????????? ??????
    		//????????? ??????DEFAULT:P, BUYER:B, SELLER:S, GP ADMIN:M)
    		http
    			.cors()
    				.disable()
    			.authorizeRequests()
    				// /login ??? ?????? ????????????
    				.antMatchers("/login","/order/VBank").permitAll()
    				.antMatchers("/signUp","/memberSignUp","/chkId").anonymous()
    				.antMatchers("/seller/sellerSignUp","/seller/joinSellerEnd","/seller/doSellerSignUp", "/seller/updateSellerCode").hasAnyAuthority("P","B")
    				.antMatchers("/seller/**").hasAnyAuthority("S","M")
    				.antMatchers("/buyer/companySignUp","/seller/joinBuyerEnd","/buyer/doCompanySignUp","/buyer/updateBuyerCode").hasAnyAuthority("P")
    				//.antMatchers("/checkplus_success","/checkplus_fail","/checkplus_idpw_success","/checkplu_idpw_fail","/searchMyInfo","/buyer/checkBussiness").permitAll()
    				//.antMatchers("/kakao","/kakaoSignUp","/naver","/naverSignUp").permitAll()
    				.antMatchers("/buyer/**").hasAnyAuthority("P","B","S","M")
    				// /member ??? ?????? ?????? ??? ???????????? ????????? ( ???????????? ????????? ????????? ?????? ???????????? ?????? )
    				//.antMatchers("/member/**").hasAnyAuthority("B","S","M")
    				// /admin ??? ?????? ?????? ??? admin ????????? ?????????
    				.antMatchers("/admin/**").hasAuthority("M")
    					.anyRequest()
    					.permitAll()
    					
    			.and()
    			 // ??????????????? ????????? ?????? ?????????
    			.formLogin()
    				//????????? ?????????
    				.loginPage("/login")
    					.usernameParameter("userId")
    					.passwordParameter("password")
    				//????????? handler
    				.successHandler(successHandler())
    				//????????? handler
    				.failureHandler(failureHandler())
    				.and()
    			.logout()
    				.logoutSuccessUrl("/login")
    				.invalidateHttpSession(true) // ?????? ?????????
    				.deleteCookies("JSESSIONID","WECONN")
    				.and()
        		.rememberMe()
    				.key("marketTree")
    				.rememberMeParameter("remember-me")
    				.rememberMeCookieName("MarketTree")
    				.userDetailsService(backedLoginService)
    				.tokenValiditySeconds(604800)
    				.and()
    			.anonymous()
    			.principal("annonymouseUser")
    				.and()
    			.exceptionHandling()
    			.accessDeniedPage("/WEB-INF/views/index.jsp")
    				.and()
    			.sessionManagement()
				.maximumSessions(2) // ?????? ?????? ?????? ?????? ???, -1??? ?????? ????????? ?????? 
				.maxSessionsPreventsLogin(false) // ?????? ????????? ??????, false??? ?????? ?????? ?????? ??????
    			.sessionRegistry(sessionRegistry());
    		
	http.csrf().disable();//csrf ?????????
	
    }
 
    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
    
    @Bean
    public AuthenticationSuccessHandler successHandler() {
    	return new MyLoginSuccessHandler();
    }
    
    @Bean
    public AuthenticationFailureHandler failureHandler() {
    	return new MyLoginFailureHandler();
    }
    
    //USER??? ADMIN ????????? ??????????????? ?????????
    @Bean(name = BeanIds.AUTHENTICATION_MANAGER)	
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public SessionRegistry sessionRegistry() {
        return new SessionRegistryImpl();
    }
    
}