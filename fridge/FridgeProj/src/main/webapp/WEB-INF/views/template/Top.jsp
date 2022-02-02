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
	<link rel="stylesheet" href="<c:url value="/resources/plugins/template/bootstrap/bootstrap.min.css"/>">
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
                        <a href="/app" >
                            <img src="<c:url value="/resources/images/template/logo.png"/>" alt="">
                        </a>
                    </div>
                   	<!-- /logo -->
                </div>
                
                <!-- main menu -->
                <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="main-menu">
                        <ul class="nav navbar-nav navbar-right">
                        	<c:if test="${empty sessionScope.id }" var="isLogin">
	                        	<li><a href="<c:url value="/member/SignUp.do"/>">회원가입</a></li>
	                        	<li><a href="<c:url value="/member/login.do"/>">로그인</a></li>                        	
							</c:if>
                            <c:if test="${not isLogin }">
	                            <li><a href="#" >커뮤니티</a></li>
	                            <li><a href="<c:url value="/shareWrite.do"/>">나눔</a></li>
	                            <li><a href="service.html">레시피</a></li>
	                            <li class="dropdown">
	                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">냉장고 <span class="caret"></span></a>
	                                <div class="dropdown-menu">
	                                    <ul>
	                                        <li><a href="#">404 Page</a></li>
	                                        <li><a href="#">Gallery</a></li>
	                                    </ul>
	                                </div>
	                            </li>
	                            <li class="dropdown">
	                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">마이페이지<span class="caret"></span></a>
	                                <div class="dropdown-menu">
	                                    <ul>
	                                        <li><a href="#">프로필</a></li>
	                                        <li><a href="#">설정</a></li>
	                                        <li><a href="<c:url value="/member/logout.do"/>">로그아웃</a></li>
	                                    </ul>
	                                </div>
	                            </li>
	                            <li><a href="contact.html">채팅</a></li>
                            </c:if>
                        </ul>
                    </div>
                </nav>
                <!-- /main nav -->
            </div>
        </header>