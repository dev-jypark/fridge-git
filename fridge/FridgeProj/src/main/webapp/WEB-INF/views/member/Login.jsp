<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- sessionScope가 안먹으면 추가해야하는 로직 -->
<%
	request.setCharacterEncoding("UTF-8");
	session = request.getSession(true); 
	String id = request.getParameter("id"); 
	request.getSession().setAttribute("id", id); 
%>
<!-- 실제 내용 시작 -->
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width">
    <title>찍먹냉장고</title>
    <!-- css 파일 연결한 위치 -->
    <link href="../resources/css/memberlogin/login_insta.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../resources/js/memberlogin/login.js"></script>
  </head>
  <style>
  	.alert_login {
	  	margin-top: 10px;
		margin-bottom: 10px;
		
		text-align: center;
		font-size: 14px;
		color: #8e8e8e;
  	}
  </style>
  <body>
  	<div class>
  		찍먹냉장고(로고가 들어갈 자리입니다)
  	</div>
	
    <div class="container">  
	    
    	<!-- 아이디가 일치하면 -->
		<div class="alert_login">
			<c:if test="${not empty sessionScope.id and empty NotMember}" var="isLogin">
				<div class="col-xs-offset-1 col-xs-6 alert alert-success">
					${sessionScope.id }님 찍먹냉장고에 오신 걸 환영합니다!
				</div>
			</c:if>
		</div>
		<!-- 아이디 또는 비밀번호 일치하지 않을때 -->
	    <c:if test="${! empty  NotMember}">
			<div class="alert_login">
				<div class="col-xs-offset-1 col-xs-6 alert alert-warning fade in">
					${NotMember}
				</div>
			</div>
		</c:if>
		<form name="form1" method="post" action="<c:url value='/member/loginprocess.do'/>" onsubmit="return Login();">
	    <c:if test="${not isLogin}">
	      <input type="text" class="input_login" name="id" id="id" placeholder="아이디">
	      <input type="password" class="input_login" name="pwd" id="pwd" placeholder="비밀번호">
	     <button type="submit" id="btn_login">로그인</button>
	      <!-- 네이버, 카카오 -->
	      
	      <div id="naverIdLogin">
	      	<a id="naverIdLogin_loginButton" href=#>
	      	<img src="../resources/images/memberlogin/btnG_완성형.png" height="30">
	      	</a>   
	      	</div>
	      	<div id="kakaoIdLogin">
	      	<a id="kakaoIdLogin_loginButton" href=#>
	      	<img src="../resources/images/memberlogin/kakao_login_medium_narrow.png" height="30">
	      	</a>  
	      	</div>	
	      	
	      	<!-- 회원가입, 계정찾기 -->
	      	<span class="button_forgot" onClick="location.href='<c:url value="/member/SignUp.do"/>'">
	      	회원이 아니신가요?</span>
	      	
	      <span class="button_forgot">계정을 잊어버리셨나요?</span>
	      </c:if>
	    </form>
	    
	    
    </div>
    <!-- JS 파일 걸어줄 위치 -->
    <script src="../resources/js/memberlogin/login.js"></script>
  </body>
</html>

<!-- 실제 내용 끝-->