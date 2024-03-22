<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
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
        width: 450px;
        height: 220px;
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
    <form action="<%=contextPath %>/searchIdFinish.me" method="post">
      <div id="searchInput-wrap">
        <h1 align="center">아이디 찾기</h1>
        <div id="table-wrap">
        <table>
          <tr>
            <th style="width: 100px;">이름</th>
            <td> <input type="text" name="userName" required class="form-control" placeholder="본인의 이름을 입력하세요" style="width: 300px;" /></td>
          </tr>
          <tr>
            <th style="width: 100px;">이메일</th>
            <td><input type="text" name="email" required class="form-control" placeholder="가입시 등록한 이메일 주소를 입력하세요" style="width: 300px;"/></td>
          </tr>
        </table>
        <div id="btn-wrap">
          <button class="btn btn-primary">ID 찾기</button>
          <button type="button" onclick="location.href='<%=contextPath%>/loginForm.me'" class="btn btn-primary">취소</button>
        </div>
      </div>
        
      </div>
    </form>

  </div>

    <%@include file="../common/footer.jsp" %>
  </body>
</html>
