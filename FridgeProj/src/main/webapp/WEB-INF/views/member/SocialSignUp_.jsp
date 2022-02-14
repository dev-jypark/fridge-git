<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>찍먹냉장고 | 회원가입</title> <!-- Bootstrap CSS --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="<c:url value="/resources/css/membersignup/SignUp.css"/>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<c:url value="/resources/js/member/SignUp.js"/>"></script>
<style>
/*css가 안 먹어서 이래놨어요 미안... 스압이지만 참아줘....*/
body { 
		min-height: 100vh; 
		background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#54cfba)); 
		background: -webkit-linear-gradient(bottom left, #92b5db 0%, #54cfba 100%); 
		background: -moz-linear-gradient(bottom left, #92b5db 0%, #54cfba 100%); 
		background: -o-linear-gradient(bottom left, #92b5db 0%, #54cfba 100%); 
		background: linear-gradient(to top right, #92b5db 0%, #54cfba 100%); 
		letter-spacing: -.4px;
	} 
	.input-form { 
		max-width: 680px; 
		margin-top: 80px; 
		padding: 50px 100px; 
		background: #fff; 
		-webkit-border-radius: 10px; 
		-moz-border-radius: 10px; 
		border-radius: 10px; 
		-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
		-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
		box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15) 
	} 
	.description {
	    margin-bottom: 10px;
	    font-size: 13px;
	    color: #757575;
	    line-height: 1.4;
	}
	.lable {
	    display: block;
	    margin: 0 0 12px;
	    font-size: 15px;
	    font-weight: bold;
	    color: #292929;
	    line-height: 21px;
	    word-break: keep-all;
	}
	.checkBox-require {
	    color: #35c5f0;
	    font-size: 12px;
	    margin-left: 4px;
	}
	.checkBox-option {
	    color: #bdbdbd;
	    font-size: 12px;
	    margin-left: 4px;
	}	
</style> 
</head>
<body>
<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<h4 class="mb-3" style="font-weight: bold;">추가정보입력</h4>
			<hr/>
			<form method="post" action="SocialSignUp.do" class="validation-form" novalidate="novalidate" name="login_frm">
				<!--  input type="hidden" name="login_ok" value="1"/>-->
				<!-- 아이디 -->
				
				<div class="mb-3"> 
					<!--  <label class="lable" for="id">아이디</label>-->
					<input type="hidden" class="form-control" id="socialId" name="socialId" value="${sessionScope.socialId}" readonly="readonly" required/> 		
				</div> 
				 
				<!-- 이메일 -->				
				<div class="mb-3">
					<label class="lable" for="email">이메일</label>
					<input type="email" class="form-control" id="email" name="email" value="${sessionScope.email}" readonly="readonly" required/>				
				</div>
				<!-- 닉네임 -->
				<div class="mb-3"> 
					<label class="lable" for="nickname">별명</label>
					<div class="description">한글 2~8자</div>
					<input type="text" pattern="^[가-힣]{2,8}$" class="form-control" id="nick" name="nick" value="${sessionScope.nick}" placeholder="사용하실 별명을 입력해주세요." required/> 
					<div class="invalid-feedback"> 올바른 별명 양식이 아닙니다. 다시 확인해주세요. </div>					
					<button class="btn btn-lg btn-block" id="nicknameCheck" type="button" onclick="nicknameDuplCheck();" value="N" 
					style="border-color: #95E1D3; color: #95E1D3; margin-top:10px" 
					>중복 확인</button>
				</div>
				<!-- 주소 -->
				<div class="mb-3"> 
					<label class="lable" for="address">주소</label>
					<div class="description">동, 리까지 입력</div>
					<input type="text" pattern="([가-힣\s]+(시|군)+[가-힣0-9\s]+(구|읍|면)+[가-힣0-9\s]+(리|동))" class="form-control" id="addr" name="addr" placeholder="예) 서울시 강남구 개포1동, 달성군 다사읍 달천리" required/> 
					<div class="invalid-feedback"> 올바른 주소 양식이 아닙니다. 다시 확인해주세요. </div>					
				</div> 
				<!-- 체크박스 -->
				<label class="lable">약관동의</label>
				<div style="border: solid 1px #CED4DA; padding:20px;">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="allAgreement"/>
						<label class="custom-control-label" for="allAgreement">전체동의</label>
					</div>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" name="agree" id="agreement1" checked required/>
						<label class="custom-control-label" for="agreement1" style="font-size: 13px;">어플리케이션 사용을 위한 필수 정보 제공에 동의합니다.</label>
						<span class="checkBox-require">(필수)</span>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" name="agree" id="agreement2"/>
						<label class="custom-control-label" for="agreement2" style="font-size: 13px;">개인정보의 제3자 제공 및 마케팅 활용에 동의합니다.</label>
						<span class="checkBox-option">(선택)</span>
					</div>
				</div>
				<div class="mb-4"></div> 
				<button class="btn btn-lg btn-block" type="submit" style="background-color: #95E1D3; color: #FFFFFF; margin-top:10px"
				>회원가입</button> 
			</form> 
		</div> 
	</div> 
	<footer class="my-3 text-center text-small"> 
	<!-- <p class="mb-1">&copy; 2021 </p>--> </footer> 
</div> 
</body> 
</html>