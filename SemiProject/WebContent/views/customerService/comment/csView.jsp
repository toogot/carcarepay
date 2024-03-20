<%@page import="com.kh.semi.customerService.commnet.model.vo.Cs"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  Cs cs = (Cs)request.getAttribute("cs");
  Member sessionMember = (Member) session.getAttribute("loginUser");
  String attTitle = (String) request.getAttribute("attTitle");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="UTF-8">
        <title>1:1 문의</title>
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
            <!-- <img src= alt="1:1 문의 이미지" style="width: 800px; height: 400px; display: block;margin: auto; margin-bottom: 20px;"> -->


        <div class="main-content">
            <h1>1:1 문의</h1>
            <div style="display:flex;justify-content: space-between;">
            </div>
            <table>
                <tr>
                    <th>카테고리</th>
                    <td><%= cs.getCgType() %></td>
                </tr>
                <tr>
                    <th style="width:200px;">제목</th>
                    <td><%= cs.getCsTitle() %></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><%= cs.getCsDetail().replaceAll("\r\n", "<br>").replaceAll("\r", "<br>").replaceAll("\n", "<br>") %></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><%= cs.getAttNo() != null ? ("<a href='csdn.if?id="+ cs.getAttNo() +"'>"+ attTitle +"</a>"):"" %></td>
                </tr>
                <tr>
                    <th>답변</th>
                    <% if(sessionMember != null && "운영자".equals(sessionMember.getUserLevel())) { %>
                    <td><textarea id="comComment" style="width:100%;"><%= cs.getComComment()==null?"":cs.getComComment() %></textarea><br><a href="javascript:goReply(<%= cs.getCsNo() %>);" class="btn btn-warning">답변</a></td>
                    <% } else { %>
                    <td><%= cs.getComComment()==null?"":cs.getComComment() %></td>
                    <% } %>
                </tr>
                <!-- More rows as needed -->
            </table>

            <% if(sessionMember != null) { %>
            <a href="javascript:goDel(<%= cs.getCsNo() %>);" class="btn btn-danger">삭제</a>
            <a href="csaddform.if?id=<%= cs.getCsNo() %>" class="btn btn-info">수정</a>
            <% } %>

            <a href="cs.if" class="btn btn-primary">목록</a>
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
    		  url : 'csdel.if',
    		  type : 'post',
    		  data : {
    			  id : id
    		  },
    		  success : function(result){
    			  if(result == 'ok') {
    				  alert("삭제 되었습니다.");
    				  location.href = 'cs.if';
    			  } else {
    				  alert("삭제에 실패 하였습니다.");
    			  }
    		  }
    	  });
      }
      function goReply(csNo) {
          $.ajax({
            url : 'csreply.if',
            type : 'post',
            data : {
            	csNo : csNo,
            	comComment : $("#comComment").val()
            },
            success : function(result){
              if(result == 'ok') {
                alert("답변이 등록 되었습니다.");
                location.href = 'cs.if';
              } else {
                alert("답변 등록에 실패 하였습니다.");
              }
            }
          });
        }
    </script>
</body>
</html>