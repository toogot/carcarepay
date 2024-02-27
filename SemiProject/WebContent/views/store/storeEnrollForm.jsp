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
	#searchAdd{
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
		
		<form action="<%=contextPath %>/enroll.st" method="post" enctype="multipart/form-data">
			<input type="hidden" value="<%=loginUser.getUserNo()%>" name="userNo">
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
					<td><input type="text" name="storeAddress" onclick="searchAddress();" required><button id="searchAdd" type="button" onclick="searchAddress();">주소검색</button></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="storePhone" required></td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td><input type="text" name="storeTime" required></td>
				</tr>
				<tr>
					<th>사업자번호</th>
					<td><input type="text" name="businessNo" required></td>
				</tr>
				<tr>
					<th>가격정보</th>
					<td><textarea name="storePrice" cols="50" rows="10" style="resize: none;" required></textarea></td>
				</tr>
				<tr>
					<th>사진등록</th>
					<td>
						<label for="storeImg0" style="background-color: rgb(168, 165, 165); width: 180px; height: 25px; display: block; text-align: center; border-radius: 5px; line-height: 25px; cursor: pointer;">내 PC에서 가져오기</label>
						<input type="file" id="storeImg0" name="storeImg0" style="display: none;" onchange="imgUpload(this);">
						<input type="file" id="storeImg1" name="storeImg1" style="display: none;" onchange="imgUpload(this);">
						<input type="file" id="storeImg2" name="storeImg2" style="display: none;" onchange="imgUpload(this);">
						<input type="file" id="storeImg3" name="storeImg3" style="display: none;" onchange="imgUpload(this);">
						<input type="file" id="storeImg4" name="storeImg4" style="display: none;" onchange="imgUpload(this);">
						<input type="file" id="storeImg5" name="storeImg5" style="display: none;" onchange="imgUpload(this);">
						<input type="file" id="storeImg6" name="storeImg6" style="display: none;" onchange="imgUpload(this);">
						<input type="file" id="storeImg7" name="storeImg7" style="display: none;" onchange="imgUpload(this);">
						<input type="file" id="storeImg8" name="storeImg8" style="display: none;" onchange="imgUpload(this);">
						<input type="file" id="storeImg9" name="storeImg9" style="display: none;" onchange="imgUpload(this);">
						<input type="file" id="storeImg10" name="storeImg10" style="display: none;" onchange="imgUpload(this);">
						<input type="file" id="storeImg11" name="storeImg11" style="display: none;" onchange="imgUpload(this);">
					
					
					</td>
				</tr>
				<tr>
					
					<td colspan="2">
						<div style="width: 500px; height: 150px; background-color: white; margin: auto; overflow: scroll;" id="imgUpload">
							
						</div>
					</td>
				</tr>
			</table>
			<div id="btn-wrap">
				<button type="submit">신청하기</button>
				<button type="reset" onclick="allexit();">취소하기</button>
			</div>			
		</form>
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
	
	<%}else{%>
		<script>
			alert("로그인이 필요한 서비스 입니다.");
			location.href = "<%=contextPath%>/loginForm.me"
		</script>
	<%} %>

		<script>
			let img= []
			let count=1;
			let input = [];
			function imgUpload(inputFile){			
				if(inputFile.files.length >= 1){
					let file = new FileReader();

				file.readAsDataURL(inputFile.files[0])

				file.onload=function(e){
					$("#storeImg").attr("name","storeImg"+(count++))
					input.push($("#storeImg"));
					console.log(input);
					img.push("<img name='storeImg0' src="+e.target.result+" style='width:25px; height:25px;'>"
					   					 +"<span>"+inputFile.files[0].name+"</span><br><hr>")
					
					$('#imgUpload').html(img);
					
					
				}
				
				}
				
				
			}


			function allexit(){
				$('#imgUpload').html('');
				img = [];
				$("#storeImg").attr("name","storeImg0");
				count = 1;
			}
		</script>


	<%@include file="../common/footer.jsp" %>
	
</body>
</html>