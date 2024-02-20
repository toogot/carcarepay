<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        border: 1px solid red;
    }
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
        border: 1px solid red;
    }
</style>
</head>
<body>
<%@include file="../common/head.jsp" %>

<div class="mypage-wrap">
    <form action="<%= contextPath%>/myPage.me" method="post">
        <div>
            <table>
                <tr>
                    <th>
                       마이페이지;
                    </th>
                    <td>
                        
                    </td>
                  
                        
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td><input type="password" name="userPwd" required></td>
                </tr>
            </table>
            <div>
                <button></button>
                <button></button>
                <button></button>
            </div>
        </div>
    </form>
</div>


<%@include file="../common/footer.jsp" %>
</body>
</html>