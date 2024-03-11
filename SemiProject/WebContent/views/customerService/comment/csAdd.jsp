<%@page import="com.kh.semi.customerService.commnet.model.vo.Cs"%>
<%@page import="com.kh.semi.customerService.commnet.model.vo.Category"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  Cs cs = (Cs)request.getAttribute("cs");
  List<Category> categoryList = (List<Category>)request.getAttribute("categoryList");
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

            <h1>1:1 문의 등록</h1>
            <br/>
            <div class="form-group">
              <label for="cgNo">카테고리</label>
		          <select id="cgNo" class="form-control" >

		            <% for(Category category : categoryList) { %>
		            <option value="<%= category.getCgNo() %>" <%= category.getCgNo().equals(cs==null?"":cs.getCgNo())?"selected":"" %>><%= category.getCgType() %></option>
		            <% } %>
		          </select>
            </div>
					  <div class="form-group">
					    <label for="csTitle">제목</label>
					    <input type="text" class="form-control" id="csTitle" value="<%= (cs==null?"":cs.getCsTitle()) %>">
					  </div>
					  <div class="form-group">
					    <label for="csDetail">내용</label>
					    <textarea class="form-control" id="csDetail" rows="3"><%= cs==null?"":cs.getCsDetail() %></textarea>
					  </div>
            <div class="form-group">
              <label for="csDetail">첨부파일</label>
              <input type="file" class="form-control-file" id="file"">
            </div>
					  <button class="btn btn-primary" onclick="save(<%= cs==null?"":cs.getCsNo() %>);">저장</button>
					  <button class="btn btn-secondary" onclick="history.go(-1);">취소</button>
	        </div>
	      </div>

       <%@ include file="/views/common/footer.jsp" %>
    </body>
    </html>
    <script>
      function save(id) {
    	  const csTitle = $("#csTitle").val();
    	  const csDetail = $("#csDetail").val();
    	  if(csTitle == '') {
    		  alert("제목을 입력해 주세요.");
    		  $("#csTitle").focus();
    		  return;
    	  }
        if(csDetail == '') {
          alert("내용을 입력해 주세요.");
          $("#csDetail").focus();
          return;
        }


        var formData = new FormData();
        formData.append('file', $('#file')[0].files[0]);
        if(id) {
	        formData.append('id', id);
        }
        var attNo = <%= cs==null?null:cs.getAttNo() %>;
        formData.append('csTitle', csTitle);
        formData.append('csDetail', csDetail);
        formData.append('cgNo', $("#cgNo").val());
        if(attNo){
	        formData.append('attNo', attNo);
        }


        $.ajax({
        	url : 'csadd.if',
        	type : 'post',
          processData: false, // 필수 옵션: FormData를 사용할 때 false로 설정
          contentType: false, // 필수 옵션: FormData를 사용할 때 false로 설정
        	data : formData,
        	success : function() {
        	  alert("1:1 문의가 저장 되었습니다.");
        	  location.href = "cs.if";
        	},
        	error : function() {
        		alert("1:1 문의 저장에 실패하였습니다.");
        	}
        })
      }
    </script>
</body>
</html>