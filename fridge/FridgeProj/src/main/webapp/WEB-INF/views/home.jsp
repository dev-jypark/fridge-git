<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<P>  The time on the server is ${serverTime}. </P>
<!-- 
CREATE TABLE example (
    song NVARCHAR2(10),
    lyrics NVARCHAR2(100)
);

INSERT INTO example VALUES ('song1', '떳다 떳다 비행기 날아라 날아라');
INSERT INTO example VALUES ('song2', '나비야 나비야 이리 날아오너라');
 -->
<form method="GET" action="<c:url value="/songs"/>">
	<button>json으로 example 테이블 리스트 받아오기</button>
</form>
</body>
</html>