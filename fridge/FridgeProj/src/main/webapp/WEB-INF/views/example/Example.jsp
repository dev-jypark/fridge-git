<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>예시 뷰 페이지</legend>
		<h2>example 테이블 목록</h2>
		<ul style="list-style:decimal">
			<c:forEach var="map" items="${list}">
				<li>노래제목 : ${map.song} ,가사 : ${map.lyrics }</li>
			</c:forEach>
		</ul>
	</fieldset>
</body>
</html>