<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport"
        content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,viewport-fit=cover" />
    <meta name="naver-site-verification" content="907a7f8c9a61df897ccf0f03a835f6d2668945b1" />
    <meta property="fb:admins" content="100006457426639" />
    <meta name="google-site-verification" content="d-veBobRNo_in0thN3uOOoIcUWMUOjQZeMidTyItfGk" />
    <meta name="google-site-verification" content="AZK3GfRwg4q_EH-0OSbbkCurocEY7okWrPZF93COxYU" />
    <meta property="fb:app_id" content="185853321610795" />
    <title>찍먹냉장고</title>
    <meta name="description" content="한 번에!">
    <meta property="og:title" content="찍고 먹는 냉장고" />
    <meta property="og:type" content="website" />
    <link rel="alternate" href="android-app://net.bucketplace/http/ohou.se/deep" />
    <link rel="shortcut icon" href="https://assets.ohou.se/web/assets/bookmark_icon/favicon_144x144.png" />
    <link href="https://assets.ohou.se/web/assets/favicon.png" rel="shortcut icon" />

    <meta name="csrf-param" content="authenticity_token" />
    <meta name="csrf-token"
        content="d8idy2Eiw+OZnPZfiKazKoWd8dckU99X9CGDwrwrRj5A9/m8+PddM1UQUll23Vl5yiqejKbPcD52FjgF6BKj+w==" />
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700&display=swap&subset=korean"
        rel="stylesheet">

    <!-- css관련부분 -->
    <link rel="stylesheet" href="https://assets.ohou.se/web/dist/css/preamble-97ede701.chunk.css">
    <link rel="stylesheet" href="https://assets.ohou.se/web/dist/css/templates-Home-HomePage-f3a55bf4.chunk.css">
    <link rel="stylesheet" href="https://assets.ohou.se/web/dist/css/21-0e75de9b.chunk.css">
    <link rel="stylesheet" href="https://assets.ohou.se/web/dist/css/23-2ef16b9a.chunk.css">
    <link rel="stylesheet" href="https://assets.ohou.se/web/dist/css/App-6e6c2f0c.chunk.css">
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			    <header class="layout-navigation-bar">
			        <div data-sticky-enabled="false" data-sticky-disabled="true" data-sticky-always="true" data-sticky-ignore="true"
			            data-direction="top" data-offset="0" class="sticky-container layout-navigation-primary-wrap">
			            <div class="sticky-child layout-navigation-primary" style="position:relative">
			                <div class="layout-navigation-primary__content">
			                    <div class="layout-navigation-primary__leftmost">
			
			                    </div>
			                    <div class="layout-navigation-primary__left">
			                        <a class="layout-navigation-logo layout-navigation__bar__logo" aria-label="찍먹냉장고" href="/">
			                            <svg class="icon" width="74" height="30" viewBox="0 0 74 30"
			                                preserveAspectRatio="xMidYMid meet">
			                                <g fill="none" fill-rule="evenodd">
			                                    <!-- 로고부분 (오늘의 집 써있는 부분) -->
			
			                                    <!-- 로고부분 끝 -->
			                                </g>
			                            </svg></a>
			                    </div>
			                    <nav class="layout-navigation-primary__menu">
			                        <a class="layout-navigation-primary__menu__item layout-navigation-primary__menu__item--active layout-navigation-primary__menu__item--open"
			                            href="/">커뮤니티</a>
			                        <a class="layout-navigation-primary__menu__item" href="<c:url value="/shareList.do" />">나눔</a>
			                        <a class="layout-navigation-primary__menu__item" href="<c:url value="/qna.do" />">레시피</a>
			                    </nav>
			                    <div class="layout-navigation-primary__right">
			                        <div class="layout-navigation-bar-search">
			                            <div class="layout-navigation-search" id="id-1">
			                                <div class="layout-navigation-search__header">
			                                    <div id="id-1-combobox" class="layout-navigation-search__combobox" role="combobox"
			                                        aria-haspopup="listbox" aria-expanded="false">
			                                        <div class="layout-navigation-search__input"><input type="text"
			                                                class="layout-navigation-search__input__text" value=""
			                                                autoComplete="off" size="1" id="id-1-input" aria-autocomplete="list"
			                                                placeholder="찍먹 냉장고 검색" aria-label="찍먹 냉장고 검색" />
			                                            <svg class="layout-navigation-search__input__icon" width="24" height="24"
			                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
			                                                preserveAspectRatio="xMidYMid meet">
			                                                <path d="M22 22l-5-5"></path>
			                                                <circle cx="11" cy="11" r="8"></circle>
			                                            </svg>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                        <button class="layout-navigation-bar-icon layout-navigation-bar-search-button" title="검색"
			                            aria-label="검색" type="button">
			                            <svg class="icon" width="24" height="24" viewBox="0 0 24 24" fill="none"
			                                stroke="currentColor" stroke-width="2" preserveAspectRatio="xMidYMid meet">
			                                <path d="M22 22l-5-5"></path>
			                                <circle cx="11" cy="11" r="8"></circle>
			                            </svg></button>
			
			                        <!-- 우측 바 -->
			                        <div class="layout-navigation-bar-login">
			                            <a class="layout-navigation-bar-login__item" href="<c:url value="/login.do" />">로그인</a>
			                            <a class="layout-navigation-bar-login__item" href="<c:url value="/notice.do" />">알림</a>
			                            <a class="layout-navigation-bar-login__item" href="<c:url value="/mail.do" />">쪽지</a>
			                            <a class="layout-navigation-bar-login__item" href="<c:url value="/userchart.do" />">냉장고</a>
			                            <a class="layout-navigation-bar-login__item" href="<c:url value="/shareWrite.do" />">글쓰기</a>
			                            <a class="layout-navigation-bar-login__item" href="<c:url value="/notice.do" />">프로필</a>
			                            <a class="layout-navigation-bar-login__item" href="<c:url value="/frigochart.do" />">통계</a>
			                            <a class="layout-navigation-bar-login__item" href="<c:url value="/qna.do" />">마이페이지</a>
			                            <a class="layout-navigation-bar-login__item" href="<c:url value="/qna.do" />">회원가입 </a>
			
			
			
			                            <div class="drop-down layout-navigation-bar-upload-button">
			                                <path fill="currentColor" fill-rule="evenodd"
			                                    d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z"></path></svg></button>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </header>			
			</div>
		</div>
	