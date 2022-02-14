<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 나중에 파비콘 만들어 -->
<!-- <link rel="icon" href="favicon.ico"> -->
<title>찍먹냉장고 | 찍고 먹는 식품 제고 관리 커뮤니티</title>
<!-- Mobile Specific Metas================================================== -->
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Template CSS Files================================================== -->
	<!-- Twitter Bootstrs CSS -->
	<!-- Ionicons Fonts Css -->
	<link rel="stylesheet" href="<c:url value="/resources/plugins/template/ionicons/ionicons.min.css"/>">
	<!-- animate css -->
	<link rel="stylesheet" href="<c:url value="/resources/plugins/template/animate-css/animate.css"/>">
	<!-- Hero area slider css-->
	<link rel="stylesheet" href="<c:url value="/resources/plugins/template/slider/slider.css"/>">
	<!-- owl craousel css -->
	<link rel="stylesheet" href="<c:url value="/resources/plugins/template/owl-carousel/owl.carousel.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/plugins/template/owl-carousel/owl.theme.css"/>">
	<!-- Fancybox -->
	<link rel="stylesheet" href="<c:url value="/resources/plugins/template/facncybox/jquery.fancybox.css"/>">
	<!-- template main css file -->
	<link rel="stylesheet" href="<c:url value="/resources/css/template/style.css"/>">

<!-- Template Javascript Files
	================================================== -->
	<!-- jquery -->
	<script src="<c:url value="/resources/plugins/template/jQurey/jquery.min.js"/>"></script>
	<!-- Form Validation -->
    <script src="<c:url value="/resources/plugins/template/form-validation/jquery.form.js"/>"></script> 
    <script src="<c:url value="/resources/plugins/template/form-validation/jquery.validate.min.js"/>"></script>
	<!-- owl carouserl js -->
	<script src="<c:url value="/resources/plugins/template/owl-carousel/owl.carousel.min.js"/>"></script>
	<!-- bootstrap js -->
	<script src="<c:url value="/resources/plugins/template/bootstrap/bootstrap.min.js"/>"></script>
	<!-- wow js -->
	<script src="<c:url value="/resources/plugins/template/wow-js/wow.min.js"/>"></script>
	<!-- slider js -->
	<script src="<c:url value="/resources/plugins/template/slider/slider.js"/>"></script>
	<!-- Fancybox -->
	<script src="<c:url value="/resources/plugins/template/facncybox/jquery.fancybox.js"/>"></script>
	<!-- template main js -->
	<script src="<c:url value="/resources/js/template/main.js"/>"></script>
</head>

<body>
	<!--
        ==================================================
        Header Section Start
        ================================================== -->
        <header id="top-bar" class="navbar-fixed-top animated-header">
            <div class="container">
                <div class="navbar-header">
                    <!-- responsive nav button -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <!-- /responsive nav button -->
                    
                    <!-- logo -->
                    <div class="navbar-brand">
                         <a href="<c:url value="/"/>"><img src="<c:url value="/resources/images/top/logo_full.png"/>" alt="찍먹냉장고" style="width:20%; height:20%; float:left;"/></a>
                    </div>
                   	<!-- /logo -->
                </div>
                
                <!-- main menu -->
                <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="main-menu">
                        <ul class="nav navbar-nav navbar-right">
                        	<!-- 로그인 여부 판별. 로그인 전이라면 회원가입과 로그인만 노출 -->
                        	<c:if test="${empty sessionScope.id && empty sessionScope.socialId}" var="beforeLogin">
                        	<li><a href="<c:url value="/member/SignUp.do"/>"><img src="<c:url value="/resources/images/top/top6.png"/>" alt="회원가입" style="width:80%; height:80%;"/></a></li>
                        	<li><a href="<c:url value="/member/login.do"/>"><img src="<c:url value="/resources/images/top/top7.png"/>" alt="로그인" style="width:80%; height:80%;"/></a></li>                        	
							</c:if>
                            <c:if test="${not beforeLogin }">                         
	                            <li><a style="padding-right: 0px;" href="<c:url value=""/>" ><img src="<c:url value="/resources/images/top/top1.png"/>" alt="커뮤니티" style="width:70%; height:70%;"/></a></li>
	                            <li class="dropdown">
	                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<c:url value="/resources/images/top/top2.png"/>" alt="나눔" style="width:58%; height:58%;"/><span class="caret"></span></a>
	                                <div class="dropdown-menu">
	                                    <ul>
	                                        <li><a href="<c:url value="/share/shareList.do"/>">주변나눔확인</a></li>
	                                        <li><a href="/message_list.do">채팅하기</a></li>
	                                    </ul>
	                                </div>
	                            </li>
	                            <li><a href="<c:url value='/recipe.do'/>"><img src="<c:url value="/resources/images/top/top3.png"/>" alt="레시피" style="width:70%; height:70%;"/></a></li>                          
	                            <li class="dropdown">
	                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<c:url value="/resources/images/top/top4.png"/>" alt="냉장고" style="width:62%; height:62%;"/><span class="caret"></span></a>
	                                <div class="dropdown-menu">
	                                    <ul>
	                                        <li><a href="<c:url value="/fridge/fridgeList.do"/>">재료목록</a></li>
	                                    </ul>
	                                </div>
	                            </li>
	                            <!-- 회원상세정보에서 프로필사진을 지정하지 않은 경우 기본 이미지-->
	                            <c:if test="${empty sessionScope.profileImg }" var="nullImgsrc">
		                            <li class="dropdown">		                           
		                                <a href="#" class="dropdown-toggle_profile" data-toggle="dropdown" 
		                                style="padding-top: 6.5px;padding-left: 5px;margin-right: 5px;">	                                
		                                <img class="profileImg" id="profileImg" src="<c:url value="/resources/images/template/basic_profile.png"/>">                              
		                                <span class="caret"></span></a>
		                                <div class="dropdown-menu">
		                                    <ul>		                                        
		                                        <c:if test="${empty sessionScope.id}" var="isSocialLogin"></c:if>
		                                        <c:if test="${not isSocialLogin }"> 
		                                        <!-- 세션 저장값으로 소셜로그인 여부 판별. 소셜로그인인 경우 마이페이지 카테고리 숨김 -->	  
		                                        <li><a href="<c:url value="/mypage/memberinfo/Profile.do"/>">프로필</a></li>
		                                        <li><a href="<c:url value="/mypage/memberinfo/Edit.do"/>">회원상세정보</a></li>  
		                                        <li><a href="<c:url value="/mypage/memberinfo/Password.do"/>">비밀번호변경</a></li>
		                                        </c:if>
		                                        <li><a href="<c:url value="/member/logout.do"/>">로그아웃</a></li>
		                                    </ul>
		                                </div>
		                            </li>
	                            </c:if> 	                            
	                            <!-- 회원상세정보에서 프로필사진을 변경했다면 값을 불러와 띄워준다 -->
	                            <c:if test="${not nullImgsrc }">
		                            <li class="dropdown">		                           
		                                <a href="#" class="dropdown-toggle_profile" data-toggle="dropdown" 
		                                style="padding-top: 6.5px;padding-left: 5px;padding-right: 5px;">	                                
		                                <img class="profileImg" id="profileImg" src="/user/profile/${sessionScope.profileImg}">
		                                <span class="caret"></span></a>
		                                <div class="dropdown-menu">
		                                    <ul>
		                                         <!-- 세션 저장값으로 소셜로그인 여부 판별. 소셜로그인인 경우 마이페이지 카테고리 숨김 -->	   
		                                        <c:if test="${empty sessionScope.id}" var="isSocialLogin"></c:if>
		                                        <c:if test="${not isSocialLogin }"> 
		                                        <li><a href="<c:url value="/mypage/memberinfo/Profile.do"/>">프로필</a></li>
		                                        <li><a href="<c:url value="/mypage/memberinfo/Edit.do"/>">회원상세정보</a></li>
		                                        <li><a href="<c:url value="/mypage/memberinfo/Password.do"/>">비밀번호변경</a></li>
		                                        </c:if>
		                                        <li><a href="<c:url value="/member/logout.do"/>">로그아웃</a></li>
		                                    </ul>
		                                </div>
		                            </li>
	                            </c:if> 
	                        
                            </c:if>
                        </ul>
                    </div>
                </nav>
                <!-- /main nav -->
            </div>
        </header>