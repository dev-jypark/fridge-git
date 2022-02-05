<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/FridgeTop.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찍먹냉장고 | 재료 작성하기</title>
<!-- css(외부라이브러리) -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<!-- 내가만든 css,js -->
<link rel="stylesheet" type="text/css"
	href="../resources/css/fridgelist/fridgelist.css" />
<script src="../resources/js/fridgelist/fridgelist.js"></script>
<!-- js(외부라이브러리) -->
<script src="http://momentjs.com/downloads/moment-timezone-with-data.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
</head>
<body>
<script>

/* function fn_addform(){
	$('.addform').click (function(){
		//var addIngre = "<input type=\"text\" class=\"form-control" id="" placeholder="작성자" name="id" value="${sessionScope.id}" style="display: none;">"
		$('.carted-product-copy').append('<input type="text" class="form-control" id="" placeholder="작성자" name="id" value="${sessionScope.id}" style="display: none;"> <div class="form-group" style="float: left; margin-right: 30px; width: 350px;"><label for="recipient-name" class="control-label">재료명</label> <input type="text" class="form-control" id="" placeholder="재료명" name="i_name" value=""></div> <div class="form-group"style="float: left; margin-right: 30px; width:150px;"> <label for="recipient-name" class="control-label">수량</label> <input type='number' min='1' max='500' step='1' class="form-control" name="i_cnt" id="" placeholder="수량" value=""></div><div class="form-group registration-date"style="float: left; width: 310px;"> <label for="recipient-name" class="control-label">유통기한</label> <div class="input-group registration-date-time"><span class="input-group-addon" id="basic-addon1"> <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> </span> <input class="form-control" name="i_enddate" id="registration-date" type="date" value=""></div></div>');//end append
	});	 
	
		//var addIngre = "<input type=\"text\" class=\"form-control" id="" placeholder="작성자" name="id" value="${sessionScope.id}" style="display: none;">"
		$('.carted-product-copy').append('<input type="text" class="form-control" id="" placeholder="작성자" name="id" value="${sessionScope.id}" style="display: none;"> <div class="form-group" style="float: left; margin-right: 30px; width: 350px;"><label for="recipient-name" class="control-label">재료명</label> <input type="text" class="form-control" id="" placeholder="재료명" name="i_name" value=""></div> <div class="form-group"style="float: left; margin-right: 30px; width:150px;"> <label for="recipient-name" class="control-label">수량</label> <input type='number' min='1' max='500' step='1' class="form-control" name="i_cnt" id="" placeholder="수량" value=""></div><div class="form-group registration-date"style="float: left; width: 310px;"> <label for="recipient-name" class="control-label">유통기한</label> <div class="input-group registration-date-time"><span class="input-group-addon" id="basic-addon1"> <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> </span> <input class="form-control" name="i_enddate" id="registration-date" type="date" value=""></div></div>');//end append

} */
</script>
	<form name="insertForm" method="POST" action="insert.do">
		<!-- 상단구역 시작 -->
		<section class="sectionedit"></section>
		<!-- 상단구역 끝 -->
		<!-- 내용 시작 -->
		<div class="commerce-cart-wrap">
			<div class="commerce-cart row">
				<!-- 추가등록 시작 -->
				<div class="commerce-cart__content">
					<div data-sticky-enabled="false" data-sticky-disabled="false"
						data-sticky-always="false" data-sticky-ignore="false"
						data-direction="top" data-offset="0"
						class="sticky-container commerce-cart__header-wrap"
						style="position: sticky; top: 0px;">
						<div class="sticky-child commerce-cart__header"
							style="position: relative;">
							<!-- 재료 추가 등록 -->
							<span class="commerce-cart__header__right"> 
							<input type="button" class="addform"
								value="+ 추가등록">
							</span>
						</div>
					</div>
					<!-- 추가등록 끝 -->
					<ul class="commerce-cart__content__group-list ">
						<li class="commerce-cart__content__group-item">
							<article class="commerce-cart__group">
								<h1 class="commerce-cart__group__header">재료 작성하기</h1>
								<ul class="commerce-cart__group__item-list">
									<li class="commerce-cart__group__item">
	
										<section class="commerce-cart__delivery-group-copy"
											id="important_content">
											<!-- foreach -->
											<ul class="commerce-cart__delivery-group__product-list">
												<li class="commerce-cart__delivery-group__product-item" id="hereDouble">
													<!-- 여러개입력하기 -->
													
													
													<c:forEach items="${foodArr}" var="item" varStatus="loop">
														<section class="carted-product-copy" style="margin-bottom: 20px;display: flex;">												
															<!-- id -->
															<input type="text" class="form-control" placeholder="작성자" name="id" value="${sessionScope.id}" style="display: none;">
															<!-- 재료명 -->
															
																<div class="form-group"
																	style="margin-right: 30px; width: 350px;">
																	<label for="recipient-name" class="control-label">재료명</label>
																	<input type="text" class="form-control" placeholder="재료명" name="i_name" value="${item.value}">
																</div>
															
															<!-- 수량 -->
															<div class="form-group" style="margin-right: 30px; width:130px;">
																<label for="recipient-name" class="control-label">수량</label>
																<input type='number' min='1' max='500' step='1' class="form-control" name="i_cnt" placeholder="수량" value="">
															</div>
															<!-- 유통기한 -->
															<div class="form-group" style="width: 280px; margin-bottom: 20px;">
																<label for="recipient-name" class="control-label">유통기한</label>
																<div class="input-group registration-date-time">
																	<span class="input-group-addon" id="basic-addon1">
																		<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
																	</span>
																	<input class="form-control" name="i_enddate" id="registration-date" type="date" value="">
																</div>
															</div>
															<button type="button" class="deleteform" 
																	style="margin-bottom: 80px; margin-left: 30px; font-size: 15px; border:none; background-color: #fafafa; color:#ededed;">
													        	<span class="glyphicon glyphicon-remove" onclick="deletebutton(this);" aria-hidden="true"></span>
													        </button>
														</section>
													</c:forEach> 
													
													
												</li>
											</ul>
										</section> 
									</li>
									<!-- 취소 & 확인 --> 
									<footer class="commerce-cart__delivery-group__footer">
											<div class="okCancle" style="text-align: right;">
												<button type="button" class="btn btn-default">
													<a href="/app/fridge/fridgeList.do">취소</a>
												</button>
												<input type="submit" class="btn btn-default" id="submit"
													style="background-color: #c3eee6; color: white;" value="확인"/>
											</div>
										</footer>
								</ul>
							</article>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</form><!-- </form> -->
	<script>
	/* 추가 */
	$('.addform').click (function(){
		var appendIngre = "<section class=\"carted-product-copy\" style=\"margin-bottom: 20px;display: flex;\">";
		appendIngre += "<input type=\"text\" class=\"form-control\" placeholder=\"작성자\" name=\"id\" value=\"${sessionScope.id}\" style=\"display: none;\">";
		appendIngre += "<div class=\"form-group\"style=\"margin-right: 30px; width: 350px;\">";
		appendIngre += "<label for=\"recipient-name\" class=\"control-label\">재료명</label>";
		appendIngre += "<input type=\"text\" class=\"form-control\" placeholder=\"재료명\" name=\"i_name\" value=\"\">";
		appendIngre += "</div>";
		appendIngre += "<div class=\"form-group\" style=\"margin-right: 30px; width:130px;\">";
		appendIngre += "<label for=\"recipient-name\" class=\"control-label\">수량</label>";
		appendIngre += "<input type='number' min='1' max='500' step='1' class=\"form-control\" name=\"i_cnt\" placeholder=\"수량\" value=\"\">";
		appendIngre += "</div>";
		appendIngre += "<div class=\"form-group\" style=\"width: 280px;margin-bottom: 20px;\">";
		appendIngre += "<label for=\"recipient-name\" class=\"control-label\">유통기한</label>";
		appendIngre += "<div class=\"input-group registration-date-time\">";
		appendIngre += "<span class=\"input-group-addon\" id=\"basic-addon1\">";
		appendIngre += "<span class=\"glyphicon glyphicon-calendar\" aria-hidden=\"true\"></span>";
		appendIngre += "</span>";
		appendIngre += "<input class=\"form-control\" name=\"i_enddate\" id=\"registration-date\" type=\"date\" value=\"\">";
		appendIngre += "</div>";
		appendIngre += "</div>";
		appendIngre += "<button type=\"button\" class=\"deleteform\" style=\"margin-bottom: 80px; margin-left: 30px; font-size: 15px;border:none; background-color: #fafafa; color:#ededed;\">";
		appendIngre += "<span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span>";
		appendIngre += "</button>";
		appendIngre += "</section>";
		
		console.log("찍히나?",appendIngre);
		
		$('#hereDouble').append(appendIngre);
	});
	/* 삭제 */
	/* $('.deleteform').click(function(){
		$(this).parent().remove();
	}); */
	function deletebutton(obj){
		var div=$(obj).parent().parent();
		console.log('div',div);
		div.remove();
	}
	/* 동적 추가한 태그의 값전달 */
	$('#submit').click (function(){
	$('form[name="insertForm"]').serialize();
	$('form[name="insertForm"]').attr('method','POST');
	$('form[name="insertForm"]').attr('action','insert.do');
	
	$('form[name="insertForm"]').submit();	
	});
	/* 유효성검증 */
	$('#submit').click (function(){
		var form=document.insertForm;
		if($('input[name=i_name]').val() == ''){
			alert('재료명을 입력해주세요');
			return false;
		}
		if($('input[name=i_cnt]').val() == ''){
			alert('수량을 입력해주세요');
			return false;
		}
		else if($('input[name=i_enddate]').val() == ''){
			alert('유통기한을 입력해주세요');
			return false;
		}
	});
	
	</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />