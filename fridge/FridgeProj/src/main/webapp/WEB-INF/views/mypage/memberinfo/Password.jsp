<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../resources/css/mypage/memberinfo/Password.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../../resources/js/mypage/memberinfo/Password.js"></script> 
<title>찍먹냉장고 | 비밀번호 변경</title>
</head>
<body>
	<div class="edit-user-info">
			<div class="myhome-nav myhome-nav--owner">
				<nav class="page-navigation myhome-nav__owner">
					<ul style="transform: translateX(0px);">
						<li class="page-navigation__item">
							<a id="profile" class="" href="/app/mypage/memberinfo/Reward.do" target="_self">리워드</a>
						</li>
						<li class="page-navigation__item">
							<a id="setting" class="active" href="" target="_self">설정</a>
						</li>
					</ul>
				</nav>

				<nav class="page-navigation myhome-nav__contents">
					<ul style="transform: translateX(0px);">
						<li class="page-navigation__item">
							<a id="member_edit" class="" href="/app/mypage/memberinfo/Edit.do" target="_self">회원정보수정</a></li>
						<li class="page-navigation__item">
							<a id="alert" class="" href="/app/mypage/memberinfo/Alert.do" target="_self">알림 설정</a>
						</li>
						<li class="page-navigation__item">
							<a id="change_pwd" class="active" href="/app/mypage/memberinfo/Password.do" target="_self">비밀번호 변경</a>
						</li>
					</ul>
				</nav>

			</div>

		<div class="update-password__wrap">
			<h1 class="update-password__title">비밀번호 변경</h1>
			<form>
				<div class="update-password__section">
					<div class="update-password__section__title">
					새 비밀번호
					</div>
					<div class="update-password__section__sub-title">
					영문, 숫자, 특수문자를 포함한 8~20자 비밀번호를 입력해주세요.
					</div>
					<div class="expert-form-group">
						<div class="expert-form-group__content">
							<div class="expert-form-group__input">
								<input id="pwd1" pattern="(?=.*[a-zA-Z]+)(?=.*[0-9]+)(?=.*[`~!@@#$%^&*|₩₩₩'₩;:₩/?]+).{8,20}" type="password" class="form-control" required>
							</div>
						</div>
					</div>
				</div>
				<div class="update-password__section">
					<div class="update-password__section__title">
					새 비밀번호 확인
					</div>
					<div class="expert-form-group">
						<div class="expert-form-group__content">
							<div class="expert-form-group__input">
								<input id="pwd2" pattern="(?=.*[a-zA-Z]+)(?=.*[0-9]+)(?=.*[`~!@@#$%^&*|₩₩₩'₩;:₩/?]+).{8,20}" type="password" class="form-control" required>
							</div>
						</div>
					</div>
				</div>
				<button class="button button--color-blue button--size-50 button--shape-4 update-password__submit" type="submit"  onclick="pwdCheck()">비밀번호 변경</button>
			</form>
		</div>
	</div>
</body>
</html>