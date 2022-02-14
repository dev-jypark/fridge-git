<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="../../resources/css/mypage/memberinfo/Reward.css" rel="stylesheet" type="text/css">
<script src="../../resources/js/mypage/memberinfo/Password.js"></script> 
<meta charset="UTF-8">
<title>찍먹냉장고 | 나의 리워드</title>
</head>
<body>

	<div class="edit-user-info">
		<div class="myhome-nav myhome-nav--owner">
			<nav class="page-navigation myhome-nav__owner">
				<ul style="transform: translateX(0px);">
					<li class="page-navigation__item"><a id="profile"
						class="active" href="" target="_self">리워드</a></li>
					<li class="page-navigation__item"><a id="setting" class=""
						href="/app/mypage/memberinfo/Edit.do" target="_self">설정</a></li>
				</ul>
			</nav>
		</div>
	</div>

	<div id="wrap" class="edit-user-info__wrap container">
		<div class="edit-user-info__header">
			<div class="edit-user-info__header__title">나의 리워드</div>
		</div>
		<form>
		<h2 class="css-p80mfr-PushSettingTitle e1ok56tx4">현재 경험치</h2>
			<div class="progress">
				<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="2"
					aria-valuemin="0" aria-valuemax="100">75%</div>
			</div>
			<div class="text">
				<h2 class="css-p80mfr-PushSettingTitle">리워드란?</h2>
				<div class="p">
					<p class="css-114agji-PushSettingSubTitle">
							남들도 모르게 서성이다 울었지 지나온 일들이 가슴에 사무쳐 
							텅빈 하늘 밑 불빛들 켜져가면 옛사랑 그 이름 아껴 불러보네 
							찬바람 불어와 옷깃을 여미우다 후회가 또 화가 난 눈물이 흐르네 
							누가 물어도 아플 것 같지 않던 지나온 내 모습 모두 거짓인걸 
							이제 그리운 것은 그리운 대로 내맘에 둘 거야 
							그대 생각이 나면 생각 난 대로 내버려 두듯이 
							흰 눈 나리면 들판에 서성이다 옛사랑 생각에 그길 찾아가지 
							광화문 거리  흰눈에 덮여가고 하얀 눈 하늘 높이 자꾸 올라가네 
							이제 그리운 것은 그리운 대로 내맘에 둘 거야 
							그대 생각이 나면 생각 난 대로 내버려 두듯이 
							사랑이란게 지겨울 때가 있지 내맘에 고독이 너무 흘러넘쳐 
							눈 녹은 봄날 푸르른 잎새 위엔 옛사랑 그대 모습 영원 속에 있네 
							흰 눈 나리면 들판에 서성이다 옛사랑 생각에 그길 찾아가지 
							광화문 거리 흰눈에 덮여가고 하얀 눈 하늘 높이 자꾸 올라가네 
					</p>
				</div>
				<div class="level">
					<h4>등급별 아이콘 들어갈 자리</h4>
					<div class="progress">
						<div class="progress-bar" role="progress-bar-info" aria-valuenow="40"
							aria-valuemin="0" aria-valuemax="100" style="min-width: 0%; width:0%">
							~ 15
						</div>
					</div>
					<div class="progress">
						<div class="progress-bar progress-bar-info" role="progressbar"
							aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
							style="width: 20%">~ 45
						</div>
					</div>
					<div class="progress">
						<div class="progress-bar progress-bar-info" role="progressbar"
							aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
							style="width: 40%">~ 90
						</div>
					</div>
					
					<div class="progress">
						<div class="progress-bar progress-bar-info" role="progressbar"
							aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
							style="width: 60%">~ 180
						</div>
					</div>
					<div class="progress">
						<div class="progress-bar progress-bar-info" role="progressbar"
							aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
							style="width: 80%">~ 360
						</div>
					</div>
					<div class="progress">
						<div class="progress-bar progress-bar-info" role="progressbar"
							aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
							style="width: 100%">~ 720
						</div>
					</div>
				</div>

					
			</div>
		</form>
	</div>
</body>
</html>