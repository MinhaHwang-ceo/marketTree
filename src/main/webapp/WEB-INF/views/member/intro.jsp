<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,viewport-fit=cover">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>회원가입</title>
  <link rel="stylesheet" href="/resources/css/layout.css">
  <link rel="stylesheet" href="/resources/css/member.css">
</head>

<body class="member intro">
  <div class="wrap">


    <!-- S : body -->
    <main>
      <div class="container">
        <div class="content">
          <!--S : 회원가입 intro 정보-->
          <div class="layout-member_wrap">
            <h1 class="tit">
              <a href="/" class="gp_logo">골든플랫폼 <span>회원가입</span></a>
              <div class="fr_procedure">
                <ul class="">
                  <li class="step1 on">1 회원선택</li>
                  <li class="step2">2 약관동의</li>
                  <li class="step3">3 정보입력</li>
                  <li class="step4">4 가입완료</li>
              </ul>
              </div>
            </h1>
            <div class="member-area">
                <!-- GP 로그인 -->
                <div class="intro-box">
                  <div class="txt_desc">안녕하세요.<br/>
                  빠르고 간편한 골든플랫폼입니다.</div>
                  <div class="btn-group">
                    <a href="/signUp" ><button type="submit" class="btn btn-gp_join">골든플랫폼 회원가입</button></a>
                    <button type="submit" class="btn btn-sns_join" id="sns-join">소셜 간편 회원가입</button>
                  </div>
                </div>
            </div>
          </div>
          <!-- -E : 로그인 정보  -->
        </div>
      </div>
    </main>
    <!-- E : body -->
    <!--v팝업 -->
    <div class="layout-popup_wrap" id="layer_pop">
      <div class="popup_inwrap">
        <div class="popup-header">
          <h2><div class="gp_logo">골든플랫폼</div>간편 회원가입</h2>
        </div>
        <div class="popup-body">
          <p>소셜계정으로 간편하게 회원가입하세요.</p>
          <ul class="easy_joinlist">
            <li> <a class="btn btn-kakao" href="${kakaoUrl}" > 카카오 계정으로 시작하기 </a> </li>
            <li> <a class="btn btn-naver" href="${naverUrl}" > 네이버 계정으로 시작하기 </a> </li>
          </ul>
        </div>
        <div class="popup-close"><button type="button" class="btn-close icon_close" id="btn-close"><span class="blind">닫기</span></button></div>
      </div>
    </div>
    <!-- 팝업 -->
  </div>
  <!-- E : wrap -->

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript">

    $(document).ready(function() {
      $('#sns-join').click(function() {
        $('#layer_pop').addClass('active');
        return false;
      });

      $('#btn-close').click(function() {
        $('#layer_pop').removeClass('active');
        return false;
      });
      
    });

  </script>

</body>
</html>
