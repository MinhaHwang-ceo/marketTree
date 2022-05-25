<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="com.gloryDuck.marketTree.model.vo.MemberEntity" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%

%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,viewport-fit=cover">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>SELLER 가입 신청</title>
  <link rel="stylesheet" href="/resources/css/layout.css">
  <link rel="stylesheet" href="/resources/css/member.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>

<body class="member join">
  <div class="wrap">

    <!-- S : body -->
    <main>
      <div class="container">
        <div class="content">
          <!--S : 회원가입 정보-->
          <div class="layout-join_wrap __seller">
            <h2><span>Seller</span> 가입 신청</h2>
            <div class="join-area">
              <form id="sellerForm">
                <!-- 셀러정보 -->
                <div class="form-title"><strong>기업정보</strong><c:if test="${member.platformRole eq 'B'}"><div class="checkbox __checkbox" id="callMyInfo" style="display:none;"><input type="checkbox" id="MyInfo"><label for="MyInfo">기업회원 정보 불러오기</label></div></c:if></div>
				<div class="form-item">
                  <div class="form-head"><span class="form-name __required">사업자 번호 </span></div>
                  <div class="form-body">
                    <div class="form-area type-b"><input type="text" name="irsNo" id="irsNo" maxlength="10" oninput="maxLengthCheck(this)" placeholder="10자리 숫자 입력" ><c:if test="${member.platformRole ne 'B'}"><button type="button" class="" id="checkbuss" name="checkbuss" onclick="checkbussiness();" >사업자 조회</button></c:if></div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">사업자 명 </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="sellerName" id="sellerName" maxlength="20" oninput="maxLengthCheck(this)" placeholder="정보 조회시 자동입력" readonly></div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">대표자 이름 </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="ceoUserName" id="ceoUserName" maxlength="20"  oninput="maxLengthCheck(this)" placeholder="정보 조회시 자동입력" readonly></div>
                  </div>
                </div>
                 <div class="form-item">
                  <div class="form-head"><span class="form-name __required">대표 전화번호 </span></div>
                  <div class="form-body">
                    <div class="form-area type-b">
                      <select name="representTel"  id="representTel">
                        <option value="02">서울( 02 )</option>
                        <option value="051">부산( 051 )</option>
                        <option value="053">대구( 053 )</option>
                        <option value="032">인천( 032 )</option>
                        <option value="062">광주( 062 )</option>
                        <option value="042">대전( 042 )</option>
                        <option value="052">울산( 052 )</option>
                        <option value="044">세종( 044 )</option>
                        <option value="031">경기( 031 )</option>
                        <option value="033">강원( 033 )</option>
                        <option value="043">충북( 043 )</option>
                        <option value="041">충남( 041 )</option>
                        <option value="063">전북( 063 )</option>
                        <option value="061">전남( 061 )</option>
                        <option value="054">경북( 054 )</option>
                        <option value="055">경남( 055 )</option>
                        <option value="064">제주( 064 )</option>
                        <option value="070">070</option>
                        <option value="080">080</option>
                        <option value="0505">0505</option>
                        <option value="0303">0303</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                        <option value="0504">0504</option>
                      </select>
                    <input type="number" name="representTelNo" id="representTelNo" maxlength="8" oninput="maxLengthCheck(this)" placeholder="숫자만 입력" ></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name">대표 팩스번호</span></div>
                  <div class="form-body">
                    <div class="form-area type-b">
                      <select name="representFax" id="representFax" >
                        <option value="" >선택</option>
                        <option value="02">서울( 02 )</option>
                        <option value="051">부산( 051 )</option>
                        <option value="053">대구( 053 )</option>
                        <option value="032">인천( 032 )</option>
                        <option value="062">광주( 062 )</option>
                        <option value="042">대전( 042 )</option>
                        <option value="052">울산( 052 )</option>
                        <option value="044">세종( 044 )</option>
                        <option value="031">경기( 031 )</option>
                        <option value="033">강원( 033 )</option>
                        <option value="043">충북( 043 )</option>
                        <option value="041">충남( 041 )</option>
                        <option value="063">전북( 063 )</option>
                        <option value="061">전남( 061 )</option>
                        <option value="054">경북( 054 )</option>
                        <option value="055">경남( 055 )</option>
                        <option value="064">제주( 064 )</option>
                        <option value="070">070</option>
                        <option value="080">080</option>
                        <option value="0505">0505</option>
                        <option value="0303">0303</option>
                        <option value="0504">0504</option>
                      </select>
                     <input type="number" name="representFaxNo" id="representFaxNo" maxlength="9" oninput="maxLengthCheck(this)" placeholder="숫자만 입력" ></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">사업자 등록 상 주소  </span></div>
                  <div class="form-body">
                    <div class="form-area type-b"><input type="text" name="zipCode" id="zipCode" maxlength="20" oninput="maxLengthCheck(this)" readonly="readonly"> <button type="button" class=""  id="addressOn" name="addressOn">우편번호 검색</button></div>
                    <div class="form-area type-a">
                      <input class="input" type="text" name="address" id="address" title="주소 입력" readonly="readonly">
                      <input class="input" type="text" name="addressDetail" id="addressDetail"  maxlength="50" oninput="maxLengthCheck(this)" placeholder="상세주소 입력" >
                       <input type="hidden" name="areaName" id="areaName" value="" >
                      </div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">업태 </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="businessType" id="businessType" maxlength="20" oninput="maxLengthCheck(this)" oninput="maxLengthCheck(this)" placeholder="예)제조업" ></div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">업종 </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="industryType" id="industryType" maxlength="20" oninput="maxLengthCheck(this)" oninput="maxLengthCheck(this)" placeholder="예)산업용기계 및 공구 " ></div>
                  </div>
                </div>
                 <div class="form-item">
                  <div class="form-head"><span class="form-name">고객응대 전화번호</span></div>
                  <div class="form-body">
                    <div class="form-area type-b">
                      <select name="customerTel" id="customerTel" >
                        <option value="">선택</option>
                        <option value="02">서울( 02 )</option>
                        <option value="051">부산( 051 )</option>
                        <option value="053">대구( 053 )</option>
                        <option value="032">인천( 032 )</option>
                        <option value="062">광주( 062 )</option>
                        <option value="042">대전( 042 )</option>
                        <option value="052">울산( 052 )</option>
                        <option value="044">세종( 044 )</option>
                        <option value="031">경기( 031 )</option>
                        <option value="033">강원( 033 )</option>
                        <option value="043">충북( 043 )</option>
                        <option value="041">충남( 041 )</option>
                        <option value="063">전북( 063 )</option>
                        <option value="061">전남( 061 )</option>
                        <option value="054">경북( 054 )</option>
                        <option value="055">경남( 055 )</option>
                        <option value="064">제주( 064 )</option>
                        <option value="070">070</option>
                        <option value="080">080</option>
                        <option value="0505">0505</option>
                        <option value="0303">0303</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                        <option value="0504">0504</option>
                      </select>
                     <input type="number" name="customerTelNo" id="customerTelNo" maxlength="9" oninput="maxLengthCheck(this)" placeholder="숫자만 입력" ></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                  </div>
                </div>
                <div class="form-title"><strong>세금계산서 수신자 정보</strong></div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">수신자 명</span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="receiverName" id="receiverName" maxlength="20" oninput="maxLengthCheck(this)" placeholder="2자 이상 입력" ></div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">수신자 휴대폰번호 </span></div>
                  <div class="form-body">
                    <div class="form-area type-b"><select name="cellphoneReceiver" id="cellphoneReceiver" class="form-elem valid">
                      <option value="010">010</option>
                      <option value="011">011</option>
                      <option value="016">016</option>
                      <option value="017">017</option>
                      <option value="018">018</option>
                      <option value="019">019</option>
                    </select> <input type="number" name="receiverCellNo" maxlength="8"  id="receiverCellNo" oninput="maxLengthCheck(this)" placeholder="숫자만 입력" value=""></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">수신자 전화번호</span></div>
                  <div class="form-body">
                    <div class="form-area type-b">
                      <select name="fax" id="telephoneReceiver" >
                        <option value="">선택</option>
                        <option value="02">서울( 02 )</option>
                        <option value="051">부산( 051 )</option>
                        <option value="053">대구( 053 )</option>
                        <option value="032">인천( 032 )</option>
                        <option value="062">광주( 062 )</option>
                        <option value="042">대전( 042 )</option>
                        <option value="052">울산( 052 )</option>
                        <option value="044">세종( 044 )</option>
                        <option value="031">경기( 031 )</option>
                        <option value="033">강원( 033 )</option>
                        <option value="043">충북( 043 )</option>
                        <option value="041">충남( 041 )</option>
                        <option value="063">전북( 063 )</option>
                        <option value="061">전남( 061 )</option>
                        <option value="054">경북( 054 )</option>
                        <option value="055">경남( 055 )</option>
                        <option value="064">제주( 064 )</option>
                        <option value="070">070</option>
                        <option value="080">080</option>
                        <option value="0505">0505</option>
                        <option value="0303">0303</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                        <option value="0504">0504</option>
                      </select>
                     <input type="number" name="receiverTelNo"  id="receiverTelNo" maxlength="8" oninput="maxLengthCheck(this)" placeholder="숫자만 입력" ></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">수신자 이메일</span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="receiverEmail" id="receiverEmail" maxlength="40" oninput="maxLengthCheck(this)" placeholder="세금계산서 수신자 이메일을 정확히 입력해주세요" value=""></div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name">팩스번호</span></div>
                  <div class="form-body">
                    <div class="form-area type-b">
                      <select name="receiverFax" id="receiverFax" >
                        <option value="">선택</option>
                        <option value="02">서울( 02 )</option>
                        <option value="051">부산( 051 )</option>
                        <option value="053">대구( 053 )</option>
                        <option value="032">인천( 032 )</option>
                        <option value="062">광주( 062 )</option>
                        <option value="042">대전( 042 )</option>
                        <option value="052">울산( 052 )</option>
                        <option value="044">세종( 044 )</option>
                        <option value="031">경기( 031 )</option>
                        <option value="033">강원( 033 )</option>
                        <option value="043">충북( 043 )</option>
                        <option value="041">충남( 041 )</option>
                        <option value="063">전북( 063 )</option>
                        <option value="061">전남( 061 )</option>
                        <option value="054">경북( 054 )</option>
                        <option value="055">경남( 055 )</option>
                        <option value="064">제주( 064 )</option>
                        <option value="070">070</option>
                        <option value="080">080</option>
                        <option value="0505">0505</option>
                        <option value="0303">0303</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                        <option value="0504">0504</option>
                      </select>
                     <input type="number" name="receiverFaxNo" id="receiverFaxNo" maxlength="9" oninput="maxLengthCheck(this)" placeholder="숫자만 입력" ></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                  </div>
                </div>

                <!-- 셀러 정산담당자 정보 -->
                <div class="form-title"><strong>정산담당자 정보</strong><div class="checkbox __checkbox" id="receiverSame"><input type="checkbox" id="sameReceiver"><label for="sameReceiver">세금계산서 수신자와 동일</label></div></div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">정산담당자 이름 </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="settlementName" id="settlementName" maxlength="20"  oninput="maxLengthCheck(this)" placeholder="정산담당자 이름을 정확히 입력해주세요" value=""></div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">정산담당자 전화번호</span></div>
                  <div class="form-body">
                    <div class="form-area type-b">
                      <select name="settlementTel" id="settlementTel" >
                        <option value="">선택</option>
                        <option value="02">서울( 02 )</option>
                        <option value="051">부산( 051 )</option>
                        <option value="053">대구( 053 )</option>
                        <option value="032">인천( 032 )</option>
                        <option value="062">광주( 062 )</option>
                        <option value="042">대전( 042 )</option>
                        <option value="052">울산( 052 )</option>
                        <option value="044">세종( 044 )</option>
                        <option value="031">경기( 031 )</option>
                        <option value="033">강원( 033 )</option>
                        <option value="043">충북( 043 )</option>
                        <option value="041">충남( 041 )</option>
                        <option value="063">전북( 063 )</option>
                        <option value="061">전남( 061 )</option>
                        <option value="054">경북( 054 )</option>
                        <option value="055">경남( 055 )</option>
                        <option value="064">제주( 064 )</option>
                        <option value="070">070</option>
                        <option value="080">080</option>
                        <option value="0505">0505</option>
                        <option value="0303">0303</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                        <option value="0504">0504</option>
                      </select>
                     <input type="number" name="settlementTelNo" id="settlementTelNo" maxlength="8" oninput="maxLengthCheck(this)" placeholder="숫자만 입력" ></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">정산담당자 이메일 </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="settlementEmail" id="settlementEmail" maxlength="40"  oninput="maxLengthCheck(this)" placeholder="정산담당자 이메일을 정확히 입력해주세요" value=""></div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name">팩스번호</span></div>
                  <div class="form-body">
                    <div class="form-area type-b">
                      <select name="settlementFax" id="settlementFax" >
                        <option value="" >선택</option>
                        <option value="02">서울( 02 )</option>
                        <option value="051">부산( 051 )</option>
                        <option value="053">대구( 053 )</option>
                        <option value="032">인천( 032 )</option>
                        <option value="062">광주( 062 )</option>
                        <option value="042">대전( 042 )</option>
                        <option value="052">울산( 052 )</option>
                        <option value="044">세종( 044 )</option>
                        <option value="031">경기( 031 )</option>
                        <option value="033">강원( 033 )</option>
                        <option value="043">충북( 043 )</option>
                        <option value="041">충남( 041 )</option>
                        <option value="063">전북( 063 )</option>
                        <option value="061">전남( 061 )</option>
                        <option value="054">경북( 054 )</option>
                        <option value="055">경남( 055 )</option>
                        <option value="064">제주( 064 )</option>
                        <option value="070">070</option>
                        <option value="080">080</option>
                        <option value="0505">0505</option>
                        <option value="0303">0303</option>
                        <option value="0504">0504</option>
                      </select>
                     <input type="number" name="settlementFaxNo" id="settlementFaxNo" maxlength="9" oninput="maxLengthCheck(this)" placeholder="숫자만 입력" ></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                  </div>
                </div>
                <!-- 셀러 담당자 정보 -->
                <div class="form-title"><strong>담당자 정보</strong><div class="checkbox __checkbox" id="receiverSame2"><input type="checkbox" id="sameReceiver2"><label for="sameReceiver2">세금계산서 수신자와 동일</label></div></div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">담당자 이름 </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="managerName" id="managerName" maxlength="40"  oninput="maxLengthCheck(this)" placeholder="담당자 이름을 정확히 입력해주세요" value=""></div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">담당자 전화번호</span></div>
                  <div class="form-body">
                    <div class="form-area type-b">
                      <select name="managerTel" id="managerTel" >
                        <option value="">선택</option>
                        <option value="02">서울( 02 )</option>
                        <option value="051">부산( 051 )</option>
                        <option value="053">대구( 053 )</option>
                        <option value="032">인천( 032 )</option>
                        <option value="062">광주( 062 )</option>
                        <option value="042">대전( 042 )</option>
                        <option value="052">울산( 052 )</option>
                        <option value="044">세종( 044 )</option>
                        <option value="031">경기( 031 )</option>
                        <option value="033">강원( 033 )</option>
                        <option value="043">충북( 043 )</option>
                        <option value="041">충남( 041 )</option>
                        <option value="063">전북( 063 )</option>
                        <option value="061">전남( 061 )</option>
                        <option value="054">경북( 054 )</option>
                        <option value="055">경남( 055 )</option>
                        <option value="064">제주( 064 )</option>
                        <option value="070">070</option>
                        <option value="080">080</option>
                        <option value="0505">0505</option>
                        <option value="0303">0303</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                        <option value="0504">0504</option>
                      </select>
                     <input type="number" name="managerTelNo" id="managerTelNo" maxlength="8" oninput="maxLengthCheck(this)" placeholder="숫자만 입력" ></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">담당자 이메일 </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="text" name="managerEmail" id="managerEmail" maxlength="40"  oninput="maxLengthCheck(this)" placeholder="담당자 이메일을 정확히 입력해주세요" value=""></div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name">팩스번호</span></div>
                  <div class="form-body">
                    <div class="form-area type-b">
                      <select name="managerFax" id="managerFax" >
                        <option value="" >선택</option>
                        <option value="02">서울( 02 )</option>
                        <option value="051">부산( 051 )</option>
                        <option value="053">대구( 053 )</option>
                        <option value="032">인천( 032 )</option>
                        <option value="062">광주( 062 )</option>
                        <option value="042">대전( 042 )</option>
                        <option value="052">울산( 052 )</option>
                        <option value="044">세종( 044 )</option>
                        <option value="031">경기( 031 )</option>
                        <option value="033">강원( 033 )</option>
                        <option value="043">충북( 043 )</option>
                        <option value="041">충남( 041 )</option>
                        <option value="063">전북( 063 )</option>
                        <option value="061">전남( 061 )</option>
                        <option value="054">경북( 054 )</option>
                        <option value="055">경남( 055 )</option>
                        <option value="064">제주( 064 )</option>
                        <option value="070">070</option>
                        <option value="080">080</option>
                        <option value="0505">0505</option>
                        <option value="0303">0303</option>
                        <option value="0504">0504</option>
                      </select>
                     <input type="number" name="managerFaxNo" id="managerFaxNo" maxlength="9" oninput="maxLengthCheck(this)" placeholder="숫자만 입력" ></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                  </div>
                </div>
                <!--반품/교환-->
                <div class="form-title"><strong class="__required">반품/교환지 정보</strong>
                </div>
                  <div class="form-item" id="settleAccountView" style="display:block;">
                  <div class="form-head"><span class="form-name __required">반품/교환 택배사  </span></div>
                  <div class="form-body">
                    <div class="form-area type-a">
                      <select name="returnLogistics" id="returnLogistics">
                        <option value="none">반품/교환 택배사</option>
                        <c:forEach var="logistics" items="${logistics}" step="1" varStatus="logistics">
							<option value="${logistics.current.CODE}">${logistics.current.CODE_TEXT}</option>
						</c:forEach>
                      </select>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">반품배송비(편도) </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="number" name="returnCharge" id="returnCharge" maxlength="20"  oninput="maxLengthCheck(this)" placeholder="반품배송비 입력" value=""></div>
                  </div>
                </div>
                 <div class="form-item">
                  <div class="form-head"><span class="form-name __required">교환배송비(왕복) </span></div>
                  <div class="form-body">
                    <div class="form-area type-a"><input type="number" name="exchangeCharge" id="exchangeCharge" maxlength="20"  oninput="maxLengthCheck(this)" placeholder="교환배송비 입력" value=""></div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">A/S 책임자 관련 전화번호 </span></div>
                    <div class="form-body">
                    <div class="form-area type-b">
                      <select name="asPartTel" id="asPartTel" >
                        <option value="">선택</option>
                        <option value="02">서울( 02 )</option>
                        <option value="051">부산( 051 )</option>
                        <option value="053">대구( 053 )</option>
                        <option value="032">인천( 032 )</option>
                        <option value="062">광주( 062 )</option>
                        <option value="042">대전( 042 )</option>
                        <option value="052">울산( 052 )</option>
                        <option value="044">세종( 044 )</option>
                        <option value="031">경기( 031 )</option>
                        <option value="033">강원( 033 )</option>
                        <option value="043">충북( 043 )</option>
                        <option value="041">충남( 041 )</option>
                        <option value="063">전북( 063 )</option>
                        <option value="061">전남( 061 )</option>
                        <option value="054">경북( 054 )</option>
                        <option value="055">경남( 055 )</option>
                        <option value="064">제주( 064 )</option>
                        <option value="070">070</option>
                        <option value="080">080</option>
                        <option value="0505">0505</option>
                        <option value="0303">0303</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                        <option value="0504">0504</option>
                      </select>
                     <input type="number" name="asPartTelNo" id="asPartTelNo" maxlength="8" oninput="maxLengthCheck(this)" placeholder="숫자만 입력" ></div>
                    <div class="form-noti cellphone_noti_2">이미 등록된 번호입니다.</div>
                 </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">반품/교환지  </span></div>
                  <div class="form-body">
                    <div class="form-area type-b"><input type="text" name="returnZipCode" id="returnZipCode" maxlength="20" oninput="maxLengthCheck(this)" readonly="readonly"> <button type="button" class=""  id="addressOn2" name="addressOn2">우편번호 검색</button></div>
                    <div class="form-area type-a">
                      <input class="input" type="text" name="returnAddress1" id="returnAddress1" title="주소 입력" readonly="readonly">
                      <input class="input" type="text" name="returnAddress2" id="returnAddress2"  maxlength="50" oninput="maxLengthCheck(this)" placeholder="상세주소 입력" >
                      </div>
                  </div>
                </div>
 
                <!--셀러 정산대금 수신방법  -->
                <div class="form-title"><strong class="__required">정산대금 수신방법</strong>
                	<div class="checkbox __checkbox">
	                     <select name="settlementType" id="settlementType">
	                        <option value="none" >방법 선택</option>
	                        <option value="ACCOUNT" id="settleAccountCheck" selected>계좌송금</option>
	                        <!-- <option value="POINT">적립금</option> -->
	                      </select>
                     </div>
                </div>
                <div class="form-item" id="settleAccountView" style="display:block;">
                  <div class="form-head"><span class="form-name __required">계좌번호  </span>
                   <div class="radio-group __radio" id="strGbn_div">
                    <input type="radio" name="strGbn" id="strGbn1" value="1" checked="checked">
						<label for="strGbn1">개인계좌</label>
					<input type="radio" name="strGbn" id="strGbn2" value="2">
						<label for="strGbn2">법인계좌</label>
					</div>
				  </div>
                  <div class="form-body">
                    <div class="form-area type-b">
                    <!-- 서비스구분 (1: 소유주 확인, 2: 예금주명 확인, 3: 계좌 유효성 확인) -->
					<input type="hidden" name="service" value="">
					<!-- 업무구분 (5: 소유주 확인, 2: 예금주명 확인, 4: 계좌 유효성 확인) -->
					<input type="hidden" name="svcGbn" value="">
                      <select name="businessAccountBank" id="businessAccountBank">
                        <option value="none">은행 선택</option>
                        <%-- <c:forEach var="bankInfo" items="${bankInfo}" step="1" varStatus="bankInfo">
							<option value="${bankInfo.current.CODE}">${bankInfo.current.CODE_TEXT}</option>
						</c:forEach> --%>
						<option value="002">산업은행</option>
						<option value="003">기업은행</option>
						<option value="004">국민은행</option>
						<option value="007">수협</option>
						<option value="011">농협</option>
						<option value="012">지역농축협</option>
						<option value="020">우리은행</option>
						<option value="023">SC제일은행</option>
						<option value="027">한국씨티은행</option>
						<option value="031">대구은행</option>
						<option value="032">부산은행</option>
						<option value="034">광주은행</option>
						<option value="035">제주은행</option>
						<option value="037">전북은행</option>
						<option value="039">경남은행</option>
						<option value="045">새마을금고</option>
						<option value="048">신협</option>
						<option value="050">저축은행</option>
						<option value="054">HSBC은행</option>
						<option value="055">도이치은행</option>
						<option value="057">JP모간체이스은행</option>
						<option value="060">BOA은행</option>
						<option value="061">BNP파리바은행</option>
						<option value="062">중국공상은행</option>
						<option value="064">산림조합</option>
						<option value="067">중국건설은행</option>
						<option value="071">우체국</option>
						<option value="081">하나은행</option>
						<option value="088">신한은행</option>
						<option value="089">케이뱅크</option>
						<option value="090">카카오뱅크</option>
						<option value="209">유안타증권</option>
						<option value="218">KB증권</option>
						<option value="227">KTB투자증권</option>
						<option value="238">미래에셋대우</option>
						<option value="240">삼성증권</option>
						<option value="243">한국투자증권</option>
						<option value="247">NH투자증권</option>
						<option value="261">교보증권</option>
						<option value="262">하이투자증권</option>
						<option value="263">현대차증권</option>
						<option value="264">키움증권</option>
						<option value="265">이베스트투자증권</option>
						<option value="266">SK증권</option>
						<option value="267">대신증권</option>
						<option value="269">한화투자증권</option>
						<option value="270">하나금융투자</option>
						<option value="278">신한금융투자</option>
						<option value="279">DB금융투자</option>
						<option value="280">유진투자증권</option>
						<option value="287">메리츠종합금융증권</option>
						<option value="288">카카오페이증권</option>
						<option value="290">부국증권</option>
						<option value="291">신영증권</option>
						<option value="292">케이프투자증권</option>
						<option value="294">펀드온라인코리아</option>
                      </select>
                      <input type="text" maxlength="20"  name="businessAccount" id="businessAccount" oninput="maxLengthCheck(this)" placeholder="계좌번호"> </div>
                    <div class="form-area type-b">
                    <input type="text" name="businessAccountName" id="businessAccountName" maxlength="20" oninput="maxLengthCheck(this)" placeholder="예금주명">
                    <button type="button" class="" id="accountUseCheck">계좌유효성 확인</button>
                    </div>
                  </div>
                </div>
                <div class="form-item">
                  <div class="form-head"><span class="form-name __required">신고 여부 </span></div>
                  <div class="form-body">
                    <div class="form-area type-c">
                      <div class="tit">통신판매업에 신고하셨습니까? <a href="javascript(0);" class="icon_question" id="doc_info"><span class="blind">통신판매 안내 팝업</span></a></div>
                      <div class="radio-group __radio" id="onlineMarketBizYN">
                        <input type="radio" id="radio01" name="onlineRadio" value="Y" ><label for="radio01">예</label>
                        <input type="radio" id="radio02" name="onlineRadio" value="N"  ><label for="radio02">아니오</label>
                      </div>
                    </div>
                    <!--통신판매 - 예 -->
                    <div class="form-area type-a">
                      <input type="text" name="onlineMarketBiz" id="onlineMarketBiz" style="display:none;" maxlength="20" oninput="maxLengthCheck(this)"  placeholder="통신판매 신고 번호 입력">
                    </div>
                    <!--통신판매 아니오-->
                    <div class="form-area type-a">
                      <select name="onlineMarketNotReason" id="onlineMarketNotReason" style="display:none;">
                        <option value="">미신고 사유 선택</option>
                        <option value="EXEMPTION">신고면제자</option>
                        <option value="READY">신고준비중</option>
                        <option value="etcReason">기타입력</option>
                      </select>
                      <br>
                      <input type="text" style="display:none;" maxlength="20" id="etcNotReason" oninput="maxLengthCheck(this)" placeholder="기타 사유를 적어주세요.">
                    </div>
                    <!--간이과세자 여부 선택-->
                  <div class="form-area type-c">
                    <div class="tit ">간이과세자 여부</div>
                    <div class="radio-group __radio" id="taxationDivision">
                      <input type="radio" id="radio03" name="taxRadio" value="Y" ><label for="radio03">간이 과세자</label>
                      <input type="radio" id="radio04" name="taxRadio" value="N" ><label for="radio04">일반 과세자(면세사업자 포함)</label>
                    </div>
                  </div>
				<div class="form-item">
                  <div class="form-head"><span class="form-name __required">필요서류 첨부 </span><a href="javascript(0);" class="icon_question" id="doc_info2"><span class="blind">통신판매 안내 팝업</span></a></div>
                  <div class="form-body">
                    <div class="form-area type-a" id="file_list_div">
                      <button type="button" class="icon_plus dragAndDropDiv" id="plus_files">파일 추가</button>
                      <br>
                      <input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
                       <div class="field" id="inputFileList">
                      </div>
                  </div>
                </div>
                <br>
				<hr>
				<br>
                  <div class="form-area type-c">
                    <div class="tit"><span class="form-name __required">개인정보 수집 및 이용(필수)</span></div>
                    <div class="radio-group __radio" id="AgreeUseUserInfo">
                     <div class="checkbox __checkbox" id="userInfo"><input type="checkbox" id="gpisServiceTerms"><label for="gpisServiceTerms">동의</label></div>
                    </div>
                  </div>
                </div>
                <br>
                <!-- 회원가입 버튼 -->
                <div class="form-btn-area type-b">
                  <button type="button" class="btn btn-black btn-previous" onclick="window.history.back()"><span>이전으로</span></button>
                  <button type="button" class="btn btn-red btn-seller"  onclick="AllCheck()"><span>Seller 신청</span></button></div>
                <!-- 회원가입 버튼 -->
              </form>
            </div>
          </div>

            <!--E : 회원가입 정보-->


          </div>
      </div>
    </main>
    <!--v팝업 -->
    <div class="layout-popup_wrap" id="layer_pop">
      <div class="popup_inwrap">
        <div class="popup-header">
          <h2>Seller 회원 제출서류 안내</h2>
        </div>
        <div class="popup-body">
          <p>서류 승인 심사가 완료 된 이후 Seller 가입이 최종 승인됩니다.</p>
          <div class="doc_box">
              <div class="doclist-box">
                <div class="stit">제출서류</div>
                <ul>
                  <li>사업자 등록증 사본</li>
                  <li>통신판매 신고증</li>
                  <li>대표자/법인 명의 통장사본</li>
               </ul>
             </div>
             <div class="doclist-box">
              <div class="stit">보내실곳</div>
              <ul>
                <li> FAX : 02-0000-0000</li>
                <li>스캔본 업로드</li>
              </ul>
            </div>
          </div>

          <p>서류 접수 후 24시간 이내 관리자
          확인을 거쳐 최종 승인됩니다.</p>
          <!-- <div class="agree-box">개인정보 수집 및 이용(필수)   <div class="checkbox __checkbox"><input type="checkbox" id="check03"><label for="check03">동의</label></div></div> -->
        </div>
        <div class="popup-close"><button type="button" class="btn-close icon_close" id="btn-close"><span class="blind">닫기</span></button></div>
      </div>
    </div>
    <!-- 팝업 -->
    <!-- E : body -->
    </div>
    <!-- E : wrap -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
    var chk = false;
    var chkReceiver = false;
    var onlineMarketBizYN = '';
    var taxationDivision = '';
    var accountUseCheck = false;
    var comInfo = '';
    var myPlatformRole = '';
    
	var $fileListArr = new Array();
	var $totSize = 0;
	var $keyNum = 0;
	var $limit = 0;
	
    const Toast = Swal.mixin({
        toast: true,
        position: 'center-center',
        showConfirmButton: false,
        timer: 1200,
        timerProgressBar: true,
        didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
        });
    
      $(document).ready(function() {
    	  
    	myPlatformRole = '${member.platformRole}';
    	  

        $('#doc_info').click(function() {
          $('#layer_pop').addClass('active');
          return false;
        });
        
        $('#doc_info2').click(function() {
            $('#layer_pop').addClass('active');
            return false;
          });

        $('#btn-close').click(function() {
          $('#layer_pop').removeClass('active');
          return false;
        });
        
        $("#receiverSame").click(function() {
	  		if ($('#sameReceiver').is(':checked')) {
	  				$('#sameReceiver').val("Y"); 
	  				chkReceiver = true;
	  		} else {
	  				$('#sameReceiver').val("N"); 
	  				chkReceiver = false;
	  		} 
        });
        
        $("#receiverSame2").click(function() {
	  		if ($('#sameReceiver2').is(':checked')) {
	  				$('#sameReceiver2').val("Y"); 
	  				chkReceiver = true;
	  		} else {
	  				$('#sameReceiver2').val("N"); 
	  				chkReceiver = false;
	  		} 
        });
        
        
        $("#callMyInfo").click(function() {
	  		if ($('#MyInfo').is(':checked')) {
	  				$('#MyInfo').val("Y"); 
	  				chk = true;
	  		} else {
	  				$('#MyInfo').val("N"); 
	  				chk = false;
	  		} 
        });
        
        $("#settlementType").click(function() {
	  		if ($("[id=settlementType] :selected").val() == 'ACCOUNT') {
	  			$('#settleAccountView').css("display", "block"); 
	  		} else {
	  			$('#settleAccountView').css("display", "none"); 
	  		} 
        });
        
        $("#onlineMarketNotReason").click(function() {
	  		if ($("[id=onlineMarketNotReason] :selected").val() == 'etcReason') {
	  			$('#etcNotReason').css("display", "block"); 
	  		} else {
	  			$('#etcNotReason').css("display", "none"); 
	  			$('#etcNotReason').val('');
	  		} 
        });
        
        $("#onlineMarketBizYN").click(function() {
	  		if ($('#radio01').is(':checked')) {
	  			onlineMarketBizYN = 'Y';
	  			$('#onlineMarketNotReason').css("display", "none"); 
	  			$('#onlineMarketNotReason').val('');
	  			$('#onlineMarketBiz').css("display", "block"); 
	  			$('#etcNotReason').css("display", "none"); 
	  			$('#etcNotReason').val('');
	  		} 
	  		else if($('#radio02').is(':checked')){
	  			onlineMarketBizYN = 'N';
	  			$('#onlineMarketBiz').css("display", "none");
	  			$('#onlineMarketNotReason').css("display", "block"); 
	  		} 
        });
        
        
        $("#taxationDivision").click(function() {
	  		if ($('#radio03').is(':checked')) {
	  			taxationDivision = 'SIMPLE';
	  		} 
	  		else if($('#radio04').is(':checked')){
	  			taxationDivision = 'NORMAL';
	  		} 
        });
        
        $("#accountUseCheck").click(function() {
        		//계좌 유효성 검사 로직 개발요망
        		//alert('완료되었습니다');
        		////console.log($('input[name=strGbn]').val());
        		
        		$.ajax({
		    	   url: '/checkAccount',
		    	   type : 'POST',
		    	   data : {
		    		   'service' : '3',
		    		   'svcGbn' : '4',
		    		   'strGbn' : $('input[name=strGbn]').val(),
		    		   'strBankCode' : $('#businessAccountBank').val(),
		    		   'strAccountNo' : $('#businessAccount').val(),
		    		   'inq_rsn' : '10' // 조회사유 설정 (10:회원가입 20:기존회원인증 30:성인인증 40:비회원확인 90:기타)	
		    	   },
		    	   success : function(result){
		    		   //console.log(result);
		    		   
		    		   if(result.resultCode == '0000'){
		    			   Swal.fire({
		  		             //title: '미선정 항목 재요청이 없습니다',
		  		             text: "입력한 계좌정보로 확정할까요?",
		  		             icon: 'info',
		  		             showCancelButton: true,
		  		             confirmButtonColor: '#3085d6',
		  		             cancelButtonColor: '#d33',
		  		             confirmButtonText: '확정',
		  		             cancelButtonText: '취소'
		  		     	}).then((result) => {
		  		     		
		  			         if (result.isConfirmed) {
		  		    		   	
		  			        	document.getElementById('businessAccount').readOnly = true;
		  			        	document.getElementById('businessAccountName').readOnly = true;
		  			        	document.getElementById('businessAccountBank').disabled = true;
		  			        	document.getElementById('strGbn1').disabled = true;
		  			        	document.getElementById('strGbn2').disabled = true;
		  			        	
		  		        		Toast.fire({
		  		     	           icon: 'success',
		  		     	           title: '완료되었습니다'
		  		     	      	});
		  		        		
		  		        		accountUseCheck = true;
		  			        	 
		  			         }else{
		  			        	 
		  			        	accountUseCheck = false;
		  			        	return false;
		  			        	 
		  			         }
		  		     	
		  		     	});
		    		   }else{
		    			   
		    			   Toast.fire({
	  		     	           icon: 'error',
	  		     	           title: '계좌정보가 올바르지 않습니다'
	  		     	      	});
		    			   accountUseCheck = false;
		    		   }
		    		   
		    	   },
		    	   fail: function(e){
		    	       //console.log("fail")
		    	   }
		    	 });// end ajax
			     	
        });
        
        
        
    	$("#callMyInfo").click(function() {
		  		
	  		  var u1 = '${userId}'; //security uid
			  var u2 = u1;
			  var enString = btoa(u2); //encoding
			  
			  if(u2 = ''){
				  //user 정보가 없는 채로 해당 페이지에 접근된 상태
				  //security 가 튕겨내지만 추가제어
				  Toast.fire({
	     	           icon: 'error',
	     	           title: '회원정보를 확인할 수 없습니다. 다시 로그인 해주시기 바랍니다.'
	     	      	});
				  window.location.href = '/index';
			  }
		  
		  
    		 $.ajax({
    		   	   url: '/buyer/getCompanyInfo?enString='+enString,
    		   	   type : 'GET',
    		   	   success : function(data){
    		   		
    		   		 comInfo = data;
    		   		 if(chk == true){
		   				 
	   		   		   	 $('#receiverEmail').val(data.receiverEmail);
	   		   		 	 $('#receiverName').val(data.receiverName);
	   		   			 $('#receiverTelNo').val(data.receiverTelNo.substring(3, data.receiverTelNo.length));
	   		   			 $('#telephoneReceiver').val(data.receiverTelNo.substring(0, 3));
	   		   			 $('#receiverCellNo').val(data.receiverCellNo.substring(3, data.receiverCellNo.length));
	   		   			 $('#cellphoneReceiver').val(data.receiverCellNo.substring(0, 3));
	   		   			 $('#zipCode').val(data.zipCode);
	   		   		     $('#address').val(data.address);
	   		   		 	 $('#addressDetail').val(data.addressDetail);
	   		   			 $('#areaName').val(data.areaName);
	   		   		     $('#businessType').val(data.businessType);
	   			     	 $('#industryType').val(data.industryType);
	   		             $('#sellerName').val(data.buyerName);
	   		             $('#irsNo').val(data.irsNo);
	   		             $('#ceoUserName').val(data.ceoUserName);
	   		             
	   		         	 if(data.telNo != null && data.telNo != '' && (data.telNo.substring(0,4) == '0505' || data.telNo.substring(0,4) == '0303' || data.telNo.substring(0,4) == '0504')){
			   		   		$('#representTel').val(data.telNo.substring(0, 4));
			   		   		$('#representTelNo').val(data.telNo.substring(4, data.telNo.length));
			   		   	 }
		   		   		 else if(data.telNo != null && data.telNo != '' && (data.telNo.substring(0,2) == '02')){
		   		   			$('#representTel').val(data.telNo.substring(0, 2));
		   		   			$('#representTelNo').val(data.telNo.substring(2, data.telNo.length));
		   		   		 }else if(data.telNo != null && data.telNo != '' && (data.telNo.substring(0,2) != '02')){
		  		   			$('#representTel').val(data.telNo.substring(0, 3));
		  		   			$('#representTelNo').val(data.telNo.substring(3, data.telNo.length));
			   		   	 }else{
				   		   	$('#representTel').val('');
		  		   			$('#representTelNo').val('');
				   		 }
		   		   		 
			   		   	if(data.faxNo != null && data.faxNo != '' && (data.faxNo.substring(0,4) == '0505' || data.faxNo.substring(0,4) == '0303' || data.faxNo.substring(0,4) == '0504')){
			   		   		$('#receiverFax').val(data.faxNo.substring(0, 4));
			   		   		$('#receiverFaxNo').val(data.faxNo.substring(4, data.faxNo.length));
			   		   	 }else if(data.faxNo != null && data.faxNo != '' && (data.faxNo.substring(0,2) == '02')){
		   		   			$('#receiverFax').val(data.faxNo.substring(0, 2));
		   		   			$('#receiverFaxNo').val(data.faxNo.substring(2, data.faxNo.length));
		   		   		 }else if(data.faxNo != null && data.faxNo != '' && (data.faxNo.substring(0,2) != '02')){
		  		   			$('#receiverFax').val(data.faxNo.substring(0, 3));
		  		   			$('#receiverFaxNo').val(data.faxNo.substring(3, data.faxNo.length));
			   		   	 }else{
			   		   		$('#receiverFax').val('');
	  		   				$('#receiverFaxNo').val('');
			   		   	 }
   	   			 	
   	   				 }else{
   	   			  
	   		   			  $('#receiverEmail').val('');
	   		   			  $('#receiverName').val('');
	   		   			  $('#receiverTelNo').val('');
	   		   			  $('#telephoneReceiver').val('');
	   		   			  $('#receiverCellNo').val('');
	   		   			  $('#cellphoneReceiver').val('010');
	   		   			  $('#representFaxNo').val('');
 		   			      $('#representFax').val('');
	   		   		 	  $('#receiverFaxNo').val('');
	   		   			  $('#receiverFax').val('');
		   		   		  $('#zipCode').val('');
		   		   		  $('#address').val('');
		   		   	  	  $('#addressDetail').val('');
		   		   	 	  $('#areaName').val('');
		   		   		  $('#businessType').val('');
		   			      $('#industryType').val('');
		   		          $('#sellerName').val('');
		   		          $('#irsNo').val('');
		   		     	  $('#ceoUserName').val('');
	   	   			 	
   	   		 	 }
    		   	   },
    		   	   fail: function(exception){
    		   	       //console.log("fail");
    		   	   }
    		   	 });// end ajax
    		   	 
	  	});
    	
    	$("#receiverSame").click(function() {
	  		
  		   if(chkReceiver == true){
		   		 
	   			   	 $('#settlementEmail').val($('#receiverEmail').val());
	   			 	 $('#settlementName').val($('#receiverName').val());
	   				 $('#settlementTel').val($('#telephoneReceiver').val());
	   				 $('#settlementTelNo').val($('#receiverTelNo').val());
	   				 $('#settlementFax').val($('#receiverFax').val());
	   				 $('#settlementFaxNo').val($('#receiverFaxNo').val());
 	   		
 	   		 }else{
 	   	 
	   			   	 $('#settlementEmail').val('');
	   			 	 $('#settlementName').val('');
	   				 $('#settlementTel').val('');
	   				 $('#settlementTelNo').val('');
	   				 $('#settlementFax').val('');
	   				 $('#settlementFaxNo').val('');
 	   		}
	  	});
    	
    	$("#receiverSame2").click(function() {
	  		
   		   if(chkReceiver == true){
 		   		 
 	   			   	 $('#managerEmail').val($('#receiverEmail').val());
 	   			 	 $('#managerName').val($('#receiverName').val());
 	   				 $('#managerTel').val($('#telephoneReceiver').val());
 	   				 $('#managerTelNo').val($('#receiverTelNo').val());
 	   				 $('#managerFax').val($('#receiverFax').val());
 	   				 $('#managerFaxNo').val($('#receiverFaxNo').val());
  	   		
  	   		 }else{
  	   	 
 	   			   	 $('#managerEmail').val('');
 	   			 	 $('#managerName').val('');
 	   				 $('#managerTel').val('');
 	   				 $('#managerTelNo').val('');
 	   				 $('#managerFax').val('');
 	   				 $('#managerFaxNo').val('');
  	   		}
 	  	});
      });

      function maxLengthCheck(object){
          if (object.value.length > object.maxLength){
            object.value = object.value.slice(0, object.maxLength);
          }    
      }
      
      //사업자번호 정규식
      function checkCorporateRegistrationNumber(value) {
          var valueMap = value.replace(/-/gi, '').split('').map(function(item) {
              return parseInt(item, 10);
          });

          if (valueMap.length === 10) {
              var multiply = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5);
              var checkSum = 0;

              for (var i = 0; i < multiply.length; ++i) {
                  checkSum += multiply[i] * valueMap[i];
              }

              checkSum += parseInt((multiply[8] * valueMap[8]) / 10, 10);
              return Math.floor(valueMap[9]) === (10 - (checkSum % 10));
          }

          return false;
      }
      
      function AllCheck(){
    	  		
	    	  var u1 = '${userId}'; //security uid
			  var u2 = u1;
			  var enString = btoa(u2); //encoding
			  
			  if(u2 = ''){
				  //user 정보가 없는 채로 해당 페이지에 접근된 상태
				  //security 가 튕겨내지만 추가제어
				  Toast.fire({
	     	           icon: 'error',
	     	           title: '회원정보를 확인할 수 없습니다. 다시 로그인 해주시기 바랍니다.'
	     	      	});
				  window.location.href = '/index';
			  }
			  
	    	  var data = '';
	    	  var tempData = '';
	    	  $.each( $('#sellerForm').serializeArray(), function(key, val){
	    		  if((val['name'] == 'returnLogistics' || val['name'] == 'returnCharge' || val['name'] == 'exchangeCharge' 
	    			  || val['name'] == 'asPartTel' || val['name'] == 'asPartTelNo' || val['name'] == 'returnZipCode' 
	    			  || val['name'] == 'returnAddress1' || val['name'] == 'returnAddress2')){
		    		 tempData += ',"'+val['name']+'":"'+val['value']+'"';
		    		 //console.log('tempdata = ' + val['name']+'":"'+val['value']);
	    		  }else{
	    	  		 data += ',"'+val['name']+'":"'+val['value']+'"';
		    	  	 //console.log('data = ' + val['name']+'":"'+val['value']);
	    		  }
	    		  
	    	  });
	    	  data = '{'+ data.substr(1) +'}';
	    	  tempData = '{'+ tempData.substr(1) +'}';
	    	  var sellerData = JSON.parse(data);
	    	  var templateData = JSON.parse(tempData);
	    	  sellerData.addUserId = enString;
	    	  sellerData.customerTelNo = $('#customerTel').val()+''+ $('#customerTelNo').val();
	    	  sellerData.receiverTelNo = $('#telephoneReceiver').val()+''+ $('#receiverTelNo').val();
	    	  sellerData.receiverCellNo = $('#cellphoneReceiver').val()+''+ $('#receiverCellNo').val();
	    	  sellerData.receiverFaxNo = $('#receiverFax').val()+''+ $('#receiverFaxNo').val();
	    	  sellerData.telNo = $('#representTel').val()+''+ $('#representTelNo').val();
		      sellerData.faxNo = $('#representFax').val()+''+ $('#representFaxNo').val();
	    	  sellerData.settlementTelNo = $('#settlementTel').val()+''+ $('#settlementTelNo').val();
	    	  sellerData.settlementFaxNo = $('#settlementFax').val()+''+ $('#settlementFaxNo').val();
	    	  sellerData.managerTelNo = $('#managerTel').val()+''+ $('#managerTelNo').val();
	    	  sellerData.managerFaxNo = $('#managerFax').val()+''+ $('#managerFaxNo').val();
	    	  sellerData.sellerName = $('#sellerName').val();
	    	  templateData.asPartTelNo = $('#asPartTel').val()+''+ $('#asPartTelNo').val();
     		  templateData.addUserId = enString;
       		  templateData.managerName = sellerData.managerName;
       		  templateData.irsNo = sellerData.irsNo;
       		  
       		  ///var jsonTemp = JSON.stringify(templateData);
	    	  //console.log('temp  = ' + JSON.stringify(templateData));
	    	  
	    	  //#############################Seller 정보##########################################
	    	//name Check
	    	var name = sellerData.sellerName;
	    	if(name.length < 2){
	    	 	Toast.fire({
	     	           icon: 'error',
	     	           title: '올바른 사업자명을 입력해주세요'
	     	      	});
	    	 	document.getElementById('sellerName').focus();
	    	  	return;
	    	 }
	    	
	    	
	    	//사업자 확인 api 추가시 정규식으로 체크로직 완료할 것
	    	if(sellerData.irsNo.length != 10){
	    		  Toast.fire({
	     	           icon: 'error',
	     	           title: '올바른 사업자 번호를 입력해주세요'
	     	      	});
	    		  document.getElementById('irsNo').focus();
	    		  return;
	    	}
	    	
	    	var name = sellerData.ceoUserName;
	    	if(name.length < 2){
	    	   	 Toast.fire({
	     	           icon: 'error',
	     	           title: '올바른 대표자 이름을 입력해주세요'
	     	      	});
	    	   	 document.getElementById('ceoUserName').focus();
	    	   	 return;
	    	 }
	    	
	    	  
		       //일반 전화
		       var regExp = /^\d{3}-?\d{3,4}-?\d{4}$/;
		       var patternPhone = /01[016789][^0][0-9]{2,3}[0-9]{3,4}/;
		       if(!regExp.test(sellerData.telNo))
		       {
		    	   if(!patternPhone.test(sellerData.telNo))
			      {
			          Toast.fire({
		     	           icon: 'error',
		     	           title: '대표 전화번호를 확인 해주세요'
		     	      	});
			          document.getElementById('representTelNo').focus();
			          return;
			      }
		       }
	    	  
		       //팩스
		       var regExp = /[\+? *[1-9]+]?[0-9 ]+/;
		       if(sellerData.faxNo != '' && sellerData.faxNo != null){
			       if(!regExp.test(sellerData.faxNo))
			       {
				      Toast.fire({
		     	           icon: 'error',
		     	           title: '대표 팩스번호를 확인 해주세요'
		     	      	});
				      document.getElementById('representFaxNo').focus();
				      return;
			       }
		       }
		       
	    	  //adress check
	    	  if(sellerData.zipCode.length < 1 || sellerData.address == '' || sellerData.addressDetail == ''){
		    	  Toast.fire({
	    	           icon: 'error',
	    	           title: '주소를 정확히 입력해주세요'
	    	      	});
	    	     document.getElementById('addressDetail').focus();
	    	     return;         
	    	  }
	    	  
	    	  
	    	  if(sellerData.businessType.lenth < 1 || sellerData.businessType == ''){
			    	Toast.fire({
		   	           icon: 'error',
		   	           title: '업태를 정확히 입력해주세요'
		   	      	});
	    	 	  document.getElementById('businessType').focus();
	    	  	  return;         
	    	  }
	    	  
	    	  if(sellerData.industryType.lenth < 1 || sellerData.industryType == ''){
	    	  Toast.fire({
	   	           icon: 'error',
	   	           title: '업종을 정확히 입력해주세요'
	   	      	});
	    	  	  document.getElementById('industryType').focus();
	    	     return;         
	    	  }
	    	  
	    	 //일반 전화
	    	  var regExp = /^\d{3}-?\d{3,4}-?\d{4}$/;
	    	  var patternPhone = /01[016789][^0][0-9]{2,3}[0-9]{3,4}/;
	    	  if(sellerData.customerTelNo != '' && sellerData.customerTelNo != 'none' && !regExp.test(sellerData.customerTelNo))
	    	  {
	    	   if(!patternPhone.test(sellerData.customerTelNo))
		          {
		              Toast.fire({
			   	           icon: 'error',
			   	           title: '고객응대 전화번호를 확인 해주세요'
			   	      	});
		              document.getElementById('customerTelNo').focus();
		              return;
		          }
	    	  }
	    	  
	    	  //#####################세금계산서 정보 ######################################
		    	var name = sellerData.receiverName;
		    	if(name.length < 2){
		    	 	   Toast.fire({
			   	           icon: 'error',
			   	           title: '세금계산서 수신자 명을 확인 해주세요'
			   	      	});
		    	 	document.getElementById('receiverName').focus();
		    	  	return;
		    	 }
		    	
		      //phone Check
		      var patternPhone = /01[016789][^0][0-9]{2,3}[0-9]{3,4}/;
		       if(!patternPhone.test(sellerData.receiverCellNo))
		       {
		           Toast.fire({
		   	           icon: 'error',
		   	           title: '세금계산서 수신자 휴대폰번호를 확인 해주세요'
		   	      	});
		           document.getElementById('receiverCellNo').focus();
		           return;
		       }
		       //일반 전화
		       var regExp = /^\d{3}-?\d{3,4}-?\d{4}$/;
		       var patternPhone = /01[016789][^0][0-9]{2,3}[0-9]{3,4}/;
		       if(!regExp.test(sellerData.receiverTelNo))
		       {
		    	   if(!patternPhone.test(sellerData.receiverTelNo))
			      {
		    		  Toast.fire({
			   	           icon: 'error',
			   	           title: '세금계산서 수신자 전화번호를 확인 해주세요'
			   	      	});
			          document.getElementById('receiverTelNo').focus();
			          return;
			      }
		       }
	    	  
	    	  //mail Check
	    	  var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	    	  if(!reg_email.test(sellerData.receiverEmail)) {
	    	 	  Toast.fire({
		   	           icon: 'error',
		   	           title: '세금계산서 수신자 이메일 주소를 정확히 입력해주세요'
		   	      	});
	    	 	  document.getElementById('receiverEmail').focus();
	    	 	  return;         
	    	  }     
		       //팩스
		       var regExp = /[\+? *[1-9]+]?[0-9 ]+/;
		       if(sellerData.receiverFaxNo != '' && sellerData.receiverFaxNo != null){
			       if(!regExp.test(sellerData.receiverFaxNo))
			       {
				      Toast.fire({
			   	           icon: 'error',
			   	           title: '세금계산서 수신자 팩스번호를 확인 해주세요'
			   	      	});
				      document.getElementById('faxNo').focus();
				      return;
			       }
		       }
		       
		       
		       //###########################정산 담당자 정보####################################
		       
		    	var name = sellerData.settlementName;
		    	if(name.length < 2){
		    	 	Toast.fire({
			   	           icon: 'error',
			   	           title: '정산담당자 이름을 확인 해주세요'
			   	      	});
		    	 	document.getElementById('settlementName').focus();
		    	  	return;
		    	 }
		    	
		    	
		       //일반 전화
		       var regExp = /^\d{3}-?\d{3,4}-?\d{4}$/;
		       if(!regExp.test(sellerData.settlementTelNo))
		       {
		    	   if(!patternPhone.test(sellerData.settlementTelNo))
			      {
			          Toast.fire({
			   	           icon: 'error',
			   	           title: '정산담당자 전화번호를 확인 해주세요'
			   	      	});
			          document.getElementById('settlementTelNo').focus();
			          return;
			      }
		       }
	    	  
	    	  //mail Check
	    	  var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	    	  if(!reg_email.test(sellerData.settlementEmail)) {
	    	 	 Toast.fire({
		   	           icon: 'error',
		   	           title: '정산담당자 이메일 주소를 정확히 입력해주세요'
		   	      	});
	    	 	  document.getElementById('settlementEmail').focus();
	    	 	  return;         
	    	  }     
		       //팩스
		       var regExp = /[\+? *[1-9]+]?[0-9 ]+/;
		       if(sellerData.settlementFaxNo != '' && sellerData.settlementFaxNo != null){
			       if(!regExp.test(sellerData.settlementFaxNo))
			       {
				      Toast.fire({
			   	           icon: 'error',
			   	           title: '정산담당자 팩스번호를 확인 해주세요'
			   	      	});
				      document.getElementById('settlementFaxNo').focus();
				      return;
			       }
		       }

		       
		       //###########################담당자 정보####################################
		       
		    	var name = sellerData.managerName;
		    	if(name.length < 2){
		    	 	Toast.fire({
			   	           icon: 'error',
			   	           title: '담당자 이름을 확인 해주세요'
			   	      	});
		    	 	document.getElementById('managerName').focus();
		    	  	return;
		    	 }
		    	
		    	
		       //일반 전화
		       var regExp = /^\d{3}-?\d{3,4}-?\d{4}$/;
		       if(!regExp.test(sellerData.managerTelNo))
		       {
		    	   if(!patternPhone.test(sellerData.managerTelNo))
			      {
			          Toast.fire({
			   	           icon: 'error',
			   	           title: '담당자 전화번호를 확인 해주세요'
			   	      	});
			          document.getElementById('managerTelNo').focus();
			          return;
			      }
		       }
	    	  
	    	  //mail Check
	    	  var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	    	  if(!reg_email.test(sellerData.managerEmail)) {
	    	 	 Toast.fire({
		   	           icon: 'error',
		   	           title: '담당자 이메일 주소를 정확히 입력해주세요'
		   	      	});
	    	 	  document.getElementById('managerEmail').focus();
	    	 	  return;         
	    	  }     
		       //팩스
		       var regExp = /[\+? *[1-9]+]?[0-9 ]+/;
		       if(sellerData.managerFaxNo != '' && sellerData.managerFaxNo != null){
			       if(!regExp.test(sellerData.managerFaxNo))
			       {
				      Toast.fire({
			   	           icon: 'error',
			   	           title: '담당자 팩스번호를 확인 해주세요'
			   	      	});
				      document.getElementById('managerFaxNo').focus();
				      return;
			       }
		       }
		     //#############################반품/교환지 체크########################################## 
		     
		       var name = templateData.returnLogistics;
		    	if(name == 'none' || name == ''){
		    	   	 Toast.fire({
			   	           icon: 'error',
			   	           title: '올바른 반품/교환사를 선택 해주세요'
			   	      	});
		    	   	 document.getElementById('returnLogistics').focus();
		    	   	 return;
		    	 }
		    	
		    	
		    	
		       var name = templateData.returnCharge;
		    	if(name == '' || name == '0' ){
		    		
		    		 Swal.fire({
			                title: '반품배송비(편도)를 입력하지 않으셨습니다',
			                text: "무료로 설정하시겠습니까?",
			                icon: 'question',
			                showCancelButton: true,
			                confirmButtonColor: '#3085d6',
			                cancelButtonColor: '#d33',
			                confirmButtonText: '저장',
			                cancelButtonText: '취소'
			            }).then((result) => {
			                if (result.isConfirmed) {
			                	document.getElementById('returnCharge').val('0');
			                	Swal.fire({
     		                        text:'설정이 완료되었습니다.',
     		                        //'계속 진행해주세요',
     		                        icon: 'success'
     		    		   		});
			                }else{
			                	document.getElementById('returnCharge').focus();
			                	return;
			                }
			            });
		    		 
		    	 }
		    	
			       var name = templateData.exchangeCharge;
			    	if(name == '' || name == '0' ){
			    		 /* var conStr = '교환배송비(왕복)을 입력하지 않으셨습니다. 무료로 설정하시겠습니까?';
			    	   	 if(confirm(conStr) == true){
			    	   		 document.getElementById('exchangeCharge').val('0');
			    	   	 }else{
			    	   		 document.getElementById('exchangeCharge').focus();
				    	   	 return;
			    	   	 } */
			    	   	 
			    	   	Swal.fire({
			                title: '교환배송비(왕복)을 입력하지 않으셨습니다',
			                text: "무료로 설정하시겠습니까?",
			                icon: 'question',
			                showCancelButton: true,
			                confirmButtonColor: '#3085d6',
			                cancelButtonColor: '#d33',
			                confirmButtonText: '저장',
			                cancelButtonText: '취소'
			            }).then((result) => {
			                if (result.isConfirmed) {
			                	document.getElementById('exchangeCharge').val('0');
			                	Swal.fire({
     		                        text:'설정이 완료되었습니다.',
     		                        //'계속 진행해주세요',
     		                        icon: 'success'
     		    		   		});
			                }else{
			                	 document.getElementById('exchangeCharge').focus();
			                	return;
			                }
			            });
			    	 }
		    	
		    	  
			       //일반 전화
			       var regExp = /^\d{3}-?\d{3,4}-?\d{4}$/;
			       var patternPhone = /01[016789][^0][0-9]{2,3}[0-9]{3,4}/;
			       if(!regExp.test(templateData.asPartTelNo))
			       {
			    	   if(!patternPhone.test(templateData.asPartTelNo))
				      {
				          Toast.fire({
				   	           icon: 'error',
				   	           title: 'A/S 책임자 관련 전화번호를 확인 해주세요'
				   	      	});
				          document.getElementById('asPartTelNo').focus();
				          return;
				      }
			       }
			       
		    	  //adress check
		    	  if(templateData.returnZipCode.length < 1 || templateData.returnAddress1 == '' || templateData.returnAddress2 == ''){
		    	  Toast.fire({
		   	           icon: 'error',
		   	           title: '주소를 정확히 입력해주세요'
		   	      	});
		    	     document.getElementById('returnAddress2').focus();
		    	     return;         
		    	  }
	    	
	    	//#############################계좌 체크########################################## 
	    	 if(sellerData.settlementType == null || sellerData.settlementType == 'none'){
		    	 Toast.fire({
		   	           icon: 'error',
		   	           title: '정산대금 수신방법을 성정하지 않으셨습니다'
		   	      	});
		    	 document.getElementById('settlementType').focus(); 
		    	 return;
	    	 }
	    	
	    	  if(sellerData.businessAccountBank == '' || sellerData.businessAccount == '' || sellerData.businessAccountName ==''){
	    		  Toast.fire({
		   	           icon: 'error',
		   	           title: '계좌정보를 올바르게 입력하지 않으셨습니다'
		   	      	});
	    		  document.getElementById('businessAccount').focus(); 
	    		  return;
	    	  }
	    	  
	    	  if(accountUseCheck){
	    		  sellerData.businessAccountcheck = 'Y';
	    		  sellerData.businessAccount = $('#businessAccount').val();
	    		  sellerData.businessAccountBank = $('#businessAccountBank').val();
	    		  sellerData.businessAccountName = $('#businessAccountName').val();
	    	  }else{
	    		  Toast.fire({
		   	           icon: 'error',
		   	           title: '계좌 유효성 확인을 하지 않으셨습니다'
		   	      	});
	    		  document.getElementById('accountUseCheck').focus(); 
	    		  return;
	    	  }
	    	  
	    	  //#############################통신판매업 신고 여부###################################
	    	  if(sellerData.onlineRadio != '' || sellerData.onlineRadio != null ){
	    	 	  sellerData.onlineMarketBizYn = sellerData.onlineRadio;
	    	  }else if(sellerData.onlineRadio == '' || sellerData.onlineRadio == null ){
	    		  Toast.fire({
		   	           icon: 'error',
		   	           title: '통신판매업 신고 내용을 작성하지 않으셨습니다'
		   	      	});
	    		  document.getElementById('onlineMarketBizYN').focus();  
	    		  return;
	    	  }
	    	  if($('#onlineMarketNotReason').val() != '' || $('#onlineMarketNotReason').val() != null ){
	    		  sellerData.onlineMarketNotReason = $('#onlineMarketNotReason').val();
	    	  }
	    	  
	    	  if(sellerData.onlineMarketNotReason == 'etcReason'){
	    		  sellerData.onlineMarketNotReason = $('#etcNotReason').val();
	    	  }
	    	  if($('#onlineMarketBiz').val() != '' || $('#onlineMarketBiz').val() != null ){
	    		  sellerData.onlineMarketBiz = $('#onlineMarketBiz').val();
	    	  }else if(sellerData.onlineMarketNotReason == '' || sellerData.onlineMarketNotReason == null ||  $('#onlineMarketBiz').val() == '' || $('#onlineMarketBiz').val() == null ){
	    		  Toast.fire({
		   	           icon: 'error',
		   	           title: '통신판매업 신고 내용을 작성하지 않으셨습니다'
		   	      	});
	    		  document.getElementById('onlineMarketBizYN').focus(); 
	    		  return;
	    	  }
	    	  
	    	  //#############################간이과세 여부#########################################
	    	  if(taxationDivision != '' || taxationDivision != null){
	    		  sellerData.taxationDivision = taxationDivision;
	    	  }else{
	    		  Toast.fire({
		   	           icon: 'error',
		   	           title: '간이 과세자 여부를 선택하지 않으셨습니다'
		   	      	});
	    		  document.getElementById('taxationDivision').focus(); 
	    		  return;
	    	  }
	    	  
	    	  
	    	  //#############################개인정보 수집 및 이용 동의###############################
	    	  if ($('#gpisServiceTerms').is(':checked')) {
	  			  sellerData.gpisServiceTerms = 'Y';
		  	  }else{
		  		  Toast.fire({
		   	           icon: 'error',
		   	           title: '개인정보 수집 및 이용에 동의하지 않으셨습니다'
		   	      	});
		  		  document.getElementById('gpisServiceTerms').focus();
		  		  return;
		  	  }
	    	  
	    	  
	    	  //return;
	    	  $.ajax({
	       	   url: '/seller/doSellerSignUp',
	       	   type : 'POST',
	       	   data :  sellerData,
	       	   success : function(result){
		       		 $.ajax({
		  	       	   url: '/seller/updateSellerCode',
		  	       	   type : 'POST',
		  	       	   data : JSON.stringify(templateData),
			       	   dataType : 'json',
			       	   contentType : 'application/json; charset=UTF-8',
		  	       	    success : function(result){
		  	       	    	if(result.result == '성공'){
		  	       	    		imageUploadAjax(result.sellerCode);
		  	       	    	}else{
		  	       	    		
		  	       	    		Toast.fire({
	    	 	       	           icon: 'error',
	    	 	       	           title: '등록에 실패 했습니다'
	    	 	       	      	});
	    	  					return false;
		  	       	    	}
		  	       	   		
		  	       	    },
			       	    fail: function(e){
			       		   
			       	        //console.log("fail");
			       	    },
			       	    error:function(request, status, error){
			       		   
			           		alert(request+', ' + error +  ', ' + status);
			    	    }
			      	  });// end ajax
	       	   },
	       	   fail: function(e){
	       	        //console.log("fail");
	       	   },
	       	   error:function(request, status, error){
	       			Toast.fire({
			   	           icon: 'error',
			   	           title: '이미 신청되어 있거나, 기업회원 신청 계정으로 진행하지 않으셨습니다'
			   	      	});
	       			
	    	       	}
	      	  });// end ajax
	    	  
    	  
      }
      
      window.onload = function (){
    	  
    	  //console.log(myPlatformRole);

          if(myPlatformRole == 'B'){
        	  document.getElementById('irsNo').readOnly = true;
        	  $('#MyInfo').prop('checked', true);
       		  $('#callMyInfo').trigger('click');
          }
          
    	    document.getElementById("addressOn").addEventListener("click", function(){ //주소입력칸을 클릭하면
      	        //카카오 지도 발생
      	        new daum.Postcode({
      	            oncomplete: function(data) { //선택시 입력값 세팅
      	            	//console.log(data);
      	            	$('#zipCode').val(data.zonecode);
      	                $('#address').val(data.address); // 주소 넣기
      	                $('#areaName').val(data.sido +' '+ data.sigungu); 
      	                document.querySelector("input[name=addressDetail]").focus(); //상세입력 포커싱
      	            }
      	        }).open();
      	    });
      	    
      	    document.getElementById("addressOn2").addEventListener("click", function(){ //주소입력칸을 클릭하면
      	        //카카오 지도 발생
      	        new daum.Postcode({
      	            oncomplete: function(data) { //선택시 입력값 세팅
      	            	//console.log(data);
      	            	$('#returnZipCode').val(data.zonecode);
      	                $('#returnAddress1').val(data.address); // 주소 넣기
      	                document.querySelector("input[name=returnAddress2]").focus(); //상세입력 포커싱
      	            }
      	        }).open();
      	    });
      	    
    		var objDragAndDrop = $(".dragAndDropDiv");
    		
            objDragAndDrop.on('click',function (e){
            	//objDragAndDrop.unbind("click");
                $('input[id=fileUpload]').trigger('click');
            });
            
            $('input[id=fileUpload]').off("change").on('change', function(e) {
                var files = e.originalEvent.target.files;
                handleFileUpload(files,objDragAndDrop);
            });
            
            function handleFileUpload(files,obj)
            {
            	
            	var fileArr = new Array();
            	fileArr = $fileListArr;
            	$limit = $totSize;
            	
            	for(var i = 0 ; i < files.length ; i++){
            		$limit = $limit + files[i].size;
            		if($limit > 20000000){
            			Toast.fire({
               	           icon: 'error',
               	           title: '첨부파일 용량은 20MB를 넘길수 없습니다'
               	      	});
            			return false;
            		}
            	}
            	
            	for(var i = 0 ; i < files.length ; i++){
            		 var html = "<input class='input' style='text-align:center;' type='text' id='file"+ $keyNum + "' name='" + files[i].name +"'  value='" + files[i].name +"' data-size='" + Math.floor(files[i].size / 1000) + "' readonly>";
            		 html += "&nbsp;<button name='" + files[i].name +"' class='deleteFile'>삭제</button>";
            		 $('#inputFileList').append(html);
    	       		 $keyNum++;
    	       		 fileArr.push(files[i]);
    	       		 $totSize = $totSize + files[i].size;
          		}
           	
    	       	$fileListArr = new Array();
    	       	$fileListArr = fileArr;
    	       	$('#totSize').text("");
    	       	$('#totSize').text(Math.floor($totSize / 1000000));
           	
            }
            
            $(document).on("click" , '.deleteFile', function(){
            	//삭제할 파일의 아이디
            	var name = "input[name='"+$(this).attr('name')+"']";
            	var DeleteID = $(this).closest('div').find(name).attr('id');
            	/* //console.log(name);
            	//console.log(DeleteID); */
            	//삭제하려는 파일의 크기값(텍스트)
            	var DeleteFileSize = $(this).closest('div').find(name).data("size");

            	//삭제하는 파일의 크기값(바이트)
            	var fileSize = Number(DeleteFileSize) * 1000;

            	/* //console.log(name);
            	//console.log(DeleteID);
            	//console.log(DeleteFileSize);
            	//console.log(fileSize); */
            	/* 
    	    	//console.log(fileArr);
    	       	//console.log($fileListArr); */
    	       	
            	//배열에서 삭제를 위한 번호
            	var DeleteArrNum = DeleteID.substring(DeleteID.length , DeleteID.length -1);
            	
            	var fileArr = $fileListArr;
            	fileArr.splice(DeleteArrNum , 1);
            	$keyNum = 0;
            	$fileListArr = new Array();
            	$('#inputFileList').children().remove();
            	$totSize = 0;
            	
	
            	//console.log(fileArr);
            	
            	for(var i = 0 ; i < fileArr.length ; i++){
            		var html = "<input class='p-input sizeMeidem' style='text-align:center;width:90%;' type='text' id='file"+ $keyNum + "' name='" + fileArr[i].name +"'  value='" + fileArr[i].name +"' data-size='" + Math.floor(fileArr[i].size / 1000) + "' readonly>";
	   	       		 html += " <button name='" + fileArr[i].name +"' class='deleteFile'>삭제</button>";
	           		 $('#inputFileList').append(html);
	   	       		 $keyNum++;
	   	       		 $totSize = $totSize + fileArr[i].size;
            	}

            	$fileListArr = new Array();
    	       	$fileListArr = fileArr;
            	$limit = $totSize;
            	$('#totSize').text("");
            	$('#totSize').text(Math.floor($totSize / 1000000));
				//console.log($fileListArr);
            });
      }

      
      function checkbussiness(){
    	  
    	  var irsNo = $('#irsNo').val();	//사업자번호
    	  
    	  //name Check
    	  if(irsNo.length != 10){
       	  	  Toast.fire({
               icon: 'error',
               title: '올바른 사업자 번호를 입력해주세요.'
          	  });
      	   	  document.getElementById('irsNo').focus();
      	   	  return;
           }
    	  	
          var paramList = {
    	    		'irsNo' : irsNo
    	    	   };
          
     		$.ajax({
    	    	   url: '/buyer/checkBussiness',
    	    	   type : 'POST',
    	    	   cache : false,
    	    	   data : paramList,
    	    	   success : function(result){
    	    		   
    	    		   if(result.RETURN_CODE == '01'){
    	    			   Toast.fire({
    	    		           icon: 'success',
    	    		           title: '조회에 성공했습니다'
    	    		      	  });
    	    			   $('#sellerName').val(result.RETURN_COMPNAME);
    		    		   $('#ceoUserName').val(result.RETURN_REPNAME);
    	    		   }else{
    	    			   Toast.fire({
    	    		           icon: 'error',
    	    		           title: '올바른 사업자 번호를 입력해주세요'
    	    		      	  });
    	    			   document.getElementById('irsNo').focus();
    	    		  	   return;
    	    		   }
    	    		   
    	    	   },
    	    	   fail:function(e){
    	    	        //console.log("fail");
    	    	   },
    	    	   error:function(request, status, error){
    	        		alert(error);
    	 	       }
     		  
     		});
     		
      }
      
	  	function imageUploadAjax (data){
	  		
	  		////console.log(data.estiAll);
	  		
			var formData = new FormData();
			
			for(var i = 0; i < $fileListArr.length ; i++){
				formData.append("uploadFile" , $fileListArr[i]);
			}
			
			var sellerData = {};
			
			sellerData['SELLER_DATA'] = {};
			sellerData['SELLER_DATA']['sellerCode'] = data;
			
			formData.append('param' ,	JSON.stringify( sellerData ) );
			
			////console.log(formData);
			////console.log(estiData);
			
			$.ajax({
	  			url : '/util/uploadSellerFile',
	  			type: "POST",
	  			enctype: 'multipart/form-data',	// 필수
	  			data: formData,
	  			processData: false,	// 필수
	  			contentType: false,	// 필수
	  			cache: false,
	  			success: function (result)
	  			{
	  				if( result =="SUCCESS" )
	  				{
	  					//alert("등록에 성공 했습니다");
	  					window.location.href='/seller/joinSellerEnd';
	  					//document.location.reload();
	  				}
	  				else
	  				{	
	  					Toast.fire({
	 	       	           icon: 'error',
	 	       	           title: '등록에 실패 했습니다'
	 	       	      	});
	  					return;
	  				}
	  			},
	  			error: function (e) {
	  			}
	  		});
	  	}
      
    </script>
  </body>
  </html>
