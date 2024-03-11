<%@page import="com.kh.semi.customerService.FAQ.model.vo.Faq"%>
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
	Faq faq = (Faq)request.getAttribute("faq");
	
%>  
    
=======
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  List<Faq> faqList = (List<Faq>)request.getAttribute("faqList");
  int totalCount = (int)request.getAttribute("totalCount");
  int pageNo = (int)request.getAttribute("pageNo");
  Member sessionMember = (Member) session.getAttribute("loginUser");
  String cate = (String)request.getAttribute("cate");
%>

>>>>>>> sh
<!DOCTYPE html>
  <html lang="ko">
  <head>
      <meta charset="UTF-8">
      <title>자주묻는질문</title>
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
<<<<<<< HEAD
=======
  .wrap{
      margin: auto;
      width: 1330px;
      display: flex;
  }
>>>>>>> sh



  body {
  font-family: Arial, sans-serif;
  margin: auto;
  padding: 30px;
<<<<<<< HEAD
  display: flex;
=======
>>>>>>> sh
  }

  .sidebar {
  width: 200px;
<<<<<<< HEAD
  height: 100vh; /* Full height */
=======
>>>>>>> sh
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
<<<<<<< HEAD
  flex-grow: 1;
  background-color: #ffffff;
  padding: 50px;
  margin: ce;
  }


  
</style>
</head>
<body>
 <div class="sidebar">
        
        <a href="<%=request.getContextPath()%>/notice.if">공지사항</a>
            <a href="<%=request.getContextPath()%>/faq.if">자주묻는질문</a>
            <a href="<%=request.getContextPath()%>/comment.if">1:1문의</a>
        <!-- More links as needed -->
        
    </div>
    <br>
    <div class="main-content">
        <!-- Image tag added here -->
        <img src= alt="자주묻는질문" style="width: 600px; height: 200px; display: block;margin: auto; margin-bottom: 20px;">

=======
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
>>>>>>> sh


    <div class="main-content">
        <h2>자주묻는질문</h2>
<<<<<<< HEAD
        <p>고객에게서 많이 묻는 질문입니다 </p>
        <select name="category" id="category">
            <option value="category1">[기타]</option>
            <option value="category2">[교환/환불]</option>
            <option value="category3">[상품/매장]</option>
          </select>
        
      
  <section class="notice">
  
=======
        <form id="searchForm">
        <input type="hidden" name="page" id="page" value="<%= pageNo %>>">
        <div style="display: flex; justify-content: space-between;">
	        <p>고객에게서 많이 묻는 질문입니다 </p>
	        <div style="text-align: right">
	        <select name="cate" id="category" onchange="goList(1);">
	          <option value="기타" <%= "기타".equals(cate)?"selected":"" %>>[기타]</option>
	          <option value="교환/환불" <%= "교환/환불".equals(cate)?"selected":"" %>>[교환/환불]</option>
	          <option value="상품/매장" <%= "상품/매장".equals(cate)?"selected":"" %>>[상품/매장]</option>
	        </select>
          <% if(sessionMember != null && "운영자".equals(sessionMember.getUserLevel())) { %>
          <a href="faqaddform.if" class="btn btn-primary">등록</a>
          <% } %>
          </div>
        </div>
        </form>


  <section class="faq">

>>>>>>> sh
    <div id="board-list">
          <div class="container">
              <table  class="table table-hover">
                  <thead>
                  <tr>
<<<<<<< HEAD
                      <th scope="col" class="th-num">번호</th>
                      <th scope="col" class="th-ctg">카테고리</th>
                      <th scope="col" class="th-title">제목</th>
                      <th scope="col" class="th-date">조회수</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                      <td>∨</td>
                      <th>[기타]</th>
                      <th>
                        <a style="color: black;">할인되는 카드는 없나요?</a>
                      </th>
                    <td>100</td>
                  </tr>
  
                  <tr>
                      <td>∨</td>
                      <th>[교환/환불]</th>
                      <th><a style="color: black;">카드 취소가능한가요?</a></th>
                      <td>101</td>
                  </tr>
  
                  <tr>
                      <td>∨</td>
                      <th>[상품/매장]</th>
                      <th><a style="color: black;">매장이 어디에있나요?</a></th>
                      <td>102</td>
                  </tr>
                  <tr>
                    <td>∨</td>
                    <th>[기타]</th>
                    <th>
                      <a style="color: black;">할인되는 카드는 없나요?</a>
                    </th>
                  <td>100</td>
                </tr>

                <tr>
                    <td>∨</td>
                    <th>[교환/환불]</th>
                    <th><a style="color: black;">카드 취소가능한가요?</a></th>
                    <td>101</td>
                </tr>

                <tr>
                    <td>∨</td>
                    <th>[상품/매장]</th>
                    <th><a style="color: black;">매장이 어디에있나요?</a></th>
                    <td>102</td>
                </tr>
                <tr>
                    <td>∨</td>
                    <th>[기타]</th>
                    <th>
                      <a style="color: black;">할인되는 카드는 없나요?</a>
                    </th>
                  <td>100</td>
                </tr>

                <tr>
                    <td>∨</td>
                    <th>[교환/환불]</th>
                    <th><a style="color: black;">카드 취소가능한가요?</a></th>
                    <td>101</td>
                </tr>

                <tr>
                    <td>∨</td>
                    <th>[상품/매장]</th>
                    <th><a style="color: black;">매장이 어디에있나요?</a></th>
                    <td>102</td>
                </tr>
                  </tbody>
              </table>
          </div>
      </div>
  
  </section>
          
    </div>
   

=======
                      <th scope="col" class="th-num" style="width:150px;">번호</th>
                      <th scope="col" class="th-ctg" style="width:150px;">카테고리</th>
                      <th scope="col" class="th-title">제목</th>
                      <th scope="col" class="th-date" style="width:150px;">조회수</th>
                  </tr>
                  </thead>
                  <tbody>
	                <% for(int i= 0; i< faqList.size(); i++) { Faq faq = faqList.get(i); %>
	                <tr>
	                    <td><%= (totalCount - (pageNo - 1) * 10 - i) %></td>
	                    <td>[<%= faq.getFaqCate() %>]</td>
	                    <td><a href="javascript:view(<%= faq.getFaqNo() %>);"><%= faq.getFaqTitle() %></a></td>
	                    <td><%= faq.getFaqCount() %></td>
	                </tr>
	                <tr id="detail-<%= faq.getFaqNo() %>" style="display:none;">
                      <td colspan="999" style="height: inherit;background-color: #dee2e6;"">
                      <div style="height: inherit; overflow: hidden;display: flex;">
	                      <div style="margin:0px 50px;">내용</div>
	                      <div>
	                      <%= faq.getFaqDetail().replaceAll("\r\n","<br>").replaceAll("\n","<br>").replaceAll("\r","<br>") %>
	                      </div>
					            </div>

                      <% if(sessionMember != null && "운영자".equals(sessionMember.getUserLevel())) { %>
                      <br><br>
                      <a class="btn btn-primary" href="faqview.if?id=<%= faq.getFaqNo() %>">관리</a>
                      <% } %>
                      </td>
                  </tr>
	                <% } %>
	                <% if(faqList.isEmpty()) { %>
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
  function view(faqNo){
	  $('#detail-'+faqNo).slideToggle();
	  $.ajax({
		  url : 'faqcount.if',
		  data : {
			  id: faqNo
			}
	  });
  }
</script>
>>>>>>> sh
</body>
</html>