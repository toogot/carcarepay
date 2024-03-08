<%@page import="com.kh.semi.customerService.notice.model.vo.Notice"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  List<Notice> noticeList = (List<Notice>)request.getAttribute("noticeList");
  int totalCount = (int)request.getAttribute("totalCount");
  int pageNo = (int)request.getAttribute("pageNo");
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
        <%@ include file="/views/customerService/notice/sidebar.jsp" %>

        <div class="main-content">
            <!-- Image tag added here -->
            <!-- <img src= alt="공지사항 이미지" style="width: 800px; height: 400px; display: block;margin: auto; margin-bottom: 20px;"> -->


        <div class="main-content">
            <h1>공지사항</h1>
            <div style="display:flex;justify-content: space-between;">
            <p> ※카케어페이에 새로운소식을 확인하세요 NOTICE ※ </p>
            <% if(session.getAttribute("loginUser") != null) { %>
            <a href="noticeaddform.if" class="btn btn-primary">등록</a>
            <% } %>
            </div>
            <table>
                <tr>
                    <th style="width:150px;">번호</th>
                    <th>제목</th>
                    <th style="width:150px;">작성일자</th>
                    <th style="width:150px;">조회수</th>
                </tr>
                <% for(int i= 0; i< noticeList.size(); i++) { Notice notice = noticeList.get(i); %>
                <tr>
                    <td><%= (totalCount - (pageNo - 1) * 10 - i) %></td>
                    <td><a href="noticeview.if?id=<%= notice.getNotiCode() %>"><%= notice.getNotiTitle() %></a></td>
                    <td><%= notice.getNotiDateFormat() %></td>
                    <td><%= notice.getNotiCount() %></td>
                </tr>
                <% } %>
                <% if(noticeList.isEmpty()) { %>
                <tr><td colspan="999" style="text-align: center;">등록된 데이터가 없습니다.</td></tr>
                <% } %>
                <!-- More rows as needed -->
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
						      <a class="page-link" href="?pageNo=<%=pageNo - 1%>" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <% for (int i = startPage; i <= endPage; i++) { %>
						        <li class="page-item <%= pageNo == i ? "active" : "" %>"><a class="page-link" href="?pageNo=<%=i%>"><%=i%></a></li>
						    <% } %>
						    <li class="page-item <%= pageNo >= totalPage ? "disabled" : "" %>">
						      <a class="page-link" href="?pageNo=<%=pageNo + 1%>" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>


        </div>
       </div>
      </div>

       <%@ include file="/views/common/footer.jsp" %>

    </body>
    </html>
</body>
</html>