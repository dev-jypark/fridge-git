<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- sessionScope가 안먹으면 추가해야하는 로직 -->
<%
	request.setCharacterEncoding("UTF-8");
	session = request.getSession(true); 
	String id = request.getParameter("adminid"); 
	request.getSession().setAttribute("adminid", id); 
%>
<!-- 실제 내용 시작 -->
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width">
    <title>찍먹냉장고</title>
    <!-- css 파일 연결한 위치 -->
    <link href="../resources/css/adminlogin/login_insta.css" rel="stylesheet" type="text/css" />
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
  	<div class="row" style="display: flex;
    justify-content: center; margin-top: 80px;">
  		 <img style="width:30%; border-radius:25% "
                                    src="../resources/img/frigochart/logo_full.png" >
  	</div>
	
    <div class="container" style="justify-content: center display: flex;
    justify-content: center; margin-bottom: 40px;">  
	    
    	<!-- 아이디가 일치하면 -->
		<div class="alert_login">
			<c:if test="${not empty sessionScope.id and empty NotAdmin}" var="isAdmin">
				<div class="col-xs-offset-1 col-xs-6 alert alert-success">
					${sessionScope.id }관리자 님 찍먹냉장고에 오신 것을 환영합니다!
				</div>
			</c:if>
		</div>
		<!-- 아이디 또는 비밀번호 일치하지 않을때 -->
	    <c:if test="${! empty  NotAdmin}">
			<div class="alert_login">
				<div class="col-xs-offset-1 col-xs-6 alert alert-warning fade in">
					${NotAdmin}
				</div>
			</div>
		</c:if>
		<form name="form1" method="post" action="<c:url value='/admin/LoginProcess.do'/>" onsubmit="return Login();">
	    <c:if test="${not isAdmin}">
	    	<h3 style="display: flex;
    justify-content: center;
    margin-bottom: 40px;">관리자 로그인</h3>
	      <input type="text" class="input_login" name="adminid" id="adminid" placeholder="아이디">
	      <input type="password" class="input_login" name="adminpw" id="adminpw" placeholder="비밀번호">
	     <button type="submit" id="btn_login">로그인</button>
	     
	      </c:if>
	    </form>
	    
	    
    </div>
    <!-- JS 파일 걸어줄 위치 -->
    <script src="../resources/js/memberlogin/login.js"></script>
  </body>
</html>

<!-- 실제 내용 끝-->