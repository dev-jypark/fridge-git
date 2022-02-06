<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
	<!-- <button type="button" class="btn btn-primary btn-lg" onclick="closeModView()" data-toggle="modal" data-target="#myModal" style="float: right; padding-right:3%;padding-top:2%">닫기</button> -->
	<article class="contents">
		<header class="articleTop">
		</header>
			<!-- <div class="user_container">
				<div class="profile_img">
					<img src="imgs/thumb.jpeg" alt="프로필이미지" style="width: 300px;height: 120px;">
				</div>
				<div class="user_name">
					<div class="nick_name m_text">${record.id}</div>
				</div>
			</div> -->
		<div class="img_section">
			<div class="trans_inner">
				<div>
					<img src="https://www.walkerhillstory.com/wp-content/uploads/2020/09/2-1.jpg" alt="visual01" style="height: 320px; width: 580px;border-radius: 30px;">
				</div>
			</div>
		</div>
		<h3 class="product-title" style="margin-top: 15px;font-size: 24px;font-weight: 700;line-height: 1.4; padding-left: 5%;"> ${record.tbTitle}</h3>
		<div style="display: flex;flex-direction: row;justify-content: space-between; border-top: 1px solid rgba(142, 113, 152, 0.79); border-bottom: 1px solid rgba(142, 113, 152, 0.79);">
			<div class="col-md-8">
				<ul class="list-product-information">
					<li class="list-item user_id" style="margin-left:2%; margin-top:1%;"> 판매자: <span>${record.id}</span></li>
					<li class="list-item date" style="margin-left:2%; margin-top:1%;"> 게시일: <span>${record.tbPostDate}</span></li>
					<li class="list-item location" style="margin-left:2%; margin-top:1%;"> 지역: <span>독산동</span></li>
				</ul>	
			</div>
			<c:if test="${sessionScope.id ne record.id}">
				<div class="col-md-4" style="margin:auto">
					<a href="<c:url value="/message_send_trade.do?no=${record.tbNo}"/>" class="btn btn-info" >채팅</a>
				</div>
			</c:if>		
		<c:if test="${sessionScope.id eq record.id}">
			
				<a href="<c:url value="/message_send_trade.do?no=${record.tbNo}"/>" class="btn btn-info">거래완료</a>
		</c:if>
		</div>
		<div class="description" style="padding-left: 5%; padding-top:2%">		
			${record.tbContent}
		</div>
		<div class="rudBtn" style="display: flex; justify-content: flex-end;">
			<c:if test="${sessionScope.id eq record.id}">
				<a href="<c:url value="/share/shareEdit.do?tb_no=${record.tbNo}"/>" class="btn btn-info" style="margin-right: 1%; padding="1%">수정</a>
				<a href="<c:url value="/share//shareDelete.do?tb_no=${record.tbNo}"/>" class="btn btn-info" style="margin-right: 1%;">삭제</a>
			</c:if>
		</div>
	</article>
</div>