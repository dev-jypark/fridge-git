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
		<link rel="stylesheet" type="text/css" href="../resources/css/fridgelist/fridgelist.css" />		
		<script src="../resources/js/fridgelist/fridgelist.js"></script>   
		<!-- js(외부라이브러리) -->
		<script src="http://momentjs.com/downloads/moment-timezone-with-data.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
	</head>
<body>
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
		<!-- 상단구역 끝 -->
		<!-- 내용 시작 -->
		<div class="commerce-cart-wrap">
			<div class="commerce-cart row">
				<!-- 체크박스~유통기한순~선택삭제 부분 div 시작 -->
				<div class="commerce-cart__content">	
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
										<input type="checkbox" class="_3UImz" value="">
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
								<select class="myselect">
									<option value="0">유통기한 임박순</option>
									<option value="1">등록순</option>
								</select> 
							</div>
				
							<div>

								<!-- <button class="commerce-cart__header__caption" type="button" data-toggle="modal" data-target="#addfridgeModal">냉장고 추가하기</button> -->
								<div class="glyone">
									<a href="<c:url value="/fridge/fridgeWrite.do"/>"><span class="glyphicon glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
								</div>
								<div class="glytwo">
									<a href=""><span class="glyphicon glyphicon glyphicon-picture" aria-hidden="true"></span></a>
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
							
							
							<span class="commerce-cart__header__right">
								<button class="commerce-cart__header__delete" type="button">선택삭제</button>
							</span>
						</div>
						
					</div>
					<!-- 체크박스~유통기한순~선택삭제 부분 div 끝 -->
					<ul class="commerce-cart__content__group-list ">
						<li class="commerce-cart__content__group-item">
							<article class="commerce-cart__group">
								<h1 class="commerce-cart__group__header">기본냉장고</h1>
								<ul class="commerce-cart__group__item-list">
									<li class="commerce-cart__group__item">
							
                                    <!-- forEach Start-->
                                   <section class="commerce-cart__delivery-group">		
									<c:forEach items="${list}" var="item" varStatus="loop">
                                       <ul class="commerce-cart__delivery-group__product-list">
                                          <li class="commerce-cart__delivery-group__product-item">
                                             <span class="commerce-cart__header__left"> <label
                                                class="_3xqzr _4VN_z">
                                                   <div class="_3zqA8">
                                                      <input type="checkbox" class="_3UImz" >
                                                      <span class="_2mDYR"> <svg width="1em"
                                                            height="1em" viewBox="0 0 16 16" class="_2UftR">
                                                      <path fill="currentColor"
                                                               d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path>
                                                   </svg>
                                                      </span>
                                                   </div>
                                             </label>
                                          </span> <!-- 체크박스 끝-->
                                          <!-- 브로콜리 이름 띄어주기 -->
                                             <section class="carted-product">
                                                <h4 class="product-small-item__title">${list[0].i_name}</h4>
                                               
                                                <!-- 수량 -->
                                                <div class="product-small-item__content">
                                                   <input type='number' min='1' max='500' step='1'
                                                      class="form-control" value="${list[0].i_cnt}">
                                                </div>
                                                <!-- 유통기한 프로그래스 바 -->
                                                <div class="clearboth">
                                                   <div class="progress">
                                                      <div class="progress-bar">+9</div>
                                                   </div>
                                                </div>
                                                <div class="carted-product__footer">
                                                   <!-- 유통기한 날짜 -->
                                                   <span class="carted-product__footer__left">
                                                      <p class="css-f55hds-Caption">${list[0].i_enddate}까지</p>
                                                   </span>
                                                   <!-- 상세보기 -->
                                                   <span class="carted-product__subtotal">
                                                      <button class="carted-product__edit-btn"
                                                         href="#signup" type="button" data-toggle="modal"
                                                         data-target="#exampleModal">상세보기</button>
                                                   </span>
                                                   <!-- 모달 -->
                                                   <div class="modal fade" id="exampleModal" tabindex="-1"
                                                      role="dialog" aria-labelledby="exampleModalLabel">
                                                      <div class="modal-dialog" role="document">
                                                         <div class="modal-content">
                                                            <div class="modal-header">
                                                               <button type="button" class="close"
                                                                  data-dismiss="modal" aria-label="Close">
                                                                  <span aria-hidden="true">&times;</span>
                                                               </button>
                                                               <span>재료 상세보기</span>
                                                            </div>
                                                            <div class="modal-body">
                                                               <form>
                                                                  <div class="form-group">
                                                                     <label for="recipient-name" class="control-label">재료명</label>
                                                                     <input type="text" class="form-control" id="" placeholder="재료명" value="${list[0].i_name}">
                                                                  </div>
                                                                  <div class="form-group">
                                                                     <label for="recipient-name" class="control-label">수량</label>
                                                                     <input type='number' min='1' max='500' step='1'
                                                                        class="form-control" id="" placeholder="수량" value="${list[0].i_cnt}">
                                                                  </div>
                                                                  <div class="form-group registration-date">
                                                                     <label for="recipient-name" class="control-label">유통기한</label>
                                                                     <div class="input-group registration-date-time">
                                                                        <span class="input-group-addon"
                                                                           id="basic-addon1"><span
                                                                           class="glyphicon glyphicon-calendar"
                                                                           aria-hidden="true"></span></span> <input
                                                                           class="form-control" name="registration_date"
                                                                           id="registration-date" type="date" value="${list[0].i_enddate}">
                                                                     </div>
                                                                  </div>
                                                                  <div>
                                                                     <label for="recipient-name" class="control-label">등록일</label>
                                                                     <div>
                                                                        <b>${list[0].i_postdate}</b>
                                                                     </div>
                                                                  </div>
                                                               </form>
                                                            </div>
                                                            <!-- 모달 취소&확인 버튼 -->
                                                            <div class="modal-footer">
                                                               <button type="button" class="btn btn-default"
                                                                  data-dismiss="modal">취소</button>
                                                               <button type="button" class="btn btn-primary">확인</button>
                                                            </div>
                                                         </div>
                                                      </div>
                                                   </div>
                                                   <!-- 모달끝 -->
                                                </div>
                                                </section>
                                               </c:forEach> <!-- forEach End-->
                                             </section> 
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
											        <button type="button" class="btn btn-primary">확인</button>
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
	<!-- 내용 끝 -->
	<!-- 네비바 움직이는 기능 구현-->
	<script>
		(function() {
			[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
				new CBPFWTabs( el );
			});
		})();
	</script>
	<!-- 프로그래스 바 D-Day 남은 날짜 자동으로 구하기 -->
	<script>
		(function(){
			var widthbar = $('.progress-bar').width();
		
			var counter = function(){
				var startDate = new Date("2022/1/25 18:00:00") //디데이 (날짜 설정)
					setInterval(function(){
						var currentDate = new Date(); //현재 날짜 가져오기
						var distance = startDate.getTime() - currentDate.getTime();
						var d = Math.floor(distance / (1000 * 60 * 60 * 24)+1);
						var h = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
						var m = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
						var s = Math.floor((distance % (1000 * 60)) / 1000);
					
						if(s < 10){ s = '0'+s;}
						$('.content').html(d+'day'+ h +'시'+ m +'분'+ s+'초 남았습니다.' )
						console.log(d);
						$('.progress-bar').css({
							width: d * (widthbar / 31) +'px' //여기서 31은 1일부터 ~ 31일까지 기준이다.
						})
				}, 1000);
			}
			counter();
			
		})();
	</script>
	<!-- 제이쿼리 셀렉터 플러그인(드롭다운기능 구현)-->
	<script>
		$(document).ready(function(){
	    // selectbox styling
	    $('select').niceSelect();
		});
	</script>
	<!-- 모달창 안에 유통기한 지정하는 날짜창(달력) 구현 -->
	<script>
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