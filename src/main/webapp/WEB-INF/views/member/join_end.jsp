<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

<body class="member join">
  <div class="wrap">

    <!-- S : body -->
    <main>
      <div class="container">
        <div class="content">
          <!--S : 회원가입 정보-->
          <div class="layout-join_wrap">
            <div class="join-area">
              <form>
                <div class="section">
                  <div class="joinend-header">
                    <div class="gp-logo"><span class="blind">골든플랫폼</span></div>
                    회원가입이<br/> 완료되었습니다.
                    <div class="s_txt">골든플랫폼 회원가입을 환영합니다.<br />
                    다양한 서비스를 만나보세요</div>
                  </div>
                  <!-- 회원가입 버튼 -->
                  <div class="no-member"><button type="button" class="btn btn-default btn-home" onclick="location.href='/'"><span>메인으로 가기</span></button></div>
                  <!-- 회원가입 버튼 -->
                  <br>
				  <div class="no-member"><button type="button" class="btn btn-default btn-home" onclick="location.href='/login'"><span>로그인하러 가기</span></button></div>
                  <div class="joinend-option">
                    <!-- <div class="form-item">
                      <div class="form-head"><span class="form-name __required">사업자 등록번호 </span></div>
                      <div class="form-body">
                        <div class="form-area type-a"><input type="text" name="user_name" maxlength="20" placeholder="10자리 숫자 입력" ></div>
                      </div>
                    </div>
                     -->
                    <div class="btn-group">
                      <div class="signup-link"><span class="com-span">기업구매 회원</span>으로 전환 하시겠습니까?</div>
                      <div class="no-member"><button type="button" class="btn btn-blue btn-change_company" onclick="location.href='/buyer/companySignUp'"><span>기업구매 회원 전환</span></button></div>

                      <div class="signup-link">골든플랫폼에서 <span class="sell-span">판매</span>도 해보세요!
                        <div class="s_txt">seller 전환하실 경우 <span>필수 서류를 제출해주셔야 가입이 승인</span> 됩니다.(최종 심사 완료 후 판매 가능)</div>
                      </div>
                      <div class="no-member"><button type="button" class="btn btn-red btn-join_seller" onclick="location.href='/seller/sellerSignUp'"><span>seller신청</span></button></div>
                    </div>
                  </div>
                  <!-- -->
                </div>

              </form>
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
