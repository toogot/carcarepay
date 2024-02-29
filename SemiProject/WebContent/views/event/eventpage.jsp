<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      
        .outer{
    background-color:
    color: white;
    width: 1000px;
    height: 800px;
    margin: auto;
    margin-top: 100px;
  }
  .list-area{
    width: 1000px;
    margin: auto;
    margin-left: 120px;
  }
  .thumbnail{
    border: 1px solid white;
    width: 220px;
    display: inline-block;
    margin: 14px;
  }
  .btn{
    margin-left: 150px;
  }

    </style>

</head>
<body>
<div class="outer">
        <br>
       
        <div class="main-content">
          <!-- Image tag added here -->
          <img src= alt="공지사항 이미지" style="width: 700px; height: 200px; display: block;margin: auto; margin-bottom: 20px;">


        <h2 align="center">카케어이벤트</h2>
        
        <h5 align="center">카케어의 다양한 이벤트를 만나보세요</h5>
        <div class="btn">
          <a href="">최신순 | </a>
          <a href="">조회순 </a>
      </div>
        <br>
    
  <div class="list-area">
    
         
        <div class="thumbnail" align="center">
            <img src="<%= contextPath %>/resources/thumbnail_upfiles/대표이미지파일명" width="200" height="150">

            <p>
              2024/01/01~2024/01/10 <br>
              세차 쿠폰증정 이벤트
            </p>
        </div>
           
        <div class="thumbnail" align="center">
            <img src="대표이미지경로" width="200" height="150">

            <p>
              No.20 제목입니다. <br>
              조회수 : 230
            </p>
        </div>
    
            
      <div class="thumbnail" align="center">
          <img src="대표이미지경로" width="200" height="150">

          <p>
            No.20 제목입니다. <br>
            조회수 : 230
          </p>
      </div>
    
      <div class="thumbnail" align="center">
          <img src="대표이미지경로" width="200" height="150">

          <p>
            No.20 제목입니다. <br>
            조회수 : 230
          </p>
      </div>
    
      <div class="thumbnail" align="center">
          <img src="대표이미지경로" width="200" height="150">

          <p>
            No.20 제목입니다. <br>
            조회수 : 230
          </p>
      </div>
      
  
    <div class="thumbnail" align="center">
        <img src="대표이미지경로" width="200" height="150">

        <p>
          No.20 제목입니다. <br>
          조회수 : 230
        </p>
  </div>
           
 </div>
        
    
</div>



</body>
</html>