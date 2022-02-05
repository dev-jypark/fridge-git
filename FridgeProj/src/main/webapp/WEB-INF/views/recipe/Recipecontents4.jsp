<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/recipe/recipecontents.css"/>"
	rel="stylesheet">
<!-- jQuery -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script> -->
<!-- js -->
<!-- <script type="text/javascript" src="<c:url value="/resources/js/recipe/recipecontents.js"/>"></script> -->



</head>

<body>
	<div class="container-body col-xs-12">
		<div class="recipetitle">
			<div class="view_pic1 recipe_img"
				style="background-image: url(); background-size: 100% 100%;">
				<!-- {제일 상단 사진공간} -->
			</div>
			<div class="view1_summary st3 recipe_name">
				<!-- 이름 -->
				<h3 id="name" style="text-align: center; font-weight: bold; font-size: larger;"></h3>
				<br/>
				<div class="view1_summary_in recipe_summary" id="recipeIntro" style="color: gray;">
					<!-- 레시피정보  -->
				</div>
				<div class="view1_summary_info">
					<span class="view1_summary_info1"></span> 
					<span class="view1_summary_info2"></span>
					<span class="view1_summary_info3"></span>
				</div>

			</div>
			<div class="best_tit" style="border-bottom: 3px solid #ececec;">
				<b>재료</b><span>Ingredients</span>
			</div>
			<div class="recipecontents recipe_info">
				<ul class="case1">
				</ul>
			</div>
			<br/>
			<br/>
			<div  style="border-bottom: 3px solid #ececec;"></div>
			<br/>
			<!--  값으로 지정해주신거 띄어쓰기해서 클래스 추가해서 적용해보시면 됩니다. -->
			<div class="recipeStep">
				<div class="best_tit">
					<b>조리순서</b><span>Steps</span>
				</div>
				<div class="view_step_cont">
				</div>
				
<!-- 				<div class="view_step_cont media step1">
					<div class="media-body"></div>
					<div class="media-right"><img src="https://via.placeholder.com/300x150"></div>
				</div>
				<div class="view_step_cont media step2">
					<div class="media-body">잘개 썬다.</div>
					<div class="media-right"><img src="https://via.placeholder.com/300x200"></div>
				</div>
				<div class="view_step_cont media step3">
					<div class="media-body">볶음밥에 넣는다.</div>
					<div class="media-right"><img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/06/23/513df4e684424fe17b8af73152c8276e1.jpg"></div>
				</div> -->
			</div>
		</div>
		<br/>
		<br/>
		<br/>
		<br/>
	</div>
	
<script>

	$.ajax({
		url :"http://localhost:7070/app/recipedetail4.do",
		method:"GET",
		dataType:"json",
		success : function(data){
			if(data){
				 console.log(data)
		          $(".view_pic1").css("background-image","url("+data[3].img+")");
		          $("#name").text(data[3].name);
		          $("#recipeIntro").text(data[3].summary);
		          $(".view1_summary_info1").text(data[3].info.info1);
		          $(".view1_summary_info2").text(data[3].info.info2);
		          $(".view1_summary_info3").text(data[3].info.info3);
		          //console.log(data[0].ingre[0].ingre_name);
		          console.log(data[0].ingre.length);
		         for(var i=0;i<data[3].ingre.length;i++){
		        	 var dataString="<h3>"+data[3].ingre[i].ingre_name+"&nbsp;"+data[3].ingre[i].ingre_count+data[3].ingre[i].ingre_unit+"</h3>";
/*		        	 var ingreName = "<h3 id=\"ingre_name"+i+"\">"+data[0].ingre[i].ingre_name+"<h3>";    	 
			         var ingreCnt = "<h3 id=\"ingre_count"+i+"\">"+data[0].ingre[i].ingre_count+"<h3>";
			         var ingreUnit = "<h3 id=\"ingre_unit"+i+"\">"+data[0].ingre[i].ingre_unit+"<h3>"; */
		        	 var enter="\r\n";
			         console.log("레시피 동적 생성 반복문 들어옴");
		        	 //ingreName+ingreCnt+ingreUnit
		        	   $(".case1").append(dataString);
		        	   $(".case1").append(enter);
			          /* $(".case1").append(ingreCnt);
			          $(".case1").append(ingreUnit); */	      	
		          }		          
		         for(var i=0;i<data[3].recipe.length;i++){	        	 
		        	 var recipeImg = "<img id=\"img"+i+"\" src=\""+data[3].recipe[i].img+"\"/>"
			          var recipeTxt = "<h3 id=\"text"+i+"\">"+data[3].recipe[i].txt+"<h3>";
		        	 $(".view_step_cont").append(recipeImg,recipeTxt);
			        /*   $(".recipe_step").append(recipeTxt); */
		          }

				 
				} 
 
		},
		error : function(jqWHR){
			console.log(jqWHR.statusText);
		}
	})
</script>	

</body>
</html>