<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!------ Include the above in your HEAD tag ---------->

<head>
<link href="resources/css/share-write/sharewrite.css" rel="stylesheet" type="text/css">
<script src="resources/js/share-write/template.js"></script>
<title>찍먹냉장고 | 재료나눔게시판 글쓰기</title>
</head>
		<!-- step 템플릿 -->
		<div class="container">
		<div class="stepwizard">
		    <div class="stepwizard-row setup-panel">
		        <div class="stepwizard-step">
		            <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
		            <p>Step 1</p>
		        </div>
		        <div class="stepwizard-step">
		            <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
		            <p>Step 2</p>
		        </div>
		        <div class="stepwizard-step">
		            <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
		            <p>Step 3</p>
		        </div>
		    </div>
		</div>

		<form role="form">
		<!-- step1  -->
		    <div class="row setup-content" id="step-1">
		        <div class="col-xs-12">
		            <div class="col-md-12">            
		                <h3> Step 1</h3><h4><strong>나의 냉장고 보기</strong></h4>           
		   <div class="container py-5">
		   <div class="border-info mx-sm-1 p-3">
		    <div class="row">
		        <div class="col-lg-12">
		<!-- 체크박스 -->
		<div class="container">
			<div class="row">
			<div class="boxes">
		  <input type="checkbox" id="box-1">
		  <label for="box-1">Sustainable typewriter cronut</label>
		
		  <input type="checkbox" id="box-2" checked>
		  <label for="box-2">Gentrify pickled kale chips </label>
		
		  <input type="checkbox" id="box-3">
		  <label for="box-3">Gastropub butcher</label>
		</div>
	</div>
</div>
            
       	</div>
       </div>
</div>
</div>
			   <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button>
            </div>
        </div>
    </div>
    
    <!-- step2  -->
    <div class="row setup-content" id="step-2">
        <div class="col-md-9">
            <div class="col-md-12">
                <h3> Step 2</h3><h4><strong>거래글 작성</strong></h4>
         		&nbsp;
         		
   		 <div class="col-md-10">
	      <form method="post" action="#" id="#">        
              <div class="form-group files color">
                <label><strong>사진 등록하기</strong></label>
                <br>            
                <!-- 이미지 첨부(1) --> 
                <input type="file" class="form-control" multiple="multiple">
                </div>
              </div>           
          </form>
        		<!-- 이미지 첨부(2) 이미지 미리보기/삭제 제어용 js 예시 --> 
			 <div id='image_preview'>
			    <input type='file' id='btnAtt' multiple='multiple' />
			    <div id='att_zone'
			      data-placeholder='첨부할 파일을 드래그앤드롭 하세요'></div>
			  </div>
				<script src="resources/js/share-write/image.js"></script>
				&nbsp;
				<!-- 글작성 (텍스트박스) -->
				<div class="form-group">
				  <label class="control-label col-sm-2" for="fname"><strong>제목</strong></label>
				  <div class="col-sm-10">          
					<input type="text" class="form-control" id="fname" placeholder="제목을 입력하세요" name="fname">
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-2" for="comment"><strong>내용</strong></label>
				  <div class="col-sm-10">
					<textarea class="form-control" rows="5" id="comment" placeholder="상세내용을 입력하세요"></textarea>
				  </div>
				</div>
			
                <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button>
            </div>
        </div>
    </div>
    <!-- step3  -->
    <div class="row setup-content" id="step-3">
        <div class="col-xs-12">
            <div class="col-md-12">
                <h3> Step 3</h3>
                &nbsp;
                <h4><strong>게시글 등록이 완료되었습니다!</strong></h4>
              	<br>
                <button class="btn btn-success btn-lg pull-right" type="submit">확인</button>
            </div>
        </div>
    </div>
</form>
</div>

