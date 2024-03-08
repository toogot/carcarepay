<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드신청</title>
<style>
	#applicationForm-wrap{
		width: 1000px;
		height: 800px;
		margin: auto;
		margin-top: 50px;
		margin-bottom: 50px;
		border-radius: 30px;
		background-color: #87CEFA;
	}
	#applicationForm-wrap>h1{
		line-height: 150px;
	}
	#table-form{
		width: 500px;
		height: 500px;
		margin: auto;
	}
	#table-form>table{
		width: 100%;
		height: 70%;
		margin-top: 50px;
	}
	#table-form th, #table-form td{
		font-size: 20px;
	}
	#footer-btn-wrap{
		width: 50%;
		height: 30%;
		margin: auto;
	}
	#footer-btn-wrap>button{
		margin-left: 50px;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/head.jsp" %>
		<div id="applicationForm-wrap">
			<h1 align="center">카드신청</h1>
			<form action="<%=contextPath%>/successApp">
				<div id="table-form">
					<table>
						<tr>
							<th>신청자</th>
							<td><input type="text" name="userName" value="<%=loginUser.getUserName() %>" readonly> </td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" name="userAddress" value="<%=loginUser.getAddress() %>" readonly></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="userPhone" value="<%=loginUser.getPhone() %>" readonly></td>
						</tr>
						
					</table>
				</div>
				<div id="footer-btn-wrap">
					<p>배송지 오류시 배송이 되지 않을 수 있습니다. 다시한번 확인해주세요</p>
				
					<button id="newAdd" type="button" class="btn btn-primary" onclick="newAddress();">다른배송지</button>
					<button type="submit" class="btn btn-primary">신청하기</button>
					<button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>'">취소하기</button>
				</div>
			</form>
		</div>

		<script>
			function newAddress(){
				

				if($("#newAdd").html()=="기본배송지"){
					$("input[name=userName]").val("<%=loginUser.getUserName() %>");
					$("input[name=userAddress]").val("<%=loginUser.getAddress() %>");
					$("input[name=userPhone]").val("<%=loginUser.getPhone() %>");
					$("#table-form input").attr("readonly",true);
					$("#newAdd").html("다른배송지");
				}else{
					$("#table-form input").attr("readonly",false);
					$("#newAdd").html("기본배송지");
				}
			}

		</script>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>