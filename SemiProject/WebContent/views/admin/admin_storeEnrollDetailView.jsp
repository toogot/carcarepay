<%@page import="com.kh.semi.store.enrollController.model.vo.AppStoreImage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.store.enrollController.model.vo.Application"%>
<%@page import="com.kh.semi.store.model.vo.Store"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<% 
    Application ap = (Application)request.getAttribute("ap");
	ArrayList<AppStoreImage> list = (ArrayList)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

    <style>
      div {
        /* border: 1px solid red; */
      }
      h1 {
        padding: 50px;
        border-bottom: 2px solid #e3e6f0;
      }
      th {
        text-align: center !important;
      }
      table {
        margin: auto;
      }
      #wrap {
        width: 1300px;
        height: auto;
      }
      #btn {
        text-align: center;
        padding-top: 50px;
      }
      table * {
        padding: 20px;
      }
      .tableWrap {
        border: 1px solid #e3e6f0;
      }
      #store_name_h2 {
        text-align: center;
        font-size: 30px;
        color: rgb(54, 54, 54);
        border-top: 0px;
        padding-top: 50px;
        padding-bottom: 10px;
      }
      table {
        width: 800px;
        
      }
      #bottom_div {
        padding-top: 50px;
        height: 100px;
      }
      img{
        padding: none;
      }
      #bottom_div{
        display: flex;
        justify-content: center;
      }
      #mailForm{
        /* display: none; */
      }
      #mailTableForm th,td{
        border: 1px solid #e3e6f0
      }
    </style>
  </head>
  <body>
    <%@ include file="/views/admin/admin_header.jsp" %>

    <div id="wrap">
      <div>
        <h1>입점 신청 상세 조회 페이지</h1>
      </div>

      <div>
        <h2 id="store_name_h2"></h2>
      </div>

      <form action="storeEnrollComplete" method="post" onsubmit="return confirm('매장을 승인하시겠습니까?')" >
        <input type="hidden" name="eno" value="<%=ap.getAppNo()%>" />

        <div id="table_wrap_div">
          <table border="1" class="tableWrap">
            <tr>
              <th>매장이름</th>
              <td colspan="3"><%=ap.getStoreName() %></td>
            </tr>
            <tr>
              <th>대표이름</th>
              <td><%=ap.getUserName() %></td>
              <th>사업자번호</th>
              <td><%=ap.getBusinessNo() %></td>
            </tr>
            <tr>
              <th>매장번호</th>
              <td colspan="3"><%=ap.getStorePhone() %></td>
            </tr>
            <tr>
              <th>주소</th>
              <td colspan="3"><%=ap.getStoreAddress() %></td>
            </tr>
            <tr>
              <th>세차장유형</th>
              <td><%=ap.getTypeName()%></td>
              <th>영업시간</th>
              <td><%=ap.getStoreTime() %></td>
            </tr>
            <tr>
              <th>매장상태</th>
              <td><%=ap.getAppTypeName() %></td>
              <td colspan="2" style="color: red"></td>
            </tr>
            <tr>
              <th>가격</th>
              <td colspan="3"><%=ap.getStorePrice()%></td>
            </tr>
            <tr>
              <th>사진</th>
              <td colspan="3">

              		<%for(int i=0; i<list.size(); i++) { %>
              		<br>
              		<img src="<%= contextPath %>/<%=list.get(i).getImgRoot()+list.get(i).getChangeName() %>" width="300" height="250"> 
              		<button class="btn btn-outline-primary btn-lg" type="button">원본보기</button>
              		</br>
              		<% } %>
					
              </td>
            </tr>
          </table>
        </div>
      </form>

      <div id="btn">
        <button type="submit" class="btn btn-primary" >승인하기</button>
        <a
          href="<%=contextPath %>/storeEnrollList?cpage=1"
          class="btn btn-secondary"
          >목록가기</a>
        <a class="btn btn-danger" onclick="storeno()">거절하기</a>
        
      </div>

      <form action="">
        <div id="bottom_div">
          <div id="mailForm">
            <input type="hidden" vlaue="<%=ap.getEmail()%>">
            <table id="mailTableForm">
              <tr>
                <th>제목</th>
                <td>
                  <input type="text">
                </td>
              </tr>
              <tr>
                <th>내용</th>
                <td>
                  <textarea name="" id="storeNoForm" cols="30" rows="10"></textarea>
                </td>
              </tr>
              <tr>
                <th colspan="2">
                  <a href="#" class="btn btn-primary"> 전송하기 </a>
                  <a class="btn btn-light"> 취소하기 </a>
                </th>
              </tr>
            </table>

          </div>
          
        </div>
      </form>

    <script>
      
	//  function realstorego(){
	//  	if(confirm('매장을 승인하시겠습니까?')){
	// 		location.href="<%=contextPath %>/storeEnrollComplete"
	//  	}else{
	// 		//history.back();
	//  	}
	//  }
    function storeno(){

      if( $('#mailForm').css("display") == "none"){
                    //$(this).siblings("p").slideUp(); //내가 누른 div// 나의 형제들 p를선택해라
                    $('#mailForm').slideDown(); //부드러운 느낌!
                    //다 닫고 하나만 열면됨
                }else{
                    // 안보여지게끔
                    // $p.css("display","none");
                    $('#mailForm').slideUp();
                }
    }
	
    </script>
  </body>
</html>
