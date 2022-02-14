<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="../../resources/css/mypage/memberinfo/Alert.css" rel="stylesheet" type="text/css">
	<script src="../../resources/js/mypage/memberinfo/Alert.js"></script> 
	<title>찍먹냉장고 | 알림 설정</title>
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
							<a id="alert" class="active" href="/app/mypage/memberinfo/Alert.do" target="_self">알림 설정</a>
						</li>
						<li class="page-navigation__item">
							<a id="change_pwd" class="" href="/app/mypage/memberinfo/Password.do" target="_self">비밀번호 변경</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		
	<div class="css-duqdc3-PushSettingContainer e1ok56tx5">
		<h1 class="css-p80mfr-PushSettingTitle e1ok56tx4">냉장고 알림 설정</h1>
			<p class="css-114agji-PushSettingSubTitle e1ok56tx3">냉장고 관리에 대한 유용한 정보를 받아보시겠어요?</p>
				
				<ul class="css-1xmpys0-PushSettingList e1ok56tx2">
					<!-- 선택약관 동의 여부 -->
					<li class="css-n4hdvq-PushSettingItem e1ok56tx1">
						<span class="css-glpnvo-PushSettingItemName e1ok56tx0">마케팅 정보 활용에 동의합니다.</span>
						<span class="css-1xnppoi-SwitchSpan e1pegdba2">
							<input type="checkbox" name="isEmailSubscribed" checked="" class="css-xd21da-SwitchInput e1pegdba0" value="">
							<span class="css-1luu4ee-SwitchSpanThumb e1pegdba1"></span>
						</span>
					</li>
					<!-- 이메일 -->
					<li class="css-n4hdvq-PushSettingItem e1ok56tx1">
						<span class="css-glpnvo-PushSettingItemName e1ok56tx0">이메일로 정보를 받겠습니다.</span>
						<span class="css-1xnppoi-SwitchSpan e1pegdba2">
							<input type="checkbox" name="isSmsSubscribed" class="css-xd21da-SwitchInput e1pegdba0" value="">
							<span class="css-10jjmn2-SwitchSpanThumb e1pegdba1"></span>
						</span>
					</li>
					<!-- 문자 -->
					<li class="css-n4hdvq-PushSettingItem e1ok56tx1">
						<span class="css-glpnvo-PushSettingItemName e1ok56tx0">문자로 정보를 받겠습니다.</span>
						<span class="css-1xnppoi-SwitchSpan e1pegdba2">
							<input type="checkbox" name="isSmsSubscribed" class="css-xd21da-SwitchInput e1pegdba0" value="">
							<span class="css-10jjmn2-SwitchSpanThumb e1pegdba1"></span>
						</span>
					</li>
				</ul>
		</div>
</body>
</html>