<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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

    <!-- S : aside -->
    <script type="text/javascript" src="/resources/js/jquery.min.js"></script>
    <jsp:include page="/WEB-INF/views/common/aside.jsp" flush ="false"/>
    <script type="text/javascript" src="/resources/js/xlsx.full.min.js"></script>
    
	<script type="text/javascript" src="/resources/js/swiper_8.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.flexslider-min.js"></script>
	<script type="text/javascript" src="/resources/js/sample.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.bxslider.min.js"></script>

    <script type="text/javascript" src="/resources/js/weconnExcelDown.js"></script>
    <script type="text/javascript" src="/resources/js/FileSaver.min.js"></script>
    <script type="text/javascript" src="/resources/js/jsDelivr.js"></script>
    <script type="text/javascript" src="/resources/js/scroll_table_script.js"></script>
    <script type="text/javascript" src="/resources/js/sweetalert2.js"></script>
    <script>
    
    
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
   
    moment.locale('ko');

 
    </script>
    <!-- E : aside -->
    <header>
      <!--S : NEW HEADER-->
      <div class="container">
        <div class="inwrap">
          <div class="top_wrap">
            <div class="l_top">
              <div class="all_cate"><a href="#" onclick = "fn_menuOpen();"><i class="xi-bars"></i> 전체카테고리</a></div>
              <div class="service_menu" style = "display : block;">
                <%-- <ul>
                  <li class="on"><a href="/index">GP쇼핑</a></li>
                   <sec:authorize access="hasAnyAuthority('P,B,S,M')">
                  <li><a href="/buyer/index">구매자</a></li>
                  </sec:authorize>
                  <sec:authorize access="hasAnyAuthority('S,M')">
                  <li><a href="/seller/index">판매자</a></li>
                  </sec:authorize>
                  <sec:authorize access="hasAnyAuthority('M')">
                  <li><a href="/adminManager/index">ADMIN</a></li>
                  </sec:authorize>
                </ul> --%>
              </div>
            </div>
            <div class="header_logo">
            	<a href="/">GPlogo</a>
            </div>
            <div class="r_top">
              <div class="login_area">
               
                <ul class="_before">
                   <sec:authorize access="isAnonymous()">
                  	<li><a href="/login">로그인</a></li>
       		  	    <li><a href="/intro">회원가입</a></li>
       		      </sec:authorize>
       		       <sec:authorize access="hasAnyAuthority('P,B,S,M')">
       		        <li><a href="/logout">로그아웃</a></li>
       		        <li><a href="/buyerQuestions/notice">고객센터</a></li>
       		       </sec:authorize>
                </ul>
                 <ul class="_after">
                  <li><a href="#">베스트</a></li>
                  <li><a href="#">기획전</a></li>
                  <li><a href="#">신상품</a></li>
                </ul>
             
                <div class="member_menu">
                 <ul>
                    <%-- <sec:authorize access="hasAnyAuthority('P,B,S,M')">
                    	<li><a href="/buyerCartItem/buyerMtItem"><i class="xi-heart"></i>찜</a></li>
                    	<li><a href="/order/cart"><i class="xi-cart-o"></i>장바구니</a></li>
                    </sec:authorize>
                    <sec:authorize access="isAnonymous()">
                   		<li><a href="/login"><i class="xi-heart"></i>찜</a></li>
       		        	<li><a href="/login"><i class="xi-cart-o"></i>장바구니</a></li>
       		        </sec:authorize> --%>
       		        <%-- <sec:authorize access="hasAnyAuthority('P,B,S,M')">
                    <li class="btn_mypage"><a href="/buyer/index"><i class="xi-user"></i>마이메뉴</a>
                      <!-- -->
                      <div class="data-body">
                        <ul class="data-list">
                       	  <sec:authorize access="hasAnyAuthority('P,B,S,M')">
	                          <li class="data-item"><a href="/buyer/index">마이페이지</a></li>
	                          <li class="data-item"><a href="/buyerCartItem/buyerMtItem">관심보관함</a></li>
	                          <li class="data-item"><a href="/buyerOrder/orderSearch">주문배송 조회</a></li>
	                          <!-- <li class="data-item"><a href="">마이쿠폰</a> <span class="count">3</span></li> -->
                        	  <li class="data-item"><a href="#">1:1 문의</a></li>
                           </sec:authorize>
                        </ul>
                      </div>
                    </li>
                     </sec:authorize>
                     <sec:authorize access="isAnonymous()">
                     <li class="btn_mypage"><a href="/login"><i class="xi-user"></i>마이메뉴</a>
                      <div class="data-body">
                        <ul class="data-list">
	                          <li class="data-item"><a href="/buyer/m2_0101">주문배송 조회</a></li>
                         	  <li class="data-item"><a href="#">1:1 문의</a></li>
                        </ul>
                      </div>
                    </li>
                    </sec:authorize> --%>
                    <!-- -->
                  <li><a href="" id="btn_search_o" class="search_off" onclick = "return fn_viewSearch();"><i class="xi-search"></i>검색</a></li>
                  <li><a href="" id="btn_search_c" class="search_on" style="display:none" onclick = "return false;" ><i class="xi-close"></i>검색닫기</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--E : NEW HEADER-->
      <!-- S : 검색어 -->
      <div id="search_box" class="header-search-wrap" style="display:none">
        <form action="" name="searchForm">
          <fieldset>
            <legend>통합검색</legend>
            <div class="header-search">
              <div class="header-search__input-wrap">
                <input type="text" autocomplete="off" class="header-search__input" id = "QUICK_SEARCH_TEXT" placeholder="무엇을 찾고 계신가요?">
              </div>
              <button class="header-search__submit icon" onclick="return fn_quickSearch();" ><i class="xi-search"></i><span class="blind">검색</span></button>
            </div>
          </fieldset>
        </form>
        <!-- S : 인기검색어 -->
        <div class="search-relate-list">
          <section class="search_ranking">
            <h3 class="search_ranking_title">인기검색어</h3>
            <div class="search_ranking_list">
              <ul id = "QUICK_SEARCH_BTN">
                <!-- <li><a href="#">가습기</a></li>
                <li><a href="#">노트북</a></li>
                <li><a href="#">기초실장비</a></li>
                <li><a href="#">산업용전지</a></li>
                <li><a href="#">실험실안전</a></li>
                <li><a href="#">의료용품</a></li> -->
              </ul>
            </div>
          </section>
        </div>
        <!-- E : 인기검색어 -->
      </div>
      <!-- E : 검색어 -->
    </header>
    
    <div class="menu_all">
    <div class="all_box">
      <div class="titlewrap">
        <p class="title"> 전체 카테고리 </p>
        <button type="button" class="btn-allmenu_close icon_close" onclick = "fn_menuClose();"> <span class="blind">레이어 닫기</span> </button>
      </div>
      <div class="gnb">
      <!-- 
        <ul class="line1">
          <li>
            <h3>
              <span onclick="" style="cursor: pointer;">사무용품/사무기기</span>
            </h3>
            
            <div class="depth1">
            
              <div class="l_menu">
                <ul>
                  <li>
                    <a href="1">복사용지/지류</a>
                  </li>
                  <li>
                    <a href="2">사무용품</a>
                  </li>
                  <li>
                    <a href="3">화일바인더</a>
                  </li>
                  <li>
                    <a href="4">필기류</a>
                  </li>
                  <li>
                    <a href="6">사무용가구</a>
                  </li>
                  <li>
                    <a href="7">교육교구</a>
                  </li>
                  <li>
                    <a href="8">금고</a>
                  </li>
                </ul>
              </div>
              
            </div>
            
          </li>
        </ul> -->
        <!-- line1 -->
       </div><!--  gnb  -->
       
    </div>
  </div>