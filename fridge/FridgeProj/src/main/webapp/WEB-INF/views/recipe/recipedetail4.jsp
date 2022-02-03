<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div> 
       <div class="recipe_img"> 
         <img id="image" src="img" alt=""/>
       </div> 
       <div class="recipe_name"> 
         <h3 id="name"/>
       </div> 
       <div class="recipe_summary"> 
         <h3 id="summary"/>
       </div> 
       <div class="recipe_info"> 
         <h3 id="info1"/>
         <h3 id="info2"/>
         <h3 id="info3"/>
       </div> 
       <div class="recipe_ingre"> 

       </div> 
      <div class="recipe_step"> 
       </div> 
       
       
       
       <div class="recipe_info"> 
         <a id="" href="pageLink"><h3 id="ingre" src="ingre" alt=""/></a> 
       </div> 
       
   </div> 

		
		

<script>

	$.ajax({
		url :"http://localhost:7070/app/recipedetail4.do",
		method:"GET",
		dataType:"json",
		success : function(data){
			if(data){
				 console.log(data)
		          $("#image").attr("src",data[3].img);
		          $("#name").text(data[3].name);
		          $("#summary").text(data[3].summary);
		          $("#info1").text(data[3].info.info1);
		          $("#info2").text(data[3].info.info2);
		          $("#info3").text(data[3].info.info3);
		         for(var i=0;i<data[3].ingre.length;i++){
		        	 var ingreName = "<h3 id=\"ingre_name"+i+"\">"+data[3].ingre[i].ingre_name+"<h3>";    	 
			         var ingreCnt = "<h3 id=\"ingre_count"+i+"\">"+data[3].ingre[i].ingre_count+"<h3>";
			         var ingreUnit = "<h3 id=\"ingre_unit"+i+"\">"+data[3].ingre[i].ingre_unit+"<h3>";
		        	 console.log("레시피 동적 생성 반복문 들어옴");
		        	  $(".recipe_ingre").append(ingreName);
			          $(".recipe_ingre").append(ingreCnt);
			          $(".recipe_ingre").append(ingreUnit);
			      	
			          }		
		         for(var i=0;i<data[3].recipe.length;i++){
/* 		        	 console.log("000000000000000"+data[3].recipe[i].img);
		        	 console.log("iiiiiiiiiiiii"+i); */
		        	 var recipeImg = "<img id=\"img"+i+"\" src=\""+data[3].recipe[i].img+"\"/>"
		        	// console.log(recipeImg);
			          var recipeTxt = "<h3 id=\"text"+i+"\">"+data[3].recipe[i].txt+"<h3>";
		        	// console.log("레시피 동적 생성 반복문 들어옴");
		        	 $(".recipe_step").append(recipeImg);
			          $(".recipe_step").append(recipeTxt);
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