/*tab*/
/**
 * cbpFWTabs.js v1.0.0
 * http://www.codrops.com
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2014, Codrops
 * http://www.codrops.com
 */
;( function( window ) {
	
	'use strict';

	function extend( a, b ) {
		for( var key in b ) { 
			if( b.hasOwnProperty( key ) ) {
				a[key] = b[key];
			}
		}
		return a;
	}

	function CBPFWTabs( el, options ) {
		this.el = el;
		this.options = extend( {}, this.options );
  		extend( this.options, options );
  		this._init();
	}

	CBPFWTabs.prototype.options = {
		start : 0
	};

	CBPFWTabs.prototype._init = function() {
		// tabs elems
		this.tabs = [].slice.call( this.el.querySelectorAll( 'nav > ul > li' ) );
		// content items
		this.items = [].slice.call( this.el.querySelectorAll( '.content-wrap > section' ) );
		// current index
		this.current = -1;
		// show current content item
		this._show();
		// init events
		this._initEvents();
	};

	CBPFWTabs.prototype._initEvents = function() {
		var self = this;
		this.tabs.forEach( function( tab, idx ) {
			tab.addEventListener( 'click', function( ev ) {
				ev.preventDefault();
				self._show( idx );
			} );
		} );
	};

	CBPFWTabs.prototype._show = function( idx ) {
		if( this.current >= 0 ) {
			this.tabs[ this.current ].className = this.items[ this.current ].className = '';
		}
		// change current
		this.current = idx != undefined ? idx : this.options.start >= 0 && this.options.start < this.items.length ? this.options.start : 0;
		this.tabs[ this.current ].className = 'tab-current';
		this.items[ this.current ].className = 'content-current';
	};

	// add to global namespace
	window.CBPFWTabs = CBPFWTabs;

})( window );

/*조회하기*/

$(function(){
	$.ajax({
		url:"<c:url value='/fridge/fridgeSortPostdate.do'/>",
		type: 'get',
		success: function(data){
			console.log('등록일 정렬',data);
			$('#important_content').html(data);
		},
		error: function(jqWHR){
			console.log('에러',jqWHR.statusText);
		}
	})
});

$(".deadline").on('change', 'select', function() {
	  var sortBy = $("#sort-by").val();
	  console.log('sortBy',sortBy);
	  
	  if(sortBy == 1){
		  $.ajax({		
			url: "<c:url value='/fridge/sortByEnd.do'/>",
			type: 'get',
			//dataType: 'json',
			success: function(data){
				console.log('유통기한 정렬',data);
				$('#important_content').html(data);
			},
			error: function(jqWHR){
				console.log('에러',jqWHR.statusText);
			}
		})//ajax
	  }//if
	  else{
		  $.ajax({
				url:"<c:url value='/fridge/fridgeSortPostdate.do'/>",
				type: 'get',
				success: function(data){
					console.log('등록일 정렬',data);
					$('#important_content').html(data);
				},
				error: function(jqWHR){
					console.log('에러',jqWHR.statusText);
				}
		})
	  }
});

/*네비바 움직이는 기능 구현*/

(function() {
	[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
		new CBPFWTabs( el );
	});
})();


/*제이쿼리 셀렉터 플러그인(드롭다운기능 구현)*/

$(document).ready(function(){
// selectbox styling
$('select').niceSelect();
});

/*모달창 안에 유통기한 지정하는 날짜창(달력) 구현*/

function addNow() {
  nowDate = moment().tz("Europe/London").format('YYYY-MM-DD');
  nowTime = moment().tz("Europe/London").format('HH:mm:ss');
  document.getElementById('registration-date').value = nowDate;
  document.getElementById('registration-time').value = nowTime;
  set = setTimeout
  (function () { addNow(); }, 1000);
}
function stopNow() {
	clearTimeout(set);
}

/*선택삭제*/

$(function(){
		var chkObj=document.getElementsByName("RowCheck");
		var rowCnt=chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr=$("input[name='RowCheck']");
		for(var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked=this.checked;
		}
	});
	$("input[name='RowCheck']").click(function(){
		if($("input[name='RowCheck']:checked").length==rowCnt){
			$("input[name='allCheck']")[0].checked= true;
		}
		else{
			$("input[name='allCheck']")[0].checked= false;
		}
	});
});
function deleteValue(){
	var url="ingreDelete.do";
	var valueArr=new Array();
	var list=$("input[name='RowCheck']");
	for(var i=0; i<list.length; i++){
		if(list[i].checked){
			valueArr.push(list[i].value);
		}
	}
	if(valueArr.length==0){
		alert("선택된 글이 없는디용");
	}
	else{
		var chk=confirm("정말 삭제할고양?");
		$.ajax({
			url: url,
			type: 'POST',
			traditional: true,
			data: {valueArr : valueArr},
			success: function(jdata){
				if(jdata=1){
					alert("선택한 재료가 삭제되었습니다.");
					location.replace("fridgeList.do");
				}
				else{
					alert("삭제실패");
				}
			}
		});
	}
}
