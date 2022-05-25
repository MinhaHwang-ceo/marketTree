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
	        // 동일 도메인에서 iframe 접근이 가능하도록 X-Frame-Options을 sameOrigin으로 설정
    		http.headers().frameOptions().sameOrigin();
    		//USER_TYPE = Buyer 계정의 구분
    		//플랫폼 구분DEFAULT:P, BUYER:B, SELLER:S, GP ADMIN:M)
    		http
    			.cors()
    				.disable()
    			.authorizeRequests()
    				// /login 은 모두 접근허용
    				.antMatchers("/login","/order/VBank").permitAll()
    				.antMatchers("/signUp","/memberSignUp","/chkId").anonymous()
    				.antMatchers("/seller/sellerSignUp","/seller/joinSellerEnd","/seller/doSellerSignUp", "/seller/updateSellerCode").hasAnyAuthority("P","B")
    				.antMatchers("/seller/**").hasAnyAuthority("S","M")
    				.antMatchers("/buyer/companySignUp","/seller/joinBuyerEnd","/buyer/doCompanySignUp","/buyer/updateBuyerCode").hasAnyAuthority("P")
    				//.antMatchers("/checkplus_success","/checkplus_fail","/checkplus_idpw_success","/checkplu_idpw_fail","/searchMyInfo","/buyer/checkBussiness").permitAll()
    				//.antMatchers("/kakao","/kakaoSignUp","/naver","/naverSignUp").permitAll()
    				.antMatchers("/buyer/**").hasAnyAuthority("P","B","S","M")
    				// /member 에 관한 접근 시 로그인을 요구함 ( 구체화된 페이지 생기면 그때 설정해줄 예정 )
    				//.antMatchers("/member/**").hasAnyAuthority("B","S","M")
    				// /admin 에 관한 접근 시 admin 권한을 요구함
    				.antMatchers("/admin/**").hasAuthority("M")
    					.anyRequest()
    					.permitAll()
    					
    			.and()
    			 // 로그인하는 경우에 대해 설정함
    			.formLogin()
    				//로그인 페이지
    				.loginPage("/login")
    					.usernameParameter("userId")
    					.passwordParameter("password")
    				//성공시 handler
    				.successHandler(successHandler())
    				//실패시 handler
    				.failureHandler(failureHandler())
    				.and()
    			.logout()
    				.logoutSuccessUrl("/login")
    				.invalidateHttpSession(true) // 세션 날리기
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
				.maximumSessions(2) // 최대 허용 가능 세션 수, -1인 경우 무제한 세션 
				.maxSessionsPreventsLogin(false) // 동시 로그인 차단, false인 경우 기존 세션 만료
    			.sessionRegistry(sessionRegistry());
    		
	http.csrf().disable();//csrf 미적용
	
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
    
    //USER와 ADMIN 권한을 인식해주는 메소드
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