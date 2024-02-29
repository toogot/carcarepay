<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>

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
			<a id="kakao-login-btn" onclick="kakaoLogin();">
				<img src="resources/images/kakao_login_medium_narrow.png" alt="카카오 로그인 버튼" />
		  	</a>
	
		<script type="text/javascript">
		    Kakao.init('6c41921b6cc2773cc2170949e98a9b91');
		    function kakaoLogin() {
		        Kakao.Auth.login({
		            success: function (response1) {
		                Kakao.API.request({
		                    url: '/v2/user/me',
							
		                    success: function (response) {
								
		                        alert(JSON.stringify(response));
								$.ajax({
									url:'<%= contextPath%>/kakaoLogin.me',
									data:{
										id:response.id,
										nickname:response.properties.nickname,
										email:response.kakao_account.email
									}
								})
								
								

		                    },
		                    fail: function (error) {
		                        alert(JSON.stringify(error))
		                    },
		                })
		            },
		            fail: function (error) {
		                alert(JSON.stringify(error))
		            },
		        })
		    }
		</script>
		 
		
	<button onclick="location.href = '<%=contextPath%>/enrollForm.me'">회원가입</button>
					<button onclick="location.href = '<%=contextPath%>/searchId.me'">ID찾기</button>
					<button onclick="location.href = '<%=contextPath%>/searchPwd.me'">PWD찾기</button>
	</div>

	

	<%@include file="../common/footer.jsp"%>
</body>
</html>