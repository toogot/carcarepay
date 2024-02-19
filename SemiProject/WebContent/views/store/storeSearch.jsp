<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="../../docs/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../../docs/js/examples-base.js"></script>
    <script type="text/javascript" src="../../docs/js/highlight.min.js"></script>
    <!-- ncpClientId는 등록 환경에 따라 일반(ncpClientId), 공공(govClientId), 금융(finClientId)으로 나뉩니다. 사용하는 환경에 따라 키 이름을 변경하여 사용하세요. 참고: clientId(네이버 개발자 센터)는 지원 종료 -->
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=83bfuniegk"></script>
    <link rel="stylesheet" type="text/css" href="../../docs/css/examples-base.css" />
<style>
	div{
		/* border: 1px solid red; */
		box-sizing: border-box;
	}
	.search_wrap{
		width: 1900px;
		height: 1000px;
	}
	#searchBar{	
		width: 100%;
		height: 30%;
	}
	#map_list_wrap{
		width: 100%;
		height: 70%;
	}
	#search_map{
		width: 60%;
		height: 100%;
		float: left;
		border: 1px solid #87CEFA;
	}
	#store_list{
		width: 40%;
		height: 100%;
		float: left;
		border: 1px solid #87CEFA;
	}
	#searchBar>form{
		line-height: 300px;
	}
	#searchBar input{
		width: 500px;
		height: 50px;
		border-radius: 10px;
		border: 1px solid lightblue;
	}
	#searchBar button{
		width: 70px;
		height: 50px;
		background-color: #87CEFA;
		border: 1px solid #4aa9e4;
		border-radius: 10px;
	}
	#search_map>*{
		margin: 50px 150px;
	}
	#list1,#list2,#list3{
		width: 100%;
		height: 28%;
	}
	#list_btn{
		width: 100%;
		height: 10%;
	}
	#store_list ul{
		width: 100%;
		height: 100%;
		display: block;
		box-sizing: border-box;
	}
	#store_list li{
		width: 100%;
		height: 30%;
		list-style-type: none;
		display: block;
		box-sizing: border-box;
		line-height: 50px;
	}
	#list_btn>button{
		width: 60px;
		height: 30px;
		margin: 0px 100px;
	}
	#map{
		width: 90%;
		height: 90%;
		margin: auto;
		margin-top: 40px;
		border: 5px solid #87CEFA;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/head.jsp" %>

	<div class="search_wrap">
		<div id="searchBar">
			<form action="#" align="center">
				<input type="text" name="search_keyword">
				<button type="submit">검색</button>
			</form>
		</div>
		<div id="map_list_wrap">
			<div id="search_map">
				<div id="map"></div>
   				<code id="snippet" class="snippet"></code>
			</div>
			<div id="store_list">
				<div id="list1">
					<ul>
						<li>가게이름</li>
						<li>가게주소</li>
						<li>가게전화번호</li>
					</ul>
				</div>
				<div id="list2">
					<ul>
						<li>가게이름</li>
						<li>가게주소</li>
						<li>가게전화번호</li>
					</ul>
				</div>
				<div id="list3">
					<ul>
						<li>가게이름</li>
						<li>가게주소</li>
						<li>가게전화번호</li>
					</ul>
				</div>
				<div id="list_btn">
					<button type="button">이전</button>
					<button type="button">다음</button>
				</div>
			</div>
		</div>
		
	</div>
	<script id="code">
		var map = new naver.maps.Map('map', {
			center: new naver.maps.LatLng(37.3595704, 127.105399),
			zoom: 15
		});
	</script>
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>