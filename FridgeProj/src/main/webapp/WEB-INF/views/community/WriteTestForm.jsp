<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fieldset style="margin-top: 50px;">
	<legend>글작성</legend>
	<form action="<c:url value="/community/writeProcess.do"/>" method="post" enctype="multipart/form-data" >
		<div>
		<label>id:</label>
		<input type="text" name="id" size="50""/>
		</div>
		<div>
		<label>내용:</label>
		<input type="text" name="fb_content" size="50""/>
		</div>
		<div>
		<input type="file" name="fl_src" size="30" multiple/>
		</div>
		<div>
		<input type="submit" value="업로드" />
		</div>
	</form>
</fieldset>
	
<fieldset style="margin-top: 50px;">
	<legend>회원 사진 수정</legend>
	<form action="<c:url value="/community/setUserImg.do"/>" method="post" enctype="multipart/form-data" >
		<div>
		<input type="text" name="id" size="50""/>
		</div>
		<div>
		<input type="file" name="imgsrc" size="30"/>
		</div>
		<div>
		<input type="submit" value="사진변경" />
		</div>
	</form>
</fieldset>