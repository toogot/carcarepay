<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String userId = (String)request.getAttribute("userId"); %>
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

<div>조회 결과<br>
	<%if(userId == null){ %>
     조회 된 아이디가 없습니다.
    <%}else{ %>
    조회된 아이디 : <%= userId %>
    <%} %>
</div>





<%@include file="../common/footer.jsp" %>

</body>
</html>