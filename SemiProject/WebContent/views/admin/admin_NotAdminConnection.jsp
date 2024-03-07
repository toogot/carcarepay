<%@page import="com.kh.semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath(); %>
<%Member loginUser = (Member)session.getAttribute("loginUser"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* div{border: 1px solid red;} */
    h1{
        text-align: center;
        margin: 0;
        padding: 0;
        font-size: 38px;
    }
    #error{
        height: 250px;
        display: flex;
        justify-content: center;
    }
    img{
        height: 200px;
    }
    #div1{
        height: 80px;
    }

    .button_area{
        text-align: center;
        padding-top: 60px;
    }
    .btn{
        font-size: 20px;
        padding: 10px;
        cursor: pointer;
        display: inline-block;
        height: 30px;
        line-height: 30px;
        width: 180px;
        border: 1px solid black;
        color: black;
    }
    .type2{
        margin-left: 20px;
    }
    @font-face {
        font-family: 'NanumSquareNeo-Variable';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        }
        body {
        font-family: 'NewFont',NanumSquareNeo-Variable;
        }
</style>
</head>
<body>
    <div id="wrap">
        <div id="div1"></div>
        <div id="error">
            <img src="../../resources/admin_img/error.png" alt="경고이미지">
        </div>
        <div>
            <h1>잘못된 접근입니다</h1>
        </div>
        <div class="button_area">
            <div class="button_wrap">
                <span class="btn" onclick="location.href='<%=contextPath%>'">홈으로</span>
                <span class="btn type2"  onclick="location.href='<%=contextPath%>'">마이페이지</span>
            </div>
        </div>
    </div>
</body>
</html>