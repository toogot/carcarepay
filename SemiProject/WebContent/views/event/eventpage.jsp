<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.semi.event.model.vo.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Event> list = (ArrayList<Event>) request.getAttribute("list");

	PageInfo piFin = (PageInfo) request.getAttribute("piFin");
	ArrayList<Event> listFin = (ArrayList<Event>) request.getAttribute("listFin");

  Member sessionMember = (Member) session.getAttribute("loginUser");

  String orderType = (String) request.getAttribute("orderType");
  String tab = (String) request.getAttribute("tab");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
<style>
@font-face {
	font-family: 'KCC-Ganpan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

body * {
	font-family: 'KCC-Ganpan';
}

<<<<<<< HEAD
.outer {
	background-color: color: white;
	width: 100%;
	height: 90%;
	margin: auto;
	margin-top: 500px;
}

=======
>>>>>>> sh
.list-area {
	margin: auto;
}

.thumbnail {
	border: 1px solid white;
	width: 200px;
	display: inline-block;
	margin: 14px;
	cursor: pointer !important;
}

.btn {
	margin-left: 150px;
}

body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

h1 {
	padding: 50px 0;
	font-weight: 400;
	text-align: center;
}

p {
	margin: 0 0 20px;
	line-height: 1.5;
}

.main {
	min-width: 320px;
	max-width: 800px;
	padding: 50px;
	margin: 0 auto;
}

section {
	display: none;
	padding: 20px 0 0;
	border-top: 1px solid #ddd;
}

input {
	display: none;
}

label {
	display: inline-block;
	margin: 0 0 -1px;
	padding: 15px 25px;
	font-weight: 600;
	text-align: center;
	color: #bbb;
	border: 1px solid transparent;
}

label:hover {
	color: #2e9cdf;
	cursor: pointer;
}

input:checked+label {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid #2e9cdf;
	border-bottom: 1px solid #ffffff;
}

#tab1:checked ~ #content1, #tab2:checked ~ #content2, #tab3:checked ~
	#content3, #tab4:checked ~ #content4 {
	display: block;
}
</style>

</head>
<body>
<<<<<<< HEAD
=======
    <%@ include file="/views/common/head.jsp" %>
    <div class="wrap">
>>>>>>> sh

	<div class="outer">
		<br>

		<div class="main-content">
			<!-- Image tag added here -->
			<!-- <img src=alt= "이벤트
				이미지" style="width: 700px; height: 200px; display: block; margin: auto; margin-bottom: 20px;"> -->


			<h2 align="center">카케어이벤트</h2>

			<h5 align="center">카케어의 다양한 이벤트를 만나보세요</h5>
			<div class="btn">
				<a href="javascript:$('#orderType').val(1);$('#pageFin').val(1);goList(1);">최신순 | </a> <a href="javascript:$('#orderType').val(2);$('#pageFin').val(1);goList(1);">조회순</a>
			</div>
			<br>
			<form id="listForm">
				<input type="hidden" name="page" id="page" value="<%= pi.getCurrentPage() %>">
				<input type="hidden" name="pageFin" id="pageFin" value="<%= piFin.getCurrentPage() %>">
				<input type="hidden" name="orderType" id="orderType" value="<%= orderType %>">
        <input type="hidden" name="tab" id="tab" value="<%= tab %>">
			</form>

			<div class="main">
				<input id="tab1" type="radio" name="tabs" onclick="$('#content1').show();$('#content2').hide();$('#tab').val(1);" <%= "1".equals(tab)?"checked":"" %>>
				<label for="tab1">진행중이벤트</label>

				<input id="tab2" type="radio"	name="tabs" onclick="$('#content1').hide();$('#content2').show();$('#tab').val(2);" <%= "2".equals(tab)?"checked":"" %>>
				<label for="tab2">종료된이벤트</label>


	       <% if(sessionMember != null && "운영자".equals(sessionMember.getUserLevel())) { %>
	       <a href="eventaddform.if" class="btn btn-primary" style="float:right;margin-top:20px;">등록</a>
	       <% } %>

				<section id="content1"  <%= "2".equals(tab)?"style='display:none;'":"" %>>
					<%if (list == null || list.size() == 0) { %>
						<p>진행중인 이벤트가 없습니다. </p>
					<%} else { %>

					<div class="list-area">

					<%for (Event event : list){ %>

					<div class="thumbnail" align="center" onclick="goView(<%= event.getEvNo()%>);">
							<img
								src="eventdn.if?id=<%= event.getEvNo() %>"
								width="200" height="150">
							<p>
								<%=event.getEvDateFormat() %> ~ <%=event.getEvFinFormat() %><br>
								<%=event.getEvTitle() %>
							</p>
						</div>
					<%} %>
					<%} %>
					</div>
              <nav aria-label="Page navigation example" class="mt-3">
                <ul class="pagination justify-content-center">
                  <li class="page-item <%= pi.getCurrentPage() <= 1 ? "disabled" : "" %>">
                    <a class="page-link" href="javascript:goList(<%=pi.getCurrentPage() - 1%>)" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <% for (int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
                      <li class="page-item <%= pi.getCurrentPage() == i ? "active" : "" %>"><a class="page-link" href="javascript:goList(<%=i%>)"><%=i%></a></li>
                  <% } %>
                  <li class="page-item <%= pi.getCurrentPage() >= pi.getMaxPage() ? "disabled" : "" %>">
                    <a class="page-link" href="javascript:goList(<%=pi.getCurrentPage() + 1%>)" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>

				</section>

				<section id="content2" <%= "1".equals(tab)?"style='display:none;'":"" %>>
					<%if (listFin == null || listFin.size() == 0) { %>
						<p>종료된 이벤트가 없습니다. </p>
					<%} else { %>

					<div class="list-area">

					<%for (Event event : listFin){ %>

					<div class="thumbnail" align="center" onclick="goView(<%= event.getEvNo()%>);">
							<img
                src="eventdn.if?id=<%= event.getEvNo() %>"
                width="200" height="150">
							<p>
								<%=event.getEvDateFormat() %> ~ <%=event.getEvFinFormat() %><br>
								<%=event.getEvTitle() %>
							</p>
						</div>
					<%} %>
					<%} %>
					</div>
              <nav aria-label="Page navigation example" class="mt-3">
                <ul class="pagination justify-content-center">
                  <li class="page-item <%= piFin.getCurrentPage() <= 1 ? "disabled" : "" %>">
                    <a class="page-link" href="javascript:goList2(<%=piFin.getCurrentPage() - 1%>)" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <% for (int i = piFin.getStartPage(); i <= piFin.getEndPage(); i++) { %>
                      <li class="page-item <%= piFin.getCurrentPage() == i ? "active" : "" %>"><a class="page-link" href="javascript:goList2(<%=i%>)"><%=i%></a></li>
                  <% } %>
                  <li class="page-item <%= piFin.getCurrentPage() >= piFin.getMaxPage() ? "disabled" : "" %>">
                    <a class="page-link" href="javascript:goList2(<%=piFin.getCurrentPage() + 1%>)" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>
				</section>

			</div>
		</div>
<<<<<<< HEAD
		<%@ include file="/views/common/footer.jsp" %>
=======
		</div>
		<%@ include file="/views/common/footer.jsp" %>


<script>
  function goList(page) {
    $("#page").val(page);
    $("#listForm").submit();
  }
  function goList2(page) {
    $("#pageFin").val(page);
    $("#listForm").submit();
  }
  function goView(evNo) {
	  const tab = $("#tab").val();
	  const page = tab == '1'? $("#page").val():$("#pageFin").val();
	  let url = 'eventdetail?evNo='+evNo;
	  url += "&orderType=" + $("#orderType").val();
	  url += "&tab=" + tab;
	  url += "&page=" + page;
	  location.href=url;
  }
</script>
>>>>>>> sh
</body>
</html>