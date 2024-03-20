<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script
      type="text/javascript"
      src="https://developers.kakao.com/sdk/js/kakao.js"
    ></script>
    <script
      type="text/javascript"
      src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
      charset="utf-8"
    ></script>
    <script
      type="text/javascript"
      src="http://code.jquery.com/jquery-1.11.3.min.js"
    ></script>
    <script
      src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
      charset="utf-8"
    ></script>

    <style>
      /* div {
	border: 1px solid red;
} */

      .login-wrap {
        width: 1800px;
        height: 1000px;
        margin: auto;
      }
      #loginForm {
        width: 1200px;
        height: 800px;
        margin: auto;
        margin-top: 80px;
        border-radius: 50px;
        background-color: #87cefa;
      }
      #board {
        width: 800px;
        height: 800px;
        margin: auto;
        margin-top: 100px;
        border-left: 1px solid rgb(135, 135, 236);
        border-right: 1px solid rgb(135, 135, 236);
      }
      #input-wrap {
        width: 500px;
        height: 400px;
        margin: auto;
      }
      #input-wrap th {
        font-size: 30px;
        text-align: center;
      }
      #input-wrap input {
        width: 250px;
        height: 30px;
        margin: 0px 10px;
      }
      #input-wrap h1 {
        margin: 0px;
        line-height: 300px;
        color: white;
        font-size: 100px;
      }
      #input-wrap tbody {
        display: inline-block;
        margin-left: 20px;
      }
      #input-wrap button {
        width: 60px;
        height: 78px;
        text-align: center;
        padding: 0px;
      }

      #loginForm a {
        display: block;
        cursor: pointer;
        margin-left: 300px;
        margin-top: 20px;
      }
      #loginForm-btn {
        width: 300px;
        margin: auto;
        margin-top: 50px;
      }
    </style>
  </head>
  <body>
    <%@include file="../common/head.jsp"%>

    <div class="login-wrap">
      <div id="loginForm">
        <div id="board">
          <div id="input-wrap" class="form-group">
            <form action="<%=contextPath%>/login.me" method="post">
              <table>
                <tbody>
                  <h1 align="center">LOGIN</h1>
                  <tr>
                    <th>아이디</th>
                    <td>
                      <input
                        type="text"
                        name="userId"
                        class="form-control"
                        required
                      />
                    </td>
                    <td rowspan="2">
                      <button type="submit" class="btn btn-primary">
                        Login
                      </button>
                    </td>
                  </tr>

                  <tr>
                    <th>비밀번호</th>
                    <td>
                      <input
                        type="password"
                        name="userPwd"
                        class="form-control"
                        required
                      />
                    </td>
                  </tr>
                </tbody>
              </table>
            </form>
          </div>
          <div>
            <a id="kakao-login-btn" onclick="kakaoLogin();">
              <img
                src="resources/images/kakao_login_medium_narrow.png"
                alt="카카오 로그인 버튼"
              />
            </a>

            <div id="naver_id_login"></div>

            <div id="loginForm-btn">
              <button
                class="btn btn-primary"
                onclick="location.href = '<%=contextPath%>/enrollForm.me'"
              >
                회원가입
              </button>
              <button
                class="btn btn-primary"
                onclick="location.href = '<%=contextPath%>/searchId.me'"
              >
                ID찾기
              </button>
              <button
                class="btn btn-primary"
                onclick="location.href = '<%=contextPath%>/searchPwd.me'"
              >
                PWD찾기
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript">
      Kakao.init("6c41921b6cc2773cc2170949e98a9b91");
      function kakaoLogin() {
        Kakao.Auth.login({
          success: function (response1) {
            Kakao.API.request({
              url: "/v2/user/me",

              success: function (response) {
                alert(JSON.stringify(response));
                $.ajax({
                  url: "<%=contextPath %>/kakaoLogin.me",
                  data: {
                    id: response.id,
                    nickname: response.properties.nickname,
                    email: response.kakao_account.email,
                  },
                  success: function () {
                    location.href = "<%=contextPath %>";
                  },
                });
              },
              fail: function (error) {
                alert(JSON.stringify(error));
              },
            });
          },
          fail: function (error) {
            alert(JSON.stringify(error));
          },
        });
      }
    </script>

    <div id="naver_id_login"></div>
    <script
      type="text/javascript"
      src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
      charset="utf-8"
    ></script>

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
      var naver_id_login = new naver_id_login(
        "tP6NMedSre8QzRI5CFDK",
        "http://localhost:8003/SemiProject/naverLogin.me"
      );
      // 접근 토큰 값 출력
      alert(naver_id_login.oauthParams.access_token);
      // 네이버 사용자 프로필 조회
      naver_id_login.get_naver_userprofile("naverSignInCallback()");
      // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
      function naverSignInCallback() {
        alert(naver_id_login.getProfileData("email"));
        alert(naver_id_login.getProfileData("nickname"));
      }
    </script>

    <%@include file="../common/footer.jsp"%>
  </body>
</html>
