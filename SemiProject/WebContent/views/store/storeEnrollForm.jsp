<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1{
		color: white;
		
	}
	.enroll-wrap{
		background-color: #87CEFA;
		width: 1000px;
		height: 1200px;
		margin: auto;
		margin-top: 20px;
	}
	.enroll-wrap table{
		border: 1px solid rgba(13, 203, 236, 0.959);
		width: 700px;
		height: 800px;
		
	}
	.enroll-wrap th{
		font-size: 20px;
		color: white;
	}
	.enroll-wrap input{
		width: 300px;
		height: 30px;
	}
	.enroll-wrap select{
		width: 100px;
		height: 30px;
		font-size: 15px;
	}
	.enroll-wrap button{
		height: 40px;
		margin-left: 10px;
		border: 0;
		background-color: rgb(23, 20, 226);
		border-radius: 10px;
		color: white;
	}
	#btn-wrap{
		margin: auto;
		width: 300px;
		margin-top: 50px;
	}
	#btn-wrap>button{
		width: 100px;
		height: 50px;
		background-color: rgb(110, 228, 14);
		font-size: 20px;
		font-weight: 800;
	}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	
	<%@include file="../common/head.jsp" %>
	<% if(loginUser != null){%>
	<div class="enroll-wrap">
		
		<form action="<%=contextPath %>/enroll.st" method="post">
			<br><br><br>
			<h1 align="center">입접신청</h1>
			<br><br>
			<table align="center">
				<tr>
					<th>상호명</th>
					<td><input type="text" name="storeName"></td>
				</tr>
				<tr>
					<th>가게유형</th>
					<td>
						<select name="storeType" id="storeType">
							<option value="S1">기계세차</option>
							<option value="S2">손세차</option>
							<option value="S3">셀프세차</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="storeAddress" onclick="searchAddress();"><button type="button" onclick="searchAddress();">주소검색</button></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="storePhone"></td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td><input type="text" name="storeTime"></td>
				</tr>
				<tr>
					<th>사업자번호</th>
					<td><input type="text" name="businessNo"></td>
				</tr>
				<tr>
					<th>가격정보</th>
					<td><textarea name="storePrice" cols="50" rows="10" style="resize: none;"></textarea></td>
				</tr>
			</table>
			<div id="btn-wrap">
				<button type="submit">신청하기</button>
				<button type="reset">취소하기</button>
			</div>			
		</form>
	</div>
	<script>
		function searchAddress(){
			new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.\
				$("input[name=storeAddress]").val(data.address);
			}
		}).open();
		}
		
	</script>
	
	<%}else{%>
		<script>
			location.href = "<%=contextPath%>/loginForm.me"
		</script>
	<%} %>
	<%@include file="../common/footer.jsp" %>
	
</body>
</html>