<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 상단메뉴 시작 -->	
<jsp:include page="/WEB-INF/views/template/Side.jsp"/>
<!-- 상단메뉴 끝 -->

<!-- side -->
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>사용자 통계 - Dashboard</title>

	<!-- 처음 CDN 코드 작성하는 곳 -->
    <script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
	
    <!-- Custom fonts for this template-->
    <link href="<c:url value="/resources/vendor/frigochart/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/resources/css/frigochart/sb-admin-2.min.css"/>" rel="stylesheet">

</head>
<!-- side 끝 -->

<!-- 실제 내용 시작 -->
<div class="container">
	
	<div class="page-header">
		<h1>관리자 <small>공지사항 게시판</small></h1>
	</div>
	<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

      

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                 

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                      

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href=# id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자님 환영합니다.</span>
                                <img class="img-profile rounded-circle"
                                    src="../resources/img/frigochart/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

<style>
	/* 수정/삭제/목록 버튼 사이 간격 주기 */
	.btn.btn-success{margin-right:5px}
	/* 모달창 크기 조정*/
	.modal-sm{width:325px}
</style>


<div class="container">
	
	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<table class="table table-bordered table-striped">
				<tr>
					<th class="col-md-2 text-center">번 호</th>
					<td>${record.n_no }</td>
				</tr>
				<tr>
					<th class="text-center">제 목</th>
					<td>${record.n_title }</td>
				</tr>
				<tr>
					<th class="text-center">조회수</th>
					<td>${record.n_hit}</td>
				</tr>
				
				<tr>
					<th class="text-center">등록일</th>
					<td>${list.n_postDate}</td>
				</tr>
				<tr>
					<th class="text-center" colspan="2">내 용</th>
				</tr>
				<tr>
					<td colspan="2">${record.n_content }</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- row -->
	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
			<ul id="pillMenu" class="nav nav-pills center-block"
				style="width: 250px; margin-bottom: 10px">
				<li><a href="<c:url value="/admin_notice/Edit.do?n_no=${record.n_no}"/>" class="btn btn-primary" data-toggle="modal"
					data-target="#passwordModal">수정</a></li>
					
				<!-- confirm창에서  취소시에는 모달창이 뜨지 않도록 data-toggle="modal" 제거 그리고 자스로 제어해서 모달창을 띄운다(삭제 확인버튼 클릭시에만) -->
				<li><a href="<c:url value="/admin_notice/Delete.do?n_no=${record.n_no}"/>" class="btn btn-primary" 
					data-target="#passwordModal">삭제</a></li>
					
				<li><a href="<c:url value="/admin_notice/List.do?nowPage=${param.nowPage}"/>"
					class="btn btn-primary">목록</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- container -->
<!-- 실제 내용 끝-->
<!-- 수정/삭제시 사용할 모달 시작 -->
			
<script>
	$('#pillMenu a').not(':last').click(function(){
		console.log($(this).html());
		var text = $(this).html().trim();		
//삭제버튼 클릭
			if(confirm("정말로 삭제 하시겠습니까?")){
				$('input[name=mode]').val('DELETE');
				
				//모달창 자스로 띄우기
				$("#passwordModal").modal('show');
			}
		}
		
	});

</script>



