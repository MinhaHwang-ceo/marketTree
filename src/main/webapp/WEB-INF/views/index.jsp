<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <!DOCTYPE html>
  <html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>WEECON</title>
    <link rel="stylesheet" href="/resources/css/layout.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <!-- <link rel="stylesheet" href="/resources/css/swiper_8.min.css"> -->
  <!--  <link rel="stylesheet" href="/resources/css/layout.css" media="screen and (min-width:1280px)">
    <link rel="stylesheet" href="/resources/css/main.css" media="screen and (min-width:1280px)">
<!--
    <link rel="stylesheet" href="/resources/css/tab/tab_layout.css" media="screen and (min-width:768px) and (max-width:1279px)">
    <link rel="stylesheet" href="/resources/css/mobile/m_layout.css" media="screen and (max-width:767px)">

    <link rel="stylesheet" type="text/css" href="/resources/css/tab/tab_main.css" media="screen and (min-width:768px) and (max-width:1279px)">
    <link rel="stylesheet" type="text/css" href="/resources/css/mobile/m_main.css" media="screen and (max-width:767px)">-->
      <!-- <script>
        function fn_ShowcategoryTab(categoryName){
      //		categoryName = categoryName.replace(/ /g,"");
          $("[class*='categoryTab_']").hide();
          $(".categoryTab_"+categoryName).show();
        }

        function fn_ShowcategoryStab(categorysName){
      //		categoryName = categoryName.replace(/ /g,"");
          $("[class*='categoryStab_']").hide();
          $(".categoryStab_"+categorysName).show();
        }
        </script> -->
  </head>

  <body class="main">
      <!-- S : wrap -->


    <div class="wrap">
        <!-- S : header -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" flush ="true"/>
        <script>
        
		var weconn_all_category = '';
        function create_weconn_category(category){
        		weconn_all_category = category;
        	  //allCategory Depth 가져다가 출력
        	  var html = '';
        	  var html_depth2 = '';
        	  
        	  console.log(category);
        	  var isFirst = 'Y';
        	  var firstCode = '';
        	  
        	  for( var i = 0 ; i < category.DEPTH1.length; ++i ){
        		 
        		  //console.log(category.DEPTH1[i]);
        		  //console.log(doesFileExist('/resources/images/main/cate_icon_'+category.DEPTH1[i].CATEGORY_CODE+'.png'));
        		  //console.log('/resources/images/main/cate_icon_'+category.DEPTH1[i].CATEGORY_CODE+'.png');
        		  
        		  var imageIsHere = doesFileExist('/resources/images/main/cate_icon_'+category.DEPTH1[i].CATEGORY_CODE+'.jpg');
        		  
        		  //console.log(imageIsHere);
        		  if(imageIsHere && isFirst == 'Y'){
        			  
        			  isFirst = 'N';
        			  //아이콘 생성
        			  html += '<div class="swiper-slide"><button onclick="change_weconn_cate_depth2(\''+category.DEPTH1[i].CATEGORY_CODE+'\');" class="Btn_categoryTab cate_'+category.DEPTH1[i].CATEGORY_CODE+' on" >';
        			  html += '<img src="/resources/images/main/cate_icon_'+category.DEPTH1[i].CATEGORY_CODE+'.jpg" alt=""></button></div>'; 
        			  
					  var depth2 = category.DEPTH2[category.DEPTH1[i].CATEGORY_CODE];
					  
        			  for(var j = 0 ; j < depth2.length; j++ ){
        				  
        				  //중단 2depth
        				  if(j == 0){
        					  html_depth2 += '<div class="brand_pd_slide_wrap categoryTab_'+category.DEPTH1[i].CATEGORY_CODE+'" style="display: block;">';
        					  html_depth2 += '<div class="s_category" >';
        					  html_depth2 += '<ul>';
        					  
        					  html_depth2 += '<li class="on depth2_li depth2_'+depth2[j].CATEGORY_CODE+'"><a href="javascript:change_weconn_cate_goods(\''+depth2[j].CATEGORY_CODE+'\');" >'+depth2[j].CATEGORY_NAME+'</a></li>';
        					  firstCode = depth2[j].CATEGORY_CODE;
        				  }else if(j == depth2.length -1){
        					  
        					  html_depth2 += '</div>';
        					  html_depth2 += '</div>';
        					  html_depth2 += '</ul>'
        					  
        					  
        				  }else{
        					  
        					  html_depth2 += '<li class=" depth2_li depth2_'+depth2[j].CATEGORY_CODE+'"><a href="javascript:change_weconn_cate_goods(\''+depth2[j].CATEGORY_CODE+'\');" >'+depth2[j].CATEGORY_NAME+'</a></li>';
            				  
        				  }
            			  
        			  }
        			 
        			  //change_weconn_cate_goods(firstCode);
        			  
        		  }else if(imageIsHere){
        			  
        			  html += '<div class="swiper-slide"><button  class="Btn_categoryTab cate_'+category.DEPTH1[i].CATEGORY_CODE+'" onclick="change_weconn_cate_depth2(\''+category.DEPTH1[i].CATEGORY_CODE+'\');">';
        			  html += '<img src="/resources/images/main/cate_icon_'+category.DEPTH1[i].CATEGORY_CODE+'.jpg" alt=""></button></div>';
        			  
        		  }
        		  
        	  }
        	  
        	  $brandCount = $('.cate_brand_slide .swiper-wrapper > div').length;
        	  swiperCategory = '';
              if ($brandCount <= 5){
              	/*$('.cate_brand_slide_wrap .Pbox_arrow_box').css('display', 'none');*/
              	swiperCategory = new Swiper(".cate_brand_slide", {
              		speed: 500,
              		watchOverflow: true,
              		mousewheel: true,
              		centerInsufficientSlides: true,
              		slidesPerView: "auto",
              		spaceBetween: 20
              	});
              }else {
              	/*$('.cate_brand_slide_wrap .Pbox_arrow_box').css('display', 'block');*/
              	swiperCategory = new Swiper(".cate_brand_slide", {
              		speed: 500,
              		watchOverflow: true,
              		mousewheel: true,
              		centerInsufficientSlides: true,
              		slidesPerView: 9,
              		spaceBetween: 20,
              		slidesOffsetAfter : 180,
              		navigation: {
              			nextEl: ".cate_brand_slide_wrap .swiper-button-next",
              			prevEl: ".cate_brand_slide_wrap .swiper-button-prev"
              		}
              	});
              }
              
              swiperCategory.removeAllSlides();
              $('#weconn_category').append(html);
              
              $('#weconn_category_depth2').find('div').remove();
              $('#weconn_category_depth2').append(html_depth2);
              
        	  change_weconn_cate_goods(firstCode);
              
              //swiperCategory.appendSlide(res);
              swiperCategory.update();
              $('.cate_brand_slide_wrap').css({"opacity":"1"});
              
              
        }

        function doesFileExist(urlToFile) {
        	    var xhr = new XMLHttpRequest();
        	   
        	    xhr.open('HEAD', urlToFile, false);
        	    xhr.send();
        	     
        	    if (xhr.status == "404") {
        	        return false;
        	    } else {
        	        return true;
        	    }
        	}
        
        function change_weconn_cate_depth2(categoryNo){
        	
        	var depth2 = weconn_all_category.DEPTH2[categoryNo];
        	var html_depth2 = '';
        	var firstCode = '';
        	//console.log($('.Btn_categoryTab .cate_'+categoryNo));
        	
        	$('.Btn_categoryTab').removeClass('on');
        	
        	$('.cate_'+categoryNo).addClass('on');
        	
        	for(var j = 0 ; j < depth2.length; j++ ){
				  
        		//중단 2depth
				  if(j == 0){
					  html_depth2 += '<div class="brand_pd_slide_wrap categoryTab_'+categoryNo+'" style="display: block;">';
					  html_depth2 += '<div class="s_category" >';
					  html_depth2 += '<ul>';
					  
					  html_depth2 += '<li class="on depth2_li depth2_'+depth2[j].CATEGORY_CODE+'"><a href="javascript:change_weconn_cate_goods(\''+depth2[j].CATEGORY_CODE+'\');" >'+depth2[j].CATEGORY_NAME+'</a></li>';
					  firstCode = depth2[j].CATEGORY_CODE;
					  
				  }else if(j == depth2.length -1){
					  
					  html_depth2 += '</div>';
					  html_depth2 += '</div>';
					  html_depth2 += '</ul>'
					  
				  }else{
					  
					  html_depth2 += '<li class=" depth2_li depth2_'+depth2[j].CATEGORY_CODE+'"><a href="javascript:change_weconn_cate_goods(\''+depth2[j].CATEGORY_CODE+'\');" >'+depth2[j].CATEGORY_NAME+'</a></li>';
  				  
				  }
  			  
			  }
        	
        	$('#weconn_category_depth2').find('div').remove();
        	$('#weconn_category_depth2').append(html_depth2);
        	change_weconn_cate_goods(firstCode);
        	
        }

        function change_weconn_cate_goods(categoryNo){
        	
			$('.depth2_li').removeClass('on');
        	
			//console.log(categoryNo);
			var changeDepth = '.depth2_'+categoryNo;
			//console.log(changeDepth);
        	$(changeDepth).addClass('on');
        	
        	var g_Depth1 = categoryNo.substr(3,3);
        	var g_Depth2 = categoryNo.substr(6,3) ?? '';
        	var g_Depth3 = categoryNo.substr(9,3) ?? '';
        	
        	console.log(g_Depth1);
        	console.log(g_Depth2);
        	console.log(g_Depth3);
        	
        	///001001001002
        	var g_orderType = 'selling';
        	//
        	$.ajax({
    			url : 'https://search.iffice.com:5003/extensions/QuotationExtension'
    			,type : 'get'
    			,data : 
    			{
    				//'itemNm' : 'A4'
    				'category1Code' : g_Depth1
    				,'category2Code' : g_Depth2
    				,'category3Code' : g_Depth3
    				//,'category4Code' : ''
    				,'myKeywordData' : 1
    				,'type' : 'seller'
    				//,'sort' : g_orderType																					// 정렬순서
    				,'pageNumber' : 1														// 페이징
    				,'rowsPerPage' : 5
    				//,'newProduct' :  1								//새상품
    			}
    			,dataType : 'json'
    			,success : function( result )
    			{
    				var resultData = result.resultSet.result[0].resultDocuments;
    				var goodsList = [];
    				var weconn_goods_html = '';
    				console.log(resultData);
    				$('.weconn_category_header').remove();
    				
    				weconn_goods_html += '<div class="swiper-container brand_pd_slide swiper-container-horizontal categoryStab_'+categoryNo+' weconn_category_header"  style="display: block;">';
					//weconn_goods_html += '<div class="swiper-container brand_pd_slide swiper-container-horizontal">';
					weconn_goods_html += '<div class="swiper-wrapper weconn_category_inner" >';
					

					weconn_goods_html += '</div>';
					//weconn_goods_html += '</div>';
    				weconn_goods_html += '<div class="brand_pd_slide_prev swiper-button-prev"></div>';
    				weconn_goods_html += '<div class="brand_pd_slide_next swiper-button-next"></div>';
    				
    				$('#weconn_category_depth2').append(weconn_goods_html);
    				
    				weconn_goods_html = '';
					
    				//resultData.length x 아예 5개까지만
    				for( var i = 0 ; i < 5 ; i++  ){
    					
    					if(resultData.length > 0){
    						
    						var item = resultData[i];
    						
        					if(item != undefined && item != null && item != ''){
        						//href="/buyerGoods/product?ITEM_NO=G22-003568"
        						weconn_goods_html += '<div class="cate_pd_box swiper-slide ">';
        						weconn_goods_html += '<a href="/buyerGoods/product?ITEM_NO='+item.ITEM_NO+'" target="_blank">';
        						
        						weconn_goods_html += '<div class="img_box">';
        						weconn_goods_html += '<img src="'+item.IMAGE_URL+'">';
        						weconn_goods_html += '</div>';
        						weconn_goods_html += '<div class="brand_pd_info">';
        						weconn_goods_html += '<p class="pd_name">';
        						weconn_goods_html += handleOnInput('['+item.MAKER_NAME+'] '+ item.DESCRIPTION, 15);
        						weconn_goods_html += '</p>';
        						weconn_goods_html += '<div class="pd_price">';
        						weconn_goods_html += '<span class="won">';
        						weconn_goods_html += numberWithCommas(item.UNIT_PRICE);
        						weconn_goods_html += ' 원</span>';
        						weconn_goods_html += '</div>';
        						weconn_goods_html += '<div class="rating">';
        						weconn_goods_html += '<span class="ratingStar">';
        						var gradePoint = (item.GRADE_POINT * 20);
        						weconn_goods_html += '<span class="ratingOn" style="width: '+gradePoint+'%;"></span>';
        						weconn_goods_html += '</span>';
        						weconn_goods_html += '<span class="ratingScore">'+item.GRADE_POINT+'</span>';
        						weconn_goods_html += '</div>';
        						weconn_goods_html += '</div></a>';
        						weconn_goods_html += '</div>';
        						
        						
        					}else{
        						
        						weconn_goods_html += '<div class="cate_pd_box swiper-slide ">';
        						weconn_goods_html += '<a href="javascript:void(0);">';
        						
        						weconn_goods_html += '<div class="img_box">';
        						weconn_goods_html += '<img  src="/resources/images/etc/noimg.jpg">';
        						weconn_goods_html += '</div>';
        						weconn_goods_html += '<div class="brand_pd_info">';
        						weconn_goods_html += '<p class="pd_name">';
        						weconn_goods_html += '상품 준비중';
        						weconn_goods_html += '</p>';
        						weconn_goods_html += '<div class="pd_price">';
        						weconn_goods_html += '<span class="won">';
        						weconn_goods_html += '0';
        						weconn_goods_html += ' 원</span>';
        						weconn_goods_html += '</div>';
        						weconn_goods_html += '<div class="rating">';
        						weconn_goods_html += '<span class="ratingStar"><span class="ratingOff" style="width: 0%;"></span></span>';
        						weconn_goods_html += '<span class="ratingScore">0</span>';
        						weconn_goods_html += '</div>';
        						weconn_goods_html += '</div></a>';
        						weconn_goods_html += '</div>';
        						
        					}
    						
    					}else{
    						//console.log('init ' + i);
    						
    						weconn_goods_html += '<div class="cate_pd_box swiper-slide ">';
    						weconn_goods_html += '<a href="javascript:void(0);">';
    						
    						weconn_goods_html += '<div class="img_box">';
    						weconn_goods_html += '<img src="/resources/images/etc/noimg.jpg">';
    						weconn_goods_html += '</div>';
    						weconn_goods_html += '<div class="brand_pd_info">';
    						weconn_goods_html += '<p class="pd_name">';
    						weconn_goods_html += '상품 준비중';
    						weconn_goods_html += '</p>';
    						weconn_goods_html += '<div class="pd_price">';
    						weconn_goods_html += '<span class="won">';
    						weconn_goods_html += '0';
    						weconn_goods_html += ' 원</span>';
    						weconn_goods_html += '</div>';
    						weconn_goods_html += '<div class="rating">';
    						weconn_goods_html += '<span class="ratingStar"><span class="ratingOff" style="width: 0%;"></span></span>';
    						weconn_goods_html += '<span class="ratingScore">0</span>';
    						weconn_goods_html += '</div>';
    						weconn_goods_html += '</div></a>';
    						weconn_goods_html += '</div>';
    						
    					}
    					
    				}
/* 
    				weconn_goods_html += '</div>';
    				weconn_goods_html += '<div class="swiper-button-prev"></div>';
    				weconn_goods_html += '<div class="swiper-button-next"></div>'; */
    				weconn_goods_html += '</div>';
    				
    				//console.log(weconn_goods_html);
    				
    				$('.weconn_category_inner').append(weconn_goods_html);
    				best_product();
    				//console.log(weconn_goods_html);
    				//console.log(goodsList);
    			}
    		}); 
        	 
        }
        
        function best_product(){
		
        	console.log('init');
			var best_product_html = '';
			//https://search.iffice.com:5003/extensions/GoodsExtension?newProduct=1&sort=selling
			$.ajax({
    			url : 'https://search.iffice.com:5003/extensions/GoodsExtension'
    			,type : 'get'
    			,data : 
    			{
    				'newProduct' : 1
    				,'sort' : 'selling'
    				,'pageNumber' : 1														// 페이징
    				,'rowsPerPage' : 4
    			}
    			,dataType : 'json'
    			,success : function( result )
    			{
    				var resultData = result.resultSet.result[0].resultDocuments;
    				var goodsList = [];
    				
    				console.log(resultData);
    				
    				$('#best_product_ul li').remove();
    				
    				//resultData.length x 아예 5개까지만
    				for( var i = 0 ; i < 4 ; i++  ){
    					
    					if(resultData.length > 0){
    						
    						var item = resultData[i];
    						
        					if(item != undefined && item != null && item != ''){
        						//href="/buyerGoods/product?ITEM_NO=G22-003568"
        						best_product_html += '<li>';
        						best_product_html += '<a href="/buyerGoods/product?ITEM_NO='+item.ITEM_NO+'" target="_blank">';
        						best_product_html += '<div class="img_box">';
        						best_product_html += '<img src="'+item.IMAGE_URL+'">';
        						best_product_html += '</div>';
        						best_product_html += '<div class="brand_pd_info">';
        						best_product_html += '<p class="pd_name"> ';
        						best_product_html += handleOnInput('['+item.MAKER_NAME+'] '+ item.DESCRIPTION, 15);
        						best_product_html += '</p>';
        						best_product_html += '<div class="pd_price">';
        						best_product_html += '<span class="won">';
        						best_product_html += numberWithCommas(item.UNIT_PRICE);
        						best_product_html += ' 원</span>';
        						best_product_html += '</div>';
        						best_product_html += '</div>';
        						best_product_html += '</a>';
        						best_product_html += '</li>';
        						
        						
        					}else{
        						
        						best_product_html += '<li>';
        						best_product_html += '<a href="javascript:void(0);">';
        						best_product_html += '<div class="img_box">';
        						best_product_html += '<img src="/resources/images/etc/noimg.jpg">';
        						best_product_html += '</div>';
        						best_product_html += '<div class="brand_pd_info">';
        						best_product_html += '<p class="pd_name">';
        						best_product_html += '상품 준비중';
        						best_product_html += '</p>';
        						best_product_html += '<div class="pd_price">';
        						best_product_html += '<span class="won">';
        						best_product_html += '0';
        						best_product_html += ' 원</span>';
        						best_product_html += '</div>';
        						best_product_html += '</div>';
        						best_product_html += '</a>';
        						best_product_html += '</li>';
        						
        					}
    						
    					}else{
    						//console.log('init ' + i);
    						
    						best_product_html += '<li>';
    						best_product_html += '<a href="javascript:void(0);">';
    						best_product_html += '<div class="img_box">';
    						best_product_html += '<img src="/resources/images/etc/noimg.jpg">';
    						best_product_html += '</div>';
    						best_product_html += '<div class="brand_pd_info">';
    						best_product_html += '<p class="pd_name">';
    						best_product_html += '상품 준비중';
    						best_product_html += '</p>';
    						best_product_html += '<div class="pd_price">';
    						best_product_html += '<span class="won">';
    						best_product_html += '0';
    						best_product_html += ' 원</span>';
    						best_product_html += '</div>';
    						best_product_html += '</div>';
    						best_product_html += '</a>';
    						best_product_html += '</li>';
    						
    					}
    					
    				}
    				
    				console.log(best_product_html);
    				
    				$('#best_product_ul').append(best_product_html);
    				new_product_list();
    				
    			}
    		}); 
			
        	
        }
        
        function new_product_list(){
        	
        	var new_product_html = '';
        	
			//https://search.iffice.com:5003/extensions/GoodsExtension?newProduct=1&sort=selling
			$.ajax({
    			url : 'https://search.iffice.com:5003/extensions/GoodsExtension'
    			,type : 'get'
    			,data : 
    			{
    				'newProduct' : 1
    				,'sort' : 'date'
    				,'pageNumber' : 1														// 페이징
    				,'rowsPerPage' : 10
    			}
    			,dataType : 'json'
    			,timeout : 3000
    			,success : function( result )
    			{
    				var resultData = result.resultSet.result[0].resultDocuments;
    				var goodsList = [];
    				
    				console.log(resultData);
    				
    				//resultData.length x 아예 10개까지만
    				for( var i = 0 ; i < 10 ; i++  ){
    					
    					if(resultData.length > 0){
    						
    						var item = resultData[i];
    						
        					if(item != undefined && item != null && item != ''){
        						//href="/buyerGoods/product?ITEM_NO=G22-003568"
        						new_product_html += '<div class="swiper-slide">';
        						new_product_html += '<div class="pd_area">';
        						new_product_html += '<a href="/buyerGoods/product?ITEM_NO='+item.ITEM_NO+'" target="_blank">';
        						new_product_html += '<div class="img_box">';
        						new_product_html += '<img style="height:234px !important;" src="'+item.IMAGE_URL+'">';
        						new_product_html += '</div>';
        						new_product_html += '<div class="brand_pd_info">';
        						new_product_html += '<p class="pd_name"> ';
        						new_product_html += handleOnInput('['+item.MAKER_NAME+'] '+ item.DESCRIPTION, 15);
        						new_product_html += '</p>';
        						new_product_html += '<div class="pd_price">';
        						new_product_html += '<span class="won">';
        						new_product_html += numberWithCommas(item.UNIT_PRICE);
        						new_product_html += ' 원</span>';
        						new_product_html += '</div>';
        						new_product_html += '</div>';
        						new_product_html += '</a>';
        						new_product_html += '</div>';
        						new_product_html += '</div>';
        						
        						
        					}else{
        						
        						new_product_html += '<div class="swiper-slide">';
        						new_product_html += '<div class="pd_area">';
        						new_product_html += '<a href="javascript:void(0);">';
        						new_product_html += '<div class="img_box">';
        						new_product_html += '<img style="height:234px !important;" src="/resources/images/etc/noimg.jpg">';
        						new_product_html += '</div>';
        						new_product_html += '<div class="brand_pd_info">';
        						new_product_html += '<p class="pd_name">';
        						new_product_html += '상품 준비중';
        						new_product_html += '</p>';
        						new_product_html += '<div class="pd_price">';
        						new_product_html += '<span class="won">';
        						new_product_html += '0';
        						new_product_html += ' 원</span>';
        						new_product_html += '</div>';
        						new_product_html += '</div>';
        						new_product_html += '</a>';
        						new_product_html += '</div>';
        						new_product_html += '</div>';
        						
        					}
    						
    					}else{
    						//console.log('init ' + i);
    						
    						new_product_html += '<div class="swiper-slide">';
    						new_product_html += '<div class="pd_area">';
    						new_product_html += '<a href="javascript:void(0);">';
    						new_product_html += '<div class="img_box">';
    						new_product_html += '<img style="height:234px !important;" src="/resources/images/etc/noimg.jpg">';
    						new_product_html += '</div>';
    						new_product_html += '<div class="brand_pd_info">';
    						new_product_html += '<p class="pd_name">';
    						new_product_html += '상품 준비중';
    						new_product_html += '</p>';
    						new_product_html += '<div class="pd_price">';
    						new_product_html += '<span class="won">';
    						new_product_html += '0';
    						new_product_html += ' 원</span>';
    						new_product_html += '</div>';
    						new_product_html += '</div>';
    						new_product_html += '</a>';
    						new_product_html += '</div>';
    						new_product_html += '</div>';
    						
    					}
    					
    				}
    				$('#new_product_list').find('div').remove();
    				$('#new_product_list').append(new_product_html);
    				
    				swiper = new Swiper('.new_pd_box .swiper-container', {
    					  //기본 셋팅
    					  //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
    					  direction: 'horizontal',
    					  //한번에 보여지는 페이지 숫자
    					  slidesPerView: 5,  
    					  //페이지와 페이지 사이의 간격
    					  spaceBetween: 13,  
    					  //드레그 기능 true 사용가능 false 사용불가
    					  //debugger: true,  
    					  draggable: true,
    					  //마우스 휠기능 true 사용가능 false 사용불가
    					  mousewheel: true,  
    					  //반복 기능 true 사용가능 false 사용불가
    					  loop: true,  
    					  //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가 djqt
    					  //centeredSlides: true,
						  centerInsufficientSlides: true,
    					  //자동 스크를링
    					  autoplay: {//시간 1000 이 1초
    					    delay: 4000,
    					    disableOnInteraction: true,
    					  },
    					  //페이징
    					  /* pagination: {
    					    //페이지 기능
    					    el: '.new_pd_box .swiper-pagination',  //클릭 가능여부
    					    clickable: true,
    					  }, */
    					  //방향표
    					  navigation: {
    					    nextEl: '.new_pd_box .swiper-button-next',
    					    prevEl: '.new_pd_box .swiper-button-prev',
    					  },

    				});
    				
    				swiper.update();
    				
    			}
    		}); 
			
        	
        }
        
        function handleOnInput(el, maxlength) {
        	var returnValue = '';
        	if(el.length > maxlength)  {
        		returnValue = el.substr(0, maxlength)+'...';
        	}else{
        		returnValue = el;
        	}
        	
        	return returnValue;
        	
        }
        
        //comma
	    function numberWithCommas(price) {
	    	var price_del = Math.floor(price)
	        return price_del.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    }
	    
	    function comma(str) {
	        str = String(str);
	        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	    }

	    function uncomma(str) {
	        str = String(str);
	        return str.replace(/[^\d]+/g, '');
	    } 
	    
	    function inputNumberFormat(obj) {
	        obj.value = comma(uncomma(obj.value));
	    }
	    
	    function inputOnlyNumberFormat(obj) {
	        obj.value = onlynumber(uncomma(obj.value));
	    }
	    
	    function onlynumber(str) {
		    str = String(str);
		    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
		}
	    
	    function onlyNumberKorean(str){
	    	var regex = /[^0-9]/gi;
	    	return parseInt(str.replace(regex, ""));
	    }
	    
	    //comma 끝

        </script>
        <!-- E : header -->
        <!-- S : body -->
        <main>
          <div class="container _main">
            <div class="content">
              <!-- 비쥬얼 슬라이드 박스-->
              <div class="visual">
                <div class="bx-wrapper">
                  <div class="bx-viewport">
                    <ul class="bxslider">
                      <li class="slider1">
                        <div class="slider_box1"> </div>
                        </li>
                      <li class="slider2">
                        <div class="slider_box2"> </div>
                        </li>
                      <li class="slider3">
                        <div class="slider_box3"> <button class="btn_slider04" onclick="location.href=''"></button></div>
                        </li>
                      <li class="slider4">
                        <div class="slider_box4"><button class="btn_slider04" onclick="location.href=''"></button></div>
                      </li>
                      <li class="slider5">
                        <div class="slider_box5"><button class="btn_slider05"  onclick="location.href=''"></button></div>
                      </li>
                      <!--<li class="slider5">
                        <div class="slider_box5">
                            <div class="search_box"><input type="text" value="" placeholder="검색어를 입력해주세요."><button class="mbtn_search"><span class="blind">검색</span></button></div>
                        </div>
                      </li>-->
                    </ul>
                  </div>

                </div>

              </div>
                <!-- 비쥬얼 슬라이드 박스//-->
              <!--취급상품 카테고리-->
              <div class="section02">

                <div class="title">취급 상품 카테고리</div>
                <div class="main_pd_wrap">
                  <!--// 전체 카테고리 -->
                  <div class="cate_brand_slide_wrap" >
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-container cate_brand_slide">
                    <div class="swiper-wrapper m_category" id="weconn_category">
                          <div class="swiper-slide"></div><div class="swiper-slide"></div>
                          <div class="swiper-slide"></div><div class="swiper-slide"></div>
                          <div class="swiper-slide"></div><div class="swiper-slide"></div>
                          <div class="swiper-slide"></div><div class="swiper-slide"></div>
                          <div class="swiper-slide"></div><div class="swiper-slide"></div>
                          <div class="swiper-slide"></div><div class="swiper-slide"></div>
                          <div class="swiper-slide"></div><div class="swiper-slide"></div>
                          <div class="swiper-slide"></div><div class="swiper-slide"></div>
                          <div class="swiper-slide"></div><div class="swiper-slide"></div>
                          <div class="swiper-slide"></div><div class="swiper-slide"></div>
                          <div class="swiper-slide"></div><div class="swiper-slide"></div>
                          <div class="swiper-slide"></div><div class="swiper-slide"></div>
                          <div class="swiper-slide"></div><div class="swiper-slide"></div>
                    </div>
                    </div>
                  </div>
                  <!-- 전체 카테고리 //-->
                  <!--// 카테고리 1-->
                  <div id="weconn_category_depth2">
                  <div class="brand_pd_slide_wrap categoryTab_카테고리1" style="display: block;">
                    <div class="s_category">
                      <ul >
                        <li class="on"><a href="" onclick="fn_ShowcategoryStab('수작업공구');">수작업공구</a></li>
                        <li><a href="" onclick="fn_ShowcategoryStab('전동공구');">전동공구</a></li>
                        <li><a href="" onclick="fn_ShowcategoryStab('소방공구');">소방공구</a></li>
                        <li><a href="" onclick="fn_ShowcategoryStab('소방안전');">소방안전</a></li>
                        <li><a href="" onclick="fn_ShowcategoryStab('개인안전');">개인안전</a></li>
                        <li><a href="" onclick="fn_ShowcategoryStab('조명');">조명</a></li>
                        <li><a href="" onclick="fn_ShowcategoryStab('전기');">전기</a></li>
                      </ul>
                    </div>
                    <!-- // STAB 01 -->
					<div class="swiper-container brand_pd_slide swiper-container-horizontal categoryStab_수작업공구 weconn_category_header"  style="display: block;">
                      <!-- <div class="swiper-container brand_pd_slide swiper-container-horizontal">
                        <div class="swiper-wrapper" >
                          <div class="cate_pd_box swiper-slide ">
                              <a href="#" target="_blank">
                                <div class="img_box"> <img src="/resources/images/main/goods01.jpg"> </div>
                                <div class="brand_pd_info">
                                  <p class="pd_name">[위닉스] [위닉스] 뽀송 16L 제습기 DO2E160-JW...</p>
                                  <div class="pd_price">
                                    <span class="won">349,000원</span>
                                  </div>
                                  <div class="rating"><span class="ratingStar"><span class="ratingOn" style="width: 80%;"></span></span> <span class="ratingScore">4.7</span></div>
                                </div>
                              </a>
                            </div>
                          <div class="cate_pd_box swiper-slide ">
                              <a href="#" target="_blank">
                                <div class="img_box"> <img src="/resources/images/main/goods02.jpg"> </div>
                                <div class="brand_pd_info">
                                  <p class="pd_name">[위닉스] 뽀송 10L 제습기 DXAE100-JWK </p>
                                  <div class="pd_price">
                                    <span class="won">221,000원</span>
                                  </div>
                                  <div class="rating"><span class="ratingStar"><span class="ratingOn" style="width: 80%;"></span></span> <span class="ratingScore">4.7</span></div>
                                </div>
                              </a>
                            </div>
                          <div class="cate_pd_box swiper-slide ">
                              <a href="#" target="_blank">
                                <div class="img_box"> <img src="/resources/images/main/goods03.jpg"> </div>
                                <div class="brand_pd_info">
                                  <p class="pd_name">[위닉스] 공기청정기, 제로S AZSE430-JWK </p>
                                  <div class="pd_price">
                                    <span class="won">209,000원</span>
                                  </div>
                                  <div class="rating"><span class="ratingStar"><span class="ratingOn" style="width: 80%;"></span></span> <span class="ratingScore">4.7</span></div>
                                </div>
                              </a>
                            </div>
                          <div class="cate_pd_box swiper-slide ">
                            <a href="#" target="_blank">
                              <div class="img_box"> <img src="/resources/images/main/goods04.jpg"> </div>
                              <div class="brand_pd_info">
                                <p class="pd_name">[위닉스] [위닉스] 공기청정기 타워X ATGH500-J...</p>
                                <div class="pd_price">
                                  <span class="won">229,000원</span>
                                </div>
                                <div class="rating"><span class="ratingStar"><span class="ratingOn" style="width: 80%;"></span></span> <span class="ratingScore">4.7</span></div>
                              </div>
                            </a>
                            </div>
                          <div class="cate_pd_box swiper-slide ">
                            <a href="#" target="_blank">
                              <div class="img_box"> <img src="/resources/images/main/goods05.jpg"> </div>
                              <div class="brand_pd_info">
                                <p class="pd_name">[위닉스] [단독특가] 올바른 가습기 스테인리스...</p>
                                <div class="pd_price">
                                  <span class="won">154,900원</span>
                                </div>
                                <div class="rating"><span class="ratingStar"><span class="ratingOn" style="width: 80%;"></span></span> <span class="ratingScore">4.7</span></div>
                              </div>
                            </a>
                          </div>
                        </div>

                      </div>
                      <div class="swiper-button-prev"></div>
                      <div class="swiper-button-next"></div> -->
                    </div>
                    </div>
                    <!-- STAB 01 //-->
                  </div>
                  <!--카테고리 1 //-->
                 </div>
                </div>
                <!--취급상품 카테고리-->
              <!-- -->
              <div class="section03">
                <a href="/esti/estiMulti"><img src="/resources/images/main/section03.png" alt=""></a>
              </div>

              <div class="section04">
                <div class="ad_text">위콘에서 필요하신 <span>모든 상품을 구매해보세요!</span></div>
                <div class="title">BEST 상품</span></div>
                <div class="main_pd_wrap">
                  <div class="best_box">
                    <div class="best_left">
                      <div class="pd_box">
                        <ul>
                          <li>
                            <a href="" target="_blank">
                              <div class="img_box"> <img src="/resources/images/main/best_l_pd01.png"> </div>
                            </a>
                          </li>
                          <li>
                            <a href="" target="_blank">
                              <div class="img_box"> <img src="/resources/images/main/best_l_pd02.png"> </div>
                            </a>
                          </li>
                        </ul>
                      </div>
                    </div>
                    <div class="best_right">
                      <div class="pd_box">
                        <ul id="best_product_ul">
                          <li>
                            <a href="#" target="_blank">
                              <div class="img_box"> <img src="/resources/images/main/best_r_pd01.jpg"> </div>
                              <div class="brand_pd_info">
                                <p class="pd_name">[위닉스] [위닉스] 뽀송 16L 제습기 DO2E160-JW...</p>
                                <div class="pd_price">
                                  <span class="won">349,000원</span>
                                </div>
                              </div>
                            </a>
                          </li>
                          <li>
                            <a href="#" target="_blank">
                              <div class="img_box"> <img src="/resources/images/main/best_r_pd02.jpg"> </div>
                              <div class="brand_pd_info">
                                <p class="pd_name">[위닉스] 뽀송 10L 제습기 DXAE100-JWK </p>
                                <div class="pd_price">
                                  <span class="won">221,000원</span>
                                </div>
                              </div>
                            </a>
                          </li>
                          <li>
                            <a href="#" target="_blank">
                              <div class="img_box"> <img src="/resources/images/main/best_r_pd03.jpg"> </div>
                              <div class="brand_pd_info">
                                <p class="pd_name">[위닉스] 공기청정기, 제로S AZSE430-JWK </p>
                                <div class="pd_price">
                                  <span class="won">209,000원</span>
                                </div>
                              </div>
                            </a>
                          </li>
                          <li>
                            <a href="#" target="_blank">
                            <div class="img_box"> <img src="/resources/images/main/best_r_pd04.jpg"> </div>
                            <div class="brand_pd_info">
                              <p class="pd_name">[위닉스] [위닉스] 공기청정기 타워X ATGH500-J...</p>
                              <div class="pd_price">
                                <span class="won">229,000원</span>
                              </div>
                            </div>
                          </a>
                          </li>
                        </ul>

                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!--// 신상품-->
              <div class="section06">
                <div class="title">신상품</span></div>
                <div class="main_pd_wrap">

                  <div class="new_pd_box">
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-container">
                        <!-- 보여지는 영역 -->
                        <div class="swiper-wrapper" id="new_product_list">
                          <!-- <div class="swiper-slide">내용</div> 를 추가하면된다 -->
                        </div>
                       <!--  <div class="swiper-pagination"></div> -->
                      </div>
                  </div>
                </div>
              </div>
              <!-- 신상품//-->

              <div class="section05">
                <button class="btn_partner"><span class="blind">파트너 가입하기</span></button>
                <img src="/resources/images/main/section05.png" alt="">
              </div>
            </div>
        </main>
        <!--파트너-->
        <div class="layout-popup_wrap active" id="layer_pop_partner" style="display:none">
          <div class="popup_inwrap __pop_partner __pop_left">
            <div class="popup-body">
              <div class="btn_group">
                <button class="btn_join_company" onclick="location.href='/buyer/companySignUp'"><span class="blind">기업회원 가입하기</span></button>
               <button class="btn_join_seller" onclick="location.href='/seller/sellerSignUp'"><span class="blind">셀러회원 가입하기</span></button></div>
              <img src="/resources/images/main/pop_join.jpg" alt="">
            </div>
            <div class="popup-close"><button type="button" class="btn-close icon_close" id="btn-close"><span class="blind">닫기</span></button></div>
          </div>
        </div>
    <!--파트너//-->
        <div class="layout-popup_wrap active" id="layer_pop_partner" style="display:none">
          <div class="popup_inwrap __pop_partner __pop_left">
            <div class="popup-body">
              <div class="btn_group">
                <button class="btn_join_company" onclick="location.href='/buyer/companySignUp'"><span class="blind">기업회원 가입하기</span></button>
               <button class="btn_join_seller" onclick="location.href='/seller/sellerSignUp'"><span class="blind">셀러회원 가입하기</span></button></div>
              <img src="/resources/images/main/pop_join.jpg" alt="">
            </div>
            <div class="popup-close"><button type="button" class="btn-close icon_close" id="btn-close"><span class="blind">닫기</span></button></div>
          </div>
        </div>
    <!--파트너//-->
    
        <!-- S : footer -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" flush ="true"/>

        <!-- E : footer -->
