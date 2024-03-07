<%@page import="com.kh.semi.store.model.vo.Store"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Store st = (Store)request.getAttribute("st");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/views/admin/admin_header.jsp" %>
	
	<h1><%=st.getBusinessNo() %></h1>
	<%=st.getStoreName() %>


</body>
</html>