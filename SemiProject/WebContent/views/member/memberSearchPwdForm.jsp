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
<body>s
<%@ include file="../common/head.jsp" %>
<form action="<%=contextPath %>/search.me" method="post" >
<div>아이디 찾기<br>
     이름 : <input type="text" name="userName">
    이메일 : <input type="text" name="email"><button>확인</button>
</div>
</form>




<%@include file="../common/footer.jsp" %>

</body>
</html>