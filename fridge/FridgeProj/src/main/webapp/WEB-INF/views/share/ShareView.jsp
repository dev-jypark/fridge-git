<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>상세보기</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/js/share-view/square1.js"></script>

<link rel="stylesheet" type="text/css" href="https://www.jqueryscript.net/css/jquerysctipttop.css">
<!-- <link rel="stylesheet" type="text/css" href="https://www.jqueryscript.net/css/jquerysctipttop.css"> -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.5.0/solar/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/share-view/square1.css" />
<link rel="stylesheet" type="text/css" href="resources/css/share-view/custom.css" />

<style>
	.container { margin: 50px auto; }
	[class*="slideshow"] {
		max-width: 600px;
		height: 450px;
		margin: 0 auto 40px;
		outline: none;
	}
	
	[class*="slideshow"] img {
	 	display:none;
	}
	/* .image_wrapper .text_content {
	  position: absolute;
	  bottom: 50px;
	  left: 50px;
	  color: #fff;
	  text-shadow: 0 0 3px rgba(0,0,0,.5);
	  opacity: 1;
	}
	
	.text_content * {
	  margin: .1em 0;
	} */
	body{
		color:#000000;
	}
</style>
</head>

<body>
	<article id="content">
		<!-- 상품정보 카루셀 -->
		<div class="container">
			<div class="slideshow example-2">
				<img src="https://www.jqueryscript.net/dummy/1.jpg" alt="Image 1 from http://jqueryscript.net/">
				<img src="https://www.jqueryscript.net/dummy/3.jpg" alt="Image 2 from http://jqueryscript.net/">
				<img src="https://www.jqueryscript.net/dummy/5.jpg" alt="Image 3 from http://jqueryscript.net/">
			</div>
		</div>
		<!-- 프로필 -->
		<section id="article-profile">
			<a id="article-profile-link" href="/u/xnykZpgjjWJoGwEW">
				<!-- 프로필 -->
				<div class="space-between">
					<div>
						<div id="article-profile-image">
							<img alt="이딸맘" src="https://dnvefa72aowie.cloudfront.net/origin/profile/202004/E09B124677D049383F15949194905FF869A9BB2AD2E724D04686E9C4338967F1.jpg?q=82&amp;s=80x80&amp;t=crop">
						</div>
						<div id="article-profile-left">
							<div id="nickname">이딸맘</div>
							<div id="region-name">송파구 잠실동</div>
						</div>
					</div>
					<!-- 사용자 등급 표시 -->
					<div id="article-profile-right">
						<dl id="temperature-wrap">
							<dt>사용자등급</dt>
							<dd class="text-color-04 ">
							37.8
							<span>°C</span>
							</dd>
						</dl>
						<div class="meters">
							<div class=" bar bar-color-04" style="width: 38%;"></div>
						</div>
						<div class=" face face-04"></div>
					</div>
				</div>
			</a>
		</section>
		<!-- 나눔 글 내용 -->
		<section id="article-description">
			<h1 property="schema:name" id="article-title" style="margin-top:0px;">어제 1+1 산 두부</h1>
			<p id="article-category">카테고리 ∙ <time>시간(ex.6시간 전)</time></p>
			<p property="schema:priceValidUntil" datatype="xsd:date" content="2023-12-04"></p>
			<p rel="schema:url" resource="https://www.daangn.com/322680659"></p>
			<p property="schema:priceCurrency" content="KRW"></p>
			<!-- 우리는 가격 없는데 혹시 다른걸로 쓸까봐 주석처리 -->
			<!-- <p id="article-price" property="schema:price" content="20000.0" style="font-size:18px; font-weight:bold;">
				가격
			</p> -->
			<div property="schema:description" id="article-detail">
				<p>영아가 말 배우기 시작할 때 일등공신인 프뢰벨 말하기 세트입니다. 우리 아이는 정말 수도 없이 봤네요. 1권이 빠진 구성이고 사용감(+세월의 흔적)이 많으며 두권은 손상이 심해서 저렴하게 올립니다. 사진 참고해주시고, 나머지 책들만 활용하셔도 큰 문제는 없을 듯 해요. 예민맘은 패스해주시고, 한철 가볍게 읽히시기에는 괜찮을 듯 합니다. </p>
				<p>구성 : 책 17권(두권은 찢김 있음) + CD 3개</p>
				<p>* 혹시 필요하시면 돌잡이수학 6권 같이 드릴게요(이것도 사용감은 있는데 훼손된 곳은 없급니다).</p>
				<p>* 연락이 갑자기 너무 많이 와서 깜짝 놀랐네요. 제일 먼저 연락주신 분과 거래하겠습니다. 감사합니다.</p>
			</div>
			<p id="article-counts">관심 4 ∙ 채팅 20 ∙ 조회 311</p>
		</section>
	</article>	
</body>
<script>
	$('.example-1').square1({caption: 'none',
	      theme: 'light'});
	$('.example-2').square1({animation: 'slide'});
</script>
</html>
