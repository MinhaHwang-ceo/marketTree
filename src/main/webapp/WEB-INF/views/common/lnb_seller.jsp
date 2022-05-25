<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

	.success_color	
	{
		color : red !important;
	}

</style>

<div class="seller_lnb">
  <!--구매자 or 판매자 -->
  <div class="division_area">
    <ul>
      <li> <a href="/buyer/index" class="buyer">구매자</a> </li>
      <li class="on"> <a href="/seller/index" class="seller">판매자</a> </li>
    </ul>
  </div>
  <!--구매자 or 판매자 //-->

  <ul class="seller_menu">

    <li class="depth1 __m_goods on">
      <a href="/seller/m1_0101" > 상품관리</a>
      <ul class="depth2" >
        <li> <a href="/seller/m1_0101">상품등록</a>
          <ul class="depth3">
	            <li ><a href="/sellerGoods/seller_m1_0101">상품 개별등록</a></li>
	            <li ><a href="/sellerGoods/seller_m1_0102">상품 일괄등록</a></li>
	            <li ><a href="/sellerGoods/seller_m1_0103">이미지 일괄등록</a></li>
          </ul>
        </li>
        <li> <a href="/seller/m1_0201">상품현황</a>
          <ul class="depth3">
	            <li ><a href="/sellerGoodsDetail/seller_m1_0201">상품 조회/수정</a></li>
	            <li ><a href="/sellerGoodsDetail/seller_m1_0202" class="success_color">계약상품 관리</a></li>
	            <li ><a href="/sellerGoodsDetail/seller_m1_0203" class="success_color">공지사항 관리</a></li>
          </ul>
        </li>
      </ul>
    </li>
    <li class="depth1 __m_estimate"> <a href="/seller/m2_0101"> 견적관리</a>
      <ul class="depth2" >
        <li> <a href="/seller/m2_0101">견적현황</a> </li>
        <li> <a href="/seller/m2_0201">계약현황</a> </li>
        <li> <a href="/seller/m2_0301">추천/플랫폼 등록 견적</a> </li>
        <li> <a href="/seller/m2_0401" class="success_color">견적 상담내역</a> </li>
      </ul>
    </li>
    <li class="depth1 __m_sell"> <a href="/seller/m3_0101"> 판매관리 </a>
      <ul class="depth2" >
        <li> <a href="/sellerOrder/orderSearch">주문</a> 
        	<ul class="depth3">
            <li ><a href="/sellerOrder/orderSearch">주문조회</a></li>
            <li ><a href="/sellerOrder/orderManagement">발주/발송 관리</a></li>
            <li ><a href="/sellerOrder/deliveryManagement">배송현황 관리</a></li>
            <li ><a href="/sellerOrder/cancelManagement">취소/반품/교환</a></li>
            <li ><a href="/sellerOrder/successManagement">구매확정 내역</a></li>
          </ul>
        </li>
        <li> <a href="/sellerTemplate/template">판매정보</a> </li>
      </ul>
    </li>
    <li class="depth1 __m_accounts"> <a href="/seller/m4_0101" class="success_color"> 정산관리</a>
      <ul class="depth2" >
        <li> <a href="/seller/m4_0101">정산내역</a> </li>
        <li> <a href="/seller/m4_0201">정산내역 상세</a> </li>
        <li> <a href="/seller/m4_0301">부가세신고</a> </li>
        <li> <a href="/seller/m4_0401">세금계산서</a> </li>
        <li> <a href="#" class="success_color">충전금 관리</a> </li>
      </ul>
    </li>
    <li class="depth1 __m_chart"> <a href="/seller/m5_0101" class="success_color"> 통계관리</a> </li>
    <li class="depth1 __m_ad"> <a href="/seller/m6_0101" class="success_color"> 광고관리</a> </li>
    <li class="depth1 __m_event"> <a href="/seller/m7_0101"> 이벤트 관리</a>
      <ul class="depth2" >
        <li> <a href="/seller/event/seller_m7_0101">이벤트/쿠폰등록</a> </li>
        <li> <a href="/seller/event/seller_m7_0201">조회/수정</a> </li>
      </ul>
    </li>
    <li class="depth1 __m_notice"> <a href="/seller/m8_0101" class="success_color"> 문의/공지</a> </li>
    <li class="depth1 __m_user"><a href="/seller/m9_0101">판매자 정보</a>
      <ul class="depth2" >
         <li> <a href="/seller/m9_0101" class="success_color">회원정보 수정</a> </li>
        <li> <a href="/seller/m9_0201">관심 카테고리 /키워드</a> </li>
        <li> <a href="/seller/m9_0301" class="success_color">Seller 소개</a> </li>
        <li> <a href="#" class="success_color">나의 등급 확인</a> </li>
      </ul>
    </li>
  </ul>
</div>
