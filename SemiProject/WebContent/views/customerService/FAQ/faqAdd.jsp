<%@page import="com.kh.semi.customerService.FAQ.model.vo.Faq"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  Faq faq = (Faq)request.getAttribute("faq");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="UTF-8">
        <title>자주묻는질문</title>
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

            <h1>자주묻는질문 등록</h1>
            <br/>
            <div class="form-group">
              <label for="faqCate">카테고리</label>
		          <select id="faqCate" class="form-control" >
		            <option value="기타" <%= "기타".equals(faq==null?"":faq.getFaqCate())?"selected":"" %>>[기타]</option>
		            <option value="교환/환불" <%= "교환/환불".equals(faq==null?"":faq.getFaqCate())?"selected":"" %>>[교환/환불]</option>
		            <option value="상품/매장" <%= "상품/매장".equals(faq==null?"":faq.getFaqCate())?"selected":"" %>>[상품/매장]</option>
		          </select>
            </div>
					  <div class="form-group">
					    <label for="faqTitle">제목</label>
					    <input type="text" class="form-control" id="faqTitle" value="<%= (faq==null?"":faq.getFaqTitle()) %>">
					  </div>
					  <div class="form-group">
					    <label for="faqDetail">내용</label>
					    <textarea class="form-control" id="faqDetail" rows="3"><%= faq==null?"":faq.getFaqDetail() %></textarea>
					  </div>
					  <button class="btn btn-primary" onclick="save(<%= faq==null?"":faq.getFaqNo() %>);">저장</button>
					  <button class="btn btn-secondary" onclick="history.go(-1);">취소</button>
	        </div>
	      </div>

       <%@ include file="/views/common/footer.jsp" %>
    </body>
    </html>
    <script>
      function save(id) {
    	  const faqTitle = $("#faqTitle").val();
    	  const faqDetail = $("#faqDetail").val();
    	  if(faqTitle == '') {
    		  alert("제목을 입력해 주세요.");
    		  $("#faqTitle").focus();
    		  return;
    	  }
        if(faqDetail == '') {
          alert("내용을 입력해 주세요.");
          $("#faqDetail").focus();
          return;
        }
        $.ajax({
        	url : 'faqadd.if',
        	type : 'post',
        	data : {
        		id : id,
        		faqTitle : faqTitle,
        		faqDetail : faqDetail,
        		faqCate : $("#faqCate").val()
        	},
        	success : function() {
        	  alert("자주묻는질문이 저장 되었습니다.");
        	  location.href = "faq.if";
        	},
        	error : function() {
        		alert("자주묻는질문 저장에 실패하였습니다.");
        	}
        })
      }
    </script>
</body>
</html>