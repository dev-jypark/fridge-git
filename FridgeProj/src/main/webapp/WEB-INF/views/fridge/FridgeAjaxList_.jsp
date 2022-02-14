<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- forEach Start -->
<c:forEach items="${list}" var="item" varStatus="loop">
	<ul class="commerce-cart__delivery-group__product-list">
	<li class="commerce-cart__delivery-group__product-item">
	<span class="commerce-cart__header__left"> 
		<label class="_3xqzr _4VN_z">
			<div class="_3zqA8">
				<input type="checkbox" class="_3UImz" name="RowCheck"
						value="${item.i_no}"> 
				<span class="_2mDYR"> 
					<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
             		<path fill="currentColor"
						d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z">
					</path>
          			</svg>
				</span>
			</div>
		</label>
	</span> <!-- 체크박스 끝-->
			
	<!-- 브로콜리 이름 띄어주기 -->
	<section class="carted-product">
	<!-- id -->
	<input type="text" class="form-control" id=""
		placeholder="작성자" name="id" value="${item.id}"
		style="display: none;">
		<!-- 재료명 -->
		<h4 class="product-small-item__title">${item.i_name}</h4>

		<!-- 수량 -->
		<div class="product-small-item__content">
			<input type='number' min='1' max='500' step='1'
				class="form-control" value="${item.i_cnt}">
		</div>
		<!-- 유통기한 프로그래스 바 -->
		<div class="clearboth">
			<div class="progress">
				<div class="progress-bar" style="min-width: 5em; width: 0px;">
					<div class="content" id="content${item.i_no}"></div>
					<!-- D-day를 뿌려주자 -->
					<input type="hidden" class="idx" value="${item.i_no}">
				</div>
			</div>
		</div>

		<div class="carted-product__footer">
			<!-- 유통기한 날짜 -->
			<span class="carted-product__footer__left">
				<p class="enddate" style="float: left;">${item.i_enddate}</p>
				<p class="enddate_copy">까지</p>
			</span>
			<!-- 상세보기 -->
			<span> 
				<a href="<c:url value="/fridge/detail.do?i_no=${item.i_no}"/>"
					type="button">상세보기</a>
			</span>
		</div>
	</section>
</c:forEach>
<!-- forEach End-->
<script>
$(function(){
	var enddate = document.getElementsByClassName("enddate");
	var content = document.getElementsByClassName("content");
	var progressBar = document.getElementsByClassName("progress-bar");
	
	
	for (var i=0; i<enddate.length; i++) {
		//console.log("enddate",enddate);
		//console.log("content",content);
		//console.log("progress-bar",progressBar);
		
		//progress바
		var dDay = enddate[i].innerHTML //2022-02-03
		//console.log("dDay",dDay);
		var startDate= new Date(dDay); //Thu Feb 03 2022 09:00:00 GMT+0900(한국표준시)
		var currentDate = new Date(); //현재 날짜 가져오기
		var distance = startDate.getTime() - currentDate.getTime(); //유통기한-현재날짜 한 숫자를 distance에 담기
		var d = Math.floor(distance / (1000 * 60 * 60 * 24)+1); //distance를 날짜로 계산하여 변환
		//console.log("d는",d);
		//console.log("distance는",distance)

		var widthbar = $(".progress").width(); //class가 progressBar인 아이들의 width
		//console.log("widthbar 여기다",$(".progress").width());

		//console.log("$('.progress-bar'+i)",$('.progress-bar'+i));
		progressBar[i].style.width=(Math.floor(distance / (1000 * 60 * 60 * 24)+1)) * (widthbar / 100)+'px';
		//console.log("궁금하다 디스턴스",(Math.floor(distance / (1000 * 60 * 60 * 24)+1)));
		//console.log("widthbar",progressBar[i].style.width);

			
		var cnt=[];
		cnt = document.getElementsByClassName("idx")[i].value;
		//console.log('cnt', document.getElementsByClassName("idx")[i].value);
		//유통기한 남았으면
		$('#content'+cnt).html(d+' 일');
		//유통기한 지나면
		if(d < 0){
			$('#content'+cnt).html(d+' 일');
			$('#content'+cnt).css('background-color','#F0E68C');
		}
		else if(d==0){
			$('#content'+cnt).html('오늘까지!');
			$('#content'+cnt).css('background-color','#F0E68C');
		}
	}//for문					
});

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
		alert("선택된 글이 없습니다.");
	}
	else{
		var chk=confirm("정말 삭제하시겠습니까?");
		$.ajax({
			url: url,
			type: 'POST',
			traditional: true,
			data: {valueArr},
			success: function(data){
				if(data=1){
					alert("선택하신 게시물이 삭제되었습니다.");
					location.replace("fridgeList.do");
				}
				else{
					alert("취소되었습니다.");
				}
			}
		});
	}
}
</script>