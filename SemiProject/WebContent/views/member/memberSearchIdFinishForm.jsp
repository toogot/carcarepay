<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String userId = (String)request.getAttribute("userId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     #searchForm-wrap{
        width: 1000px;
        height: 700px;
        margin: auto;
        margin-top: 50px;
        margin-bottom: 50px;
        padding: 10px;
        border-radius: 30px;
        background-color: #87cefa;
      }
      #searchInput-wrap{
        width: 500px;
        height: 350px;
        margin: auto;
        margin-top: 180px;
        border-radius: 20px;
        background-color: #6dc3f9;
      }
      #searchInput-wrap>h1{
        line-height: 150px;
      }
      #table-wrap{
        width: 400px;
        height: 200px;
        margin: auto;
        padding: 10px 0px;
      }
      #btn-wrap{
        width: 150px;
        height: 50px;
        margin: auto;
        margin-top: 50px;
      }
      th{
        font-size: 20px;
        text-align: center;
      }
</style>
</head>
<body>
<%@ include file="../common/head.jsp" %>

<div id="searchForm-wrap" class="form-group">
    
      <div id="searchInput-wrap">
        <h1 align="center">아이디 찾기</h1>
        <div id="table-wrap">
        <table>
          <tr>
            <th style="width: 100px;">조회결과</th>
            <td><%if(userId == null){%>
                조회결과가 없습니다.
            <%}else{%>
                 <%=userId%>
                <%}%>
            </td>
          </tr>
        </table>
        <div id="btn-wrap">
          <button type="button" onclick="location.href='<%=contextPath%>/loginForm.me'" class="btn btn-primary">확인</button>
        </div>
      </div>
        
      </div>

  </div>





<%@include file="../common/footer.jsp" %>

</body>
</html>