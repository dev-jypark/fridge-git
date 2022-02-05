<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>

    <div> 
       <div class="recipe_img"> 
         <a id="" href="<c:url value='/recipedetail1.do?'/>"><img id="image1" src="img" alt=""/></a> 
       </div> 
       <div class="recipe_title" style="text-align: left;"> 
         <a id="" href="<c:url value='/recipedetail1.do?'/>"><h3 id="title1"> </h3></a> 
       </div> 

    </div>
     <div> 
       <div class="recipe_img"> 
         <a id="" href="<c:url value='/recipedetail2.do?'/>"><img id="image2" src="img" alt=""/></a> 
       </div> 
       <div class="recipe_title" style="text-align: left;"> 
         <a id="" href="<c:url value='/recipedetail2.do?'/>"><h3 id="title2"> </h3></a> 
       </div> 

    </div>
     <div> 
       <div class="recipe_img"> 
         <a id="" href="<c:url value='/recipedetail3.do?'/>"><img id="image3" src="img" alt=""/></a> 
       </div> 
       <div class="recipe_title" style="text-align: left;"> 
         <a id="" href="<c:url value='/recipedetail3.do?'/>"><h3 id="title3"> </h3></a> 
       </div> 

    </div>
     <div> 
       <div class="recipe_img"> 
         <a id="" href="<c:url value='/recipedetail4.do?'/>"><img id="image4" src="img" alt=""/></a> 
       </div> 
       <div class="recipe_title" style="text-align: left;"> 
         <a id="" href="<c:url value='/recipedetail4.do?'/>"><h3 id="title4"> </h3></a> 
       </div> 

    </div>
<script>
$.ajax({
	url :"http://localhost:7070/app/recipe.do",
	method:"GET",
	dataType:"json",
	success : function(data){
		if(data){
	          $("#image1").attr("src",data[0].img);
	          $("#image2").attr("src",data[1].img);
	          $("#image3").attr("src",data[2].img);
	          $("#image4").attr("src",data[3].img);
	          $("#title1").text(data[0].title);
	          $("#title2").text(data[1].title);
	          $("#title3").text(data[2].title);
	          $("#title4").text(data[3].title);
//	          $("#link1").attr("href",data[0].pageLink);
//	          $("#link2").attr("href",data[1].pageLink);
//	          $("#link3").attr("href",data[2].pageLink);
//	          $("#link4").attr("href",data[3].pageLink);
			  console.log(data[0].img);
		}
	          
	          
	}
})
$('#link').click(function(){
	$.ajax({
		url :"http://localhost:7070/app/recipedetail.do",
		method:"GET",
		dataType:"json",
		success : function(data){
			if(data){
				console.log(data);
				}          
		},
		error : function(jqWHR){
			console.log(jqWHR.statusText);
		}
	})
});


</script> 
<div class="wrap"></div>
</body>
<%--
<script>
 $.ajax({
	url :"http://localhost:7070/app/recipe.do",
	method:"GET",
	dataType:"json",
	success : function(data){
		console.log("success");
		if(data){
			console.log(data);
			//var obj = JSON.parse(data);
			//var obj = JSON.parse(data[0]);
			console.log(data[0].title);
			JSON.stringify(data);
			//console.log(obj.img)
		}
	},
	error : function(jqWHR){
		console.log(jqWHR.statusText);
	}
})
		var list = $.parseJSON(json);
			var listLen = list.length;
			var contentStr = "";
			for(var i=0; i<listLen; i++){
				contentStr+="이미지:"+list[i].img+"제목:"+list[i].title+"</br>";			
			}
var Recipe = function (data) {
    var xhr = new XMLHttpRequest();
    var url = 'http://localhost:7070/app/recipe.do';
    console.log("url", url);
    xhr.open('GET', url);
    xhr.setRequestHeader('Authorization', 'jwt');

    xhr.send();

    xhr.onreadystatechange = function () {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          let loadedJSON = JSON.parse(xhr.responseText);
          var previewRecipeStockList = [];
          for (var i = 0; i < sizeOfRecipeArr; i++) {
            previewRecipeStockList.push(loadedJSON.ids[i]);
          }
          $.each(previewRecipeStockList, function (index, recipeNumber) {
            var xhr2 = new XMLHttpRequest();
            var url = 'http://127.0.0.1:5000/detail';
            xhr2.open('GET', url);
            xhr2.send();

            xhr2.onreadystatechange = function () {
              if (xhr2.readyState === XMLHttpRequest.DONE) {


                if (xhr2.status === 200) {
                  let loadedJSON = JSON.parse(xhr2.responseText);

                  var html = "";
                  html +=
                    <div> 
                          <div class="blog_img"> 
                            <a href="detail_recipe.html"><img src="' + loadedJSON.img + '" alt=""/></a> 
                          </div> 
                          <div class="blog_content" style="text-align: left;"> 
                            <a href="detail_recipe.html"><h3 id="plz">' + loadedJSON.title + '</h3></a> 
                          </div> 
                    </div>;
                  $(selector).append(html);
                } else {
                  console.log("error");
                }
              }
            }
          });
        } else {
          console.log("Error");
        }
      }
    }
  }

</script>--%>
</html>