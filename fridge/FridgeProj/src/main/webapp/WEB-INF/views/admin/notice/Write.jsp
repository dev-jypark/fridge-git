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
		<h1>관리자 <small>공지사항 작성</small></h1>
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
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자님 환영합니다.</span>
                                <img class="img-profile rounded-circle"
                                    src="resources/img/frigochart/undraw_profile.svg">
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
                
                
<div class="container">
	
	<div>
		<form id="myform" class="form-horizontal" method="post"	
			action="<c:url value="/admin_notice/Write.do"/>">
			
			<div class="form-group">
				<label class="col-sm-2 control-label">제 목</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="n_title"
						placeholder="제목을 입력하세요?">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">내 용</label>
				<!-- 중첩 컬럼 사용 -->
				<div class="col-sm-10">
					<div class="row">
						<div class="col-sm-8">
							<textarea rows="5" class="form-control" name="n_content"
								placeholder="내용을 입력하세요"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-4">
					<button class="btn btn-primary">글쓰기</button>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- container -->
<!-- 실제 내용 끝-->
<!-- 경고창 모달 시작 -->
<div class="modal  fade" id="small-modal" data-backdrop="static">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				<button class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h5 class="modal-title">
					<span class="glyphicon glyphicon-blackboard"></span> 확인 메시지
				</h5>
				<h5 id="warningMessage" style="color: red"></h5>
			</div>
		</div>
	</div>
</div>

        <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
                
 <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃을 원하시면 아래 Logout 버튼을 눌러 주세요.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.do">Logout</a>
                </div>
            </div>
        </div>
    </div>

<script>
	/*    	
	//파일 사이즈(바이트):파일객체(자스 DOM).files[0].size
	//파일 명:파일객체(자스 DOM).files[0].name
	//파일 컨텐츠 타입:파일객체(자스 DOM).files[0].type
	*/
	
	$(function(){
		var focusObject;
		var jsDom = $('input[name=attachfile]').get(0);
		//hidden.bs.modal는 모달창이 닫히면 발생하는 이벤트
		$('#small-modal').on('hidden.bs.modal',function(){
			focusObject.focus();
		});
		
			
			if(form.name.value==""){
				$('#warningMessage').html('이름을 입력하세요');
				$('#small-modal').modal('show');
				focusObject = form.name;
				return false;
			}
			if(form.title.value==""){
				$('#warningMessage').html('제목을 입력하세요');
				$('#small-modal').modal('show');
				focusObject = form.title;
				return false;
			}
			
			/*
			else{//파일을 첨부한 경우:파일 업로드 최대 용량 체크
				console.log('파일 크기:',file.files[0].size);
				console.log('파일 이름:',file.files[0].name);
				console.log('컨텐츠 타입:',file.files[0].type);
				if(file.files[0].size > 500*1024){
					$('#warningMessage').html('업로드 최대 용량(500KB)을 초과했어요');
					$('#small-modal').modal('show');
					focusObject = form.attachfile;
					return false;
				}
			}*/
			
			if($('textarea').val()==""){
				$('#warningMessage').html('내용을 입력하세요');
				$('#small-modal').modal('show');
				focusObject = $('textarea');
				return false;
			}
			
			
		});///////////////
		
		
	});




</script>



