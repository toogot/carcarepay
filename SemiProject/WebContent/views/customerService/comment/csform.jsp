<%@page import="com.kh.semi.customerService.commnet.model.vo.Cs"%>
<%@page import="com.kh.semi.customerService.commnet.model.vo.Category"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  List<Cs> csList = (List<Cs>)request.getAttribute("csList");
  List<Category> categoryList = (List<Category>)request.getAttribute("categoryList");
  int totalCount = (int)request.getAttribute("totalCount");
  int pageNo = (int)request.getAttribute("pageNo");
  Member sessionMember = (Member) session.getAttribute("loginUser");
  int cgNo = (int)request.getAttribute("cgNo");
%>

<!DOCTYPE html>
  <html lang="ko">
  <head>
      <meta charset="UTF-8">
      <title>1:1 문의</title>
   <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

  <!-- jQuery library -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

  <!-- Popper JS -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>


  @font-face {
  font-family: 'KCC-Ganpan';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
  font-weight: normal;
  font-style: normal;
  }
  body *{
  font-family: 'KCC-Ganpan';
  }
  .wrap{
      margin: auto;
      width: 1330px;
      display: flex;
  }



  body {
  font-family: Arial, sans-serif;
  margin: auto;
  padding: 30px;
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



</style>
</head>
<body>
    <%@ include file="/views/common/head.jsp" %>
    <div class="wrap">
        <%@ include file="/views/customerService/sidebar.jsp" %>
    <br>
    <div class="main-content">

        <%@ include file="/views/customerService/slide.jsp" %>


    <div class="main-content">
        <h2>1:1 문의</h2>
        <form id="searchForm">
        <input type="hidden" name="page" id="page" value="<%= pageNo %>>">
        <div style="display: flex; justify-content: space-between;">
	        <p></p>
	        <div style="text-align: right">
	        <select name="cgNo" id="cgNo" onchange="goList(1);">
	          <% for(Category category : categoryList) { %>
	          <option value="<%= category.getCgNo() %>" <%= category.getCgNo().equals(cgNo)?"selected":"" %>><%= category.getCgType() %></option>
	          <% } %>
	        </select>
          <% if(sessionMember != null) { %>
          <a href="csaddform.if" class="btn btn-primary">등록</a>
          <% } %>
          </div>
        </div>
        </form>


  <section class="cs">

    <div id="board-list">
          <div class="container">
              <table  class="table table-hover">
                  <thead>
                  <tr>
                      <th scope="col" class="th-num" style="width:150px;">번호</th>
                      <th scope="col" class="th-ctg" style="width:150px;">카테고리</th>
                      <th scope="col" class="th-title">제목</th>
                      <th scope="col" class="th-date" style="width:150px;">등록일자</th>
                      <th scope="col" class="th-date" style="width:150px;">답변일자</th>
                  </tr>
                  </thead>
                  <tbody>
	                <% for(int i= 0; i< csList.size(); i++) { Cs cs = csList.get(i); %>
	                <tr>
	                    <td><%= (totalCount - (pageNo - 1) * 10 - i) %></td>
	                    <td>[<%= cs.getCgType() %>]</td>
	                    <td><a href="csview.if?id=<%= cs.getCsNo() %>"><%= cs.getCsTitle() %></a></td>
	                    <td><%= cs.getCsDateFormat() %></td>
	                    <td><%= cs.getComDateFormat() %></td>
	                </tr>
	                <% } %>
	                <% if(csList.isEmpty()) { %>
	                <tr><td colspan="999" style="text-align: center;">등록된 데이터가 없습니다.</td></tr>
	                <% } %>
                  </tbody>
              </table>

	            <%
	                // 초기 설정 값
	                int pageSize = 10; // 페이지당 게시글 수
	                int pageGroupSize = 5; // 페이징에 표시될 페이지 번호의 개수

	                // 총 페이지 수 계산
	                int totalPage = (totalCount % pageSize == 0) ? totalCount / pageSize : totalCount / pageSize + 1;

	                // 페이징 시작 번호와 끝 번호 계산
	                int startPage = ((pageNo - 1) / pageGroupSize) * pageGroupSize + 1;
	                int endPage = startPage + pageGroupSize - 1;
	                if (endPage > totalPage) {
	                    endPage = totalPage;
	                }
	            %>
	            <nav aria-label="Page navigation example" class="mt-3">
	              <ul class="pagination justify-content-center">
	                <li class="page-item <%= pageNo <= 1 ? "disabled" : "" %>">
	                  <a class="page-link" href="javascript:goList(<%=pageNo - 1%>)" aria-label="Previous">
	                    <span aria-hidden="true">&laquo;</span>
	                  </a>
	                </li>
	                <% for (int i = startPage; i <= endPage; i++) { %>
	                    <li class="page-item <%= pageNo == i ? "active" : "" %>"><a class="page-link" href="javascript:goList(<%=i%>)"><%=i%></a></li>
	                <% } %>
	                <li class="page-item <%= pageNo >= totalPage ? "disabled" : "" %>">
	                  <a class="page-link" href="javascript:goList(<%=pageNo + 1%>)" aria-label="Next">
	                    <span aria-hidden="true">&raquo;</span>
	                  </a>
	                </li>
	              </ul>
	            </nav>
          </div>
      </div>

  </section>

    </div>
  </div>
</div>
       <%@ include file="/views/common/footer.jsp" %>
<script>
  function goList(page) {
	  $("#page").val(page);
	  $("#searchForm").submit();
  }
</script>
</body>
</html>