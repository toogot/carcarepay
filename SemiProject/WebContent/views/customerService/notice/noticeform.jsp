<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="UTF-8">
        <title>공지사항</title>
        <style>
    
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
                padding: 30px;
                margin: auto;
            }
    
            table {
                width: 100%;
                border-collapse: collapse;
            }
    
            table, th, td {
                border: 1px solid #ddd;
            }
    
            th, td {
                text-align: left;
                padding: 8px;
            }
    
            th {
                background-color: #f2f2f2;
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
            <a href="<%=request.getContextPath()%>/comment.if">1:1문의</a>
            <!-- More links as needed -->
        </div>
        
    
        <div class="main-content">
            <!-- Image tag added here -->
            <img src= alt="공지사항 이미지" style="width: 800px; height: 400px; display: block;margin: auto; margin-bottom: 20px;">
    
    
        <div class="main-content">
            <h1>공지사항</h1>
            <p> ※카케어페이에 새로운소식을 확인하세요 NOTIC ※ </p>
            
            <table>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일자</th>
                    <th>조회수</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>새해복 많이 받으세요</td>
                    <td>2024-02-01</td>
                    <td>112</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>충전방법에대한 상세설명</td>
                    <td>2024-02-02</td>
                    <td>97</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>카케어 서비스 안내</td>
                    <td>2024-02-03</td>
                    <td>90</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>1:1 문의전필독</td>
                    <td>2024-02-10</td>
                    <td>101</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>인스타그램 이벤트  안내사항</td>
                    <td>2024-02-12</td>
                    <td>112</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>쿠폰 사용방법</td>
                    <td>2024-01-10</td>
                    <td>122</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>개인정보 처리방침 개정안내</td>
                    <td>2023-02-10</td>
                    <td>112</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td>회원가입후  필독!</td>
                    <td>2023-02-10</td>
                    <td>112</td>
                </tr>
                <!-- More rows as needed -->
            </table>
            
           
        </div>
       
    
    </body>
    </html>
</body>
</html>