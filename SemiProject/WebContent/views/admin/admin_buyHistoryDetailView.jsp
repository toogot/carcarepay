<%@page import="com.kh.semi.order.model.vo.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Order o = (Order)request.getAttribute("o");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<style>
	span{
		border-bottom: 1px solid #ffffff;
	}
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
	.tableWrap *{
		padding: 20px	
	}
	.tableWrap *{
		border-bottom :  1px solid #eaecf1;
	}
	#store_name_h2{
		text-align: center;
		font-size: 30px;
		color: rgb(54, 54, 54);
		border-top: 0px;
		padding-top: 50px;
		padding-bottom: 10px;
	}
	table{
		width: 800px;
	}
	#bottom_div{height: 100px;}

	#userinfo,#orderinfo{
		font-weight: bold;
		font-size: 18px;
		color: rgb(54, 54, 54);
	}
	.tabletitle td{
		padding-bottom: 15px;
		padding-top: 30px;
	}
	th{
		background-color: #fbfbfb;
	}
	.price{
		color: rgb(54, 54, 54);
		font-weight: bold;
	}
	#name{
		cursor: pointer;
	}
	#name:hover{
		color: black;
	}

	
</style>
</head>
<body>

	<%@ include file="/views/admin/admin_header.jsp" %>

	<div id="wrap">
		<div>
			<h1>결제 상세 내역 조회 페이지</h1>
		</div>

		<div>
			<h2 id="store_name_h2" >결제번호 : <%=o.getPayNoK()%></h2>
		</div>

		<div id="table_wrap_div">
			<div>
				<table class="tabletitle">
					<tr>
						<td><span id="userinfo">고객정보</span></td>
					</tr>
				</table>
				<table class="tableWrap">
					<tr>
						<th>이름</th>
						<td colspan="1" id="name" onclick="location.href='<%=contextPath%>/memberDetail.bo?mno=<%=o.getUserNo() %>'"><%=o.getUserName() %></td>
						<th>전화번호</th>
						<td><%= o.getPhone()%></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan="3"><%=o.getEmail() %></td>
					</tr>
				</table>
			</div>
			<div>
				
					<table class="tabletitle">
						<tr>
							<td><span id="orderinfo">결제정보</span></td>
						</tr>
					</table>
					<table class="tableWrap">
					<tr>
						<th>결제수단</th>
						<td colspan="3"><%=o.getPayCompanyK() %></td>
					</tr>
					<tr>
						<th>결제일시</th>
						<td colspan="3"><%=o.getPayDateK() %></td>
					</tr>
					<tr>
						<th>선물여부</th>
						<td><%=o.getGiftNy()%></td>
						<th>선물받은회원</th>
						<td></td>
					</tr>
					<tr>
						<th>선택한금액</th>
						<td ><span class="price"><%=o.getPrice()%></span> 원</td>
						<th>갯수</th>
						<td ><span class="price"><%=o.getQty() %></span>개</td>
					</tr>
					<tr>
						<th >실제 결제금액</th>
						<td colspan="3" ><span class="price"><%=o.getTotalPrice() %></span> 원</td>
						
					</tr>
				</table>
			</div>
		</div>
		<div id="btn">
			<a href="<%=contextPath %>/buyhistory?opage=1" class="btn btn-sm btn-secondary">목록가기</a>
		</div>
		<div id="bottom_div">

		</div>
		

	</div>
	

<script>

</script>

	


</body>
</html>