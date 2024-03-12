<%@page import="com.kh.semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)request.getAttribute("m");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		/* border: 1px solid red; */
	}
	h1{
		padding: 50px;
		border-bottom: 2px solid #e3e6f0;
	}
	th{
		text-align: center !important;
	}
	table{
		margin: auto;
	}
	#wrap{
		width: 1300px;
		height: auto;
	}
	#btn{
		text-align: center;
		padding-top: 50px;
	}
	table *{
		padding: 20px	
	}
	.tableWrap{
		border : 1px solid #e3e6f0;
	}
	table{
		width: 800px;
	}
	#bottom_div{height: 100px;}
	#store_name_h2{
	text-align: center;
	font-size: 30px;
	color: rgb(54, 54, 54);
	border-top: 0px;
	padding-top: 50px;
	padding-bottom: 10px;
	}
</style>
</head>
<body>
<%@ include file="/views/admin/admin_header.jsp" %>


	<div id="wrap">
		<div>
			<h1>회원 상세 조회 페이지</h1>
		</div>
		
		<div>
			<h2 id="store_name_h2" >회원번호 : <%=m.getUserNo()%></h2>
		</div>


		<div id="table_wrap_div">
			<table border="1" class="tableWrap">
				<tr>
					<th>아이디</th>
					<td colspan="3"><%=m.getUserId() %></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=m.getUserName() %></td>
					<th>사업자번호</th>
					<td><%=m.getAddress() %></td>
				</tr>
				<tr>
					<th>매장번호</th>
					<td colspan="3"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3"></td>
				</tr>
				<tr>
					<th>세차장유형</th>
					<td></td>
					<th>영업시간</th>
					<td></td>
				</tr>
				<tr>
					<th>매장상태</th>
					<td></td>
					<td colspan="2" style="color: red;">대문자 N 또는 Y만 입력해주세요<br> (N:영업중 / Y:매장삭제)</td>
				</tr>
				<tr>
					<th>가격</th>
					<td colspan="3"></td>
				</tr>

			</table>
		</div>
		<div id="btn">
			<a href="<%=contextPath %>/memberlist.bo?mpage=1" class="btn btn-sm btn-secondary">목록가기</a>
			<a href="<%=contextPath %>/memberupdateform?sno=<%= m.getUserNo() %>" class="btn btn-sm btn-warning">수정하기</a>
			<!-- <a href="" class="btn btn-sm btn-danger" onclick="reallydelete()">삭제하기</a> -->
		</div>
		<div id="bottom_div">

		</div>
		

	</div>




</body>
</html>