<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>찍먹냉장고 | 냉장고 속 남은 재료 나눠먹기</title>
	
	<!-- 지금은 우리 파비콘 없는데 나중에 필요하니까 참고하려고 남겨둠 -->
	<!-- favicon -->
<!--     <link rel="shortcut icon" href="images/ico/favicon.jpg">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png"> -->
	<!-- js -->
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="resources/js/share-list/select.min.js"></script>
	
	
	<!-- 페이징 -->
	<link rel="stylesheet" type="text/css" href="resources/css/share-list/paging.css" />
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="resources/css/share-list/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/share-list/materialdesignicons.min.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/share-list/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/share-list/prettyPhoto.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/share-list/unslider.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/share-list/template.css" />
	<!-- 셀렉트 박스 css -->
	<link rel="stylesheet" type="text/css" href="resources/css/share-list/select.min.css" />
	
</head>
<body>
	<div class="container">
		<!-- 전체 글 개수 -->
		<div>
			<p>전체 : 2828개</p>
		</div>
		<!-- 정렬 드롭박스 -->
		<div>
			<select name="select" id="select">
		        <option value="1">인기순</option>
		        <option value="2">최근순</option>
		        <option value="3">조회순</option>
		        <option value="4" disabled>.모르겠다</option>
			</select>
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
								<a href="#"><img src="resources/images/share-list/our-blog/img-1.jpg" alt=""></a>
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
							<h3 class="articleTitle"><a href="">어제 1+1으로 사온 두부</a></h3>
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
					<div class="col-md-4 col-sm-4">
						<article>
							<div class="articleThumb">
								<a href="#"><img src="resources/images/share-list/our-blog/img-2.jpg" alt=""></a>
								<div class="date">
									<span class="number">14</span>
									<span class="text">Jan</span>
								</div>
							</div>
							<h3 class="articleTitle"><a href="">sed do eiusmod tempor</a></h3>
							<p class="articleDesc">
								Adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
							</p>
							<div class="articleMeta">
								<a href="#"><i class="mdi mdi-heart-outline nino-icon"></i> 995</a>
								<a href="#"><i class="mdi mdi-comment-multiple-outline nino-icon"></i> 42</a>
							</div>
						</article>
					</div>
					<div class="col-md-4 col-sm-4">
						<article>
							<div class="articleThumb">
								<a href="#"><img src="resources/images/share-list/our-blog/img-3.jpg" alt=""></a>
								<div class="date">
									<span class="number">12</span>
									<span class="text">Jan</span>
								</div>
							</div>
							<h3 class="articleTitle"><a href="">incididunt ut labore et dolore</a></h3>
							<p class="articleDesc">
								Elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
							</p>
							<div class="articleMeta">
								<a href="#"><i class="mdi mdi-heart-outline nino-icon"></i> 1264</a>
								<a href="#"><i class="mdi mdi-comment-multiple-outline nino-icon"></i> 69</a>
							</div>
						</article>
					</div>
				</div>
			</div>
    	</div>
    </section>
    <div>	
		<!-- Start Pagination -->
		<ul class="pagination">
			<li><a href="#0">&lt;</a></li>
			<li><a class="active" href="#0">1</a></li>
			<li><a href="#0">2</a></li>
			<li><a href="#0">3</a></li>
			<li><a href="#0">4</a></li>
			<li><a href="#0">&gt;</a></li>
		</ul>
		<!-- End Pagination -->
	</div>
</body>
<script>
	//셀렉트 박스 크기 설정
	$('#select').Select({width: 400,height: 50});
</script>
</html>