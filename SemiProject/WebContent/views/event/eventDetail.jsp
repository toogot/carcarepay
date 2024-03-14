<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.semi.event.model.vo.Event"%>
<%
	Event event = (Event) request.getAttribute("event");
  Event prev = (Event) request.getAttribute("prev");
  Event next = (Event) request.getAttribute("next");
  int prevPage = (int) request.getAttribute("prevPage");
  int nextPage  = (int) request.getAttribute("nextPage");
  Member sessionMember = (Member) session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>이벤트상세페이지</title>
<style>
   body {
        font-family: 'Arial', sans-serif;
        background: #e9ecef;
        margin: 0;
        padding: 0;
        height: 100vh;
    }
    .container {
        margin-top:30px;
        width: 50%;
        background: #fff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
    }
    .header {
        background: #007bff;
        color: white;
        padding: 20px;
        text-align: center;
        font-size: 24px;
    }
    .content {
        padding: 20px;
        border-bottom: 1px solid #dee2e6;
    }
    .footer {
        display: flex;
        justify-content: space-between;
        padding: 10px 20px;
        background: #f8f9fa;
    }
    .button {
        padding: 5px 15px;
        border: 1px solid #dee2e6;
        background: white;
        cursor: pointer;
    }
    .button:hover {
        background: #e2e6ea;
    }
    .disabled {
        cursor: not-allowed;
        opacity: 0.5;
    }
    @font-face {
        font-family: 'KCC-Ganpan';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        }

</style>

</head>
<body>

  <%@ include file="/views/common/head.jsp" %>


	<div class="container">
    <div class="header">
       <%= event.getEvTitle() %>
    </div>
    <div class="content">
	    <center>
	      <img
			    src="eventdn.if?id=<%= event.getEvNo() %>"
			    width="60%" >
	    </center>
      <%= event.getEvDetail().replaceAll("\r\n","<br>").replaceAll("\n","<br>").replaceAll("\r","<br>") %>
    </div>
    <div class="footer">
        <% if(prev != null) { %>
        <div>
        <button class="button mr-3" onclick="goView(<%= prev.getEvNo()%>,<%= prevPage %>)">이전</button>
        <%= prev.getEvTitle()%>
        </div>
        <% } else { %>
        <div></div>
        <% } %>
        <% if(next != null) { %>
        <div>
        <%= next.getEvTitle()%>
        <button class="button ml-3" onclick="goView(<%= next.getEvNo()%>,<%= nextPage %>)">다음</button>
        </div>
        <% } %>
    </div>
  </div>

  <% if(sessionMember != null && "운영자".equals(sessionMember.getUserLevel())) { %>
  <center>
  <a href="eventaddform.if?id=<%= event.getEvNo() %>" class="btn btn-primary" style="margin-top:20px;">수정</a>
  <a href="javascript:goDel(<%= event.getEvNo() %>);" class="btn btn-danger" style="margin-top:20px;">삭제</a>
  </center>
  <% } %>
  <%@ include file="/views/common/footer.jsp" %>
  <script>

  function goDel(id) {
    if(!confirm("정말 삭제 하시겠습니까?")) {
      return;
    }
    $.ajax({
      url : 'eventdel.if',
      type : 'post',
      data : {
        id : id
      },
      success : function(result){
        if(result == 'ok') {
          alert("삭제 되었습니다.");
          location.href = 'event';
        } else {
          alert("삭제에 실패 하였습니다.");
        }
      }
    });
  }

  function goView(evNo, page) {
    const tab = $("#tab").val();
    let url = 'eventdetail?evNo='+evNo;
    url += "&orderType=<%= request.getParameter("orderType") %>";
    url += "&tab=<%= request.getParameter("tab") %>";
    url += "&page=" + page;
    location.href=url;
  }
  </script>
</body>
</html>