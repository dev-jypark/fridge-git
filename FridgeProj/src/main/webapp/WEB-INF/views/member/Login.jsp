<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- sessionScope가 안먹으면 추가해야하는 로직 -->
<%
	request.setCharacterEncoding("UTF-8");
	session = request.getSession(true); 
	String id = request.getParameter("id"); 
	request.getSession().setAttribute("id", id); 
	String socialId = request.getParameter("socialId"); 
	request.getSession().setAttribute("socialId", socialId); 
%>
<!-- 실제 내용 시작 -->
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width">
    <meta name ="google-signin-client_id" content="1048162818783-hjp4j0h4m9uehdm28uvq9fe6299otejd.apps.googleusercontent.com">
    <title>찍먹냉장고</title>
    <!-- css 파일 연결한 위치 -->
    <link href=<c:url value="/resources/css/memberlogin/login.css"/> rel="stylesheet" type="text/css"/>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
   	<script src="<c:url value="/resources/js/member/login.js"/>"></script>  	
  </head>
  <style>
  	.alert_login {
	  	margin-top: 10px;
		margin-bottom: 10px;		
		text-align: center;
		font-size: 12px;
		color: #8e8e8e;
  	}
  </style>
  <body>
    <div class="login_container">  	    
    	
		<form name="form1" method="post" action="<c:url value='/member/loginprocess.do'/>" onsubmit="return Login();">
			<div style="text-align : center;">
			<img src="<c:url value="/resources/images/top/logo_full.png"/>" alt="찍먹냉장고" style="width:55%; height:55%; margin-top:40px; margin-bottom:15px;>
			</div>
			
			<!-- 아이디가 일치하면 -->
			<div class="alert_login">
				<c:if test="${not empty sessionScope.id and empty NotMember}" var="isLogin">
					<!--  div class="col-xs-offset-1 col-xs-10 alert alert-success">
						${sessionScope.id }님 찍먹냉장고에 오신 걸 환영합니다!
					</div>-->
				</c:if>
			</div>
			<!-- 아이디 또는 비밀번호 일치하지 않을때 -->
		    <c:if test="${! empty  NotMember}">
		    <!-- process의 NotMember value 띄우기 -->
				<div class="alert_login">
					<div class="alert alert-warning fade in">				
						${NotMember}
					</div>
				</div>
			</c:if>
			<c:if test="${not isLogin}">
			    <div class="inputbox">
			      <input type="text" class="input_login" name="id" id="id" placeholder="아이디">
			      <input type="password" class="input_login" name="pwd" id="pwd" placeholder="비밀번호">
			     <button type="submit" id="btn_login">로그인</button>
			     </div>
			</c:if>
			
	    </form>	 
	      <!--카카오, 구글 -->
	    <form action="<c:url value='/member/socialLogin.do'/>" method="post" id="form">
	      <div id="socialLogin">
		      	<ul class="css-1k406r0-SNSList e111gxds1">
				<li class="css-1balhvh-SNSItem e111gxds0" onclick="social.kakao.login()">
					<a href="javascript:kakaologin()">
					<img id="kakao" alt="카카오 로그인" src="<c:url value="/resources/images/member/kakao.png"/>">
					</a>
				</li>
				<li id="googleBtn" class="css-1balhvh-SNSItem e111gxds0">
					<a href="javascript:void(0)">
					<img id="google" alt="구글 로그인" src= "<c:url value="/resources/images/member/google.png"/>">
					</a>
				</li>
			</ul>
	      </div>	
	      	<input type="hidden" name="loginType" id="loginType">
	      	<input type="hidden" name="socialId" id="socialId">
	      	<input type="hidden" name="socialEmail" id="socialEmail">
			<input type="hidden" name="socialNick" id="socialNick">

		</form>	 
	      	<!-- 회원가입 -->
	      	<span class="button_forgot" onClick="location.href='<c:url value="/member/SignUp.do"/>'"> 회원이 아니신가요?</span>	      
	     	   
    </div>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script> 
  </body>
</html>

<!-- 실제 내용 끝-->