<%@page import="com.kh.semi.customerService.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  Notice notice = (Notice)request.getAttribute("notice");
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
                margin: auto;
                margin-top : 0px;
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

            <h1>공지사항 등록</h1>
            <br/>
					  <div class="form-group">
					    <label for="notiTitle">제목</label>
					    <input type="text" class="form-control" id="notiTitle" value="<%= (notice==null?"":notice.getNotiTitle()) %>">
					  </div>
					  <div class="form-group">
					    <label for="notiContent">내용</label>
					    <textarea class="form-control" id="notiContent" rows="3"><%= notice==null?"":notice.getNotiContent() %></textarea>
					  </div>
					  <button class="btn btn-primary" onclick="save(<%= notice==null?"":notice.getNotiCode() %>);">저장</button>
					  <button class="btn btn-secondary" onclick="history.go(-1);">취소</button>
	        </div>
	      </div>

       <%@ include file="/views/common/footer.jsp" %>
    </body>
    </html>
    <script>
      function save(id) {
    	  const notiTitle = $("#notiTitle").val();
    	  const notiContent = $("#notiContent").val();
    	  if(notiTitle == '') {
    		  alert("제목을 입력해 주세요.");
    		  $("#notiTitle").focus();
    		  return;
    	  }
        if(notiContent == '') {
          alert("내용을 입력해 주세요.");
          $("#notiContent").focus();
          return;
        }
        $.ajax({
        	url : 'noticeadd.if',
        	type : 'post',
        	data : {
        		id : id,
        		notiTitle : notiTitle,
        		notiContent : notiContent
        	},
        	success : function() {
        	  alert("공지사항이 저장 되었습니다.");
        	  location.href = "notice.if";
        	},
        	error : function() {
        		alert("공지사항 저장에 실패하였습니다.");
        	}
        })
      }
    </script>
</body>
</html>