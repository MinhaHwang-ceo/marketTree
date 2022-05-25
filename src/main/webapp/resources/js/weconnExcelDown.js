function fn_ExcelDownload(tid,sheetName,fileName){ 
	  // step 1. workbook 생성
	  var wb = XLSX.utils.book_new();

	  // step 2. 시트 만들기 
	  var newWorksheet = excelHandler.getWorksheet(tid);

	  // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
	  XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName(sheetName));

	  // step 4. 엑셀 파일 만들기 
	  var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

	  // step 5. 엑셀 파일 내보내기 
	  saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName(fileName));
	}

	var excelHandler = {
	    getExcelFileName : function(fileName){
	        return fileName + '.xlsx';	//파일명
	    },
	    getSheetName : function(sheetName){
	        return sheetName;	//시트명
	    },
	    getExcelData : function(tid){
	        return document.getElementById(tid); 	//TABLE id
	    },
	    getWorksheet : function(tid){
	        return XLSX.utils.table_to_sheet(this.getExcelData(tid));
	    }
	}

	function s2ab(s) { 
	  var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
	  var view = new Uint8Array(buf);  //create uint8array as viewer
	  for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
	  return buf;    
	}