<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script src="https://kit.fontawesome.com/979888c264.js" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<link href="<c:url value="/resources/css/mypage/memberProfile.css"/>" rel="stylesheet">

<input type="hidden" name="id" value="${id }">
<input type="hidden" name="target" value="${memberProfile.id }">
<header>
	<!-- 사용자 상단 프로필 파트 -->
	<div class="container" style="margin-top: 100px;">
		
		<div class="profile">
			
			<div class="profile-image">
				<img src="<c:url value="/upload/profile/${memberProfile.imgsrc }"/>" alt="${memberProfile.nick }">
			</div>

			<div class="profile-user-settings">
				<h1 class="profile-user-name">${memberProfile.nick }</h1>
				<button class="btn profile-edit-btn">팔로우 하기</button>
				<button class="btn profile-edit-btn">팔로우 취소</button>
				<button class="btn profile-edit-btn">프로필설정</button>
				<button class="btn profile-settings-btn" aria-label="profile settings">
					<i class="fas fa-cog" aria-hidden="true"></i>
				</button>
			</div>

			<div class="profile-stats">
				<ul style="-webkit-padding-start: 0px;">
					<li>게시물 <span class="profile-stat-count">${memberProfile.feedcount }</span></li>
					<li>팔로워 <span class="profile-stat-count">${memberProfile.followers.size() }</span></li>
					<li>팔로우 <span class="profile-stat-count">${memberProfile.follows.size() }</span></li>
				</ul>
			</div>

			<div class="profile-bio">
				<p>${memberProfile.self }</p>
			</div>

		</div>
		<!-- End of profile section -->
	</div>
	<!-- End of container -->
</header>
<!-- 사용자 상단 프로필 파트 -->

<!-- 사용자가 작성한 글(Feed) 목록 파트 -->
<main>

	<div class="gallery-container">
		
		<div role="tabpanel" style="border-top: 3px solid #95E1D3;">
			
			<!-- 탭 네비게이션 파트(커뮤니티 게시판, 거래 게시판) -->
			<div class="row">					
				<ul class="nav nav-tabs col-md-offset-5 col-md-4 col-sm-offset-4 col-sm-5 col-xs-offset-4 col-xs-10" role="tablist">
					<li role="presentation" class="active">
					<a href="#community" aria-controls="insta" role="tab" data-toggle="tab">
					<i class="fab fa-instagram"></i>&nbsp; 커뮤니티</a></li>
										
					<li role="presentation"><a href="#trade" aria-controls="trade" role="tab" data-toggle="tab">
					<i class="fas fa-carrot"></i>&nbsp; 거래 게시판</a></li>
				</ul>
			</div>
			
			<!-- 탭 눌렀을 때 보여줄 파트 -->
			<div class="tab-content">
				
				<!-- 탭 눌렀을때 보여줄 커뮤니티 게시판에 대한 내용들 -->
				<div role="tabpanel" class="tab-pane active" id="community">
					
					<div class="gallery" style="margin-top: 20px;">
							
					</div>
					
					<!-- 로딩창 필요하면 사용할 div 
					<div class="loader"></div> -->
				</div>
				<!-- 탭 눌렀을때 보여줄 커뮤니티 게시판에 대한 내용들 -->
				
				<div role="tabpanel" class="tab-pane" id="trade">
				<!-- 탭 눌렀을 때 보여줄 거래 게시판에 대한 내용 -->
				</div>
			</div>
		</div>
	</div>

</main>
<!-- 사용자가 작성한 글(Feed) 목록 파트 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="/resources/js/mypage/memberProfile.js"></script>