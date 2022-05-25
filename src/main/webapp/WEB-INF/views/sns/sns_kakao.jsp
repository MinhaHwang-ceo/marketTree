<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,viewport-fit=cover">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>SNS 로그인</title>
  <link rel="stylesheet" href="/resources/css/layout.css">
  <link rel="stylesheet" href="/resources/css/member.css">
</head>

<body class="member sns">
  <div class="wrap">

    <!-- S : body -->
    <main>
      <div class="container">
        <div class="content">
          <!--S : 로그인 정보-->
          <div class="layout-join_wrap">
            <h2 class="kakao_gp"><span class="blind">카카오 연결</span>소셜계정으로 회원가입을 진행합니다.</h2>
            <div class="s_txt">이메일입력과 약관동의 후 골든플랫폼 회원으로 가입됩니다.<br/>이후, 소셜계정으로 간편로그인하세요.</div>

            <div class="join-area">
              <form>
                <legend>주문정보 수신용 이메일 필수입력</legend>
                <div class="form-item">
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="user_name" maxlength="20" placeholder="주문정보 수신용 이메일 필수입력" value=""></div>
                    <div class="form-noti email_noti_0">이메일을 입력해 주세요.</div>
                    <div class="form-noti email_noti_1">이메일 형식이 올바르지 않습니다.</div>
                    <div class="form-noti email_noti_2">이미 사용중인 이메일입니다.</div>
                  </div>
                </div>

                <div class="form-option">
                  <fieldset class="option-list">
                    <legend>약관동의 선택 서식</legend>
                    <div class="option-item __checkbox">
                      <div class="option-head">
                        <input type="checkbox" id="check"> <label for="check">골든플랫폼 이용약관에 모두 동의 <span>(필수)</span></label>
                        <button type="button" class="btn_all icon_arrow_up"><span class="blind">약관 목록 펼치기</span></button>
                      </div>

                      <div class="option-body">
                        <ul class="check_list">
                          <li>
                            <div class="check-head">
                              <input type="checkbox" id="check01"> <label for="check01">골든플랫폼 이용약관 <span>(필수)</span> </label>
                              <button type="button" class="btn_view icon_arrow_right"><span class="blind">약관보기</span></button>
                            </div>
                            <!--동의 내용 -->
                            <div class="laypop_terms">
                              <h3 class="tit">골든플랫폼 이용약관</h3><iframe src="agree01.html" frameborder="0" scrolling="no" class="ifrm_rules" title="골든플랫폼 이용약관"></iframe><button type="button" class="btn_close  icon_close"><span class="blind">닫기</span></button>
                            </div>
                            <!--동의 내용 -->
                          </li>
                          <li>
                            <div class="check-head">
                              <input type="checkbox" id="check02"> <label for="check02">전자금융거래 이용약관<span>(필수)</span></label>
                              <button type="button" class="btn_view icon_arrow_right"><span class="blind">약관보기</span></button>
                            </div>
                            <!--동의 내용 -->
                            <div class="laypop_terms">
                              <h3 class="tit">골든플랫폼 이용약관</h3><iframe src="agree01.html" frameborder="0" scrolling="no" class="ifrm_rules" title="전자금융거래 이용약관"></iframe><button type="button" class="btn_close icon_close"><span class="blind">닫기</span></button>
                            </div>
                            <!--동의 내용 -->
                          </li>
                          <li>
                            <div class="check-head">
                              <input type="checkbox" id="check03"> <label for="check03">개인정보 수집 및 이용<span>(필수)</span></label>
                              <button type="button" class="btn_view icon_arrow_right"><span class="blind">약관보기</span></button>
                            </div>
                            <!--동의 내용 -->
                            <div class="laypop_terms">
                              <h3 class="tit">골든플랫폼 이용약관</h3><iframe src="agree01.html" frameborder="0" scrolling="no" class="ifrm_rules" title="전자금융거래 이용약관"></iframe><button type="button" class="btn_close icon_close"><span class="blind">닫기</span></button>
                            </div>
                            <!--동의 내용 -->
                          </li>
                          <li>
                            <div class="check-head">
                              <input type="checkbox" id="check04"> <label for="check04">개인정보 활용 및 마케팅 정보 수신 동의(선택)</label>
                              <button type="button" class="btn_view icon_arrow_right"><span class="blind">약관보기</span></button>
                            </div>
                            <!--동의 내용-->
                            <div class="laypop_terms">
                              <h3 class="tit">마케팅 활용을 위한<br>개인정보 수집이용동의</h3>
                              <p class="txt_desc">고객님께서는 동의를 거부하실 수 있으며,<br>동의하지 않아도 가입이 가능합니다.</p>
                              <table class="tbl">
                                  <caption>이벤트/쇼핑혜택 수신 동의 안내</caption>
                                  <colgroup>
                                      <col style="width:25%">
                                      <col style="width:75%">
                                  </colgroup>
                                  <tbody>
                                  <tr>
                                      <th scope="row">이용목적</th>
                                      <td>쇼핑이벤트 및<br> 혜택 알림 서비스 제공</td>
                                  </tr>
                                  <tr>
                                      <th scope="row">수집항목</th>
                                      <td>이메일주소</td>
                                  </tr>
                                  <tr>
                                      <th scope="row">보유기간</th>
                                      <td>회원탈퇴 또는 개인정보 유효기간 도래 시 까지 보관<br>단, 관계 법령에 따라 고객님의 개인정보를 보존하여야 하는 경우, 회사는 해당 법령에서 정한 기간 동안 보관합니다.</td>
                                  </tr>
                                  </tbody>
                              </table>
                              <button type="button" class="btn_close icon_close">닫기</button>
                          </div>
                            <!--동의 내용 -->
                          </li>
                        </ul>
                      </div>
                    </div>
                  </fieldset>
                </div>


                <div class="no-member"><button type="button" class="btn btn-red btn-join "><span>가입하기</span></button></div>
              </form>
            </div>
          </div>

          <!-- -E : 로그인 정보  -->



        </div>
    </main>
    <!-- E : body -->
  </div>
  <!-- E : wrap -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript">

    $(document).ready(function() {

      $('.check_list>li>div .btn_view').bind('click',function(){
        r=$('.check_list>li>div').index($(this));
        $(this).parent().parent().toggleClass('on').siblings().removeClass('on');
        return false;
      });

      $('.btn_close').click(function() {
        $('.check_list>li>div').parent().toggleClass('on').siblings().removeClass('on');
        return false;
      });
    });

  </script>


  </body>
</html>
