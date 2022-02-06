<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class='table table-bordered' style='width: 50%'>
	<tr>
	    <th>번호</th>
	    <th>제목</th>
	    <th>작성자</th>
	    <th>지역</th>
	    <th>작성일</th>
	</tr>
	<c:forEach var="item" items="${list}" varStatus="status">
		
		<tr>
	    	<td>${item.tbNo}</td>
	    	<td><a href="javascript:void(0);" onclick="getView('${item.tbNo}')">${item.tbTitle}</a></td>
	    	<td>${item.id}</td>
	    	<td>${item.addr}</td>
	    	<td>${item.tbPostDate}</td>
	    </tr>
	 </c:forEach>
</table>
<a href="<c:url value="/share/shareWrite.do"/>" class="btn btn-info">신규 나눔 등록</a>'