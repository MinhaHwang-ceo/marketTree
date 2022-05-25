/* paging */
function paging(totalSize, page, row_num ) {
	// get page parameter(clicked page number) 
	if (page == '')
		var page = 1;
	
	// showed page number - i.e. 1 2 3 4 5 ...
	var pageCount = 10;
	
	var totalPages = Math.ceil( totalSize / row_num );
	
	// total page count list
	var totalPageList = Math.ceil(totalPages / pageCount);
	
	var pageList = Math.ceil(page / pageCount);
	
	if (pageList < 1) {
		pageList = 1;
	}
	
	if (pageList > totalPageList) {
		pageList = totalPageList;
	}
	
	var startPageList = ((pageList - 1) * pageCount) + 1;
	
	var endPageList = startPageList + pageCount - 1;
	
	if (startPageList < 1) {
		startPageList = 1;
	}
	
	if (endPageList > totalPages) {
		endPageList = totalPages;
	}
	
	if (endPageList < 1) {
		endPageList = 1;
	}
	
	var pageInner = '';
	
	if (pageList < 2) {
		//pageInner += '맨 처음';
		//pageInner += '이전';
	}
	
	if (pageList > 1) 
	{
		/*pageInner += "<a href='#' onclick='firstPage(); return false;' class='a-nav-page' style='cursor:pointer;'><img src='/images/grid/icon_allprev.gif'></a>";*/
		pageInner +='<a href="#" onclick = "firstPage();" class="page-first"><i>처음 페이지로</i></a>';
		/*pageInner += "<a href='#' onclick='prePage("+totalSize+", "+page+"); return false;' class='a-nav-page' style='cursor:pointer;'><img src='/images/grid/icon_prev.gif'></a>";*/
		pageInner += "<a href='#' onclick='prePage("+totalSize+", "+page+"); class='page-prev'><i>이전 페이지로</i></a>";
	}
	
	for (var i = startPageList; i <= endPageList; i++) {
		if (i == page) {
			pageInner = pageInner + "<a href='#' onclick='goPage("+(i)+"); return false;' id='"+(i)+"' class='a-nav-page' style='cursor:pointer;'><strong>"+(i)+"</strong></a>";
		} else {
			pageInner = pageInner + "<a href='#' onclick='goPage("+(i)+"); return false;' id='"+(i)+"' class='a-nav-page' style='cursor:pointer;'>"+(i)+"</a>";
		}
	}
	
	if (totalPageList > pageList) 
	{
		/*pageInner = pageInner + "<a href='#' onclick='nextPage("+totalSize+", "+page+"); return false;' class='a-nav-page' style='cursor:pointer;'><img src='/images/grid/icon_next.gif'></a>";*/
		/*pageInner = pageInner + "<a href='#' onclick='lastPage("+totalSize+"); return false;' class='a-nav-page' style='cursor:pointer;'><img src='/images/grid/icon_allnext.gif'></a>";*/
		
		pageInner += "<a class='page-next' href='javascript:nextPage("+ totalSize+", "+page  +")'><i>다음 페이지로</i></a>";
		pageInner += "<a class='page-last' href='javascript:lastPage("+ totalSize+", "+page  +")'><i>마지막 페이지로</i></a></div>";
	}
	
	if (totalPageList == pageList) {
		//pageInner += "다음";
		//pageInner += "마지막";
	}
	
	$('.paging').html("");
	$('.paging').append(pageInner);
}

function firstPage() {
	var page = 1;
	doSearch(page);
}

function prePage(totalSize, page) {
	var pageCount = 10;
	page -= pageCount;
	pageList = Math.ceil(page / pageCount);
	page = (pageList - 1) * pageCount + pageCount;
	
	doSearch(page);
}

function nextPage(totalSize, page) {
	var pageCount = 10;
	page += pageCount;
	pageList = Math.ceil(page / pageCount);
	page = (pageList - 1) * pageCount + 1;
	
	doSearch(page);
}

function lastPage(totalSize) {
	doSearch(totalSize);
}

function goPage(num) {
	doSearch(num);
}