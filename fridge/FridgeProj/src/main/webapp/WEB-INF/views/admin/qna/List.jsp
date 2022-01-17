<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 상단메뉴 시작 -->	
<jsp:include page="/WEB-INF/views/template/Side.jsp"/>
<!-- 상단메뉴 끝 -->

<!-- 실제 내용 시작 -->
<!-- side -->
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>사용자 통계 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/frigochart/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/frigochart/sb-admin-2.min.css" rel="stylesheet">

</head>
<!-- side 끝 -->

<!-- 실제 내용 시작 -->
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
                                  <!-- 작성하기 버튼 -->
	<div class="text-right">
		
		<a href="<c:url value="/qna/Write.do"/>" class="btn btn-primary">등록</a>
	</div>
	
                <!-- 페이징 -->
                    <div class="text-center">${pagingString} 영역 카테고리변경됨</div>
                </div>

<!-- 실제 내용 끝-->

    
    