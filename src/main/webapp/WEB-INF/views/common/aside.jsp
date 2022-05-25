<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="com.gloryDuck.marketTree.model.vo.MemberEntity" %>
<%
Authentication auth = (Authentication)request.getUserPrincipal();
String userId = "";
if(auth == null){
	
}else{
	Object principal = auth.getPrincipal();
	if(principal != null && principal instanceof MemberEntity){
		userId = ((MemberEntity)principal).getUserId();
	}
}
%>
<aside>

  <section class="aside" >
    <div class="aside-inner">
      <button type="button" class="button-switch-aside" id="button-aside-mall">
        <span class="button-switch-aside__default">
          <strong class="button-switch-aside__title">WECONN</strong>
          <span class="button-switch-aside__icon">
            <i class="xi-angle-left"></i>
          </span>
        </span>
        <span class="button-switch-aside__on">
          <i class="button-switch-aside__logo"></i>
          <strong class="button-switch-aside__title">WECONN</strong>
          <span class="button-switch-aside__icon">
            <i class="xi-angle-left"></i>
          </span>
        </span>
      </button>
      <ul class="aside-menu">
      <li>
          <a href="/buyer/index" class="aside-menu-item icon">
            <span class="aside-menu-item__icon">
              <i class="xi104-user"></i>
            </span>
            <span class="aside-menu-item__txt">마이페이지</span>
          </a>
        </li>
      <sec:authorize access="hasAnyAuthority('S,M')">
        <li>
          <a href="/seller/index" class="aside-menu-item icon">
            <span class="aside-menu-item__icon">
              <i class="xi104-user-info"></i>
            </span>
            <span class="aside-menu-item__txt">판매자</span>
          </a>
        </li>
        </sec:authorize>
        <sec:authorize access="hasAnyAuthority('M')">
        <li>
          <a href="/adminManager/index" class="aside-menu-item icon">
            <span class="aside-menu-item__icon">
              <i class="xi104-user"></i>
            </span>
            <span class="aside-menu-item__txt">ADMIN</span>
          </a>
        </li>
        </sec:authorize>
        <li>
          <a href="/order/cart" class="aside-menu-item icon" id="asidemenu">
            <span class="aside-menu-item__icon"> <i class="xi104-basket"></i><em class="aside-menu__num viewCartCnt"></em> </span>
            <span class="aside-menu-item__txt">장바구니</span>
          </a>
        </li>
        <li>
          <a href="/buyerOrder/orderSearch" class="aside-menu-item icon" id="asidemenu">
            <span class="aside-menu-item__icon"> <i class="xi104-box"></i><em class="aside-menu__num"></em> </span>
            <span class="aside-menu-item__txt">주문/배송 조회</span>
          </a>
        </li>
        <li>
          <a href="/buyerCartItem/buyerMtItem" class="aside-menu-item icon" id="asidemenu">
            <span class="aside-menu-item__icon"> <i class="xi-heart"></i><em class="aside-menu__num"></em> </span>
            <span class="aside-menu-item__txt">관심보관함</span>
          </a>
        </li>
        <li>
          <a href="/esti/estiMulti" class="aside-menu-item icon">
            <span class="aside-menu-item__icon">
              <i class="xi104-form-check"></i>
            </span>
            <span class="aside-menu-item__txt">견적신청</span>
          </a>
        </li>
        <li>
          <a href="" class="aside-menu-item icon" target="_blank" rel="noopener noreferrer">
            <span class="aside-menu-item__icon">
              <i class="xi104-message-list"></i>
            </span>
            <span class="aside-menu-item__txt">1:1문의</span>
          </a>
        </li>
        <li>
          <a href="javascript:void(0);" id="TOP_BUTTON" class="aside-menu-item icon button-aside-top">
            <span class="aside-menu-item__icon">
              <i class="xi104-angle-double-up"><span>TOP</span></i>
            </span>
            <span class="aside-menu-item__txt">맨 위로 이동</span>
          </a>
        </li>
      </ul>
      <!-- s : aside -->
    </div>
  </section>
  <script>
  
  $(document).ready(function() {
	  // Top Button click event handler
	  $("#TOP_BUTTON").click(function() {
	    $('html, body').animate({scrollTop:0}, '600');
	  });
	});
  
  </script>
</aside>

