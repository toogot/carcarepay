<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style>
    /* div{
        border: 1px solid red;
    } */
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
        border-radius: 30px;
        background-color: rgb(164, 207, 248);
    }
    #title>h1{
        line-height: 150px;
    }
    #myBtn{
        height: 50px;
        padding-left: 200px;
        border-bottom: 1px solid rgb(241, 112, 6);
    }
    #myBtn>button{
        display: inline-block;
        width: 200px;
        height: 40px;
        border: none;
           
    }
    #myInfo>table{
        margin: 50px 200px;
        width: 700px;
    }
     #myInfo tr{
        margin: 50px;
        font-size: 30px;    
    }
 
    #myInfo{        
        height: 380px;
    }

    #myInfo button{        
        width: 100px;
        height: 45px;
        font-size: 20px;
    }
    #myInfo th{
        width: 180px;
        height: 70px;
        color: rgb(85, 81, 81);
        text-align: center;
    }
    #myInfo td{
        width: 300px;
        padding-left: 30px;
    }
    #footerBtn{
        width: 100%;
        height: 40px;
    }
    #btn-wrap{
        width: 300px;
        height: 40px;
        margin: auto;
    }
    #footerBtn button{
            display: inline-block;
            width: 100px;
            height: 40px;
            margin: auto;
            border: none;    
            margin-left: 30px;   
            border-radius: 20px;
            /* background-color: aquamarine;     */
    }
    
    
</style>
</head>
<body>


<%@include file="../common/head.jsp" %>
<%if(loginUser != null){ %>
<div class="mypage-wrap">
    <form action="<%= contextPath%>/myPage.me" method="post">
        <div id="mypage">
            <div id="title">
                <h1 align="center">마이페이지</h1>
            </div>
            <div id="myBtn" class="btn-group">
                <button type="button" class="btn btn-primary">회원정보</button>
                <button type="button" class="btn btn-primary">사용내역</button>
                <button type="button" class="btn btn-primary">즐겨찾기</button>  
            </div>
            <div id="myInfo">
                <table>
                    <tr>
                        <th>아이디</th>
                        <td colspan="2"><%=loginUser.getUserId() %></td>
                    </tr>
                    <tr>
                        <th>포인트</th>
                        <td><%=loginUser.getBalance() %>원 <br></td>
                        <td> <button type="button" class="btn btn-sm btn-danger" onclick="location.href='<%=contextPath%>/product.bo'">충전</button></td>
                    </tr>
                    <tr>
                        <th>회원등급</th>
                        <td colspan="2"><%=loginUser.getUserLevel() %></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td colspan="2"><%=loginUser.getEmail() %></td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td colspan="2"><%=loginUser.getAddress() %></td>
                    </tr>
                </table>
            </div>
            
            
            <div id="footerBtn">
                <div id="btn-wrap">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#">주소변경</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#">이메일변경</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updatePwdModal">비밀번호 변경</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal"  data-target="#deleteModal">탈퇴</button>
                </div>
            </div>
        </div>
    </form>
</div>
<%}else{%>
	<script>
		alert("로그인이 필요한 서비스 입니다.");
		location.href = "<%=contextPath%>/loginForm.me"
	</script>
<%} %>
<!-- 회원탈퇴용 Modal -->
<div class="modal" id="deleteModal">
    <div class="modal-dialog">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">회원탈퇴</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body" align="center">
         <form action="<%= contextPath %>/delete.me" method="post">
         <input type="hidden" name="userId" value="<%= loginUser.getUserId() %>">
             <b>탈퇴 후 복구가 불가능합니다. <br> 정말로 탈퇴하시겠습니까? </b> <br><br>
             
             비밀번호 : <input type="password" name="userPwd" required> <br><br>
             <button type="submit" class="btn btn-sm btn-danger">탈퇴하기</button>
             
             <!-- 
                 요청시 실행한 sql문
                 UPDATE MEMBER
                    SET STATUS = 'N'
                      , MODIFY_DATE = SYSDATE
                  WHERE USER_ID = 현재로그인한회원아이디
                    AND USER_PWD = 사용자가 입력한 비밀번호
                    
                    (정보변경, 비밀번호 변경 갱신된 회원 다시 조회할 필요 없음)
                    
                    성공했을 경우 => 메인페이지, alert(성공적으로 회원탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.)
                                    단, 로그아웃 되어있어야만함
                    실패했을 경우 => 에러페이지 에러문구 띄우기(회원탈퇴실 패)
              -->
         </form>
         
         <script>
             function validatePwd(){
                 if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
                     alert("변경할 비밀번호가 일치하지 않습니다.");
                     return false;
                 }
             }
         </script>
        </div>
      </div>
    </div>
  </div>

<!-- 비밀번호 변경용 Modal -->
	<div class="modal" id="updatePwdModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">비밀번호 변경</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" align="center">
	       <form action="<%= contextPath %>/updatePwd.me" method="post">
			<input type="hidden" name="userId" value="<%= loginUser.getUserId() %>">
            <table>
                <tr>
                    <td>현재비밀번호</td>
                    <td><input type="password" name="userPwd" required></td>
                </tr>
                <tr>
                    <td>변경할 비밀번호</td>
                    <td><input type="password" name="updatePwd" required></td>
                </tr>
                <tr>
                    <td>변경할 비밀번호 확인</td>
                    <td><input type="password" name="checkPwd" required></td>
                </tr>
            </table>
	        <br>

            <button type="submit" class="btn btn-sm btn-secondary" onclick="return validatePwd();">비밀번호 변경</button>

	       </form>
	       
	       <script>
	       	function validatePwd(){
	       		if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
	       			alert("변경할 비밀번호가 일치하지 않습니다.");
	       			return false;
	       		}
	       	}
	       </script>
	      </div>
	    </div>
	  </div>
	</div>

<%@include file="../common/footer.jsp" %>
</body>
</html>