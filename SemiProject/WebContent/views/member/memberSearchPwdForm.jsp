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
<%@ include file="../common/head.jsp" %>
<form action="<%=contextPath%>/searchPwdFinish.me" method="post" >
<div>비밀번호 찾기<br>
     이름 : <input type="text" name="userName" required>
     아이디 : <input type="text" name="userId" required>
    이메일 : <input type="text" name="email" required><button>확인</button>
</div>
</form>




<%@include file="../common/footer.jsp" %>

</body>
</html>