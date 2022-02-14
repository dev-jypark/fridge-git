<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/FridgeTop.jsp"/>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport"
		content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,viewport-fit=cover">
	<meta charset="EUC-KR">
	
	<title>찍먹냉장고 | 냉장고 꺼내보기</title>
		<!-- css(외부라이브러리) -->	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
		<!-- 내가만든 css,js -->
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/fridgelist/fridgelist.css"/>" />		
		<script src="<c:url value="/resources/js/fridgelist/fridgelist.js"/>"></script>   
		<!-- js(외부라이브러리) -->
		<script src="http://momentjs.com/downloads/moment-timezone-with-data.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
	</head>
<body>
<script>
    function showPopup(){
    	 window.open("http://192.168.35.89:10000/","챗봇시작","width=700, height=600, top=50%, left=50%");
    }
    
</script>

	<form class="css-1hs06u0-LayoutContainer">
		<!-- 상단구역 시작 -->
		<section class="sectionedit">
			<!-- 검색창 -->
			<!-- <div class="search-box">
				<input type="text" class="search-txt" name="" placeholder="재료를 검색해보세요">
				<a class="search-btn" href="#">
					<i class="fas fa-search"></i>
				</a>
			</div> -->
			<!-- 검색창 끝 -->
		</section>
				<!-- 내용 끝 -->
		<!-- <div class="chatbot_icon" style="display:flex; JUSTIFY-CONTENT:flex-end;"> -->
		
		<!-- </div> -->
		<!-- 상단구역 끝 -->
		<!-- 내용 시작 -->
		<div class="commerce-cart-wrap">
			<div class="commerce-cart row">
				<!-- 체크박스~유통기한순~선택삭제 부분 div 시작 -->
				
				<div class="commerce-cart__content">	
					<img onclick="showPopup();" style="width:100px; position:fixed; right:60px; bottom:10px" src="<c:url value="/resources/images/chatbot/chatbot.png"/>"/>
				<div data-sticky-enabled="false" data-sticky-disabled="false"
					data-sticky-always="false" data-sticky-ignore="false"
					data-direction="top" data-offset="0"
					class="sticky-container commerce-cart__header-wrap"
					style="position: sticky; top: 0px;">	
						<div class="sticky-child commerce-cart__header" style="position: relative;">
							<!-- 체크박스 모두선택 -->
							<span class="commerce-cart__header__left">
								<label class="_3xqzr _4VN_z">
									<div class="_3zqA8">
										<input type="checkbox" class="_3UImz" name="allCheck" value="">
										<span class="_2mDYR">
											<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
												<path fill="currentColor"
												d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path>
											</svg>
										</span>
									</div>
									<span class="_1aN3J">
										<span class="commerce-cart__header__caption">모두선택</span>
									</span>
								</label>
							</span>
							<!--모두선택 끝--> 
							<!-- 유통기한&등록순 보기 -->														
							<div class="deadline">
								<select class="myselect" id="sort-by" name="getoption">
									<option value="0">등록순</option>
									<option value="1">유통기한 임박순</option>
								</select> 
							</div>
				
							<div>

								<!-- <button class="commerce-cart__header__caption" type="button" data-toggle="modal" data-target="#addfridgeModal">냉장고 추가하기</button> -->
								<div class="glyone">
									<a href="<c:url value="/fridge/fridgeWrite.do"/>"><span class="glyphicon glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
								</div>
								<div class="glytwo">
									<a href="<c:url value="/receipe/imageList.do"/>"><span class="glyphicon glyphicon glyphicon-picture" aria-hidden="true"></span></a>
								</div>
								<!-- 모달 -->
								<div class="modal fade" id="addfridgeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							        	<span aria-hidden="true">&times;</span>
							        </button>
							       <span>냉장고 추가하기</span>
							      </div>
							      <div class="modal-body">
							        <form>
							          <div class="form-group">
							            <label for="recipient-name" class="control-label">추가할 냉장고 이름</label>
							            <input type="text" class="form-control" id="">
							          </div> 
							        </form>
							      </div>
							      <!-- 모달 취소&확인 버튼 -->
										<div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-primary">만들기</button>
							      </div>
							    </div>
							  </div>
							</div>
							<!-- 모달끝 -->
							</div>
							<!-- 선택삭제 -->
							<span class="commerce-cart__header__right">
								<input type="button" class="commerce-cart__header__delete" value="선택삭제" onclick="deleteValue();">
							</span>
						</div>
						<!-- id -->
						<%-- <input type="text" class="form-control" id=""
							placeholder="작성자" name="id" value="${sessionScope.id}"
							style="display: none;"> --%>
					</div>
					<!-- 체크박스~유통기한순~선택삭제 부분 div 끝 -->
					<ul class="commerce-cart__content__group-list ">
						<li class="commerce-cart__content__group-item">
							<article class="commerce-cart__group">
								<h1 class="commerce-cart__group__header">기본냉장고</h1>
								<ul class="commerce-cart__group__item-list">
									<li class="commerce-cart__group__item">
							
                                   
                                   	<section class="commerce-cart__delivery-group" id="important_content">                                  		
									<!-- foreach -->
									<!-- 재료 목록 넣어줄 자리 -->
                                   	</section>
                                   
                                   
                                    <!-- 모달 -->
                                   	<div class="modal fade" id="exampleModal" tabindex="-1"
                                       role="dialog" aria-labelledby="exampleModalLabel">
                                       <div class="modal-dialog" role="document">
                                          <div class="modal-content">  
                                          </div>
                                       </div>
                                    </div>
                                   	<!-- 모달끝 -->
                                	<!-- 브로콜리 끝 -->
														
										<!-- 냉장고 관리하기 시작 -->	
										<footer class="commerce-cart__delivery-group__footer">
											<p class="commerce-cart__delivery-group__group-link">
												<a class="commerce-cart__delivery-group__group-link__link" data-toggle="modal" data-target="#editfridgeModal">냉장고 관리하기 
													<svg class="icon" width="1em" height="1em" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
														<path fill="currentColor" fill-rule="nonzero" d="M6 19.692L8.25 22 18 12 8.25 2 6 4.308 13.5 12z"></path>
													</svg>
												</a>
											</p>
										</footer>
											<!-- 모달 -->
											<div class="modal fade" id="editfridgeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
										  <div class="modal-dialog" role="document">
										    <div class="modal-content">
										      <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
										        	<span aria-hidden="true">&times;</span>
										        </button>
										       <span>냉장고 관리하기</span>
										      </div>
										      <div class="modal-body">
										        <form>
										          <div class="form-group">
										            <label for="recipient-name" class="control-label">수정할 냉장고 이름</label>
										            <input type="text" class="form-control" id="">
										          </div> 
										        </form>
										      </div>
										      <!-- 모달 취소&확인 버튼 -->
													<div class="modal-footer">
														<div class="modal-footer_first">
															<button type="button" class="delete_fridge">이 냉장고 삭제하기</button>
														</div>
														<div class="modal-footer_second">
											        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
											        <button type="button" class="btn btn-default" style="background-color: #c3eee6;color: white;">확인</button>
										        </div>
										      </div>
										    </div>
										  </div>
										</div>
										<!-- 모달끝 -->									
										<!-- 냉장고 관리하기 끝 -->	
									</li>
								</ul>
							</article>
						</li>
					</ul>
			</div>
		</div>
	</form>
	
	<script>
	<!-- 등록일 순 조회하기 -->
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
	
	<!-- 유통기한 순 조회하기 -->	
	$(".deadline").on('change', 'select', function() {
		  var sortBy = $("#sort-by").val();
		  console.log('sortBy',sortBy);
		  
		  if(sortBy == 1){
			  $.ajax({		
				url: "<c:url value='/fridge/sortByEnd.do'/>",
				type: 'get',
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

	<!-- 네비바 움직이는 기능 구현-->
	(function() {
		[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
			new CBPFWTabs( el );
		});
	})();

	<!-- 제이쿼리 셀렉터 플러그인(드롭다운기능 구현)-->
	$(document).ready(function(){
    // selectbox styling
    $('select').niceSelect();
	});

	<!-- 모달창 안에 유통기한 지정하는 날짜창(달력) 구현 -->
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

	</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />