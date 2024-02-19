<%@page import="com.kh.semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%

   
   Member loginUser = (Member)session.getAttribute("loginUser");
 
   
   String alertMsg = (String)session.getAttribute("alertMsg");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        border: 1px solid red;
    }
    .login-wrap{
        width: 1800px;
        height: 1000px;
        margin: auto;
    }
    .login-wrap>form{
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
	 <% if(alertMsg != null){ %>
      <script>
         alert("<%= alertMsg %>");
      </script>
      <% session.removeAttribute("alertMsg"); %>
   <%} %>
	
<div class="login-wrap">
<% if(loginUser == null){ %>
    <form action="<%= contextPath %>/login.me" method="post">
        <div>
            <table>
                <tr>
                    <th>
                        아이디
                    </th>
                    <td>
                        <input type="text" name="userId" required>
                    </td>
                    <td rowspan="2">
                        <button type="submit">로그인</button>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="userPwd" required></td>
                </tr>
            </table>
            <div>
                <button>회원가입</button>
                <button>ID찾기</button>
                <button>PWD찾기</button>
            </div>
        </div>
    </form>
    <% }%>
</div>


<%@include file="../common/footer.jsp" %>
</body>
</html>