<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 푸터 시작 */
        #footer{
            width: 1900px;
            height: 350px;
            background-color: gainsboro;
            margin: auto;
        }
        #footer_wrap{
            width: 70%;
            height: 100%;
            margin: auto;
        }
        #footer_logo{
            width: 20%;
            height: 100%;
            float: left;
        }
        #footer_title{
            width: 60%;
            height: 100%;
            float: left;
        }
        #footer_award{
            width: 20%;
            height: 100%;
            float: left;
        }
        #footer1{
            width: 100%;
            height: 30%;
        }
        #footer2{
            width: 100%;
            height: 70%;

        }
        #footer li{
            display: block;
            float: left;
            text-decoration: none;
            margin: 30px 30px;
        }
        #footer1 a{
            text-decoration: none;
            color: rgb(49, 46, 46);
        }
        #footer_title>p{
            margin: 30px 15px;
            font-size: 13px;
        }
        #footer_award>*{
            width: 50%;
            float: left;
            margin-top: 50px;
        }
        #footer_award p{
            font-size: 15px;
            color: rgb(17, 14, 14);
        }
        /* 푸터 끝 */

</style>
</head>
<body>
<!-- 푸터부분 -->
        <div id="footer">
            <div id="footer_wrap">
                <div id="footer1">
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/list.tu">이용약관</a></li>
                        <li>|</li>
                        <li><a href="#">개인정보처리약관</a></li>
                        <li>|</li>
                        <li><a href="#">고객센터정보</a></li>
                    </ul>
                </div>
                <div id="footer2">
                    <div id="footer_logo">
                        <img src="https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F803ba282-c694-4f93-afbb-a3f62f6ff4a6%2Fb7c2f076-613d-4811-ad72-b493eb25db03%2F%25EC%25B9%25B4%25EC%25BC%2580%25EC%2596%25B4%25ED%258E%2598%25EC%259D%25B4%25EB%25A1%259C%25EA%25B3%25A0.png?table=block&id=9382d4c5-4d51-444b-8d28-9e0a49738b02&spaceId=803ba282-c694-4f93-afbb-a3f62f6ff4a6&width=250&userId=2d8d1a67-148e-42e4-9e04-5f896925bb47&cache=v2">
                    </div>
                    <div id="footer_title">
                        <p>
                            (주)카케어페이
                        </p>
                        <p>
                            본사: 서울특별시 강남구 테헨란로 14길 6
                        </p>
                        <p>
                            사업자번호 01027-843845
                        </p>
                        <p>
                            고객센터 :1599-7988
                        </p>
                    </div>
                    <div id="footer_award">
                        <div>
                            <img src="https://kh-academy.co.kr/resources/images/main/footer_emblem_d.png">
                            <p>5년 인증 우수</p>
                        </div>
                        <div>
                            <img src="https://kh-academy.co.kr/resources/images/main/main_renewal/main_bottom_emblem01.png">
                            <p>A등급 획득</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- 푸터부분 끝 -->
<script>
        $(function(){
            
            // 푸터부분
            $("#footer1").find("a").hover(function(){
                $(this).css("fontWeight","900");
            },function(){
                $(this).css("fontWeight","");
            })
            // 푸터 끝
        })
    </script>
</body>
</html>