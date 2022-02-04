<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		url :"http://localhost:7070/app/recipedetail3.do",
		method:"GET",
		dataType:"json",
		success : function(data){
			if(data){
				 console.log(data)
		          $("#image").attr("src",data[2].img);
		          $("#name").text(data[2].name);
		          $("#summary").text(data[2].summary);
		          $("#info1").text(data[2].info.info1);
		          $("#info2").text(data[2].info.info2);
		          $("#info3").text(data[2].info.info3);
		         for(var i=0;i<data[2].ingre.length;i++){
		        	 var ingreName = "<h3 id=\"ingre_name"+i+"\">"+data[2].ingre[i].ingre_name+"<h3>";    	 
			         var ingreCnt = "<h3 id=\"ingre_count"+i+"\">"+data[2].ingre[i].ingre_count+"<h3>";
			         var ingreUnit = "<h3 id=\"ingre_unit"+i+"\">"+data[2].ingre[i].ingre_unit+"<h3>";
		        	 console.log("레시피 동적 생성 반복문 들어옴");
		        	  $(".recipe_ingre").append(ingreName);
			          $(".recipe_ingre").append(ingreCnt);
			          $(".recipe_ingre").append(ingreUnit);
			      	
		          }		
		          //<img id="img3" src="img" alt="zzzz"/>
		         //console.log("============="+data[2].recipe[1].img);
		         for(var i=0;i<data[2].recipe.length;i++){
		        	 //console.log("000000000000000"+data[0].recipe[i].img);
		        	 //console.log("iiiiiiiiiiiii"+i);
		        	 var recipeImg = "<img id=\"img"+i+"\" src=\""+data[2].recipe[i].img+"\"/>"
		        	 console.log(recipeImg);
			          var recipeTxt = "<h3 id=\"text"+i+"\">"+data[2].recipe[i].txt+"<h3>";
		        	 console.log("레시피 동적 생성 반복문 들어옴");
		        	 $(".recipe_step").append(recipeImg);
			          $(".recipe_step").append(recipeTxt);
		          }
		          
		          
		          
		          $("#img2").attr("src",data[0].recipe[1].img);
		          $("#img3").attr("src",data[0].recipe[2].img);
		          $("#img4").attr("src",data[0].recipe[3].img);
		          $("#img5").attr("src",data[0].recipe[4].img);
		          $("#img6").attr("src",data[0].recipe[5].img);
		          $("#img7").attr("src",data[0].recipe[6].img);
		          $("#img8").attr("src",data[0].recipe[7].img);
		          $("#img9").attr("src",data[0].recipe[8].img);
		          $("#img10").attr("src",data[0].recipe[9].img);
		          $("#text1").text(data[0].recipe[0].txt);
		          $("#text2").text(data[0].recipe[1].txt);
		          $("#text3").text(data[0].recipe[2].txt);
		          $("#text4").text(data[0].recipe[3].txt);
		          $("#text5").text(data[0].recipe[4].txt);
		          $("#text6").text(data[0].recipe[5].txt);
		          $("#text7").text(data[0].recipe[6].txt);
		          $("#text8").text(data[0].recipe[7].txt);
		          $("#text9").text(data[0].recipe[8].txt);
		          $("#text10").text(data[0].recipe[9].txt);
		      
		          <%--
				var contentStr = "";
				for(var i=0; i<12; i++){
					contentStr+="이미지:"+data[0].recipe[i].img+"제목:"+data[0].recipe[i].txt+"</br>";	}
					--%>
				 
				} 
 
		},
		error : function(jqWHR){
			console.log(jqWHR.statusText);
		}
	})
</script>
</body>
</html>