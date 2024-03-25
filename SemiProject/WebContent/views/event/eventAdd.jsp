<%@page import="com.kh.semi.event.model.vo.Event"%>
<%@page import="com.kh.semi.event.model.vo.EventImage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  Event event = (Event)request.getAttribute("event");
  EventImage eventImage = (EventImage)request.getAttribute("eventImage");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="UTF-8">
        <title>카케어 이벤트</title>
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
            height: 100vh; /* Full height */
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

	        <div class="main-content">

            <h1>카케어 이벤트 등록</h1>
            <br/>
					  <div class="form-group">
					    <label for="evTitle">제목</label>
					    <input type="text" class="form-control" id="evTitle" value="<%= (event==null?"":event.getEvTitle()) %>">
					  </div>
					  <div class="form-group">
					    <label for="evDetail">내용</label>
					    <textarea class="form-control" id="evDetail" rows="3"><%= event==null?"":event.getEvDetail() %></textarea>
					  </div>
            <div class="form-group">
              <label for="evDetail">이벤트 종료일</label>
              <input type="date" class="form-control" id="evFin" value="<%= event==null?"":event.getEvFinFormat() %>">
            </div>
            <div class="form-group">
              <label for="csDetail">첨부파일</label>
              <input type="file" class="form-control-file" id="file"">
            </div>
					  <button class="btn btn-primary" onclick="save(<%= event==null?"":event.getEvNo() %>);">저장</button>
					  <button class="btn btn-secondary" onclick="history.go(-1);">취소</button>
	        </div>
	      </div>

    </body>
    </html>
    <script>
      function save(id) {
    	  const evTitle = $("#evTitle").val();
    	  const evDetail = $("#evDetail").val();
    	  const evFin = $("#evFin").val();
    	  if(evTitle == '') {
    		  alert("제목을 입력해 주세요.");
    		  $("#evTitle").focus();
    		  return;
    	  }
        if(evDetail == '') {
          alert("내용을 입력해 주세요.");
          $("#evDetail").focus();
          return;
        }
        if(evFin == '') {
           alert("이벤트 종료일을 입력해 주세요.");
           $("#evFin").focus();
           return;
         }

        var formData = new FormData();
        formData.append('file', $('#file')[0].files[0]);
        if(id) {
          formData.append('id', id);
        }
        formData.append('evTitle', evTitle);
        formData.append('evDetail', evDetail);
        formData.append('evFin', evFin);

        $.ajax({
        	url : 'eventadd.if',
        	type : 'post',
          processData: false, // 필수 옵션: FormData를 사용할 때 false로 설정
          contentType: false, // 필수 옵션: FormData를 사용할 때 false로 설정
        	data : formData,
        	success : function() {
        	  alert("카케어 이벤트가 저장 되었습니다.");
        	  location.href = "event";
        	},
        	error : function() {
        		alert("카케어 이벤트 저장에 실패하였습니다.");
        	}
        })
      }
    </script>
</body>
</html>