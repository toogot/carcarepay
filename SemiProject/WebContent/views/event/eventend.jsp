<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트종료</title>
<style>

      
  .outer{
    background-color:white;
    width: 1000px;
    height: 800px;
    margin: auto;
    margin-top: 100px;
   
  }
  .list-area{
    width: 1000px;
    margin: auto;
    margin-left: 120px;
    opacity: 0.5; /* 흐릿한 효과를 줍니다. */
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
  @font-face {
        font-family: 'KCC-Ganpan';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        }
        body *{
        font-family: 'KCC-Ganpan';
        }


</style>
</head>

<body>
    <div class="outer">
        <br>
       
        <div class="main-content">
          <!-- Image tag added here -->
          <img src= alt="이벤트이미지" style="width: 700px; height: 200px; display: block;margin: auto; margin-bottom: 20px;">


        <h2 align="center">카케어페이 이벤트</h2>
        
        <h5 align="center">카케어페이의 다양한 이벤트를 만나보세요</h5>
         <div class="btn">
          <a href="">진행중이벤트 | </a>
          <a href="">종료된이벤트</a>
         </div>
           <div class="btn">
             <a href="">최신순 | </a>
             <a href="">조회순</a>
           </div>
       </div>
    </div>
        <br><br>
    
  <div class="list-area">
    
         
    <div class="thumbnail" align="center">
     <img src="<%= request.getContextPath() %>/resources/images/eventImage.jpg" alt="이벤트 대표 이미지" style="width: 700px; height: 200px; display: block; margin: auto; margin-bottom: 20px;">
     
      <p>
        2024/01/01~2024/01/10 <br>
        세차 쿠폰증정 이벤트
      </p>
  </div>
     
  <div class="thumbnail" align="center">
      <img src="대표이미지경로" width="200" height="150">

      <p>
        2024/02/01~2024/02/10 <br>
        세차 쿠폰증정 이벤트1
      </p>
  </div>

      
<div class="thumbnail" align="center">
    <img src="대표이미지경로" width="200" height="150">

    <p>
      2024/03/01~2024/03/10 <br>
      세차 쿠폰증정 이벤트2
    </p>
</div>

<div class="thumbnail" align="center">
    <img src="대표이미지경로" width="200" height="150">

    <p>
      2024/04/01~2024/04/10 <br>
      세차 쿠폰증정 이벤트3
    </p>
</div>

<div class="thumbnail" align="center">
    <img src="대표이미지경로" width="200" height="150">

    <p>
      2024/05/01~2024/06/10 <br>
      세차 쿠폰증정 이벤트4
    </p>
</div>


<div class="thumbnail" align="center">
  <img src="대표이미지경로" width="200" height="150">

  <p>
    2024/06/01~2024/06/10 <br>
    세차 쿠폰증정 이벤트5
  </p>
</div>
<div class="thumbnail" align="center">
  <img src="대표이미지경로" width="200" height="150">

  <p>
    2024/07/01~2024/06/10 <br>
    세차 쿠폰증정 이벤트6
  </p>
</div>
<div class="thumbnail" align="center">
  <img src="대표이미지경로" width="200" height="150">

  <p>
    2024/07/01~2024/06/10 <br>
    세차 쿠폰증정 이벤트7
  </p>
</div>
<div class="thumbnail" align="center">
  <img src="대표이미지경로" width="200" height="150">

  <p>
    2024/07/01~2024/06/10 <br>
    세차 쿠폰증정 이벤트8
  </p>
</div>
           
 </div>
        
    

</body>
</html>