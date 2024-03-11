<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.store.model.vo.Store"%>
<%@page import= "com.kh.semi.admin.model.vo.Category" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Store st = (Store)request.getAttribute("st");
	ArrayList<Category> ct = (ArrayList<Category>)request.getAttribute("ct");
	
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
	input[type=text]{
		height: 1px;
	}
	#storePrice{
		resize: none !important;
	}
	#bottom_div{height: 100px;}
</style>
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
	<%@ include file="/views/admin/admin_header.jsp" %>



	<div id="wrap">
		<div>
			<h1>매장 내용 수정 페이지</h1>
		</div>

		<div>
			<h2 id="store_name_h2" ><%=st.getStoreName()%></h2>
		</div>
		<form action="<%=contextPath %>/storeupdate.so" id="update-form" method="post">
			<input type="hidden" name="sno" value="<%=st.getStoreNo() %>">
			
			<div id="table_wrap_div">
				<table border="1" class="tableWrap">
					<tr>
						<th>매장이름</th>
						<td colspan="3"><input type="text" name="storeName" value="<%=st.getStoreName()%>" required></td>
					</tr>
					<tr>
						<th>대표이름</th>
						<td><input type="text" name="storeAdminName"></td>
						<th>사업자번호</th>
						<td><input type="text" name="storeBusinessNo" value="<%=st.getBusinessNo()%>" required></td>
					</tr>
					<tr>
						<th>매장번호</th>
						<td colspan="3"><input type="text" name="storePhone" value="<%=st.getStorePhone()%>" style="width: 100%;" placeholder="000-0000-0000 " required></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">
							<input type="text" name="storeAddress" value="<%=st.getStoreAddress() %>" style="width: 85%;" onclick="searchAddress();" required readonly>
							<a class="btn btn-secondary" onclick="searchAddress();">주소찾기</a>
						</td>
					</tr>
					<tr>
						<th>세차장유형</th>
						<td>
							<select name="storeType" id="storeType">
								<!-- category 테이블로부터 조회할꺼임 -->
								<% for(Category c : ct) {%>
									<option value="<%=c.getStoreType()%>"><%=c.getTypeName() %></option>
								<% } %>				
							</select>
							<script>
								$(function(){
									$("#storeType>option").each(function(){
										if($(this).text()== "<%=st.getStoreType()%>") {
											$(this).attr("selected",true);
										}
									})
								})
							</script>
						</td>
						<th>영업시간</th>
						<td><input type="text" name="storeTime" value="<%=st.getStoreTime() %>" required></td>
					</tr>
					<tr>
						<th>매장상태</th>
						<td><input type="text" name="storeStatus" value="<%=st.getStoreStatus() %>" required maxlength="1"></td>
						<td colspan="2" style="color: red;">대문자 N 또는 Y만 입력해주세요<br> (N:영업중 / Y:매장삭제)</td>
					</tr>
					<tr>
						<th>가격</th>
						<td colspan="3">
							<textarea cols="60" rows="10" name="storePrice" id="storePrice" required><%=st.getStorePrice()%></textarea>
						</td>
					</tr>
					<tr>
						<th>사진</th>
						<td colspan="3">
							
						</td>
					</tr>

				</table>
			</div>
		
			<div id="btn">
				<a href="<%=contextPath %>/storeList?cpage=1" class="btn btn-sm btn-lg btn-secondary">목록가기</a>
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
				
				$("input[name=storeAddress]").val(data.address);
			}
		}).open();
		}
</script>

	


</body>
</html>