<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://kit.fontawesome.com/979888c264.js" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<link href="<c:url value="/resources/css/community/communityList.css"/>" rel="stylesheet">

  	
<input type="hidden" name="id" value="${id }">

<div class="container" style="margin-top: 100px;">
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<div class="feedify">
				<!-- Feed 목록을 담을 레이아웃 -->
			</div>
		</div>
	</div>
</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script src="<c:url value="/resources/js/community/communityList.js"/>"></script>