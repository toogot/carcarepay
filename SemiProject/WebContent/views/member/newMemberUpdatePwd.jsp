<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int userNo = (int)request.getAttribute("userNo");
%>
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
        width: 600px;
        height: 300px;
        margin: auto;
        padding: 10px 0px;
      }
      #btn-wrap{
        width: 300px;
        height: 150px;
        margin: auto;
        margin-top: 20px;
      }
      th{
        font-size: 20px;
        text-align: center;
      }
</style>
</head>
<body>

 <%@include file="../common/head.jsp"%>
 <div id="searchForm-wrap" class="form-group">
    <form action="<%=contextPath %>/setNewPwd.me" method="post">
      <div id="searchInput-wrap">
        <h1 align="center">비밀번호 변경</h1>
        <div id="table-wrap">
            <input type="hidden" name="userNo" value="<%= userNo%>">
        <table>
          <tr>
            <th style="width: 160px;">새 비밀번호</th>
            <td> <input type="password" name="updatePwd" required class="form-control" placeholder="영어,숫자,특수문자 8~15글자" style="width: 300px;" /></td>
          </tr>
          <tr>
            <th style="width: 160px;">비밀번호 확인</th>
            <td><input type="password" name="checkPwd" required class="form-control" placeholder="가입시 등록한 이메일 주소를 입력하세요" style="width: 300px;"/></td>
          </tr>
        </table>
        <div id="btn-wrap">
          <button class="btn btn-primary" type="submit" onclick="return validatePwd();">PWD 변경</button>
          <button type="button" onclick="location.href='<%=contextPath%>/loginForm.me'" class="btn btn-primary">취소</button>
        </div>
      </div>
        
      </div>
    </form>

  </div>
          
             <script>
                 
                 function validatePwd(){     
                     let regExp =  /^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,15}$/;
                if(!regExp.test($("input[name=updatePwd]").val())){
                    alert("영어,숫자,특수기호 포함 8~15자로 입력해주세요")
                    return false;
                }
                
                     if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
                         alert("비밀번호가 일치하지 않습니다.");
                         return false;
                     }
                    }
               
             </script>
             

                
                
                
         
    <%@include file="../common/footer.jsp" %>
</body>
</html>