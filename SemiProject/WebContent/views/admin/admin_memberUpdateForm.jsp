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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
<%@ include file="/views/admin/admin_header.jsp" %>


	<div id="wrap">
		<div>
			<h1>회원 정보 수정 페이지</h1>
		</div>
		
		<div>
			<h2 id="store_name_h2" >회원번호 : <%=m.getUserNo()%></h2>
		</div>

		<form action="<%=contextPath%>/adminmemberupdate" id="update-form" method="post">
			<input type="hidden" name="mno" value="<%=m.getUserNo() %>">
			<div id="table_wrap_div">
				<table border="1" class="tableWrap">
					<tr>
						<th>아이디</th>
						<td colspan="3">
							<%=m.getUserId() %>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" value="<%=m.getUserName() %>" name="userName"> 
						</td>
						<th>비밀번호</th>
						<td>
							<input type="text" value="<%=m.getUserPwd() %>" name = "userPwd">
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan="3">
							<input type="text" value="<%=m.getEmail() %>" name = "userEmail"> 
						</td>
					</tr>
					
					<tr>
						<th>연락처</th>
						<td colspan="3">
							<input type="text" value="<%=m.getPhone() %>" name="userPhone"> 
						</td>
					</tr>
					
					<tr>
						<th>주소</th>
						<td colspan="3">
							<input type="text" name="userAddress" value="<%=m.getAddress() %>" style="width: 85%;" onclick="searchAddress();" required readonly>
							<a class="btn btn-secondary" onclick="searchAddress();">주소찾기</a>
						</td>
					</tr>
					<tr>
						<th>잔액</th>
						<td><input type="text" name="userPrice" value="<%=m.getBalance() %>"></td>
						<th>가입일</th>
						<td><%=m.getEnrollDate() %></td>
					</tr>
					<tr>
						<th>회원탈퇴 여부</th>
						<td><input type="text" name="userStatus" value="<%=m.getStatus() %>" required maxlength="1"></td>
						<td colspan="2" style="color: red;">대문자 N 또는 Y만 입력해주세요<br> (Y:현재회원 / N:탈퇴한 회원)</td>
					</tr>
	
				</table>
			</div>
			<div id="btn">
				<a href="<%=contextPath %>/memberDetail.bo?mno=<%=m.getUserNo() %>" class="btn btn-sm btn-secondary">뒤로가기</a>
				<button type="submit" class="btn btn-sm btn-warning btn-lg">수정하기</button>
				<button type="reset" class="btn btn-sm btn-danger btn-lg">취소하기</button>
			</div>
			
		</form>
		
		
		
		<div id="bottom_div">

		</div>
		

	</div>

<script>
		function searchAddress(){
			new daum.Postcode({
			oncomplete: function(data) {
				
				$("input[name=userAddress]").val(data.address);
			}
		}).open();
		}
</script>


</body>
</html>