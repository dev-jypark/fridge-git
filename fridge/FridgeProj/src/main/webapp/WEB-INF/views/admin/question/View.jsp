<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
	/* 수정/삭제/목록 버튼 사이 간격 주기 */
	.btn.btn-success{margin-right:5px}
	/* 모달창 크기 조정*/
	.modal-sm{width:325px}
</style>


<!-- 실제 내용 시작 -->
<div class="container">
	
	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<table class="table table-bordered table-striped">
				<tr>
					<th class="col-md-2 text-center">번 호</th>
					<td>${list.q_no }</td>
				</tr>
				<tr>
					<th class="text-center">제 목</th>
					<td>${list.q_title }</td>
				</tr>
				<tr>
					<th class="text-center">작성자</th>
					<td>${list.id}</td>
				</tr>
				
				<tr>
					<th class="text-center">등록일</th>
					<td>${list.q_postdate}</td>
				</tr>
				<tr>
					<th class="text-center" colspan="2">내 용</th>
				</tr>
				<tr>
					<td colspan="2">${list.q_content }</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- row -->
	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
			<ul id="pillMenu" class="nav nav-pills center-block"
				style="width: 200px; margin-bottom: 10px">
				<li><a href="#" class="btn btn-success" data-toggle="modal"
					data-target="#passwordModal">수정</a></li>
				<!-- confirm창에서  취소시에는 모달창이 뜨지 않도록 data-toggle="modal" 제거 그리고 자스로 제어해서 모달창을 띄운다(삭제 확인버튼 클릭시에만) -->
				<li><a href="#" class="btn btn-success" 
					data-target="#passwordModal">삭제</a></li>
				<li><a href="<c:url value="/question/List.do?nowPage=${param.nowPage}"/>"
					class="btn btn-success">목록</a></li>
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



