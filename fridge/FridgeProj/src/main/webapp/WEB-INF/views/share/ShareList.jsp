<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>찍먹냉장고 | 냉장고 속 남은 재료 나눠먹기</title>
	
	<!-- 지금은 우리 파비콘 없는데 나중에 필요하니까 참고하려고 남겨둠 -->
	<!-- favicon -->
<!-- <link rel="shortcut icon" href="images/ico/favicon.jpg">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png"> -->
	<!-- js -->
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="resources/js/sharelist/select.min.js"></script>
	
	<!-- 페이징 -->
	<!-- <link rel="stylesheet" type="text/css" href="resources/css/sharelist/paging.css" /> -->
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sharelist/bootstrap.min.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sharelist/materialdesignicons.min.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sharelist/jquery.mCustomScrollbar.min.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sharelist/prettyPhoto.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sharelist/unslider.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sharelist/template.css"/>" />
	<!-- 정렬 드롭다운 -->
	<link rel="stylesheet" type="text/css" href="<c:url value="resources/css/sharelist/justselect.css"/>" />
</head>
<body>
	<div class="container">
		<!-- 전체 글 개수 -->
		<div>
			<p>전체 : 2828개</p>
		</div>
	</div>
    <section id="nino-latestBlog">
    	<div class="container">
			<div class="sectionContent">
				<div class="row"> 
				<!-- 컨텐츠 시작 -->
					<div class="col-md-4 col-sm-4">
						<article>
							<div class="articleThumb">
								<!-- 이미지 -->
								<a href="<c:url value="/"/>"><img src="<c:url value="/resources/images/share-list/our-blog/img-1.jpg"/>" alt=""></a>
								<!-- 유통기한 5일 미만의 상품은 남은 날짜 표시 -->
								<div class="date">
									<span class="number">D-3</span>
									<!-- 이건 아래 작은 작은 글씨 띄워주는건데 혹시 나중에 필요할까봐 안지움 -->
									<!-- <span class="text">Jan</span> -->
								</div>
							</div>
							<!-- 글 제목 -->
							<!-- 글 제목 한 줄 넘어가면 ... 으로 표시하기 -->
							<!-- 두 줄 이상 생기지 않기 -->
							<h3 class="articleTitle"><a href="">어제 1+1으로 사온 두부fmfmfmfmfmfmfmfmfmfmfmfmfm</a></h3>
							<!-- 거래 주소 -->
							<p class="articleDesc">
								서울시 금천구 가산동
							</p>
							<div class="articleMeta">
								<!-- 찜 개수 -->
								<a href="#"><i class="mdi mdi-heart-outline nino-icon"></i> 543</a>
								<!-- 채팅수 -->
								<a href="#"><i class="mdi mdi-comment-multiple-outline nino-icon"></i> 15</a>
							</div>
						</article>
					</div>
					<!-- 컨텐츠 끝 -->
					<c:forEach var="item" items="${listPagingData.lists }" varStatus="loop">
					<!-- 컨텐츠 시작 -->
					<div class="col-md-4 col-sm-4">
						<article>
							<div class="articleThumb">
								<!-- 이미지 -->
								<!-- resources/images/share-list/our-blog/img-1.jpg -->
								<a href="<c:url value="/shareDelete.do?tb_no=${item.tbNo }"/>"><img src="<c:url value="/resources/images/share-list/our-blog/img-1.jpg"/>" alt=""></a>
							</div>
							<!-- 글 제목 -->
							<!-- 글 제목 한 줄 넘어가면 ... 으로 표시하기 -->
							<!-- 두 줄 이상 생기지 않기 -->
							<h3 class="articleTitle"><a href="">${item.tbTitle }</a></h3>
							<!-- 거래 주소 -->
							<p class="articleDesc">
								${item.addr }
							</p>
							<div class="articleMeta">
								<!-- 찜 개수 -->
								<a href="#"><i class="mdi mdi-heart-outline nino-icon"></i> ${item.likeCount }</a>
								<!-- 채팅수 -->
								<a href="#"><i class="mdi mdi-comment-multiple-outline nino-icon"></i>??</a>
							</div>
						</article>
					</div>
					</c:forEach>
					<!-- 컨텐츠 끝 -->
				</div>
				<!-- row 끝 -->
				<!-- 페이징 -->
				<c:if test="${listPagingData.lists.size() !=0 }">
					<div class="row">
						<div class="col-md-12 text-center">${listPagingData.pagingString}</div>
					</div>
				</c:if>
			</div>
    	</div>
    </section>
</body>
<script>
	//셀렉트 박스 크기 설정
	$('#select').Select({width: 400,height: 50});
</script>
</html>