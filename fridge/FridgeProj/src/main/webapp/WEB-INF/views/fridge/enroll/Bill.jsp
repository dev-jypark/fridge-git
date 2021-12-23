<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<link href="../../../../resources/css/enroll/Bill.css" rel="stylesheet" type="text/css">
	<meta charset="UTF-8">
	<title>찍먹냉장고 | 영수증으로 식재료 등록하기</title>
	</head>
	<body>
	
		<div class="myhome-nav myhome-nav--owner">
			<nav class="page-navigation myhome-nav__owner">
				<ul style="transform: translateX(0px);">
					<li class="page-navigation__item">
						<a id="profile" class="" href="/users/2522547" target="_self">리스트로 보기</a>
					</li>
					<li class="page-navigation__item">
						<a id="profile" class="" href="/users/2522547" target="_self">캘린더로 보기</a>
					</li>
					<li class="page-navigation__item">
						<a id="setting" class="active" href="/users/2522547/edit" target="_self">재료등록하기</a>
					</li>
				</ul>
			</nav>
			<nav class="page-navigation myhome-nav__contents">
					<ul style="transform: translateX(0px);">
						<li class="page-navigation__item">
							<a id="member_edit" class="active" href="/users/2522547/edit" target="_self">영수증으로 등록</a></li>
						<li class="page-navigation__item">
							<a id="change_pwd" class="" href="/users/2522547/edit_password" target="_self">직접 등록</a>
						</li>
					</ul>
				</nav>
		</div>
		
		<!-- 본문 -->
		<div class="update-password__wrap">
			<h1 class="update-password__title">영수증으로 재료 등록하기</h1>
				(식재료 구매한 영수증을 촬영해서 올리면 된다는 설명)
				<div class="frame">
					<div class="center">
						<div class="title">
							<h1>영수증 사진을 넣어주세요</h1>
						</div>
				
						<div class="dropzone">
							<img src="http://100dayscss.com/codepen/upload.svg" class="upload-icon" />
							<input type="file" class="upload-input" />
						</div>				
						<button type="button" class="btn" name="uploadbutton">upload</button>
					</div>
					
				</div>		
				<!-- 모달창이나 별도의 페이지를 만들어서 이동시키기로 했으므로 주석처리 해둠.
				<div class="item_list">
				<h3>업로드 후 재료 목록 띄워줄 자리</h3>
				<input type="checkbox"/>전체선택
					<ul>
						<li><input type="checkbox" id="cb1" />팅글 요구르트 곤약젤리
						<input type="text" size="2" maxlength="2" class="item_num" value="10"/></li>
						<li><input type="checkbox" id="cb2">바르닭 소스품은 닭가슴살 찜닭맛
						<input type="text" size="2" maxlength="2" class="item_num" value="2"/></li>
						<li><input type="checkbox" id="cb2">바르닭 소스품은 닭가슴살 사천짜장맛
						<input type="text" size="2" maxlength="2" class="item_num" value="2"/></li>
						<li><input type="checkbox" id="cb3">아르보리아 우유 900ml
						<input type="text" size="2" maxlength="2" class="item_num" value="1"/></li>
						<li><input type="checkbox" id="cb4">호가든 포멜로
						<input type="text" size="2" maxlength="2" class="item_num" value="6"/></li>
						<li><input type="checkbox" id="cb4">매일두유 고단백 190ml
						<input type="text" size="2" maxlength="2" class="item_num" value="12"/></li>
					</ul>
					
					<button class="insert">입력</button>
					-->
				</div>		
		</div>
		<!-- original pen: https://codepen.io/roydigerhund/pen/ZQdbeN  -->
	</body>
</html>