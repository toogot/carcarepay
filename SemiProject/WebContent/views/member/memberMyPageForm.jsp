<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style>
    /* div{
        border: 1px solid red;
    } */
    .mypage-wrap{
        width: 1800px;
        height: 1000px;
        margin: auto;
    }
    .mypage-wrap>form{
        width: 1000px;
        height: 700px;
        margin: auto;
        margin-top: 150px;        
        border-radius: 30px;
        background-color: rgb(164, 207, 248);
    }
    #title>h1{
        line-height: 150px;
    }
    #myBtn{
        height: 50px;
        padding-left: 200px;
        border-bottom: 1px solid rgb(241, 112, 6);
    }
    #myBtn>button{
        display: inline-block;
        width: 200px;
        height: 40px;
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
    
    
</style>
</head>
<body>
<%@include file="../common/head.jsp" %>
<%if(loginUser != null){ %>
<div class="mypage-wrap">
    <form action="<%= contextPath%>/myPage.me" method="post">
        <div id="mypage">
            <div id="title">
                <h1 align="center">마이페이지</h1>
            </div>
            <div id="myBtn" class="btn-group">
                <button type="button" class="btn btn-primary">회원정보</button>
                <button type="button" class="btn btn-primary">사용내역</button>
                <button type="button" class="btn btn-primary">즐겨찾기</button>  
            </div>
            <div id="myInfo">
                <table>
                    <tr>
                        <th>아이디</th>
                        <td colspan="2"><%=loginUser.getUserId() %></td>
                    </tr>
                    <tr>
                        <th>포인트</th>
                        <td><%=loginUser.getBalance() %>원 <br></td>
                        <td> <button type="button" class="btn btn-sm btn-danger" onclick="location.href='<%=contextPath%>/product.bo'">충전</button></td>
                    </tr>
                    <tr>
                        <th>회원등급</th>
                        <td colspan="2"><%=loginUser.getUserLevel() %></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td colspan="2"><%=loginUser.getEmail() %></td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td colspan="2"><%=loginUser.getAddress() %></td>
                    </tr>
                </table>
            </div>
            
            <div id="footerBtn">
                <div id="btn-wrap">
                    <button class="btn btn-primary">수정</button>
                    <button class="btn btn-primary">탈퇴</button>
                </div>
            </div>
        </div>
    </form>
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