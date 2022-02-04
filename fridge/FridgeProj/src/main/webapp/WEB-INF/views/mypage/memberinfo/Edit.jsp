<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
		<link rel="icon" href="/favicon.ico" type="image/x-icon">
		<link href="<c:url value="/resources/css/memberinfo/Edit.css"/>" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="<c:url value="/resources/js/memberinfo/Edit.js"/>"></script> 
		<title>찍먹냉장고 | 회원정보수정</title>
	</head>
	<body>
		<div class="edit-user-info">
		<!-- 
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
							<a id="member_edit" class="active" href="/app/mypage/memberinfo/Edit.do" target="_self">회원정보수정</a></li>
						<li class="page-navigation__item">
							<a id="alert" class="" href="/app/mypage/memberinfo/Alert.do" target="_self">알림 설정</a>
						</li>
						<li class="page-navigation__item">
							<a id="change_pwd" class="" href="/app/mypage/memberinfo/Password.do" target="_self">비밀번호 변경</a>
						</li>
					</ul>
				</nav>
			</div>
		 -->
			<div id="wrap" class="edit-user-info__wrap container">
				<div class="edit-user-info__header">
					<div class="edit-user-info__header__title">
					회원정보수정
					</div>
					<!-- 탈퇴버튼
					<a class="edit-user-info__header__withdrawals" href="/withdrawals/new">탈퇴하기</a>
					 -->
				</div>
				<form>
					<!-- 아이디 -->
					<div class="edit-user-info__form-item">
						<div class="edit-user-info__form-item__title">
							아이디
							<div class="edit-user-info__form-item__title__require">
							*필수항목
							</div>
						</div>
						<div class="expert-form-group edit-user-info__form-item__group">
							<div class="expert-form-group__content">
								<div class="expert-form-group__input">
									<div class="edit-user-info__form-item__field">
										<div class="edit-user-info__input">
											<input class="form-control" pattern="^[a-z0-9_-]{4,12}$" name="Id" value="${param.id}" readonly="readonly" type="text" >
											<div class="edit-user-info__input__error"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 이메일 -->
					<div class="edit-user-info__form-item">
						<div class="edit-user-info__form-item__title">
							이메일
							<div class="edit-user-info__form-item__title__require">*필수항목</div>
						</div>
						<div class="expert-form-group edit-user-info__form-item__group">
							<div class="expert-form-group__content">
								<div class="expert-form-group__input">
									<div class="edit-user-info__form-item__field">
										<div class="input-group email-input">
											<span class="email-input__local">
												<input type="email" pattern="^[A-Za-z0-9_\.\-]+@[a-z\-]+\.[a-z\-]+" class="form-control" name="email" placeholder="you@example.com" value="${param.email}" required/>	
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 별명 -->
					<div class="edit-user-info__form-item">
						<div class="edit-user-info__form-item__title">
							별명
							<div class="edit-user-info__form-item__title__require">
							*필수항목
							</div>
						</div>
						<div class="expert-form-group edit-user-info__form-item__group">
							<div class="expert-form-group__content">
								<div class="expert-form-group__input">
									<div class="edit-user-info__form-item__field">
										<div class="edit-user-info__input">
											<input class="form-control" pattern="^[가-힣]{2,8}$" placeholder="사용하실 별명을 입력해주세요." name="nick" value="${param.nickname}" required/>
											<div class="edit-user-info__input__error"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 주소 -->
					<div class="edit-user-info__form-item">
						<div class="edit-user-info__form-item__title">
						주소
							<div class="edit-user-info__form-item__title__require">
							*필수항목
							</div>
						</div>
						<div class="expert-form-group edit-user-info__form-item__group">
							<div class="expert-form-group__content">
								<div class="expert-form-group__input">
									<div class="edit-user-info__form-item__field">
										<input placeholder="예) 서울시 강남구 개포1동, 달성군 다사읍 달천리" pattern="([가-힣\s]+(시|군)+[가-힣0-9\s]+(구|읍|면)+[가-힣0-9\s]+(리|동))" class="form-control" required/>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 프로필 사진 -->
					<div class="edit-user-info__form-item">
						<div class="edit-user-info__form-item__title">
						프로필 사진
						</div>
						<div class="expert-form-group edit-user-info__form-item__group">
							<div class="expert-form-group__content">
								<div class="expert-form-group__input">
									<div class="edit-user-info__form-item__field edit-user-info__form-item__field--profile">
										<div class="image-single-input-wrap">
											<ul class="image-single-input">
												<li class="image-single-input__entry">
													<button class="image-single-input__entry__button" type="button">
														<img class="image-single-input__entry__image"
															src="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1569644600_L.jpeg?gif=1&amp;w=640&amp;h=640&amp;c=c"
															srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1569644600_L.jpeg?gif=1&amp;w=960&amp;h=960&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1569644600_L.jpeg?gif=1&amp;w=1280&amp;h=1280&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1569644600_L.jpeg?gif=1&amp;w=1920&amp;h=1920&amp;c=c 3x">
													</button>
												</li>
											</ul>
										</div>
										<button id="delButton" class="button button--color-blue button--size-30 button--shape-4 edit-user-info__form-item__delete" type="button">
											<svg viewBox="0 0 20 20" preserveAspectRatio="xMidYMid meet">
												<defs>
													<filter id="delete-a" width="134.3%" height="175%" x="-17.1%" y="-37.5%" filterUnits="objectBoundingBox">
														<feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset>
														<feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="3"></feGaussianBlur>
														<feColorMatrix in="shadowBlurOuter1" result="shadowMatrixOuter1" values="0 0 0 0 0.182857143 0 0 0 0 0.205714286 0 0 0 0 0.22 0 0 0 0.2 0"></feColorMatrix>
														<feMerge>
															<feMergeNode in="shadowMatrixOuter1"></feMergeNode>
															<feMergeNode in="SourceGraphic"></feMergeNode>
														</feMerge>
													</filter>
												<path id="delete-b" d="M11 3.83v10c0 .92-.75 1.67-1.67 1.67H2.67c-.92 0-1.67-.75-1.67-1.67v-10h10zM8.08.5l.84.83h2.91V3H.17V1.33h2.91L3.92.5h4.16z"></path>
												</defs>
												<g id="g1" fill="none" fill-rule="evenodd" filter="url(#delete-a)" transform="translate(4 2)">
													<mask id="delete-c" fill="#fff">
														<use xlink:href="#delete-b"></use>
													</mask>
													<g id="g2" fill="#FFF" mask="url(#delete-c)">
														<path d="M-4-2h20v20H-4z"></path>
													</g>
												</g>
											</svg>
											삭제
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 한줄 소개 -->
					<div class="edit-user-info__form-item">
						<div class="edit-user-info__form-item__title">
						한줄 소개
						</div>
						<div class="expert-form-group edit-user-info__form-item__group">
							<div class="expert-form-group__content">
								<div class="expert-form-group__input">
									<div class="edit-user-info__form-item__field">
										<input maxlength="41" class="form-control">
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 수정 버튼 -->
					<button id="editButton" class="button button--color-blue button--size-50 button--shape-4 update-password__submit" type="submit">회원정보 수정</button>
				</form>
			</div>
		</div>
	</body>
</html>