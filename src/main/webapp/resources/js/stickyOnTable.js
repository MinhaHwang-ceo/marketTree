'use strict';

const StickyOnTable = {
	"getConfig":function(ta){
		let left = ta.getAttribute('data-sot-left');
		if(isNaN(left) || left == null){
			left = 0;
		}else{
			left = parseInt(left,10);
		}
		let top = ta.getAttribute('data-sot-top');
		if(isNaN(top) || top == null){
			top = 0;
		}else{
			top = parseInt(top,10);
		}
		let right = ta.getAttribute('data-sot-right');
		if(isNaN(right) || right == null){
			right = 0;
		}else{
			right = parseInt(right,10);
		}
		let bottom = ta.getAttribute('data-sot-bottom');
		if(isNaN(bottom) || bottom == null){
			bottom = 0;
		}else{
			bottom = parseInt(bottom,10);
		}
		return {
			top:top,
			left:left,
			right:right,
			bottom:bottom,
		}
	},
	"apply":function(ta){
		let table = ta.querySelector(':scope > table');
		if(!table){
			console.error("StickyOnTable.apply argument is invalid.");
			return;
		}
		let rowCellCounts = this.getRowCellCounts(table)
		this.setDataIdxforTable(table,rowCellCounts.rowCount,rowCellCounts.cellCount)
		this.reset(ta);
		let conf = Object.assign(this.getConfig(ta),rowCellCounts);
		conf.left = Math.min(conf.left,conf.cellCount)
		conf.top = Math.min(conf.top,conf.rowCount)
		this.applySticky(ta,conf);
	},
	"reset":function(ta){
		let table = ta.querySelector(':scope > table');
		if(!table){
			console.error("StickyOnTable.reset argument is invalid.");
			return;
		}
		table.querySelectorAll(':scope > * > tr > .sot-top ,:scope > * > tr > .sot-left,:scope > * > tr > .sot-bottom,:scope > * > tr > .sot-right').forEach((td, i) => {
			td.classList.remove('sot-top','sot-left','sot-bottom','sot-right')
			td.style.top = null;
			td.style.left = null;
			td.style.bottom = null;
			td.style.right = null;
		});
	},
	"getRowCellCounts":function(table){
		let rowCount = table.rows.length;
		let cellCount = 0;
		let tr,td;
		if(table.rows[0]){
			for(const td of table.rows[0].cells){
				cellCount+=td.colSpan;
			}
		}

		return {rowCount:rowCount,cellCount:cellCount}
	},
	"setDataIdxforTable":function(table,rowCount,cellCount){
		let arr = new Array(rowCount*cellCount);
		for(const tr of table.rows){
			let st = tr.rowIndex * cellCount;
			for(const td of tr.cells){
				if(st >= arr.length ){ break; }
				td.__sot_inited = true;
				while(arr[st]!==undefined ){ st++ }
				arr[st] = td;
				for(let i=2,m=td.colSpan;i<=m;i++){ arr[st+(i-1)] = td; }
				for(let i=2,m=td.rowSpan;i<=m;i++){ arr[st+cellCount*(i-1)] = td; }
			}
		};
		for(let i=0,m=arr.length;i<m;i++){
			const td = arr[i];
			if(!td.__sot_inited){continue;}
			delete td.__sot_inited;
			td.setAttribute('data-row-idx',Math.floor(i/cellCount))
			td.setAttribute('data-cell-idx',i%cellCount)
		}
	},
	"applySticky":function(div,conf) {		
		let table = div.querySelector(':scope > table');
		let tableTable = table.getBoundingClientRect();
		
		let tops = new Array(conf.rowCount);
		for(let i2=0,m2=conf.top;i2<m2;i2++){
			for(const td of table.rows[i2].cells){
				//셀마다 getBoundingClientRect() 할 경우 느려지기에 캐싱처리한다.
				const idx = parseInt(td.getAttribute('data-row-idx'),10);
				let topTd = tops[idx];
				if(topTd===undefined){
					topTd = td.getBoundingClientRect().top;
					tops[idx] = topTd;
				}
				let top = topTd - tableTable.top;
				td.classList.add('sot-top');
				td.style.top = top+'px';
			};
		}
		let lefts = new Array(conf.cellCount);
		for(let i2=0,m2=conf.left;i2<m2;i2++){
			table.querySelectorAll(':scope td[data-cell-idx="'+i2+'"] , :scope th[data-cell-idx="'+i2+'"]').forEach((td, i) => {
				const idx = parseInt(td.getAttribute('data-cell-idx'),10);
				let leftTd = lefts[idx];
				if(leftTd===undefined){
					leftTd = td.getBoundingClientRect().left;
					lefts[idx] = leftTd;
				}
				let left = leftTd - tableTable.left;				
				td.classList.add('sot-left');
				td.style.left = left+'px';
				
			});
		}

		// console.log(ta.);
		let bottoms = new Array(conf.rowCount);
		for(let i2=conf.rowCount-conf.bottom,m2=conf.rowCount;i2<m2;i2++){
			for(const td of table.rows[i2].cells){
				//셀마다 getBoundingClientRect() 할 경우 느려지기에 캐싱처리한다.
				const idx = parseInt(td.getAttribute('data-row-idx'),10);
				let bottomTd = bottoms[idx];
				if(bottomTd===undefined){
					bottomTd = td.getBoundingClientRect().bottom;
					bottoms[idx] = bottomTd;
				}
				let bottom = tableTable.bottom-bottomTd ;
				td.classList.add('sot-bottom');
				td.style.bottom = bottom+'px';
			};
		}

		let rights = new Array(conf.cellCount);
		for(let i2=conf.cellCount-conf.right,m2=conf.cellCount;i2<m2;i2++){
			table.querySelectorAll(':scope td[data-cell-idx="'+i2+'"] , :scope th[data-cell-idx="'+i2+'"]').forEach((td, i) => {
				const idx = parseInt(td.getAttribute('data-cell-idx'),10);
				let rightTd = rights[idx];
				if(rightTd===undefined){
					rightTd = td.getBoundingClientRect().right;
					rights[idx] = rightTd;
				}
				let right = tableTable.right - rightTd;
				td.classList.add('sot-right');
				td.style.right = right+'px';
			});
		}
	}


}