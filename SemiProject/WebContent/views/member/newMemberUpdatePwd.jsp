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
</head>
<body>

 <%@include file="../common/head.jsp"%>
    <form action="<%=contextPath%>/setNewPwd.me" method="post" >
        
        <div>비밀번호 변경<br>
                          <input type="hidden" name="userNo" value="<%= userNo %>">
             새 비밀번호 : <input type="text" name="updatePwd" placeholder="영어,숫자,특수문자 8~15글자" required>
            비밀번호 확인 : <input type="text" name="checkPwd" required>
            <button type="submit" class="btn btn-sm btn-danger" onclick="return validatePwd();">비밀번호 변경</button>
        </div>
        
        </form>
          
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