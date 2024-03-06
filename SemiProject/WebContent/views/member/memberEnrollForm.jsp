<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

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
</head>
<body>
	
	<%@include file="../common/head.jsp" %>
	
	<div class="enroll-wrap">
		


  



		<form id="enroll-form" action="<%=contextPath %>/insert.me" method="post">
			
			<br><br><br>
			<h1 align="center">회원가입</h1>
			<br><br>
			<table align="center">
				
				<tr>
					<th>이름</th>
					<td><input type="text" name="userName" id="userName" onkeyup="nkd();" required>
						<div id="nkd"></div>
					</td>
					
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="userId" id="userId"  placeholder="5~11글자 영어,숫자" onkeyup="ikd();" required>
						<button type="button" onclick="idCheck();">중복확인</button>
						<div id="ikd"></div>
					</td>

				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="userPwd" id="userPwd" placeholder="8~15글자 영어,숫자,특수문자 포함" onkeyup="pkd();" required>
						<div id="pkd"></div>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="userPwd2" id="userPwd2" onkeyup="rpkd();" required>
						<div id="rpkd"></div>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email" id="email" required onkeyup="epkd();">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" required><button type="button" onclick="searchAddress();">주소검색</button></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone" id="phone" placeholder="010-xxxx-xxxx" required></td>
				</tr>
				<tr>
					
				
			</table>
			
			<div id="btn-wrap">
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
										url:'<%= contextPath%>/kakaoInsert.me',
										data:{
											id:response.id,
											nickname:response.properties.nickname,
											email:response.kakao_account.email
		
										},
										success:function(){
											location.href = '<%=contextPath %>/loginForm.me';
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
			<!-- //네이버 로그인 버튼 노출 영역 -->
			<script type="text/javascript">
				var naver_id_login = new naver_id_login("tP6NMedSre8QzRI5CFDK", "/member/naverCallBack.jsp");
				var state = naver_id_login.getUniqState();
				naver_id_login.setButton("white", 2,40);
				naver_id_login.setDomain("http://localhost:8003");
				naver_id_login.setState(state);
				naver_id_login.setPopup();
				naver_id_login.init_naver_id_login();
			</script>
			<script type="text/javascript">
				var naver_id_login = new naver_id_login("tP6NMedSre8QzRI5CFDK", "http://localhost:8003/SemiProject/naverInsert.me");
				// 접근 토큰 값 출력
				alert(naver_id_login.oauthParams.access_token);
				// 네이버 사용자 프로필 조회
				naver_id_login.get_naver_userprofile("naverSignInCallback()");
				// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
				function naverSignInCallback() {
				  alert(naver_id_login.getProfileData('email'));
				  alert(naver_id_login.getProfileData('nickname'));
					console.log(naver_id_login.getProfiledata);
				 
				}
			  </script>
			<br>
				<button type="submit"  onclick="location.href='<%=contextPath%>/login.me'">회원가입</button>
				<button type="reset">초기화</button>
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
		function nkd(){
			let regExp = /^[가-힣]{2,}$/i;
        if(!regExp.test($("#userName").val())){
            $("#nkd").text("한글 2글자 이상 입력해주세요.").css("color","red");          
        }else{
			$("#nkd").text("이름 확인완료."); 
		}
		}
		function ikd(){
			regExp = /^[a-z][a-z\d]{5,11}$/;
        if(!regExp.test($("#userId").val())){
            $("#ikd").text("영문,숫자 5글자 이상 11글자 이하 입력해주세요")           
        }else{
		}
		}
		function pkd(){
			regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
        if(!regExp.test($("#userPwd").val())){
            $("#pkd").text("영문,숫자,특수기호 포함 8~15글자 입력해주세요")
           
        }else{
			$("#pkd").text("굿")
		}
		}
		function rpkd(){
			if($("#userPwd").val() != $("#userPwd2").val()){
				$("#rpkd").text("위 비밀번호와 일치하게 입력해주세요.")
			}else{
				$("#rpkd").text("굿")
			}
		}
		function epkd(){
			regExp = /^\d{3}-\d{4}-\d{4}$/;
			if(!regExp.test($("email").val())){
				
			}
		}
		
		
	function idCheck(){
			// 중복확인 버튼 클릭시 사용자가 입력한 아이디값을 넘겨서 조회요청(존재하는지 안하는지) => 응답데이터 돌려받기
			// 1) 사용불가능일 경우 => alert로 메세지출력, 다시 입력할 수 있도록 유도
			// 2) 사용 가능일 경우 => 진짜 사용할건지 의사를 물어볼꺼임
			//					> 사용하겠다는 경우 => 더이상 아이디 수정못하게끔, 회원가입버튼 활성화
			//					> 사용안하겠다는 경우 => 다시 입력할 수 있도록 유도
			
			//아이디 입력하는 input 요소 객체
			const $idInput = $("#enroll-form input[name=userId]")
			
			$.ajax({
				url:"idCheck.me",
				data:{checkId:$idInput.val()},
			success:function(result){
				console.log(result);
				
				if(result == "NNNNN"){
					alert("존재하는 아이디입니다");
					$idInput.focus();
				}else{
					if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
						$("#enroll-form :submit").removeAttr("disabled");
						$idInput.attr("readonly",true);
						
					}else{
						$idInput.focus();
					}
						
					}
					
				
				
				
			},
			error:function(){
				console.log("아이디 중복체크용 ajax 통신 실패")
			}
			});
		}
		
		

	</script>
	
	
	<%@include file="../common/footer.jsp" %>
	
</body>
</html>