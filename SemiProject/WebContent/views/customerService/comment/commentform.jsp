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
        
        <a href="#">공지사항</a>
        <a href="#">자주묻는질문</a>
        <a href="#">1:1문의</a>
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
        <form id="enroll-form" action="<%= contextPath %>/insert.bo" method="post" enctype="multipart/form-data"> <!-- 파일은 post방식 아니면 안넘어감 -->

            <!--  카테고리 , 제목, 내용, 첨부파일 한개  -->
            <input type="hidden" name="userNo" value="<%= loginUser.getUserNo()%>">
            <table align="center">
                <tr>
                    <th>카테고리</th>
                    <td>
                        <select name="category">
                            <!-- category 테이블로부터 조회할거임 -->
                           
                            <option value="<%= c.getCategoryNo()%>">카테고리 자리입니다 </option>
                           
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea rows="40" name="content" style="resize: none;width: 700px; height: 200px;" required></textarea></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" name="upfile"></td>
                </tr>

            </table>
            <br>

            <div align="center">
                <button type="submit">작성하기</button>
                <button type="reset">취소하기</button>
            </div>
        </form>

    </div>
</body>
</html>