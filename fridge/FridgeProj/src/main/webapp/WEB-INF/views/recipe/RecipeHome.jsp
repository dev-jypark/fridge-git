<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">    
   <!-- css -->
    <link href="<c:url value="/resources/css/recipe/recipe.css"/>" rel="stylesheet">    
    <!-- jQuery -->
   <!--  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
    <!-- js -->
    <script type="text/javascript" src="<c:url value="/resources/js/recipe/recipe.js"/>"></script>


</head>
<body>
	<div class="start-screen">
	
	  <div class="loading">
	    <div class="loading__element el1" style="color: #95E1D3">나</div>
	    <div class="loading__element el2" style="color: #95E1D3">의</div>
	    <div class="loading__element el3" style="color: #95E1D3">냉</div>
	    <div class="loading__element el4" style="color: #95E1D3">장</div>
	    <div class="loading__element el5" style="color: #95E1D3">고</div>

	  </div>
	  
    	<div class="loading">
    	
	    <div class="loading__element el5">추</div>
	    <div class="loading__element el4">천</div>
	    <div class="loading__element el3">레</div>
	    <div class="loading__element el2">시</div>
	    <div class="loading__element el1">피</div>

	  </div>
	  
	</div>
	<br/>
	<br/>
	<!-- 
	<div class="recipe-title">
	    <h1>
		    <span class="title">찍고 !</span>
		    <span class="title">먹고 !</span>
		    <span class="title">즐기는 식품관리~</span>
	  	</h1>
  	</div> 
  	-->
  	<div class="row">
		<div class="image-demo1" style="width: 350px; height: 350px;">
		</div>
        <div class="image-demo2" style="width: 350px; height: 350px;">
        </div>
    </div>
    <br/>
    <div class="row">
		<div class="image-demo5" style="width: 350px; text-align: center; font-size: 20px;">
		</div>
        <div class="image-demo6" style="width: 350px; text-align: center; font-size: 20px;">
        </div>
    </div>
    <div style="margin-bottom: 30px;"></div>
    <div class="row">       
        <div class="image-demo3" style="width: 350px; height: 350px;">
        </div>
        <div class="image-demo4" style="width: 350px; height: 350px;">
        </div>
    </div>    
    <div style="margin-bottom: 30px;"></div>
    <div class="row">
		<div class="image-demo7" style="width: 350px; text-align: center; font-size: 20px;">
		</div>
        <div class="image-demo8" style="width: 350px; text-align: center; font-size: 20px;">
        </div>
    </div>   
        <!-- <div class="image-demo1" style="width: 250px; height: 250px;"></div>
        <div class="image-demo2" style="width: 250px; height: 250px;"></div>
        <div class="image-demo3" style="width: 250px; height: 250px;"></div>
        <div class="image-demo4" style="width: 250px; height: 250px;"></div> -->



    <script>
    
    $(document).ready(function(){
        // $("클래스이름 넣어주시고").up-down-left-right-bottom(슬라이드 방향) Slide(위로 올라오는것 색,버튼 글);

        $(".image-demo1").leftSlideStyle("rgba(0, 0, 0, 0.5)", "더보기");
        $(".image-demo2").downSlideStyle("rgba(0, 0, 0, 0.5)", "더보기");
        $(".image-demo3").rightSlideStyle("rgba(0, 0, 0, 0.5)", "더보기");
        $(".image-demo4").upSlideStyle("rgba(0, 0, 0, 0.5)", "더보기");
        
        $.ajax({
        	url :"http://localhost:7070/app/recipe.do",
        	method:"GET",
        	dataType:"json",
        	success : function(data){
        		if(data){
        			  $(".image-demo1").css("background-image","url("+data[0].img+")");
        			  $(".image-demo2").css("background-image","url("+data[1].img+")");
        			  $(".image-demo3").css("background-image","url("+data[2].img+")");
        			  $(".image-demo4").css("background-image","url("+data[3].img+")");
        	          console.log(data);

        	          $(".image-demo5").text(data[0].title);
        	          $(".image-demo6").text(data[1].title);
        	          $(".image-demo7").text(data[2].title);
        	          $(".image-demo8").text(data[3].title);
        		}
        	          
        	          
        	},
        	error: function(){
        		console.log("error");
        	}
        })

    });





    </script>
</body>
</html>