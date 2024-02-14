<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>카케어페이</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        div{
             /* border: 1px solid red; */
            box-sizing: border-box;
        }
        button{
            cursor: pointer;
        }
        
        /* 헤더부분 시작 */
        #header{
            width: 1900px;
            height: 200px;
            margin: auto;
            border-bottom: 1px solid lightblue;
            
        }
        #logo{
            width: 30%;
            height: 100%;
            float: left;
        }
        #logo_btn{
            background-image: url("https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F803ba282-c694-4f93-afbb-a3f62f6ff4a6%2Fb7c2f076-613d-4811-ad72-b493eb25db03%2F%25EC%25B9%25B4%25EC%25BC%2580%25EC%2596%25B4%25ED%258E%2598%25EC%259D%25B4%25EB%25A1%259C%25EA%25B3%25A0.png?table=block&id=9382d4c5-4d51-444b-8d28-9e0a49738b02&spaceId=803ba282-c694-4f93-afbb-a3f62f6ff4a6&width=250&userId=2d8d1a67-148e-42e4-9e04-5f896925bb47&cache=v2");
            background-color: white;
            background-repeat: no-repeat;
            background-position: center;
            background-size: 50%;
            border: 0;
            width: 100%;
            height: 100%;
        }
        #login-event{
            width: 70%;
            height: 50%;
            float: left;
            
        }
        #userimgbtn{
            border: 0;
            background-image: url("https://cdn-icons-png.flaticon.com/128/17/17004.png");
            width: 50px;
            height: 100%;
            background-size: 50px;
            background-repeat: no-repeat;
            display: block;
            float: left;
        }
        #navigator{
            width: 70%;
            height: 50%;
            float: left;
        }
        #logoimg{
            width: 100%;
            height: 100%;
            display: block;
            margin: auto;
            padding: 30px;
        }
        #navigator>button{
            border: 0;
            background-color: white;
            margin: 25px 60px;
            line-height: 50px;
            
        }
        #navigator>button>a{
            font-size: 20px;
            font-weight: 800;
            text-decoration: none;
            color: black;
        }
        #login-event>button{
            border: 0px;
            background-color: white;
            line-height: 60px;
        }
        #login-event>button>a{
            font-size: 20px;
            text-decoration: none;
            color: gray;
            line-height: 3.5;
        }
        #login-event>*{
            display: block;
            float: right;
            margin: 10px;
        }
        #logininfo{
            width: 20%;
            height: 60%;
            text-align: center;
            line-height: 3;
        }
        #logininfo>p{
            float: left;
            line-height: 30px;
        }

        /* 헤더부분 끝 */

     

        
        
        
    </style>
</head>
<body style="margin: 0px;">

    

        <!-- 헤더부분 -->
        <div id="header">
            <div id="logo">
                <button type="button" id="logo_btn" onclick="location.href=<%=contextPath%>">
                    <!-- <img src="https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F803ba282-c694-4f93-afbb-a3f62f6ff4a6%2Fb7c2f076-613d-4811-ad72-b493eb25db03%2F%25EC%25B9%25B4%25EC%25BC%2580%25EC%2596%25B4%25ED%258E%2598%25EC%259D%25B4%25EB%25A1%259C%25EA%25B3%25A0.png?table=block&id=9382d4c5-4d51-444b-8d28-9e0a49738b02&spaceId=803ba282-c694-4f93-afbb-a3f62f6ff4a6&width=250&userId=2d8d1a67-148e-42e4-9e04-5f896925bb47&cache=v2" id="logoimg"> -->
                </button>
            </div>
            <div id="login-event">
                <div id="logininfo">
                    <button id="userimgbtn"></button>
                    <p>로그인해주세요</p>
                </div>
                <button id="login"><a href="#">로그인</a></button>
                <button id="event"><a href="#">이벤트</a></button>
                
                
            </div>
            <div id="navigator">
                <button id="charge" type="button"><a href="#">충전하기</a></button>
                <button id="search" type="button"><a href="<%=contextPath%>/search.st">매장찾기</a></button>
                <button id="request" type="button"><a href="#">입접신청</a></button>
                <button id="service" type="button"><a href="#">고객센터</a></button>
                <button id="event" type="button"><a href="#">이벤트</a></button>
            </div>
        </div>
        <!-- 헤더부분 끝 -->


  
    


    <script>
        $(function(){
            // 헤더부분
            $("#navigator").children().children().hover(function(){
                $(this).css("color","#87CEFA");
                
            },function(){
                $(this).css("color","");
            })
            $("#login").children().hover(function(){
                $(this).css("fontWeight","1000")
            },function(){
                $(this).css("fontWeight","")
            })
            $("#event").children().hover(function(){
                $(this).css("fontWeight","1000")
            },function(){
                $(this).css("fontWeight","")
            })
            //헤더 끝

        })
    </script>
</body>
</html>