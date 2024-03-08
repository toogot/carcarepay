<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.semi.event.model.vo.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.common.model.vo.PageInfo"%>
	
<%String contextPath = request.getContextPath(); %>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Event> list = (ArrayList<Event>) request.getAttribute("list");
	
	PageInfo piFin = (PageInfo) request.getAttribute("piFin");
	ArrayList<Event> listFin = (ArrayList<Event>) request.getAttribute("listFin");
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

.outer {
	background-color: color: white;
	width: 100%;
	height: 90%;
	margin: auto;
	margin-top: 500px;
}

.list-area {
	width: 1000px;
	margin: auto;
	margin-left: 120px;
}

.thumbnail {
	border: 1px solid white;
	width: 220px;
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

	<div class="outer">
		<br>

		<div class="main-content">
			<!-- Image tag added here -->
			<img src=alt= "이벤트
				이미지" style="width: 700px; height: 200px; display: block; margin: auto; margin-bottom: 20px;">


			<h2 align="center">카케어이벤트</h2>

			<h5 align="center">카케어의 다양한 이벤트를 만나보세요</h5>
			<div class="btn">
				<a href="">최신순 | </a> <a href="">조회순</a>
			</div>
			<br>


			<div class="main">
				<input id="tab1" type="radio" name="tabs" checked="">
				<!--디폴트 메뉴-->
				<label for="tab1">진행중이벤트</label> <input id="tab2" type="radio"
					name="tabs"> <label for="tab2">종료된이벤트</label>

				<section id="content1">
					<%if (list == null || list.size() == 0) { %>
						<p>진행중인 이벤트가 없습니다. </p>
					<%} else { %>
					
					<div class="list-area">
					
					<%for (Event event : list){ %>
					
					<div class="thumbnail" align="center" onclick="location.href='/SemiProject/eventdetail?evNo=<%= event.getEvNo()%>'">
							<img
								src="<%= contextPath %>/resources/thumbnail_upfiles/대표이미지파일명"
								width="200" height="150">
							<p>
								<%=event.getEvDate() %> ~ <%=event.getEvFin() %><br> 
								<%=event.getEvTitle() %>
							</p>
						</div>
					<%} %>
					<%} %>
					</div>
					
				</section>

				<section id="content2">
					<%if (listFin == null || listFin.size() == 0) { %>
						<p>종료된 이벤트가 없습니다. </p>
					<%} else { %>
					
					<div class="list-area">
					
					<%for (Event event : listFin){ %>
					
					<div class="thumbnail" align="center" onclick="location.href='/SemiProject/eventdetail?evNo=<%= event.getEvNo()%>'">
							<img
								src="<%= contextPath %>/resources/thumbnail_upfiles/대표이미지파일명"
								width="200" height="150">
							<p>
								<%=event.getEvDate() %> ~ <%=event.getEvFin() %><br> 
								<%=event.getEvTitle() %>
							</p>
						</div>
					<%} %>
					<%} %>
					</div>
				</section>

			</div>
		</div>
		<%@ include file="/views/common/footer.jsp" %>
</body>
</html>