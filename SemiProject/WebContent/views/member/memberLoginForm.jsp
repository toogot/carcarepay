<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	border: 1px solid red;
}

.login-wrap {
	width: 1800px;
	height: 1000px;
	margin: auto;
}

.login-wrap>form {
	width: 1000px;
	height: 700px;
	margin: auto;
	margin-top: 150px;
	border: 1px solid red;
}

.logout-wrap {
	width: 1800px;
	height: 1000px;
	margin: auto;
}

.logout-wrap>form {
	width: 1000px;
	height: 700px;
	margin: auto;
	margin-top: 150px;
	border: 1px solid red;
}
</style>
</head>
<body>
	<%@include file="../common/head.jsp"%>

	<div class="login-wrap">
		<form action="<%=contextPath%>/login.me" method="post">
			<div>
				<table>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="userId"></td>
						<td rowspan="2">
							<button type="submit">로그인</button>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="userPwd"></td>
					</tr>
				</table>
				<div>
					
				</div>
			</div>
		</form>
		
	<button onclick="location.href = '<%=contextPath%>/enrollForm.me'">회원가입</button>
					<button onclick="location.href = '<%=contextPath%>/searchId.me'">ID찾기</button>
					<button onclick="location.href = '<%=contextPath%>/searchPwd.me'">PWD찾기</button>
	</div>

	<script>
		
	</script>

	<%@include file="../common/footer.jsp"%>
</body>
</html>