<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
<style>

	.success_color	
	{
		color : red !important;
	}

</style>

<div class="buyer_lnb">
  <!--구매자 or 판매자 -->
  <div class="division_area">
    <ul>
      <li class="on"> <a href="/buyer/index" class="buyer">구매자</a> </li>
      <li> <a href="/seller/index" class="seller">판매자</a> </li>
    </ul>
  </div>
          <!--구매자 or 판매자 //-->

          <ul class="buyer_menu">

            <li class="depth1 __m_estimate">
              <a href="#" > 견적관리</a>
              <ul class="depth2" >
                <li class="on"> <a href="/buyer/m1_0101">견적현황</a> </li>
                <li> <a href="/buyer/m1_0201" class="success_color">견적상담</a> </li>
                <li> <!-- <a href="/buyer/m1_0301">이런 상품을 원해요</a> --> 
                <a href="/esti/estiMulti">비교견적 요청</a>
                <!-- <a href="/esti/estiMulti">이런 상품을 원해요</a> -->
                </li>
                <li> <a href="/buyer/m1_0401" class="success_color">계약상품</a>
                  <ul class="depth3">
                    <li><a href="#">계약연장요청</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li class="depth1 __m_order"> <a href="/buyer/m2_0101"> 주문관리</a>
              <ul class="depth2" >
                <li> <a href="/buyerOrder/orderSearch">주문/배송조회</a> </li>
                <li> <a href="/buyer/m2_0201" class="success_color">계약상품</a> </li>
                <li> <a href="/order/cart">장바구니</a> </li>
                <li> <a href="/buyerReply/buyer_m2_0401" >상품확정/리뷰</a> </li>
              </ul>
            </li>
            <li class="depth1 __m_attention"> <a href="/buyer/m3_0101"> 나의 관심 </a>
              <ul class="depth2" >
                <li> <a href="/buyerCartItem/buyerMtItem">관심상품 보관함</a> </li>
                <li> <a href="/buyerCartItem/buyerRqItem">견적상품 보관함</a> </li>
                <li> <a href="/buyerCartItem/buyerInterestSeller" class="success_color">관심 Seller</a> </li>
              </ul>
            </li>
            <li class="depth1 __m_mychat"> <a href="/buyer/m4_0301"> 나의 문의 </a>
              <ul class="depth2" >
                <li> <a href="/buyerQuestions/notice">공지사항</a> </li>
                <li> <a href="/buyerReply/buyer_m4_0201" class="success_color">FAQ</a> </li>
                <li> <a href="/buyer/m4_0301" class="success_color">나의 Q & A</a> </li>
                <li> <a href="/buyerReply/buyer_m2_0401">리뷰관리</a></a> </li>
              </ul>
            </li>
            <li class="depth1 __m_mychat"> <a href="/buyer/m5_0101" class="success_color">증빙서류 조회/출력 </a> </li>
            <li class="depth1 __m_user"><a href="/buyer/m6_0101" class="success_color">정보관리</a>
              <ul class="depth2" >
                <li> <a href="/buyer/m6_0101">회원정보 수정</a> </li>
                <li> <a href="#">회원등급 확인</a> </li>
                <li> <a href="#">포인트/쿠폰</a> </li>
               <sec:authorize access="hasAnyAuthority('P,M')">
                <li> <a href="/buyer/m6_0202">기업회원 신청</a> </li>
                </sec:authorize>
               <sec:authorize access="hasAnyAuthority('P,B,M')">
                <li> <a href="/buyer/m6_0201">Seller 신청/조회</a> </li>
               </sec:authorize>
                <li> <a href="/buyer/m6_0301">소셜계정 연동</a> </li>
                <li> <a href="/buyer/m6_0401">회원탈퇴</a> </li>
              </ul>
            </li>
          </ul>
        </div>
        <!--lnb-->
