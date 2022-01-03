<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>찍먹냉장고 | 회원가입</title> <!-- Bootstrap CSS --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="../../../resources/css/member/SignUp.css" rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../../../resources/js/member/SignUp.js"></script> 

</head>
<body>
<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<h4 class="mb-3" style="font-weight: bold;">회원가입</h4>
			<div class="socialLoginTitle">SNS 계정으로 간편하게 회원가입</div>
			<!-- 소셜로그인 로고 자리 -->
			<ul class="css-1k406r0-SNSList e111gxds1">
				<li class="css-1balhvh-SNSItem e111gxds0">
					<a href="#">
					<img id="kakao" alt="카카오 로그인" src="../../../resources/image/member/kakao.png">
					</a>
				</li>
				<li class="css-1balhvh-SNSItem e111gxds0">
					<a href="#">
					<img id="naver" alt="네이버 로그인" src="../../../resources/image/member/naver.png" style="width:183px; heigth: 45px;">
					</a>
				</li>
			</ul>			
			<hr/>
			<form class="validation-form" novalidate="novalidate">
				<!-- 아이디 -->
				<div class="mb-3"> 
					<label class="lable" for="id">아이디</label>
					<div class="description">영문이나 영문, 숫자 포함 4~12자</div>
					<input type="text" pattern="^[a-z0-9_-]{4,12}$" class="form-control" id="userId" placeholder="아이디를 입력해주세요." required/> 
					<!-- <img alt="체크마크" src="check.png" id="checkSucess" style=" width:38px; height:38px;"> -->
					<div class="invalid-feedback"> 올바른 아이디 양식이 아닙니다. 다시 확인해주세요. </div>
					<button class="btn btn-lg btn-block" id="idCheck" onclick="idDuplCheck();"
					style="border-color: #95E1D3; color: #95E1D3; margin-top:10px" 
					>중복 확인</button>
					
				</div> 
				<!-- 이메일 -->				
				<div class="mb-3">
					<label class="lable" for="email">이메일</label>
					<!-- 셀렉트로 이메일 주소 선택하기
					<div class="input-group email-input">
						<span class="email-input__local">
						<input type="email" class="form-control" placeholder="이메일"></span>
						<span class="email-input__separator">@</span>
						<select class="form-control">
							<option value="">선택해주세요</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="outlook.com">outlook.com</option>
							<option value="icloud.com">icloud.com</option>
							<option value="_manual">직접 입력</option>
						</select>
					</div> 
					-->
					<input type="email" pattern="^[A-Za-z0-9_\.\-]+@[a-z\-]+\.[a-z\-]+" class="form-control" id="userEmail" placeholder="you@example.com" required/>
					<div class="invalid-feedback"> 올바른 이메일 양식이 아닙니다. 다시 확인해주세요. </div>
					<button class="btn btn-lg btn-block" id="emailCheck" onclick="certification();"
					style="border-color: #95E1D3; color: #95E1D3; margin-top:10px" 
					type="button">인증하기</button>
					<!-- <button class="btn btn-lg btn-block" style="border-color: #95E1D3; color: #95E1D3; margin-top:10px" type="submit">이메일 확인</button> -->
				</div>
				<!-- 폰번호
				<div class="mb-3"> 
					<label class="lable" for="phone">휴대폰번호</label>
					<div class="description">- 없이 숫자만 입력</div>
					<div class="description"></div>
					<input type="text" pattern="^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$" class="form-control" id="phone" placeholder="휴대폰 번호를 입력해주세요." required> 
					<div class="invalid-feedback"> 올바른 휴대폰번호 양식이 아닙니다. 다시 확인해주세요. </div>
				</div>  -->
				
				<!-- 비밀번호 -->
				<div class="mb-3"> 
					<label class="lable" for="pwd1">비밀번호</label>
					<div class="description">영문, 숫자, 특수문자를 포함한 8~20자</div>
					<div class="description"></div>
					<input type="password" pattern="(?=.*[a-zA-Z]+)(?=.*[0-9]+)(?=.*[`~!@@#$%^&*|₩₩₩'₩;:₩/?]+).{8,20}" class="form-control" id="pwd1" placeholder="비밀번호를 입력해주세요." onchange="pwdCheck()" required/> 
					<div class="invalid-feedback"> 올바른 비밀번호 양식이 아닙니다. 다시 확인해주세요.  </div> 
					
				</div> 
				<!-- 비밀번호 확인 -->
				<div class="mb-3"> 
					<label class="lable" for="pwd2">비밀번호 확인</label>
					<input type="password" pattern="(?=.*[a-zA-Z]+)(?=.*[0-9]+)(?=.*[`~!@@#$%^&*|₩₩₩'₩;:₩/?]+).{8,20}" class="form-control" id="pwd2" placeholder="비밀번호를 한번 더 입력해주세요." onchange="pwdCheck()" required/> 
					<div class="invalid-feedback"> 올바른 비밀번호 양식이 아닙니다. 다시 확인해주세요.  </div>						
				</div>
				
				<!-- 닉네임 -->
				<div class="mb-3"> 
					<label class="lable" for="nickname">별명</label>
					<div class="description">한글 2~8자</div>
					<input type="text" pattern="^[가-힣]{2,8}$" class="form-control" id="nickname" placeholder="사용하실 별명을 입력해주세요." required/> 
					<div class="invalid-feedback"> 올바른 별명 양식이 아닙니다. 다시 확인해주세요. </div>					
				</div>
				
				<!-- 주소 -->
				<div class="mb-3"> 
					<label class="lable" for="address">주소</label>
					<div class="description">동, 리까지 입력</div>
					<input type="text" pattern="([가-힣\s]+(시|군)+[가-힣0-9\s]+(구|읍|면)+[가-힣0-9\s]+(리|동))" class="form-control" id="addr" placeholder="예) 서울시 강남구 개포1동, 달성군 다사읍 달천리" required/> 
					<div class="invalid-feedback"> 올바른 주소 양식이 아닙니다. 다시 확인해주세요. </div>					
				</div> 
				
				<label class="lable">약관동의</label>
				<div style="border: solid 1px #ced4da; padding:20px;">
					<div class="custom-control custom-checkbox"> 
						<input type="checkbox" class="custom-control-input" id="allAgreement"/> 
						<label class="custom-control-label" for="allAgreement">전체동의</label> 
					</div> 
					<hr class="mb-4">
					<div class="custom-control custom-checkbox"> 
					<!-- input에 id값, label에 for값 추가(for랑 id는 같아야 함) 동의 1번 참고 -->
					<!-- 필수 기입 사항에는 required 속성 붙여주기 동의 1번 참고 -->
						<input type="checkbox" class="custom-control-input" name="check" id="agreement1" required/> 
						<label class="custom-control-label" for="agreement1" style="font-size: 13px;">어플리케이션 사용을 위한 필수 정보 제공에 동의합니다.</label> 
						<span class="checkBox-require">(필수)</span>
					</div> 
					<div class="custom-control custom-checkbox"> 
						<input type="checkbox" class="custom-control-input" name="check" id="agreement2"/> 
						<label class="custom-control-label" for="agreement2" style="font-size: 13px;">개인정보의 제3자 제공 및 마케팅 활용에 동의합니다.</label> 
						<span class="checkBox-option">(선택)</span>
					</div>  
				</div>
				<div class="mb-4"></div> 
				<button class="btn btn-lg btn-block" type="submit"
				style="background-color: #95E1D3; color: #FFFFFF; margin-top:10px" 
				>회원가입</button> 
			</form> 
		</div> 
	</div> 
	<footer class="my-3 text-center text-small"> 
	<!-- <p class="mb-1">&copy; 2021 </p>--> </footer> 
</div> 
<script> 

</script> 
</body> 
</html>