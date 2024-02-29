<%@page import="com.kh.semi.store.model.vo.Store"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Store> list = (ArrayList<Store>)request.getAttribute("list");
	String keyword = (String)request.getAttribute("keyword");
	if(keyword==null){
		keyword="";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../../docs/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="../../docs/js/examples-base.js"></script>
<script type="text/javascript" src="../../docs/js/highlight.min.js"></script>
<!-- ncpClientId는 등록 환경에 따라 일반(ncpClientId), 공공(govClientId), 금융(finClientId)으로 나뉩니다. 사용하는 환경에 따라 키 이름을 변경하여 사용하세요. 참고: clientId(네이버 개발자 센터)는 지원 종료 -->
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=83bfuniegk&submodules=geocoder"></script>
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
	#searchBar input{
		font-size: 20px;
		
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
	#list_wrap{
		width: 100%;
		height: 90%;
		border: 1px solid #87CEFA;
		display: block;
		box-sizing: border-box;
		position: relative;
		
	}
	#list_wrap ul{
		width: 100%;
		height: 33.3%;
		margin: 0;
		border: 1px solid #87CEFA;
		box-sizing: border-box;
		cursor: pointer;
	}
	#list_wrap ul:hover{
		background-color: #87CEFA;
	}
	#list_wrap li{
		list-style-type: none;
	}
	.first_list{
		
		display: inline-block;
		width: 100px;
		font-size: 20px;
		font-weight: 800;
		line-height: 50px;
	}
	.sec_list{
		display: inline-block;
		
	}
	#list_btn{
		width: 100%;
		height: 10%;
	}
	#list_btn>button{
		width: 60px;
		height: 50px;
		margin: 5px 20px;
		display: block;
		float: left;
		background-color: #87CEFA;
		color: white;
		font-weight: 800;
		border: 0px;
		border-radius: 20px;
		font-size: 20px;
		box-sizing: border-box;
		margin-top: 10px;
	}
	#list_btn>button:hover{
		background-color: #4aa9e4;
	}
	#store_detail{
		border: 0;
		background-color: #87CEFA;
		border-radius: 20px;
		width: 100px;
		height: 30px;
	}
	#store_detail:hover{
		background-color: #4aa9e4;
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
			<form action="<%=contextPath %>/search.st?" align="center" value="<%=keyword%>">
				<input type="text" name="search_keyword" placeholder="검색할 지역명, 상호명을 입력해주세요">
				<input type="hidden" name="page" value="1">
				<button type="submit">검색</button>
			</form>
		</div>
		<div id="map_list_wrap">
			<div id="search_map">
				<div id="map"></div>
   				<code id="snippet" class="snippet"></code>
			</div>
			<div id="store_list">
				
				<div id="list_wrap">
					<%if(list==null){ %>
						
							<p>가게정보가 없습니다.</p>
						
					<%}else{ %>
						<%for(Store s : list){ %>
							
								<ul onclick="searchxy('<%=s.getStoreAddress()%>');">

									<li>
										<span class="first_list">상호명</span><span class="sec_list"><%=s.getStoreName() %></span><br>
									</li>
									<li>
										<span class="first_list">주소</span><span class="sec_list"><%=s.getStoreAddress() %></span><br>
									</li>
									<li>
										<span class="first_list">전화번호</span><span class="sec_list"><%=s.getStorePhone() %></span><br>
									</li>
									<li>
										<button id="store_detail" type="button" onclick="location.href='<%= contextPath %>/detail.st?storeNo=<%= s.getStoreNo() %>'">상세보기</button>
									</li>
								</ul>
							
						<%} %>
					<%} %>		
				
				</div>
				<div id="list_btn">
					<%if(pi.getCurrentPage()>1){ %>
						<%if(!keyword.equals("")){ %>
							<button type="button" onclick="location.href='<%=contextPath%>/search.st?page=<%=pi.getCurrentPage()-1%>&search_keyword=<%=keyword %>'" >이전</button>
						<%}else{ %>
							<button type="button" onclick="location.href='<%=contextPath%>/search.st?page=<%=pi.getCurrentPage()-1%>'" >이전</button>
						<%} %>
					<%} %>
					<%for(int i=pi.getStartPage();i<=pi.getEndPage();i++){ %>
						
						<button type="button" onclick="location.href=
						<%if(!keyword.equals("")){ %>
							'<%=contextPath%>/search.st?page=<%=i%>&search_keyword=<%=keyword %>'"
						<%} %>
						'<%=contextPath%>/search.st?page=<%=i%>'"
						><%=i %></button>
					<%} %>
					<%if(pi.getCurrentPage()<pi.getEndPage()){ %>
						<%if(!keyword.equals("")){ %>
							<button type="button" onclick="location.href='<%=contextPath%>/search.st?page=<%=pi.getCurrentPage()+1%>&search_keyword=<%=keyword %>'">다음</button>
						<%}else{ %>
							<button type="button" onclick="location.href='<%=contextPath%>/search.st?page=<%=pi.getCurrentPage()+1%>'">다음</button>	
						<%} %>
					<%} %>
				</div>
			
			</div>
			
	
		</div>
		
	</div>
	<script id="code">
		let map;
		map = new naver.maps.Map('map', {
			center: new naver.maps.LatLng(37.498981, 127.032915),
			zoom: 12
		});
		let allAddress = [];
		<%for(int i=0;i<list.size();i++){%>
			allAddress.push('<%=list.get(i).getStoreAddress()%>');
		<%}%>;
		
		let markers = [];
		let marke;
		for(let i=0;i<allAddress.length;i++){
			naver.maps.Service.geocode({
			query:allAddress[i]
		}, function(status, response){
			var result = response.v2,
			items = result.addresses;

			for(let i=0;i<allAddress.length;i++){
				marke = new naver.maps.Marker({
				position: new naver.maps.LatLng(items[i].y, items[i].x),
				map: map		
			});
			markers.push(marke);
			}
			
		})




		}
		
		
		
		function searchxy(address){
			naver.maps.Service.geocode({
        	query: address
    		}, function(status, response) {

			var result = response.v2, // 검색 결과의 컨테이너
				items = result.addresses; // 검색 결과의 배열
			// 성공 시의 response 처리
			// do Something
			
			var map = new naver.maps.Map('map', {
			center: new naver.maps.LatLng(items[0].y, items[0].x),
			zoom: 20
		});
			markers[markers.length+1] = new naver.maps.Marker({
    		position: new naver.maps.LatLng(items[0].y, items[0].x),
    		map: map
			
			});
			
			});		
	}
		
	

	</script>
	
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>