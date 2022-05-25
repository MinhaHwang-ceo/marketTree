<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,viewport-fit=cover">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>가입 완료 및 사업자 인증</title>
  <link rel="stylesheet" href="/resources/css/layout.css">
  <link rel="stylesheet" href="/resources/css/member.css">
</head>

<body class="member join _end">
  <div class="wrap">

    <!-- S : body -->
    <main>
      <div class="container">
        <div class="content">
          <!--S : 회원가입 정보-->
          <div class="layout-join_wrap">
            <!--<h2><strong>seller신청</strong> 이 완료되었습니다.</h2>-->
            <div class="join-area">
              <div class="section">
                <div class="joinend-header">
                  <div class="gp-logo"><span class="blind">골든플랫폼</span></div>
                  기업회원 전환이 <br>완료되었습니다.
                </div>
                <!-- GP 회원가입 -->
                <div class="joinend-body">
                  <div class="txt">
                  <p>지금 바로 골든플랫폼의 서비스를 이용해보세요!</p></div>
                <!-- 회원가입 버튼 -->
                <div class="no-member"><button type="button" class="btn btn-default btn-home" onclick="location.href='/'"><span>메인으로 가기</span></button></div>
                <!-- 회원가입 버튼 -->
                </div>
				
				<c:if test="${addUser == true}">
                <div class="joinend-option">
                  <div class="btn-group">
                    <div class="signup-link">골든플랫폼에서 판매도 해보세요!
                      <div class="s_txt">seller 전환하실 경우 필수 서류를 제출해주셔야 가입이 승인 됩니다.<span>(최종 심사 완료 후 판매 가능)</span></div>
                    </div>
                    <div class="no-member"><button type="button" class="btn btn-red btn-join_seller" onclick="location.href='/seller/sellerSignUp'"><span>seller신청</span></button></div>
                  </div>
                </div>
                </c:if>
              </div>
            </div>
          </div>
            <!--E : 회원가입 정보-->
        </div>
      </div>
    </main>
    <!-- E : body -->
    </div>
    <!-- E : wrap -->
  </body>
  </html>
