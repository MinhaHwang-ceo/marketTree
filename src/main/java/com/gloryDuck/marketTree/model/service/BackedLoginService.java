package com.gloryDuck.marketTree.model.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gloryDuck.marketTree.model.repositories.MemberRepository;
import com.gloryDuck.marketTree.model.vo.MemberEntity;

@Service
@Transactional(rollbackFor = {RuntimeException.class, Exception.class, IsMemberException.class})
public class BackedLoginService implements UserDetailsService {
	@Autowired
    private MemberRepository memberRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberService memberService;
	
    @Override
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
        MemberEntity member = memberRepository.findByUserId(userId).orElseThrow(() 
        						-> new UsernameNotFoundException(userId));
        
        return new User(member.getUserId(), member.getPassword(), Arrays.asList(new SimpleGrantedAuthority(member.getPlatformRole())));
    }
   
    @Transactional(rollbackFor = {Exception.class, IsMemberException.class})
    public Long save(MemberEntity member, HttpServletRequest request, HttpServletResponse response) throws IsMemberException, Exception {
    	//USER_TYPE = Buyer 계정의 구분
    	//PLATFORM_ROLE = 플랫폼 접근제어 코드 (DEFAULT:P, BUYER:B, SELLER:S, GP ADMIN:M)
    	
    	// 현재날짜 yyyymmdd
    	member.setAddDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
    	member.setServiceAgreedDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
    	member.setFinancialAgreedDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
    	member.setCollectionAgreedDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
    	member.setMarketingAgreedDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
    	member.setIsEnabled(1);
    	member.setPwWrongCnt(0);
    	
    	String sns = "N";
    	
    	sns = member.getSnsLoginKakao() != null ? member.getSnsLoginKakao() : member.getSnsLoginNaver() != null ? member.getSnsLoginNaver() : "N";
    	
    	//sns 계정일 경우 패스워드 및 각 계정 중복여부를 파악
    	if(!sns.equals("N")) {
    		member.setPassword("sns");
    		member.setSnsOnly("Y");
    		
    		String snsUser = member.getSnsLoginKakao() != null ? "KAKAO" : "NAVER";
    		
    		
    		boolean isUser = false;
    		if(snsUser.equals("KAKAO")) {
    			member.setSnsLoginKakaoDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
    			isUser = memberService.getIsSaveSnsKakao(member.getUserId());
    		}else if(snsUser.equals("NAVER")) {
    			member.setSnsLoginNaverDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
    			isUser = memberService.getIsSaveSnsNaver(member.getUserId());
    		}
            if(isUser) {
            	throw new IsMemberException("이미 가입된 아이디입니다. 로그인 페이지로 이동합니다.", request, response);
            }
            
    	}else {
        	
        	boolean isUser = false;
            isUser = memberService.getIsUser(member.getUserId());
            
            if(isUser) {
            	throw new IsMemberException("이미 가입된 아이디입니다. 로그인 페이지로 이동합니다.", request, response);
            }
    	}
    	
    	
    	
        return  memberRepository.save(MemberEntity.builder()
        		.platformNo("GP")
        		.addDate(member.getAddDate()) //등록일자 / 가입일자
        		.userId(member.getUserId())
        		.userName(member.getUserName())
        		.password(passwordEncoder.encode(member.getPassword()))
        		.email(member.getUserId())
        		.telNo(member.getTelNo().replace("-", "").replace("+82", "0").replace(" ",""))
        		.cellNo(member.getCellNo().replace("-", "").replace("+82", "0").replace(" ",""))
        		.isEnabled(member.getIsEnabled())
        		.pwWrongCnt(member.getPwWrongCnt())
        		.zipCode(member.getZipCode())
        		.address(member.getAddress())
        		.smsFlag(member.getSmsFlag())
        		.mailFlag(member.getMailFlag())
        		.userType("C")
        		.platformRole("P")
        		.snsOnly(member.getSnsOnly())
        		.buyerCode(member.getBuyerCode())
        		.sellerCode(member.getSellerCode())
        		.snsLoginKakao(member.getSnsLoginKakao())
        		.snsLoginKakaoMail(member.getSnsLoginKakaoMail())
        		.snsLoginKakaoName(member.getSnsLoginKakaoName())
        		.snsLoginKakaoDate(member.getSnsLoginKakaoDate())
        		.snsLoginNaver(member.getSnsLoginNaver())
        		.snsLoginNaverMail(member.getSnsLoginNaverMail())
        		.snsLoginNaverName(member.getSnsLoginNaverName())
        		.snsLoginNaverDate(member.getSnsLoginNaverDate())
        		.marketServiceTerms(member.getMarketServiceTerms())
        		.serviceAgreedDate(member.getServiceAgreedDate())
        		.marketFinancialTerms(member.getMarketFinancialTerms())
        		.financialAgreedDate(member.getFinancialAgreedDate())
        		.marketInformationCollection(member.getMarketInformationCollection())
        		.collectionAgreedDate(member.getCollectionAgreedDate())
        		.marketInformationMarketing(member.getMarketInformationMarketing())
        		.marketingAgreedDate(member.getMarketingAgreedDate())
        		.onlyParam(member.getOnlyParam())
        		.authType(member.getAuthType())
        		.birth(member.getBirth())
        		.mobileCo(member.getMobileCo())
        		.gender(member.getGender())
                .build()).getUserNo();
        
    }
    
    public static String toString(Object o) {
        return String.valueOf(o);
    }

    @Transactional(rollbackFor = {Exception.class, IsMemberException.class})
	public void modify(MemberEntity member, String pw1, String pw2, HttpServletRequest request,
			HttpServletResponse response) {
    	
    	memberService.updateMyPass(member.getEmail(),passwordEncoder.encode(pw1));
    	//.save(MemberEntity.builder().password(passwordEncoder.encode(pw1)).build());
		
	}
    
}
