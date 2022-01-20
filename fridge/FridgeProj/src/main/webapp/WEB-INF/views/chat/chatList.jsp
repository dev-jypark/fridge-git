<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찍먹냉장고 | 채팅</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="msg-container">
		<div class="messaging">
			<div class="inbox_people">
				<div class="heading_srch">
					<div class="recent_heading">
						<h4>Recent</h4>
					</div>
					<div class="srch_bar">
						<div class="stylish-input-group">
							<input type="text" class="search-bar" placeholder="Search">
							<span class="input-group-addon">
								<button type="button"><i class="fa fa-search" aria-hidden="true"></i></button>
							</span>
						</div>
					</div>
				</div>
				<!-- 메세지 리스트 -->
				<div class="inbox-chat">
				</div>
			</div>
			<!-- 메세지 내용 영역 -->
			<div class="mesgs">
			<!-- 메세지 내용 목록 -->
				<div class="msg_history" name="contentList">
				<!-- 메세지 내용 올 자리 -->
				</div>
				<div class="send_message">
				</div>
				<!-- 메세지 입력란이 올 자리 -->
			</div>
		</div>
	</div>
	<!-- <script>
		const firstMessageList = function(){
			$.ajax({
				url:""
			})
		}
	</script> -->
</body>
</html>