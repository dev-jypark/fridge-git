<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <title>여행봇</title>
    <script>
        function showPopup(){
            window.open("http://192.168.0.16:5000/","챗봇시작","width=700, height=600, top=50%, left=50%");
        }
        
    </script>
  </head>
  <body>
   <div class="container h-100" style="margin-bottom: 500px; text-align: center;">
          <input type="button" value="팝업창 호출" onclick="showPopup();">

    </div>
    <input type="button" value="팝업창 호출" onclick="showPopup();">
    

  </body>
</html>