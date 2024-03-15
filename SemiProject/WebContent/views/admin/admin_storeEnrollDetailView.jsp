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
        height: 100px;
      }
      img{
        padding: none;
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

      <form action="storeEnrollComplete" method="post" >
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

      <div id="btn">
        <button type="submit" class="btn btn-primary">승인하기</button>
        <a
          href="<%=contextPath %>/storeEnrollList?cpage=1"
          class="btn btn-secondary"
          >목록가기</a>
        <a href="" class="btn btn-danger" onclick="">거절하기</a>
      </div>
      <div id="bottom_div"></div>
    </div>
      </form>

    <script>
      /*
	 function realstorego(){
	 	if(confirm('매장을 승인하시겠습니까?')){
			document.form.submit();
	 	}else{
			//history.back();
	 	}
	 }
	*/
    </script>
  </body>
</html>
