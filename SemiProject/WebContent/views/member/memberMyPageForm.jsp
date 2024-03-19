<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    /* div{
        border: 1px solid red;
    } */
    .mypage-wrap{
        width: 1800px;
        height: 1000px;
        margin: auto;
    }
    #myInfo{
        width: 1000px;
        height: 900px;
        margin: auto;
        margin-top: 100px;        
        border-radius: 30px;
        background-color: rgb(164, 207, 248);
    }
    #title>h1{
        line-height: 150px;
    }
    #title{
        width: 1200px;
        margin: auto;
    }
    #myBtn{
        width: 100%;
        height: 50px;
        padding: 0px 10px;
    }
    #myBtn>button{
        display: inline-block;
        font-size: 20px;
        width: 500px;
        height: 50px;
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
    #ebtn,#abtn{
     display: inline-block;
            width: 100px;
            height: 40px;
            margin: auto;
            border: none;    
            margin-left: 30px;   
            border-radius: 20px;
    }
  
    
</style>
</head>
<body>
<%@include file="../common/head.jsp" %>
<%if(loginUser != null){ %>
<div class="mypage-wrap">
    
        <div id="mypage">
            
            <div id="title">
                <h1 align="center">마이페이지</h1>
                <div id="myBtn" class="btn-group">
                    <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/myPage.me'">회원정보</button>
                    <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/statement.me'">사용내역</button>
                    <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/bookmark.me?userNo=<%=loginUser.getUserNo()%>'">즐겨찾기</button>
                    <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/storeHistory.me?userNo=<%=loginUser.getUserNo()%>'">입점신청내역</button>
                </div>
            </div>

            <br>
            <hr style="background-color: aqua;">

            <div id="myInfo">
                <form action="<%= contextPath%>/myPage.me" method="post"></form>
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
                            <td colspan="2"><%=loginUser.getEmail() %><button type="button" id="ebtn" class="btn btn-primary" data-toggle="modal" data-target="#updateEmailModal">변경</button></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td colspan="2"><%=loginUser.getAddress() %><button type="button" id="abtn" class="btn btn-primary" data-toggle="modal" data-target="#updateAddressModal" >변경</button></td>
                        </tr>
                    </table>
                    
                </form>
                
                 <div id="footerBtn">
                    <div id="btn-wrap">
  
                    
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updatePwdModal">비번변경</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteModal">탈퇴</button>
                        
                    </div>
                </div>

            </div>
  
        </div>
    
</div>






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
            </form>
	       
            <script>
                function validatePwd(){
                    if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
                        alert("비밀번호가 일치하지 않습니다.");
                        return false;
                    }
                }
            </script>
           </div>
         </div>
       </div>
     </div>

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
              <input type="hidden" name="userId" value="<%=loginUser.getUserId()  %>">
              <table>
                  <tr>
                      <td>현재비밀번호</td>
                      <td><input type="password" name="userPwd" required></td>
                  </tr>
                  <tr>
                      <td>변경할 비밀번호</td>
                      <td><input type="password" name="updatePwd" placeholder="8~15글자 영숫특 포함" required></td>
                  </tr>
                  <tr>
                      <td>변경할 비밀번호 확인</td>
                      <td><input type="password" name="checkPwd" required></td>
                  </tr>
              </table>
              <br>
  
              <button type="submit" class="btn btn-sm btn-danger" onclick="return validatePwd();">비밀번호 변경</button>
  
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
            </div>
          </div>
        </div>
      </div>

      <div class="modal" id="updateEmailModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">이메일 수정</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body" align="center">
             <form action="<%= contextPath %>/updateEmail.me" method="post">
              <input type="hidden" name="userId" value="<%=loginUser.getUserId()  %>">
              <table>
                  <tr>
                      <td>비밀번호 확인</td>
                      <td><input type="password" name="userPwd" required></td>
                  </tr>
                  <tr>
                      <td>변경할 이메일</td>
                      <td><input type="text" name="updateEmail"  required></td>
                  </tr>
                  <tr>
                      
              </table>
              <br>
  
              <button type="submit" class="btn btn-sm btn-danger" onclick="return validateEmail();">이메일 수정</button>
  
             </form>
             
             <script>
                function validate(){
                    let regExp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
                    if(!regExp.test($("#updateEmail").val())){
                        alert("올바른 이메일 형식을 입력해주세요");
                        return false;
                    }

                }

             </script>
            </div>
        </div>
      </div>
    </div>
    <div class="modal" id="updateAddressModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">주소 수정</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body" align="center">
             <form action="<%= contextPath %>/updateAddress.me" method="post">
              <input type="hidden" name="userId" value="<%=loginUser.getUserId() %>">
              <table>
                  <tr>
                      <td>비밀번호 확인</td>
                      <td><input type="password" name="userPwd" required></td>
                  </tr>
                  <tr>
                      <td>변경할 주소</td>
                      <td><input type="text" name="updateAddress"  required onclick="searchAddress();"><button type="button" onclick="searchAddress();">주소검색</button></td>
                      
              </table>
              <br>
              
              <button type="submit" class="btn btn-sm btn-danger"  >주소 수정</button>
              
             </form>
             <script>
                function searchAddress(){
                    new daum.Postcode({
                    oncomplete: function(data) {
                        
                        $("input[name=updateAddress]").val(data.address);
                    }
                }).open();
                }
            </script>
            
            </div>
        </div>
      </div>
    </div>
     <script>
        
        
                function page(no){
                    $.ajax({
                        url:'<%=contextPath%>/'+no,
                        success:function(){
                            switch(no){
                                case 1 : 
                                
                               
                            }
                            
                        }
                    });
                    
                }
        
        
                
            </script>
<%}else{%>
	<script>
		alert("로그인이 필요한 서비스 입니다.");
		location.href = "<%=contextPath%>/loginForm.me"
	</script>
<%} %>


  
<%@include file="../common/footer.jsp" %>

           
             
</body>
</html>