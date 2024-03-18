<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    /* div{
        border: 1px solid red;
    } */
    .mypage-wrap{
        width: 1800px;
        height: 1000px;
        margin: auto;
    }
    #myInfo{
        width: 1000px;
        height: 900px;
        margin: auto;
        margin-top: 100px;        
        border-radius: 30px;
        background-color: rgb(164, 207, 248);
    }
    #title>h1{
        line-height: 150px;
    }
    #title{
        width: 1200px;
        margin: auto;
    }
    #myBtn{
        width: 100%;
        height: 50px;
        padding: 0px 10px;
    }
    #myBtn>button{
        display: inline-block;
        font-size: 20px;
        width: 500px;
        height: 50px;
        border: none;
    }
    #myInfo>table{
        margin: 50px 200px;
        width: 700px;
    }
     #myInfo tr{
        margin: 50px;
        font-size: 30px;    
    }
 
    #myInfo{        
        height: 380px;
    }

    #myInfo button{        
        width: 100px;
        height: 45px;
        font-size: 20px;
    }
    #myInfo th{
        width: 180px;
        height: 70px;
        color: rgb(85, 81, 81);
        text-align: center;
    }
    #myInfo td{
        width: 300px;
        padding-left: 30px;
    }
    #footerBtn{
        width: 100%;
        height: 40px;
    }
    #btn-wrap{
        width: 300px;
        height: 40px;
        margin: auto;
    }
    #footerBtn button{
            display: inline-block;
            width: 100px;
            height: 40px;
            margin: auto;
            border: none;    
            margin-left: 30px;   
            border-radius: 20px;
            /* background-color: aquamarine;     */
    }
    #ebtn,#abtn{
     display: inline-block;
            width: 100px;
            height: 40px;
            margin: auto;
            border: none;    
            margin-left: 30px;   
            border-radius: 20px;
    }
  
    
</style>
</head>
<body>
<%@include file="../common/head.jsp" %>
<%if(loginUser != null){ %>
<div class="mypage-wrap">
    
        <div id="mypage">
            
            <div id="title">
                <h1 align="center">마이페이지</h1>
                <div id="myBtn" class="btn-group">
                    <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/myPage.me'">회원정보</button>
                    <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/statement.me'">사용내역</button>
                    <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/bookmark.me'">즐겨찾기</button>
                    <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/storeHistory.me'">입점신청내역</button>
                </div>
            </div>

            <br>
            <hr style="background-color: aqua;">

            <div id="myInfo">
               
      </div>
    </div>
    
<%}else{%>
	<script>
		alert("로그인이 필요한 서비스 입니다.");
		location.href = "<%=contextPath%>/loginForm.me"
	</script>
<%} %>


  
<%@include file="../common/footer.jsp" %>

           
             
</body>
</html>