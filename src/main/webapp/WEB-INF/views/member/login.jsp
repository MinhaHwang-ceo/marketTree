<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="com.gloryDuck.marketTree.model.vo.MemberEntity" %>
<%
Authentication auth = (Authentication)request.getUserPrincipal();
String name = "";
if(auth == null){
	
}else{
	Object principal = auth.getPrincipal();
	if(principal != null && principal instanceof MemberEntity){
		name = ((MemberEntity)principal).getUserId();
	}
}
%>
<!DOCTYPE html>
<html lang="ko">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- <script src="https://www.google.com/recaptcha/api.js?render=6LfAsigdAAAAAALLufXTkmFNCsvhT_EjEtlO9v5s"></script> -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script type="text/javascript">

const Toast = Swal.mixin({
    toast: true,
    position: 'center-center',
    showConfirmButton: false,
    timer: 1300,
    timerProgressBar: true,
    didOpen: (toast) => {
    toast.addEventListener('mouseenter', Swal.stopTimer)
    toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
    });
    
$(document).ready(function(){
    
    $('#onSubmit').on('click',function(){
    	
    	var userId = $('#userId').val();
    	var pass = $('#password').val();
    	
    	if(userId == ''){
    		
    		Toast.fire({
                icon: 'error',
                title: '아이디를 입력해주세요',
            });
    		return false;
    	}else if(pass == ''){
    		
    		Toast.fire({
                icon: 'error',
                title: '패스워드를 입력해주세요',
            });
    		return false;
    	}else {
    		
    	}
    	
    })
});
</script>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>로그인</title>
  <link rel="stylesheet" href="/resources/css/layout.css">
  <link rel="stylesheet" href="/resources/css/member.css">
</head>

<body class="login">
  <div class="wrap">
    <!-- S : body -->
    <main>
      <div class="container">
        <div class="content">
          <!--S : 로그인 정보-->
          <div class="layout-login_wrap">
            <h2><a href="/index"><span class="blind">로그인</span></a></h2>
            <div class="login-area">
              <form action="/login" method="POST">
                <!-- GP 로그인 -->
                <div class="login-box">
                  <div class="login_text">골든플랫폼에 오신걸 환영합니다!<br>
                 	 <c:if test="${exceptionMsgName!=null}">
                 	 	<br>
					   <p style='color:red'>  <c:out value="${exceptionMsgName}"/> </p>
					 </c:if>
				  </div>
                  <div class="id_input"><input type="text" id="userId" name="userId" value="${myId}" placeholder="아이디를 입력해주세요." class=""> </div>
                  <div class="pw_input"><input name="password" id="password" type="password" placeholder="비밀번호를 입력해주세요."></div>
                  <div class="invalid-feedback" style="display:none">정확한 아이디를 입력해주세요.</div>
                  <button type="submit" id="onSubmit" value="Login" class="btn btn-login">로그인</button>
                  <div class="idpw-box">
                    <div class="id_save"><input type="checkbox" id="remember-me" name="remember-me" value="true">아이디 저장</div>
                    <div class="member-service">
                      <a href="/idpw_search">아이디·비밀번호 찾기</a>
                      <a href="/intro">회원가입</a>
                    </div>
                  </div>
                  <div align="center" class="g-recaptcha" id="g-recaptcha"></div>
                </div>
                <!-- 연동 로그인-->
                <div class="other-login">
                  <a href="${kakaoUrl}">
                  <button type="button" class="btn btn-kakao"><span>카카오로 시작하기</span></button>
                  </a>
                  <a href="${naverUrl}">
                  <button type="button" class="btn btn-naver"><span>네이버로 시작하기</span></button>
                  </a>
                </div>
                <!-- <div class="signup-link"><a href="#">아직 회원이 아니신가요?</a></div>
                <div class="no-member"><button type="button" class="btn"><span>비회원 주문조회</span></button></div> -->
              </form>
            </div>
          </div>

          <!-- -E : 로그인 정보  -->



        </div>
    </main>
    <!-- E : body -->
    </div>
</body>
</html>

