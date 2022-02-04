<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="//cdn.jsdelivr.net/npm/bs-stepper/dist/css/bs-stepper.min.css" rel="stylesheet" id="stepper-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/bs-stepper/dist/js/bs-stepper.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<head>
	<link href="<c:url value="/resources/css/sharewrite/sharewrite.css?v=220109"/>" rel="stylesheet" type="text/css">
	<script src="<c:url value="/resources/js/sharewrite/template.js"/>"></script>
	<!-- MDBootstrap Datatables  -->
	<link href="<c:url value="/resources/css/sharewrite/MDB-Free_4.20.0/css/addons/datatables.min.css"/>" rel="stylesheet">
	<!-- MDBootstrap Datatables  -->
	<script type="text/javascript" src="<c:url value="/resources/css/sharewrite/MDB-Free_4.20.0/js/addons/datatables.min.js"/>"></script>
	<title>찍먹냉장고 | 재료나눔게시판 글쓰기</title>
</head>
<script>
	var stepper = "";
	$(document).ready(function () {	
	  //stepper initialize
	  stepper = new Stepper($('.bs-stepper')[0]);
	  console.log("stepper initialize!");
	  //datatable initialize
	  $('.vertical-table').DataTable({
		  "scrollY": "100px",
		  "scrollCollapse": true,
		  "paging": false ,
		  "ordering": false 
	  });
	  $('.dataTables_length').addClass('bs-select');
	  $("form").on("submit",function(e) {
			e.preventDefault();
	  });
	  //checkbox checked/unchecked event	
	  $("input:checkbox[name='check']").click(function(e){
			if($(e.target).is(':checked')) {
				$(e.target).parents("tr").find("input[type='number']").attr('readonly',false);
				$(e.target).parents("tr").find("input[type='number']").val(1);
				addTag(e);
			}
			if(!$(e.target).is(':checked')) {
				$(e.target).parents("tr").find("input[type='number']").attr('readonly',true);
				var tagIdx = $(e.target).parents("tr").find("input[type='hidden']").val();
				// hastag delete (not use deleteTag function)
				var  element = $(".del-btn").filter(function(i,element){
							return ($(element).attr("idx")==tagIdx);
						});		
				$(element).parent().remove();		
			}
	  });
	});


	
	// hashtag delete btn click
	$(document).on("click",".del-btn", function (e) {
		deleteTag(e);
	});
	function addTag(e) {
		var tagValue = $(e.target).parents("tr").find(".name").text();
		var tagIdx = $(e.target).parents("tr").find("input[type='hidden']").val();
		$(".tag-list").append("<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" +  tagIdx + "'>x</span></li>");
	}
	function deleteTag(e) {
		var index = $(e.target).attr("idx");
		console.log("index : "+index);
		var  element = $("input[type='hidden']").filter(function(i,element){
							return ($(element).attr("value")==index);
						});
		$(element).parents("tr").find("input:checkbox[name='check']").prop("checked", false);
        $(e.target).parent().remove();
	}
	function nextStep1() {
		var count = 0;
		
		$("input[name=check]").each(function(idx){
			if($(this).is(":checked")){
				count=count+1;
			}
		});
		
		if(count < 1){
			alert('나눔 재료를 한 개 이상 선택하세요');
			return false;
		}
		
		/* if($("input[name=count]").val() > $("input[name=count]").attr('max')){
			alert('보유 재료 이하의 개수를 입력하세요');
			return false;
		}
		else($("input[name=count]").val() < 1){
			alert('1개 이상 입력하세요');
			return false;
		} */
		stepper.next();
		console.log("next step1");
	}
	function nextStep2() {
		stepper.next();
		console.log("next step2");
	}
	function send() {
		// step3 예외 처리 필요
		if($("input[name=title]").val().length==0){
			alert('제목을 입력해주세요');
			return false;
		}
		if($("textarea#comment").val().length==0){
			alert('내용을 입력해주세요');
			return false;
		}
		var url = "/app/shareWrite.do";
		var formData = new FormData($("form")[0]);
		var checkboxes = [];
		var counts = [];
		
		$("input:checkbox[name='check']:checked").each(function(){
			checkboxes.push($(this).val());
			console.log("checkboxes"+$(this).val());
		});
		
		$("input[type='number']:not([readonly])").each(function(){
			counts.push($(this).val());
		});

		$.each($("input[type='file']")[0].files, function(i, file){
			formData.append('file', file);
		});
	
		formData.append("checkboxes", checkboxes);
		formData.append("counts", counts);
		
		console.log("%O",checkboxes);
		$.ajax({
			url : url,
			type : 'post',
			data : formData,
			cache : false,
			contentType : false,
			dataType : 'text',
			processData: false,
			error : function(jqWHR, textStatus, errorThrown){
				alert(jqWHR.statusText);
			},
			success : function(data, jqWHR, textStatus){
				console.log("Success!");
				if(data){
					alert("등록을 완료했습니다!");
					location.href="/app/shareList.do";
				}
			} 
		});
		
	}
	

</script>
<div class="container">
	<div class="row">
		<div class="mb-5 p-4 bg-white shadow-sm col-lg-12">
			<div class="bs-stepper linear col-lg-12">
				<div class="bs-stepper-header" role="tablist">
				  <div class="step" data-target="#step-1">
					<button type="button" class="step-trigger" role="tab" aria-controls="step-1-trigger" id="step-1-trigger">
					  <span class="bs-stepper-circle">1</span>
					  <span class="bs-stepper-label">1단계</span>
					</button>
				  </div>
				  <div class="line"></div>
				  <div class="step" data-target="#step-2">
					<button type="button" class="step-trigger" role="tab" aria-controls="step-2-trigger" id="step-2-trigger">
					  <span class="bs-stepper-circle">2</span>
					  <span class="bs-stepper-label">2단계</span>
					</button>
				  </div>
				  <div class="line"></div>
				  <div class="step" data-target="#step-3">
					<button type="button" class="step-trigger" role="tab" aria-controls="step-3-trigger" id="step-3-trigger">
					  <span class="bs-stepper-circle">3</span>
					  <span class="bs-stepper-label">3단계</span>
					</button>
				  </div>
				</div>
				
				<form action="<c:url value='/shareEdit.do'/>" method="post" enctype="multipart/form-data">
				<div class="bs-stepper-content">
				  <!-- step1 content -->
				  <div id="step-1" role="tabpanel" class="content bs-stepper-pane" aria-labelledby="step-1-trigger">
					<h4><strong>나의 냉장고 보기</strong></h4>
					&nbsp;
					<div class="form-group">
						<div class="col-12">
							<div class="table-responsive">
								<table class="vertical-table table table-bordered">
									<thead>
									  <tr>
										<th scope="col">선택</th>
										<th scope="col">재료명</th>
										<th scope="col">유통기한</th>
										<th scope="col">보유갯수</th>
										<th scope="col">선택갯수</th>
									  </tr>
									</thead>
									<tbody>
									<!-- 시작 -->
									<c:forEach var="item" items="${record.listShareProduct }" varStatus="loop">
									  <tr>
										<td>
										  <div class="custom-control custom-checkbox">
											  <input type="checkbox" name="check" class="custom-control-input" id="idx${item.i_no}" value="${item.i_no}">
											  <label class="custom-control-label" for="idx${item.i_no}">
												<span class="sr-only"></span>
											</label>
										</div>
										</td>
										<td class="name">${item.i_name}</td>
										<td>${item.t_deadline}</td>
										<td>${item.i_cnt}</td>
										<td>
											<input type="number" min="1" max="${item.i_cnt}" step="1" class="form-control" id="selectidx${item.i_no}" name="count" readonly><!--max에 불러온 보유갯수 넣기-->
											<input type="hidden" name="idx" value="${item.i_no}"><!-- 재료 불러와서 재료 idx 넣기-->
										</td>
									  </tr>
									  </c:forEach>
									  <!-- 끝 -->
									</tbody>
								  </table>
							</div>
						  </div>
					</div>
					<h4><strong>선택한 재료</strong></h4>
					&nbsp;
					<div class="selected-ingrediants d-flex justify-content-start">
						<ul class="tag-list">
						</ul>
					</div>
					<button class="btn btn-primary" onclick="nextStep1();">Next</button>
				  </div>
				  
				  <!-- step2 content -->
				  <div id="step-2" role="tabpanel" class="content bs-stepper-pane" aria-labelledby="step-2-trigger">
					<h4><strong>거래글 작성</strong></h4>
					&nbsp;
			
					<!-- 이미지 첨부(2) 이미지 미리보기/삭제 제어용 js 예시 -->
					<div id='image_preview'>
						<input type='file' id='btnAtt' multiple='multiple' name="shareUpload"/>
						<div id='att_zone' data-placeholder='첨부할 파일을 드래그앤드롭 하세요'></div>
					</div>
					<script src="<c:url value="/resources/js/sharewrite/image.js"/>"></script>
					&nbsp;
					
					<button class="btn btn-primary" onclick="stepper.previous();console.log('previous');">Previous</button>
					<button class="btn btn-primary" onclick="nextStep2();">Next</button>
				  </div>
				  <!-- step3 content -->
				  <div id="step-3" role="tabpanel" class="content bs-stepper-pane" aria-labelledby="step-3-trigger">
				  <!-- 글작성 (텍스트박스) -->
					<div class="form-group">
						<label class="control-label col-sm-2" for="fname"><strong>제목</strong></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="fname" placeholder="제목을 입력하세요" name="title">
							<input type="hidden" name="id" value="kim"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="comment"><strong>내용</strong></label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="5" id="comment" placeholder="상세내용을 입력하세요" name="content"></textarea>
						</div>
					</div>
					<button class="btn btn-primary" onclick="stepper.previous()">Previous</button>
					<button class="btn btn-primary" onclick="send()">등록</button>
				</div>
					<!-- <div class="form-group">
					  <label for="exampleInputEmail1">Email address</label>
					  <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
					</div>
					<button class="btn btn-primary" onclick="stepper.previous()">Previous</button>
					여기 서브밋 버튼으로 만들기
					<button class="btn btn-primary" onclick="stepper.next()">Next</button>
				  </div -->			  			  
				</div>
				 </form>
			</div>			
		</div>

	</div>
</div>