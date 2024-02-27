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
		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js"
  integrity="sha384-6MFdIr0zOira1CHQkedUqJVql0YtcZA1P0nbPrQYJXVJZUkTk/oX4U9GhUIs3/z8" crossorigin="anonymous"></script>
<script>
  Kakao.init('6c41921b6cc2773cc2170949e98a9b91'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<a id="kakao-login-btn" href="javascript:loginWithKakao()">
  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    alt="카카오 로그인 버튼" />
</a>
<p id="token-result"></p>
<button class="api-btn" onclick="requestUserInfo()" style="visibility:hidden">사용자 정보 가져오기</button>
<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8003/SemiProject/loginForm.me',
    });
  }
  
  function requestUserInfo() {
    Kakao.API.request({
      url: '/v2/user/me',
    })
      .then(function(res) {
        alert(JSON.stringify(res));
      })
      .catch(function(err) {
        alert(
          'failed to request user information: ' + JSON.stringify(err)
        );
      });
  }
  
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      Kakao.Auth.getStatusInfo()
        .then(function(res) {
          if (res.status === 'connected') {
            document.getElementById('token-result').innerText
              = 'login success, token: ' + Kakao.Auth.getAccessToken();
          }
        })
        .catch(function(err) {
          Kakao.Auth.setAccessToken(null);
        });
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script>
	<button onclick="location.href = '<%=contextPath%>/enrollForm.me'">회원가입</button>
					<button onclick="location.href = '<%=contextPath%>/searchId.me'">ID찾기</button>
					<button onclick="location.href = '<%=contextPath%>/searchPwd.me'">PWD찾기</button>
	</div>

	

	<%@include file="../common/footer.jsp"%>
</body>
</html>