<%@page import="com.kh.semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath(); %>
<%Member loginUser = (Member)session.getAttribute("loginUser"); %>
<%String alert = (String)session.getAttribute("alertMsg"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>카케어페이</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        @font-face {
		    font-family: 'TTHakgyoansimYeohaengR';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2402_keris@1.0/TTHakgyoansimYeohaengR.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		@font-face {
		    font-family: 'KCCMurukmuruk';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCCMurukmuruk.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		@font-face {
		    font-family: 'ONE-Mobile-POP';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-POP.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		@font-face {
		    font-family: 'Katuri';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_13@1.0/Katuri.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		@font-face {
        font-family: 'NanumSquareNeo-Variable';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        }
        
        body *{
        font-family: 'NewFont',NanumSquareNeo-Variable;
        }
        

            
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
        <%if(loginUser == null){ %>
            #userimgbtn{
                border: 0;
                background-image: url("https://cdn.pixabay.com/photo/2016/11/14/17/39/person-1824147_640.png");
                width: 55px;
                height: 100%;
                background-size: 55px;
                background-position: center;
                background-repeat: no-repeat;
                background-color:transparent;
                display: block;
                float: left;
            }
        <%}else{%>
            #userimgbtn{
            border: 0;
            background-image: url("https://cdn.pixabay.com/photo/2016/03/03/16/21/man-head-1234492_640.png");
            width: 55px;
            height: 100%;
            background-size: 55px;
            background-position: center;
            background-repeat: no-repeat;
            background-color:transparent;
            display: block;
            float: left;
        }
        <%}%>
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
            width: 15%;
            height: 60%;
            text-align: center;
            line-height: 3;
            cursor: pointer;
        }
        #logininfo>p{
            float: left;
            line-height: 60px;
            margin-left: 10px;
        }
        
        #adminPageBtn:hover{
        	font-weight: bold;
        }

        /* 헤더부분 끝 */

    </style>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body style="margin: 0px;">

    

        <!-- 헤더부분 -->
        <div id="header">
            <div id="logo">
                <button type="button" id="logo_btn" onclick="location.href='<%=contextPath%>'">
                    <!-- <img src="https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F803ba282-c694-4f93-afbb-a3f62f6ff4a6%2Fb7c2f076-613d-4811-ad72-b493eb25db03%2F%25EC%25B9%25B4%25EC%25BC%2580%25EC%2596%25B4%25ED%258E%2598%25EC%259D%25B4%25EB%25A1%259C%25EA%25B3%25A0.png?table=block&id=9382d4c5-4d51-444b-8d28-9e0a49738b02&spaceId=803ba282-c694-4f93-afbb-a3f62f6ff4a6&width=250&userId=2d8d1a67-148e-42e4-9e04-5f896925bb47&cache=v2" id="logoimg"> -->
                </button>
            </div>
            	<%if(loginUser == null){ %>
	            	<div id="login-event">
	                <div id="logininfo" onclick="location.href='<%=contextPath%>/loginForm.me'">
	                    <button id="userimgbtn" onclick="location.href='<%=contextPath%>/loginForm.me'"></button>
	                    <p>로그인해주세요</p>
	                </div>
	                <button id="login"><a href="<%=contextPath%>/loginForm.me">로그인</a></button>
	                
	            <%}else if(loginUser.getUserId().equals("admin")) { %>
	            	<div id="login-event">
	                <div id="logininfo" onclick="location.href='<%=contextPath%>/myPage.me'">
	                    <button id="userimgbtn" onclick="location.href='<%=contextPath%>/myPage.me'"></button>             
	                    <p><%=loginUser.getUserName() %></p>
	                </div>
	                <button id="logout"><a href="<%=contextPath%>/logoutForm.me">로그아웃</a></button>
	                <button id="event"><a href="#">잔액<span id="membercash"></span>원</a></button>
	                <button id="adminPageBtn"><a href="<%=contextPath%>/admin">관리자페이지</a></button>
	                
                <%}else{ %>
	                <div id="login-event">
	                <div id="logininfo" onclick="location.href='<%=contextPath%>/myPage.me'">
	                    <button id="userimgbtn" onclick="location.href='<%=contextPath%>/myPage.me'"></button>             
	                    <p><%=loginUser.getUserName() %></p>
	                </div>
	                <button id="logout"><a href="<%=contextPath%>/logoutForm.me">로그아웃</a></button>
	                <button id="event"><a href="#">잔액<span id="membercash"></span>원</a></button>
                <%} %>
                
                
                
                
                
                <button id="event"><a href="#">이벤트</a></button>
                
            </div>
            <div id="navigator">
                <button id="charge" type="button"><a href="<%= contextPath %>/product.bo">충전하기</a></button>
                <button id="search" type="button"><a href="<%=contextPath%>/search.st?page=1">매장찾기</a></button>
                <button id="request" type="button"><a href="<%=contextPath%>/enrollForm.st">입접신청</a></button>
                <button id="service" type="button"><a href="<%=contextPath%>/customerService">고객센터</a></button>
                <button id="event" type="button"><a href="<%=contextPath%>/event">이벤트</a></button>
            </div>
        </div>
        <!-- 헤더부분 끝 -->


  	<%if(alert != null){ %>
  		<script>
  			alert('<%=alert%>');
  		</script>
  			<%session.removeAttribute("alertMsg"); %>
  	<%} %>
    


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
       
		
        <%if(loginUser != null){ %>
        
        $(function(){
        	$.ajax({
        		url:"<%=contextPath%>/memberCash",
        		data:{userNo:<%=loginUser.getUserNo()%>},
        		type:"post",
        		success:function(memberCash){
        			$("#membercash").html(memberCash);
        		},error:function(){
        			console.log("ajax통신실패")
        		}
        	})
        })
        <%}%>
    </script>
    
    <script>
		    Kakao.init('6c41921b6cc2773cc2170949e98a9b91');
		    function kakaoLogout() {
		Kakao.Auth.logout()
		    .then(function(response){
		        console.log(Kakao.Auth.getAccessToken());
		        Kakao.Auth.getAccessToken() = null;
		        <%=loginUser%> = null; 
		    })
		    .catch(function(error){
		        console.log('Not logged in.');
		    })
		}
    </script>
</body>
</html>