<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2>write 페이지 test입니다.</h2>
    <form method="post" action="insert.do">
        <div>작성자<input name="id" id="id" size="80" value="" placeholder="아이디 입력"></div>
        <div>재료명<input name="i_name" id="i_name" size="80" placeholder="재료명 입력"></div>
        <div>수량<input name="i_cnt" id="i_cnt" size="80" placeholder="수량 입력"></div>
        <div>유통기한<input type="date" name="i_enddate" id="i_enddate" size="80" placeholder="유통기한 입력"></div>
        <div style="width:650px; text-align:center;">
            <input type="submit" value="확인">
        </div>
    </form>
</body>
</html>