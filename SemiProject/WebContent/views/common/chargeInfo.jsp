<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #no1{
        margin-left: 50px;
    }
    #no1>img{
        border: 1px solid black;
        padding: 10px;
    }
    #no1>button{
        display: block;
        margin-left: 600px;
        width: 100px;
        height: 80px;
    }

</style>

</head>
<body>
<%@ include file="/views/common/head.jsp" %>
<br>
<br>
<br>
<h1 align="center">충전방법</h1>
<br><br><br>
<div id="no1">
    <h2> 1. 상단바에서 충전하기 버튼 선택 OR 메인페이지 중간 충전하기 버튼 클릭</h2>
    <br>
    <br>
    <img src="resources/images/충전하기선택화면.PNG" >
    <br>
    <br>
    <br>
    <br>

    <h2> 2. 충전페이지 내에서 금액 입력 후 충전하기 버튼을 누른다</h2>
    <br>
    <br>
    <img src="resources/images/충전하기처음.PNG">
    <br><br><br><br>

    <h2> 3. 본인의 정보 확인 및 결제수단 선택 후 결제하기 버튼을 눌러 결제한다.</h2>
    <br>
    <br>
    <img src="resources/images/충전하기중간.PNG">
    <br><br><br><br>

    <h2> 4. 충전 완료 </h2>
    <br>
    <br>
    <img src="resources/images/충전하기완료.PNG">
    <br>
    <br>
    <br>
    <br>
    <button type="button" onclick="location.href='<%=contextPath%>'" class="btn btn-primary">홈으로</button>
</div>




<%@ include file="/views/common/footer.jsp" %>
</body>
</html>