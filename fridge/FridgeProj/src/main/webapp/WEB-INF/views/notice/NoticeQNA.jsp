<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>질문과 답변</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href="<c:url value="/resources/css/notice/NoticeQNA.css"/>" rel="stylesheet">
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

                    <a class="navbar-brand" href="#"> <strong>냉장고로고</strong>
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
            <div class="qna_title">질문과 답변
                <div style="font-size: 0.6em;">냉장고 재료 관리 꿀팁을 나누어보세요!</div>
                <div class="qna_searchbox">
                    img
                    <input id="qna_searchbox_input" type="text" id="faq_search" placeholder="검색어를 입력하세요.">
                    xbtn
                </div>
                <div class="qna_KeywordListItem">
                    <dt>
                        <dd>
                            <ul>
                                <li>
                                    <a href="#">신선식품</a>
                                </li>
                                <li>
                                    <a href="#">여름철 식재료</a>
                                </li>
                                <li>
                                    <a href="#">고기 고르기 꿀팁</a>
                                </li>
                            </ul>
                        </dd>
                    </dt>
                </div>
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
                    <section style="margin: 1%;">Title contents prof-img id date numCommt numView tag attachtedImg</section>
                    <section style="margin: 1%;">Title contents prof-img id date numCommt numView tag attachtedImg</section>
                    <section style="margin: 1%;">Title contents prof-img id date numCommt numView tag attachtedImg</section>
                    <section style="margin: 1%;">Title contents prof-img id date numCommt numView tag attachtedImg</section>
                    <section style="margin: 1%;">Title contents prof-img id date numCommt numView tag attachtedImg</section>
                    <section style="margin: 1%;">Title contents prof-img id date numCommt numView tag attachtedImg</section>
                    <section style="margin: 1%;">Title contents prof-img id date numCommt numView tag attachtedImg</section>
                </article>
                <div>-----------sample below----------</div>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-condensed">
                        <!-- 테이블 컬럼폭은 col-*-*계열로 설정 -->
                        <tr>
                            <th class="text-center col-md-1">번호</th>
                            <th class="text-left">제목</th>
                            <th class="text-center col-md-1">작성자</th>
                            <th class="text-center col-md-2">등록일</th>
                        </tr>
            
                        <c:if test="${empty records }" var="isEmpty">
                            <tr class="text-center">
                                <td colspan="6">등록된 게시물이 없습니다</td>
                            </tr>
                        </c:if>
                        <c:if test="${not isEmpty}">
                            <c:forEach var="record" items="${records }" varStatus="loop">
                                <tr>
                                    <td class="text-center col-md-1">${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
                                    
                                    <td class="text-left"><a href="<c:url value="/dataroom/View.kosmo?no=${record.no}&nowPage="/><c:out value="${param.nowPage }" default="1"/>">${record.title}</a></td>
                                    <td class="text-center col-md-1">${record.name}</td>											
                                    <td class="text-center col-md-5">${record.postdate}</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </table>
                    <button>등록</button> <!-- 임시 버튼 스타일 줌-->
                </div>
                <!-- 페이징 -->
                <div class="text-center">${pagingString}</div>
            </div>
        </div>

        <div class="footer">푸터 영역_Temp</div>
    </div>
</body>

</html>