<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SamplePage</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href="<c:url value="/resources/css/share/ShareMapBoard.css"/>" rel="stylesheet">
</head>
<!-- 지도 API, ip 발급 문제로 구현 후 변경-->
<!-- 12/25 spite 및 이미지맵 미추가 -->
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
            <div class="map" onclick="showView()"> <img src="/CSS3/FRIDGE/img/map.PNG"></div>
            <div class="box" id="box">
                <div id="boardView">
                    <div class="container container-detail">

                        <article class="contents">
                            <header class="top">
                                <div class="user_container">
                                    <div class="profile_img">
                                        <img src="/CSS3/FRIDGE/imgs/thumb.jpeg" alt="프로필이미지">
                                    </div>
                                    <div class="user_name">
                                        <div class="nick_name m_text">ChulHwanChoi</div>
                                        <div class="country s_text">Gasan Dong, Seoul</div>
                                    </div>

                                </div>

                                <div class="sprite_more_icon" data-name="more">
                                    <ul class="toggle_box">
                                        <li><input type="submit" class="follow" value="팔로우" data-name="follow"></li>
                                        <li>수정</li>
                                        <li>삭제</li>
                                    </ul>
                                </div>
                            </header>

                            <div class="img_section">
                                <div class="trans_inner">
                                    <div>
                                        <img src="/CSS3/FRIDGE/images/bbsShare_no001_01.jpeg" alt="visual01">
                                    </div>
                                </div>
                            </div>

                            <div class="bottom_icons">
                                <div class="left_icons">
                                    <div class="heart_btn">
                                        <div class="sprite_heart_icon_outline" name="39" data-name="heartbeat"></div>
                                    </div>
                                    <div class="sprite_bubble_icon"></div>
                                    <div class="sprite_share_icon" data-name="share"></div>
                                </div>
                                <div class="right_icon">
                                    <div class="sprite_bookmark_outline" data-name="bookmark"></div>
                                </div>
                            </div>
                            <h3 class="product-title">과일 타르트</h3>
                            <h4 class="product-price" style="font-weight: bold;">5,000원</h4>
                            <ul class="list-product-information"
                                style="border-top: 1px solid rgba(142, 113, 152, 0.79); border-bottom: 1px solid rgba(142, 113, 152, 0.79);">
                                <li class="list-item user_id">판매자 <span>최철환</span></li>
                                <li class="list-item date">상품 등록 시간 <span><time datetime='2021-12-16T08:30:00Z'>2시간
                                            전</time></span></li>

                                <li class="list-item numProduct">상품 수량 <span>2조각</span></li>
                                <li class="list-item location">인근 지역 <span>독산동</span></li>
                            </ul>
                            <div class="description">
                                <p>동네 인스타 갬성 카페에서 산 타르트입니다. 맛있어요</p>
                                <p>
                                    판매가격: 5,000원 <br>2시간 전에 산 타르트입니다...
                                </p>
                                <p>어제 산거예요...</p>
                            </div>
                            <div class="likes m_text">
                                관심 <span id="like-count-39">346</span> <span id="bookmark-count-39"></span> 개
                            </div>

                            <div class="comment_container">
                                <div class="comment" id="comment-list-ajax-post37">
                                    <div class="comment-detail">
                                        <div class="nick_name m_text">dongdong2</div>
                                        <div>쿨거래 네고 가능한가요?</div>
                                    </div>
                                </div>
                                <div class="small_heart">
                                    <div class="sprite_small_heart_icon_outline"></div>
                                </div>
                            </div>

                            <div class="timer">1시간 전</div>

                            <div class="comment_field" id="add-comment-post37">
                                <input type="text" placeholder="댓글달기...">
                                <div class="upload_btn m_text" data-name="comment">게시</div>
                            </div>
                        </article>

                    </div>

                </div>


                box
            </div>
        </div>
        <div id="carou">
            <p>캐로캐로</p>
        </div>
        <div class="footer">푸터 영역_Temp</div>
    </div>
</body>
<script>
    function showView() {
        var box = document.getElementById("box");
        if (box.style.display != 'block') {
            box.style.display = 'block';
        }
        else
            box.style.display = 'none';

    }
</script>

</html>