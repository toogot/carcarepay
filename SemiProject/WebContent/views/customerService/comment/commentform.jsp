<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        background-color: white;
        color: black;
        width: 1000px;
        height: 550px;
        margin: auto;
        margin-top: 50px;
    }

    #enroll-form table{
    border: 1px solid white;
    }
    #enroll-form input, #enroll-form textarea{
       width: 100%;
       box-sizing: border-box;
    }
    body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
        }

    .sidebar {
        width: 200px;
        height: 100vh; /* Full height */
        padding-top: 20px;
        }

    .sidebar a {
        padding: 10px 15px;
        text-decoration: none;
        font-size: 20px;
        color: black;
        display: block;
        }

    .sidebar a:hover {
        color:#87CEFA;
        }

    .main-content {
            flex-grow: 1;
            background-color: #ffffff;
            padding: 100px;
        }
    @font-face {
        font-family: 'KCC-Ganpan';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        }
    body {
        font-family: 'KCC-Ganpan';
        }
    
</style>
</head>
<body>

    <div class="sidebar">
        
        <a href="<%=request.getContextPath()%>/notice.if">공지사항</a>
            <a href="<%=request.getContextPath()%>/faq.if">자주묻는질문</a>
            <a href="<%=request.getContextPath()%>/cs.if?page=1&cgNo=3">1:1문의</a>
        <!-- More links as needed -->
    </div>

    <div class="outer">
        <br>
        <div class="main-content">
            <!-- Image tag added here -->
            <img src= alt="이벤트이미지" style="width: 700px; height: 200px; display: block;margin: auto; margin-bottom: 20px;">
  
        <h2 align="center">1:1 문의</h2>
        <br>
		<!-- 첨부파일 넘길때는 method 방식 무조건 post!!로 하고 enctype 적기 -->
     

         
</body>
</html>