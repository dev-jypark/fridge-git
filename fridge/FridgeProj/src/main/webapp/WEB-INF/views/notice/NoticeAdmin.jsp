<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>공지사항</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href="<c:url value="/resources/css/notice/NoticeAdmin.css"/>" rel="stylesheet">
</head>

<body>
    <div id="container">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!--화면 크기가 작을때 보여지는 네비게이션바(모바일용)  -->
                <div class="navbar-header">
                    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapse-menu">
                        <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="#"> <strong>냉장고</strong>
                    </a>
                </div>

                <!-- 화면 크기가 클때 상단에 보여지는 네비게이션바(데스크탑용) -->
                <div class="collapse navbar-collapse" id="collapse-menu">
                    <!-- 네비게이션바에 폼 추가 -->
                    <form class="navbar-form navbar-right">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="검색">
                        </div>
                        <button type="submit" class="btn btn-info">확인</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">HOME</a></li>
                        <li><a href="#">회원가입</a></li>
                        <li><a href="#">냉장고 관리</a></li>
                        <li><a href="#">거래 게시판</a></li>
                        <li><a href="#">지도게시판</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>

        <div id="main">
            <div class="csNotice_title">고객센터</div>
            <div class="csNotice">

                <section class="contact">
                    <address>운영시간 : 평일 09:00 ~ 18:00 (주말 &amp; 공휴일 제외)<br>이메일 :&nbsp;<a href="#"
                            style="text-decoration:underline">이메일 문의하기</a>
                        <button class="customer-center__contact__btn-copy-email" type="button">이메일 주소 복사</button><br>
                        전화 :&nbsp;<a href="tel:9999-9999" style="text-decoration:underline">9999-9999</a>
                    </address>
                    <button class="btn btn-md btn-priority" type="button">1:1 카톡 상담하기</button>
                </section>
                <section class="csFaq">
                    <ul class="csFaq_list">
                        <li><a href="#">서비스 사용법</a></li>
                        <li><a href="#">리워드 사용법</a></li>
                        <li><a href="#">3번 FAQ</a></li>
                        <li><a href="#">4번 FAQ</a></li>
                        <li><a href="#">5번 FAQ</a></li>
                        <li><a href=""> 6번 FAQ</a></li>
                    </ul>
                </section>
            </div>
            <div class="faq">
                <div class="faq_nav">
                    <nav class="faq_nav_list">
                        <ul>
                            <li class="faq_nav_item"><a href="#">전체</a></li>
                            <li class="faq_nav_item"><a href="#">냉장고</a></li>
                            <li class="faq_nav_item"><a href="#">거래</a></li>
                            <li class="faq_nav_item"><a href="#">리워드</a></li>
                            <li class="faq_nav_item"><a href="#">웹/모바일</a></li>
                            <li class="faq_nav_item"><a href="#">로그인/회원정보</a></li>
                            <li class="faq_nav_item"><a href="#">서비스/기타</a></li>
                        </ul>

                    </nav>
                </div>
                <article class="faq_contents">
                    <section >faq 카테고리 섹션 임시</section>
                    <section >faq 카테고리 섹션 임시</section>
                    <section >faq 카테고리 섹션 임시</section>
                    <section >faq 카테고리 섹션 임시</section>
                    <section >faq 카테고리 섹션 임시</section>
                    <section >faq 카테고리 섹션 임시</section>
                    <section >faq 카테고리 섹션 임시</section>
                </article>
            </div>
        </div>

        <div class="footer">푸터 영역_Temp</div>
    </div>
</body>

</html>