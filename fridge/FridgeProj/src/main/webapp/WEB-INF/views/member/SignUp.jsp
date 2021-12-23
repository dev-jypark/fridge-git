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
<link href="../../../resources/css/member/SignUp.css" rel="stylesheet" type="text/css">
<style> 
	
</style>
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
				</li>
				<li class="css-1balhvh-SNSItem e111gxds0">
					<a href="/users/auth/kakao">
					<img alt="카카오 로그인" src="kakao.png">
					</a>
				</li>
				<li class="css-1balhvh-SNSItem e111gxds0">
					<a href="/users/auth/naver">
					<img alt="네이버 로그인" src="naver.png">
					</a>
				</li>
			</ul>			
			<hr/>
			<form class="validation-form" novalidate>
			<!-- 아이디 -->
				<div class="mb-3"> 
					<label class="lable" for="id">아이디</label>
					<div class="description">영문이나 영문, 숫자 포함 4~12자</div>
					<input type="text" class="form-control" id="id" placeholder="아이디를 입력해주세요." required> 
					<div class="invalid-feedback"> 아이디는 필수로 입력해야 합니다. </div> 
					<button class="btn btn-lg btn-block" style="border-color: #007bff; color: #007bff; margin-top:10px" type="submit">중복 확인</button> 
				</div> 
				<!-- 이메일 -->				
				<div class="mb-3">
					<label class="lable" for="email">이메일</label>
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
					<!-- <input type="email" class="form-control" id="email" placeholder="you@example.com" required> -->
					<div class="invalid-feedback"> 이메일을 입력해주세요. </div>
					<!-- <button class="btn btn-lg btn-block" style="border-color: #95E1D3; color: #95E1D3; margin-top:10px" type="submit">이메일 확인</button> -->
				</div>
				<!-- 폰번호 -->
				<div class="mb-3"> 
					<label class="lable" for="pwd1">휴대폰 번호</label>
					<div class="description">- 없이 숫자만 입력</div>
					<div class="description"></div>
					<input type="text" class="form-control" id="phone" placeholder="휴대폰 번호를 입력해주세요." required> 
					<div class="invalid-feedback"> 휴대폰 번호는 필수로 입력해야 합니다. </div> 
				</div> 
				<!-- 비밀번호 -->
				<div class="mb-3"> 
					<label class="lable" for="pwd1">비밀번호</label>
					<div class="description">영문, 숫자 포함 8~20자</div>
					<div class="description"></div>
					<input type="password" class="form-control" id="pwd1" placeholder="비밀번호를 입력해주세요." required> 
					<div class="invalid-feedback"> 비밀번호는 필수로 입력해야 합니다. </div> 
				</div> 
				<!-- 비밀번호 확인 -->
				<div class="mb-3"> 
					<label class="lable" for="pwd2">비밀번호 확인</label>
					<input type="password" class="form-control" id="pwd2" placeholder="비밀번호를 한번 더 입력해주세요." required> 
					<div class="invalid-feedback"> 비밀번호는 필수로 입력해야 합니다. </div> 
				</div>
				<!-- 닉네임 -->
				<div class="mb-3"> 
					<label class="lable" for="nickname">별명</label>
					<div class="description">한글 2~8자</div>
					<input type="text" class="form-control" id="nickname" placeholder="사용하실 별명을 입력해주세요." required> 
					<div class="invalid-feedback"> 별명은 필수로 입력해야 합니다. </div> 
				</div>
				<!-- 이름 -->
				<!-- <div class="row">
					<div class="col-md-5 mb-3">
						<label for="name">이름</label>
						<input type="text" class="form-control" id="name" placeholder="" value="" required>
						<div class="invalid-feedback"> 이름을 입력해주세요. </div> 
					</div> 
					별명
					<div class="col-md-1" style="margin-top:35px">@</div>
					<div class="col-md-5 mb-3" style="margin-top:30px"> 
						<label for="nickname">별명</label>
						<input type="text" class="form-control" id="nickname" placeholder="" value="" required>
						<div class="invalid-feedback"> 별명을 입력해주세요. </div>
						<select class="form-control"> 
							<option value=""></option> 
							<option>검색</option> 
							<option>카페</option> 
						</select> 
					</div> 
				</div> -->
				<!-- 주소 -->
				<div class="mb-3"> 
					<label class="lable" for="address">주소</label>
					<div class="description">동, 리까지 입력</div>
					<input type="text" class="form-control" id="address" placeholder="예) 서울시 강남구 역삼동, 구미시 고아읍 문성리" required> 
					<div class="invalid-feedback"> 주소를 입력해주세요. </div> 
				</div> 
				<!-- 상세주소 
				<div class="mb-3"> 
					<label class="lable" for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label> 
					<input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요."> </div> -->
				<!-- <div class="row"> 
					가입경로
					<div class="col-md-8 mb-3"> 
						<label for="root">가입 경로</label> 
						<select class="custom-select d-block w-100" id="root"> 
							<option value=""></option> 
							<option>검색</option> 
							<option>카페</option> 
						</select> 
						<div class="invalid-feedback"> 가입 경로를 선택해주세요. </div> 
					</div>
					추천인 코드 
					<div class="col-md-4 mb-3"> 
						<label for="code">추천인 코드</label> 
						<input type="text" class="form-control" id="code" placeholder="" required> 
						<div class="invalid-feedback"> 추천인 코드를 입력해주세요. </div> 
					</div> 
				</div>  -->
				<label class="lable">약관동의</label>
				<div style="border: solid 1px #ced4da; padding:20px;">
					<div class="custom-control custom-checkbox"> 
						<input type="checkbox" class="custom-control-input" id="allAggrement"> 
						<label class="custom-control-label" for="allAggrement">전체동의</label> 
					</div> 
					<hr class="mb-4">
					<div class="custom-control custom-checkbox"> 
					<!-- input에 id값, label에 for값 추가(for랑 id는 같아야 함) 동의 1번 참고 -->
					<!-- 필수 기입 사항에는 required 속성 붙여주기 동의 1번 참고 -->
						<input type="checkbox" class="custom-control-input" id="agreement1" required> 
						<label class="custom-control-label" for="agreement1" style="font-size: 13px;">어플리케이션 사용을 위한 기본 정보 제공에 동의합니다.</label> 
						<span class="checkBox-require">(필수)</span>
					</div> 
					<div class="custom-control custom-checkbox"> 
						<input type="checkbox" class="custom-control-input"> 
						<label class="custom-control-label" style="font-size: 13px;">개인정보의 제3자 제공 및 마케팅 활용에 동의합니다.</label> 
						<span class="checkBox-option">(선택)</span>
					</div>  
				</div>
				<div class="mb-4"></div> 
				<button class="btn btn-lg btn-block" type="submit" style="background-color: #95E1D3; color: #FFFFFF; margin-top:10px" type="submit"">회원가입</button> 
			</form> 
		</div> 
	</div> 
	<footer class="my-3 text-center text-small"> 
	<!-- <p class="mb-1">&copy; 2021 </p>--> </footer> 
</div> 

</body> 
</html>