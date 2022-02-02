<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
var foodArr = Array(); // 에이작스로 가져온 모든 데이터(피드글)를 관리할 전역변수

function ajax(){	
$.ajax({
	url: '/receipe/reciptList.do',
    type: "POST",
    data: JSON.stringify(json),
    dataType: 'json',
    contentType: "application/json; UTF-8;"
}).done(function(data) {
	printFeed(data);
	console.log(feeds);
	initListenerOnDocument();	
}).fail(function(req, error) {
	console.log('응답코드:%s,에러 메시지:%s,error:%s', req.status, req.responseText, error);
});
}


</script>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<div class="feedify">
				<!--냉장고 재료 목록-->
				<li>${key.value}</li>
				<li>안녕하세요 뷰페이지로 이동하였습니다.</li>
				<li>${foodArr}</li>
				<li>${foodArr.value}</li>
				<li>${foodArr.key}</li>

		    <button id="btn1">restController</button>
		    <div id="result"></div>			
			</div>
		</div>
	</div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>