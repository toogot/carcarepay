<%@page import="com.kh.semi.customerService.notice.model.vo.Notice"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  Notice notice = (Notice)request.getAttribute("notice");
  Member sessionMember = (Member) session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="UTF-8">
        <title>공지사항</title>
        <style>

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
    .wrap{

        margin: auto;
        width: 1330px;
        display: flex;

    }



            .sidebar {
            width: 200px;
            padding-top: 20px;
            }

            .sidebar a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 20px;
            color: black;
            display: block;
            }

            .sidebar a:hover {
            color:#87CEFA;
            }

            .main-content {
                flex-grow: 1;
                background-color: #ffffff;
                padding: 30px;
                margin : 0px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            th {
                background-color: #f2f2f2;
            }

            @font-face {
            font-family: 'KCC-Ganpan';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
            }
            body {
            font-family: 'KCC-Ganpan';
            }


        </style>
    </head>
    <body>
        <%@ include file="/views/common/head.jsp" %>
    <div class="wrap">
        <%@ include file="/views/customerService/sidebar.jsp" %>

        <div class="main-content">
            <!-- Image tag added here -->
            <!-- <img src= alt="공지사항 이미지" style="width: 800px; height: 400px; display: block;margin: auto; margin-bottom: 20px;"> -->


        <div class="main-content">
            <h1>공지사항</h1>
            <div style="display:flex;justify-content: space-between;">
            </div>
            <table>
                <tr>
                    <th style="width:200px;">제목</th>
                    <td><%= notice.getNotiTitle() %></td>
                </tr>
                <tr>
                    <th>작성일자</th>
                    <td><%= notice.getNotiDateFormat() %></td>
                </tr>
                <tr>
                    <th>조회수</th>
                    <td><%= notice.getNotiCount() %></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><%= notice.getNotiContent().replaceAll("\r\n", "<br>").replaceAll("\r", "<br>").replaceAll("\n", "<br>") %></td>
                </tr>
                <!-- More rows as needed -->
            </table>

            <% if(sessionMember != null && "운영자".equals(sessionMember.getUserLevel())) { %>
            <a href="javascript:goDel(<%= notice.getNotiCode() %>);" class="btn btn-danger">삭제</a>
            <a href="noticeaddform.if?id=<%= notice.getNotiCode() %>" class="btn btn-info">수정</a>
            <% } %>
            <a href="notice.if" class="btn btn-primary">목록</a>
        </div>
       </div>
      </div>

       <%@ include file="/views/common/footer.jsp" %>

    </body>
    </html>
    <script>
      function goDel(id) {
    	  if(!confirm("정말 삭제 하시겠습니까?")) {
    		  return;
    	  }
    	  $.ajax({
    		  url : 'noticedel.if',
    		  type : 'post',
    		  data : {
    			  id : id
    		  },
    		  success : function(result){
    			  if(result == 'ok') {
    				  alert("삭제 되었습니다.");
    				  location.href = 'notice.if';
    			  } else {
    				  alert("삭제에 실패 하였습니다.");
    			  }
    		  }
    	  });
      }
    </script>
</body>
</html>