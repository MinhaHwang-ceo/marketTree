package com.gloryDuck.marketTree.model.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "market_user")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public @Data class MemberEntity implements Serializable {
	 
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) //기본 키 생성을 DB에 위임
	@Column(nullable = false, name="user_no")
    private Long userNo;//GP 플랫폼 번호 시스템에서 자동으로 부여하기때문에 따로 값을 지정할필요 없음
	
	//##################### 회원가입시 필요한 정보 ########################
	
	@Column(name="user_code", insertable=false, updatable=false)
    private String userCode;
	
	@Column(length = 10, nullable = false, name="platform_no")
    private String platformNo;//GP 플랫폼 번호
    
    @Column(length = 50, nullable = false, name="user_id")
    private String userId;//사용자ID
    
    @Column(length = 50, nullable = true, name="user_name")
    private String userName; //사용자 명
    
    @Column(length = 200, nullable = true, name="password")
    private String password;//비밀번호
    
    @Column(length = 50, nullable = true, name="email")
    private String email;//이메일
    
    @Column(length = 20, nullable = true, name="tel_no")
    private String telNo;//전화번호
    
    @Column(length = 20, nullable = true, name="cell_no")
    private String cellNo;//휴대전화번호
    
    @Column(length = 10, nullable = true, name="zip_code")
    private String zipCode;//우편번호
    
    @Column(length = 200, nullable = true, name="address")
    private String address;//주소
    
    @Column(length = 1, nullable = true, name="sms_flag")
    private String smsFlag;//SMS수신여부
    
    @Column(length = 1, nullable = true, name="mail_flag")
    private String mailFlag;//Mail 수신여부
    
    @Column(length = 1, nullable = true, name="platform_role")
    private String platformRole;//플랫폼 접근제어 코드 (DEFAULT:P, BUYER:B, SELLER:S, GP ADMIN:M)
    
    
    //##################### SNS 로그인에 필요한 정보 ########################
    
    @Column(length = 1, nullable = false, name="sns_only")
    private String snsOnly;// naver login Y/N
    
    @Column(length = 20, nullable = true, name="sns_login_naver")
    private String snsLoginNaver;// naver login Y/N
    
    @Column(length = 20, nullable = true, name="sns_login_naver_mail")
    private String snsLoginNaverMail;// naver login mail
    
    @Column(length = 20, nullable = true, name="sns_login_naver_name")
    private String snsLoginNaverName;// naver login name
    
    @Column(name = "sns_login_naver_date", nullable = true)
    private String snsLoginNaverDate;//승인일자
    
    @Column(length = 20, nullable = true, name="sns_login_kakao")
    private String snsLoginKakao;// kakao login Y/N
    
    @Column(length = 20, nullable = true, name="sns_login_kakao_mail")
    private String snsLoginKakaoMail;// kakao login mail
    
    @Column(length = 20, nullable = true, name="sns_login_kakao_name")
    private String snsLoginKakaoName;// kakao login name
    
    @Column(name = "sns_login_kakao_date", nullable = true)
    private String snsLoginKakaoDate;//승인일자
    
    
    //##################### 추가로 사이트 운영시 필요한 정보 ########################
    
    @Column(nullable = true, name="isenabled")
    private Integer isEnabled;//계정 사용 가능여부
    
    @Column(nullable = true, name="pw_wrong_cnt")
    private Integer pwWrongCnt;//비밀번호 틀린 횟수
    
    @Column(length = 1, nullable = true, name="pw_reset_flag")
    private String pwResetFlag;//비밀번호 초기화 여부 Y/N

    @Column(name = "pw_reset_date", nullable = true)
    private String pwResetDate;//비밀번호 초기화 일자
    
    //##################### 같은 회사코드를 공유하는 MEMBER의 관계를 위한 데이터값 ( 법인회원 ) ########################
    
    @Column(name = "add_date", nullable = true)
    private String addDate;//등록일자 / 가입일자
    
    @Column(name = "last_login_date", nullable = true)
    private String lastLoginDate;//등록일자 / 가입일자

    @Column(length = 30, nullable = true, name="add_user_id")
    private String addUserId;//등록자ID

    @Column(name = "change_date", nullable = true)
    private String changeDate;//수정일자
    
    @Column(length = 30, nullable = true, name="change_user_id")
    private String changeUserId;//수정자ID

    @Column(length = 1, nullable = true, name="status")
    private String status;//상태 (C:신규, R:수정, D:삭제,S:등록요청,T:등록반려)
    
    @Column(length = 20, nullable = true, name="buyer_code")
    private String buyerCode; //회사 코드
    
    @Column(length = 20, nullable = true, name="seller_code")
    private String sellerCode; //회사 코드
   
    @Column(length = 10, nullable = true, name="user_type")
    private String userType;//사용자 구분 (C:일반, A:관리자)
    
    @Column(length = 30, nullable = true, name="confirm_user_id")
    private String confirmUserId;//승인자 ID
    
    @Column(name = "confirm_date", nullable = true)
    private String confirmDate;//승인일자
    
    @Column(length = 20, nullable = true, name="division_code")
    private String divisionCode;//사업부 코드
    
    @Column(length = 20, nullable = true, name="dept_code")
    private String deptCode;//부서코드
    
    @Column(length = 20, nullable = true, name="position")
    private String position;//직급
    
    @Column(length = 50, nullable = true, name="employee_no")
    private String employeeNo;//사원번호
    
    @Column(length = 20, nullable = true, name="fax_no")
    private String faxNo;//팩스번호
    
    //#############################################################################################
    
    @Column(length = 20, nullable = true, name="market_service_terms")
    private String marketServiceTerms;//서비스 이용약관
    
    @Column(name = "service_agreed_date", nullable = true)
    private String serviceAgreedDate;//동의일자
    
    @Column(length = 20, nullable = true, name="market_financial_terms")
    private String marketFinancialTerms;//전자금융거래 동의
    
    @Column(name = "financial_agreed_date", nullable = true)
    private String financialAgreedDate;//동의일자
    
    @Column(length = 20, nullable = true, name="market_information_collection")
    private String marketInformationCollection;//개인정보 수집동의
    
    @Column(name = "collection_agreed_date", nullable = true)
    private String collectionAgreedDate;//동의일자
    
    @Column(length = 20, nullable = true, name="market_information_marketing")
    private String marketInformationMarketing;//마케팅 사용동의
    
    @Column(name = "marketing_agreed_date", nullable = true)
    private String marketingAgreedDate;//동의일자
    
    //#######################################################################################
    
    @Column(name = "only_param", nullable = true)
    private String onlyParam;//고유값
    
    @Column(name = "auth_type", nullable = true)
    private String authType;//인증수단
    
    @Column(name = "birth", nullable = true)
    private String birth;//생일
    
    @Column(name = "mobile_co", nullable = true)
    private String mobileCo;//통신사
    
    @Column(name = "gender", nullable = true)
    private String gender;//성별
    
    
    //#######################################################################################
    
    
    // MemberEntity 초기 생성자
    public MemberEntity(String userId) {
    	this.userId = userId;
    }

    @Builder
    public MemberEntity(String platformNo, String userId, String userName, String password, String email, String telNo,
			String cellNo, String zipCode, String address, String smsFlag, String mailFlag, String platformRole,
			String snsOnly, String snsLoginNaver, String snsLoginNaverMail, String snsLoginNaverName, String snsLoginNaverDate,
			String snsLoginKakao, String snsLoginKakaoMail, String snsLoginKakaoName, String snsLoginKakaoDate, 
			Integer isEnabled, Integer pwWrongCnt, String pwResetFlag, String pwResetDate, String addDate,
			String lastLoginDate, String addUserId, String changeDate, String changeUserId, String status,
			String buyerCode, String sellerCode, String userType, String confirmUserId, String confirmDate,
			String divisionCode, String deptCode, String position, String employeeNo, String faxNo,
			String marketServiceTerms, String serviceAgreedDate, String marketFinancialTerms, String financialAgreedDate,
			String marketInformationCollection, String collectionAgreedDate, String marketInformationMarketing,
			String marketingAgreedDate, String onlyParam, String authType, String birth, String mobileCo,
			String gender) {
		super();
		this.platformNo = platformNo;
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.telNo = telNo;
		this.cellNo = cellNo;
		this.zipCode = zipCode;
		this.address = address;
		this.smsFlag = smsFlag;
		this.mailFlag = mailFlag;
		this.platformRole = platformRole;
		this.snsOnly = snsOnly;
		this.snsLoginNaver = snsLoginNaver;
		this.snsLoginNaverMail = snsLoginNaverMail;
		this.snsLoginNaverName = snsLoginNaverName;
		this.snsLoginNaverDate = snsLoginNaverDate;
		this.snsLoginKakao = snsLoginKakao;
		this.snsLoginKakaoMail = snsLoginKakaoMail;
		this.snsLoginKakaoName = snsLoginKakaoName;
		this.snsLoginKakaoDate = snsLoginKakaoDate;
		this.isEnabled = isEnabled;
		this.pwWrongCnt = pwWrongCnt;
		this.pwResetFlag = pwResetFlag;
		this.pwResetDate = pwResetDate;
		this.addDate = addDate;
		this.lastLoginDate = lastLoginDate;
		this.addUserId = addUserId;
		this.changeDate = changeDate;
		this.changeUserId = changeUserId;
		this.status = status;
		this.buyerCode = buyerCode;
		this.sellerCode = sellerCode;
		this.userType = userType;
		this.confirmUserId = confirmUserId;
		this.confirmDate = confirmDate;
		this.divisionCode = divisionCode;
		this.deptCode = deptCode;
		this.position = position;
		this.employeeNo = employeeNo;
		this.faxNo = faxNo;
		this.marketServiceTerms = marketServiceTerms;
		this.serviceAgreedDate = serviceAgreedDate;
		this.marketFinancialTerms = marketFinancialTerms;
		this.financialAgreedDate = financialAgreedDate;
		this.marketInformationCollection = marketInformationCollection;
		this.collectionAgreedDate = collectionAgreedDate;
		this.marketInformationMarketing = marketInformationMarketing;
		this.marketingAgreedDate = marketingAgreedDate;
		this.onlyParam = onlyParam;
		this.authType = authType;
		this.birth = birth;
		this.mobileCo = mobileCo;
		this.gender = gender;
	}


}
