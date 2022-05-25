package com.gloryDuck.marketTree.model.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
 
@Service
public class NaverLoginBO {
 
    /* 인증 요청문을 구성하는 파라미터 */
    //client_id: 애플리케이션 등록 후 발급받은 클라이언트 아이디
    //response_type: 인증 과정에 대한 구분값. code로 값이 고정돼 있습니다.
    //redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩). 애플리케이션을 등록할 때 Callback URL에 설정한 정보입니다.
    //state: 애플리케이션이 생성한 상태 토큰
    private final static String CLIENT_ID = "Rm1Lsuz8j8X1DRXgfzZU";
    private final static String CLIENT_SECRET = "EbV4s7txy6";
    
    private final static String REDIRECT_URI = "https://www.weconn.co.kr/naver";
    private final static String REDIRECT_SIGN_UP_URI = "https://www.weconn.co.kr/naverSignUp";
    private final static String REDIRECT_LINK_URI = "https://www.weconn.co.kr/naverLink";
    
    /*
    private final static String REDIRECT_URI = "https://www.weconn.co.kr/naver";
    private final static String REDIRECT_SIGN_UP_URI = "https://www.weconn.co.kr/naverSignUp";
    private final static String REDIRECT_LINK_URI = "https://www.weconn.co.kr/naverLink";
    */
    private final static String SESSION_STATE = "oauth_state";
    /* 프로필 조회 API URL */
    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
    
    /* 네이버 아이디로 인증  URL 생성  Method */
    public String getAuthorizationUrl(HttpSession session) {
 
        /* 세션 유효성 검증을 위하여 난수를 생성 */
        String state = generateRandomString();
        /* 생성한 난수 값을 session에 저장 */
        setSession(session,state);
        
        System.out.println("save session ============" + session.getId());
        System.out.println("save state ============" + state);
        
        String uri = getUri(session);
        
        /* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
        OAuth20Service oauthService = new ServiceBuilder()                                                   
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(uri)
                .state(state) //앞서 생성한 난수값을 인증 URL생성시 사용함
                .build(NaverAPI.instance());
 
        return oauthService.getAuthorizationUrl();
    }
 
    /* 네이버아이디로 Callback 처리 및  AccessToken 획득 Method */
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
 
    	System.out.println("request session =====================" + session.getId());
        System.out.println("request code =====================" + code);
        System.out.println("request state =====================" + state);
        
        /* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
        String sessionState = getSession(session);
        
        System.out.println("request sessionState =====================" + sessionState);
        
        if(StringUtils.pathEquals(sessionState, state)){
        	
        	String uri = getUri(session);
        	
            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(CLIENT_ID)
                    .apiSecret(CLIENT_SECRET)
                    .callback(uri)
                    .state(state)
                    .build(NaverAPI.instance());
 
            /* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }
 
    /* 세션 유효성 검증을 위한 난수 생성기 */
    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }
 
    /* http session에 데이터 저장 */
    private void setSession(HttpSession session,String state){
        session.setAttribute(SESSION_STATE, state);     
    }
 
    /* http session에서 데이터 가져오기 */ 
    private String getSession(HttpSession session){
        return (String) session.getAttribute(SESSION_STATE);
    }
    /* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
    public HashMap<String, Object> getUserInfo(OAuth2AccessToken oauthToken, HttpSession session) throws IOException{
 
    	HashMap<String, Object> userInfo = new HashMap<>();
    	
    	String uri = getUri(session);
    	
        OAuth20Service oauthService =new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(uri)
                .callback(REDIRECT_URI).build(NaverAPI.instance());
 
            OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        
        String result = response.getBody();
        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(result);
        
        JsonObject naverResult = element.getAsJsonObject().get("response").getAsJsonObject();
        
        String email = naverResult.getAsJsonObject().get("email").getAsString();
        String mobile = naverResult.getAsJsonObject().get("mobile").getAsString();
        String name = naverResult.getAsJsonObject().get("name").getAsString();
        
        userInfo.put("nickname", name);
        userInfo.put("email", email);
        userInfo.put("phone", mobile);
        
        return userInfo;
    }
    
    public String getUri(HttpSession session) {
    	
    	String isSignUp = session.getAttribute("signUp").toString();
        String uri = REDIRECT_URI;
        if(session.getAttribute("signUp") != null && isSignUp.equals("Y")) {
        	
        	 uri = REDIRECT_SIGN_UP_URI;
        	
        }else if(session.getAttribute("signUp") != null && isSignUp.equals("N")) {
        	
        	 uri = REDIRECT_URI;
        	 
        }else if(session.getAttribute("link") != null && isSignUp.equals("F")) {
        	
        	 uri = REDIRECT_LINK_URI;
        	 
        }
        return uri;
    }
 
}

