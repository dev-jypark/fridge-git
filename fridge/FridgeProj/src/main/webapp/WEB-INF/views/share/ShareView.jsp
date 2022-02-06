<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<article class="contents">
	<header class="articleTop">
		<div class="user_container">
			<div class="profile_img">
				<img src="imgs/thumb.jpeg" alt="프로필이미지">
			</div>
			<div class="user_name">
				<div class="nick_name m_text">${record.id}</div>
				<div class="country s_text">${record.addr}</div>
			</div>

		</div>

		<div class="sprite_more_icon" data-name="more">
			<ul class="toggle_box">
				<li><input type="submit" class="follow" value="팔로우"
					data-name="follow"></li>
				<li>수정</li>
				<!-- write -->
				<li>삭제</li>
				<!-- delete  -->
			</ul>
		</div>
	</header>
	<div class="img_section">
		<div class="trans_inner">
			<div>이미지영역
				<img src="/images/bbsShare_no001_01.jpeg" alt="visual01">
			</div>
		</div>
	</div>
	<h3 class="product-title"> ${record.tbTitle}</h3>
	<ul class="list-product-information" style="border-top: 1px solid rgba(142, 113, 152, 0.79); border-bottom: 1px solid rgba(142, 113, 152, 0.79);">
		<li class="list-item user_id"> 판매자 <span>${record.id}</span></li>
		<li class="list-item date"> 게시일 <span>${record.tbPostDate}</span></li>
		<li class="list-item numProduct"> 상품 수량 <span>2조각</span></li>
		<li class="list-item location"> 지역 <span>독산동</span></li>
		<a href="<c:url value="/message_send_trade.do?no=${record.tbNo}"/>" class="btn btn-info">채팅</a>
	</ul>	
	<div class="description">
	<a href="<c:url value="/message_send_trade.do?no=${record.tbNo}"/>" class="btn btn-info">거래완료</a>
		${record.tbContent}
	</div>
	<div class="likes m_text">
		<span id="bookmark-count-39">조회수 ${record.tbVisitCount} 회</span>
		<a href="<c:url value="/share/shareEdit.do?tb_no=${record.tbNo}"/>" class="btn btn-info">수정</a> 
		<a href="<c:url value="/share//shareDelete.do?tb_no=${record.tbNo}"/>" class="btn btn-info">삭제</a>
	</div>
</article>