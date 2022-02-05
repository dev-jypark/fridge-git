<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/FridgeTop.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찍먹냉장고 | 재료 수정하기</title>
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

<form method="post" action="edit.do">
	<div class="commerce-cart-wrap"
		style="display: flex; align-items: center; justify-content: center;">
		<div class="commerce-cart" style="width: 30%;">
			<div class="cart-wrap" 
				style="padding: 5px 30px 15px 30px; background-color: #fafafa; border: 1px solid #ededed; border-radius: 7px; margin-top: 180px;">

				<h1 class="commerce-cart__group__header"
					style="margin-top: 20px; border-bottom: 1px solid #ededed;">재료
					수정하기</h1>


				<div class="form-group" style="margin-top: 20px;">
					<input type="text" class="form-control" id="" placeholder="재료번호" 
						name="i_no" value="${data.i_no}" style="display: none;">
				</div>
				
				<input type="text" class="form-control" placeholder="작성자"
						name="id" value="${sessionScope.id}" style="display: none;">
				
				<div class="form-group">
					<label for="recipient-name" class="control-label">재료명</label> <input
						type="text" class="form-control" id="" placeholder="재료명"
						name="i_name" value="${data.i_name}">
				</div>
				<div class="form-group">
					<label for="recipient-name" class="control-label">수량</label> <input
						type='number' min='1' max='500' step='1' class="form-control"
						name="i_cnt" id="" placeholder="수량" value="${data.i_cnt}">
				</div>
				<div class="form-group registration-date">
					<label for="recipient-name" class="control-label">유통기한</label>
					<div class="input-group registration-date-time">
						<span class="input-group-addon" id="basic-addon1"> <span
							class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
						</span> <input class="form-control" name="i_enddate"
							id="registration-date" type="date" value="${data.i_enddate}">
					</div>
				</div>
				<!-- 모달 취소&확인 버튼 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default">
						<a href="/app/fridge/fridgeView.do">취소</a>
					</button>
					<button class="btn btn-default" type="submit" style="background-color: #c3eee6; color: white;">확인</button>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- </form> -->
</body>
</html>
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />