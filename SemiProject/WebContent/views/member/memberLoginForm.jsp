<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>


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
									url:'<%=contextPath %>/kakaoLogin.me',
									data:{
										id:response.id,
										nickname:response.properties.nickname,
										email:response.kakao_account.email
									},
									success:function(){
										location.href = '<%=contextPath %>';
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

<div id="naver_id_login"></div>
<script type="text/javascript"
		src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
		charset="utf-8"></script>

<script type="text/javascript">
		var clientId = "tP6NMedSre8QzRI5CFDK";
		var callbackUrl = "http://localhost:8003/SemiProject/naverLogin.me";
		var naver_id_login = new naver_id_login(clientId, callbackUrl);
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 3, 40);
		naver_id_login.setDomain("http://localhost:8003/SemiProject");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();

</script>

<script type="text/javascript">
	var naver_id_login = new naver_id_login("tP6NMedSre8QzRI5CFDK", "http://localhost:8003/SemiProject/naverLogin.me");
	// 접근 토큰 값 출력
	alert(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
	  alert(naver_id_login.getProfileData('email'));
	  alert(naver_id_login.getProfileData('nickname'));
	  
	}
  </script>
  
  


	<button onclick="location.href = '<%=contextPath%>/enrollForm.me'">회원가입</button>
					<button onclick="location.href = '<%=contextPath%>/searchId.me'">ID찾기</button>
					<button onclick="location.href = '<%=contextPath%>/searchPwd.me'">PWD찾기</button>
	</div>

	

	<%@include file="../common/footer.jsp"%>
</body>
</html>