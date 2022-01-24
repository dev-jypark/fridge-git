<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 인스타 메인 리스트를 보여주는 페이지 -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 폰트어썸에서 아이콘 사용을 위한 css CDN 추가 -->
    <script src="https://kit.font6awesome.com/979888c264.js" crossorigin="anonymous"></script>
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    
	<link href="<c:url value="/resources/css/insta/instaMainList.css"/>" rel="stylesheet">
    
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="feedify">
           
            <section class="feedify-item">
             
              <header class="feedify-item-header clearfix">
                
                <h1 class="pull-left"><a href="<c:url value="/insta/Member.do"/>">
                
                <img alt="" src="https://images.unsplash.com/photo-1513721032312-6a18a42c8763?w=152&h=152&fit=crop&crop=faces" class="img-circle pull-left">Marcus Lewis</a>
                </h1>
                <h2 class="pull-right hidden-xs">20 minutes ago</h2>
              </header>
              
              <div class="feedify-item-body">
              
                <img alt="" src="https://www.jqueryscript.net/dummy/5.jpg" alt="Image 3 from http://jqueryscript.net/" class="img-responsive">
              </div>
              
              <footer>
                <div class="actions">
                  <ul class="list-inline">
                    <li><a href="#"><i class="far fa-heart"></i></a></li>
                    <li><a href="#"><i class="far fa-clone"></i></a></li>
                    <li class="pull-right"><a href="#"><i class="fas fa-bars"></i></a></li>
                  </ul>
                </div>
               
                <div class="legend">
                  <h3><a href="#"><i class="far fa-heart"></i> 좋아요 51개</a></h3>
                  <h4 class="pull-left"><a href="#">Marcus Lewis</a></h4>
                  <p>뭐라고 적어야 할지 모르겠다</p>
                </div>
                
                <ul class="comments list-unstyled">
                  <li>
                    <h4 class="pull-left"><a href="#">Sawyer Flint</a></h4>
                    <p>ㅎㅎㅎㅎㅇ하하하하 댓글1번.</p>
                  </li>
                  <li>
                    <h4 class="pull-left"><a href="#">Chelsea McKay</a></h4>
                    <p>하하하한글한글글한귣그랃귤임댜듀 ㄷ게구루데구르루루루데구루데구르르르르.</p>
                  </li>
                </ul>
                
                <div class="add-comment">             	
                	<form action="">
                		<i class="far fa-comments"></i>
                		<input type="text" name="comment" class="comment" placeholder="댓글 달기.."></input>                	                	
                		<p class="pull-right">게시</p>
                	</form>
                </div>
              </footer>
            </section>          

          </div>
        </div>
      </div>
    </div>
   
    <script src="js/jquery-1.11.3.min.js"></script>

    <script>
    $('.comment').focusin(function(e) {
    	$(this).next().css("color", "black").css("cursor", "pointer");
    });
    </script>
  </body>
</html>