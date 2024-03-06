<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.semi.event.model.vo.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.common.model.vo.PageInfo"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Event> list = (ArrayList<Event>) request.getAttribute("list");
	
	PageInfo piFin = (PageInfo) request.getAttribute("piFin");
	ArrayList<Event> listFin = (ArrayList<Event>) request.getAttribute("listFin");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
<style>

@font-face {
	font-family: 'KCC-Ganpan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

body * {
	font-family: 'KCC-Ganpan';
}
.event_wrap{
		width: 1900px;
		height: 1000px;
	}




#imgbanner {
	width: 100%;
	height: 500px;
	position: relative;
	margin-top: 10px;
}

#imgarea {
	width: 100%;
	height: 100%;
}

#imgarea>img {
	width: 100%;
	height: 100%;;
	display: none;
}

#img_before, #img_after {
	width: 100px;
	height: 100px;
	background-color: transparent;
	border: 0px;
	position: absolute;
	margin-top: 200px;
	font-size: 50px;
	font-weight: 900;
	color: transparent;
}

#img_before {
	left: 0;
}

#img_after {
	right: 0;
}

.list-area {
	width: 1000px;
	margin: auto;
	margin-left: 12px;
	
}

.thumbnail {
	border: 1px solid white;
	width: 220px;
	display: inline-block;
	margin: 14px;
	cursor: pointer !important;
}

.btn {
	margin-left: 150px;
}


p {
	margin: 0 0 20px;
	line-height: 1.5;
}

.main {
	min-width: 50%;
	max-width: 53%;
	padding: 50px;
	margin: 0 auto;
}

section {
	display: none;
	padding: 20px 0 0;
	border-top: 1px solid #ddd;
}

input {
	display: none;
}

label {
	display: inline-block;
	margin: 0 0 -1px;
	padding: 15px 25px;
	font-weight: 600;
	text-align: center;
	color: #bbb;
	border: 1px solid transparent;
}

label:hover {
	color: #2e9cdf;
	cursor: pointer;
}

input:checked+label {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid #2e9cdf;
	border-bottom: 1px solid #ffffff;
}

#tab1:checked ~ #content1, #tab2:checked ~ #content2, #tab3:checked ~
	#content3, #tab4:checked ~ #content4 {
	display: block;
}

.hz {
	text-align: center; /* 가운데 정렬 */
	padding: 10px 0; /* 위아래 여백 지정 */
	margin: 0; /* 외부 여백을 0으로 설정 */
	margin-left: 200px;
}

.hz a {
	margin: 20px; /* 링크 사이의 여백 */
	text-decoration: none; /* 밑줄 제거 */
	color: black; /* 링크 색상 지정 */
	display: inline-block; /* 인라인 블록 요소로 만들어 정렬이 가능하게 함 */
}

.tab-write-btn-wrapper {
	text-align: right; /* 오른쪽 정렬 */
	/* 필요한 경우 추가적인 스타일링 */
}

.write-btn {
	margin-left: 10px;
	padding: 10px 15px;
	background-color: #2e9cdf;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	display: inline-block; /* 인라인 블록 요소로 만들어 정렬 가능하게 함 */
}
</style>

</head>

<body>

	<%@ include file="/views/common/head.jsp"%>
	<div class=".event_wrap">
		<br>


		<div class="main-content">
			<!--이미지 배너쪽  -->
			<div id="imgbanner">
				<button id="img_before"><</button>
				<button id="img_after">></button>
				<div id="imgarea">
					<img id="1"
						src="https://img.danawa.com/new/cmpart/splan/car/125/images/top.jpg">
					<img id="2"
						src="https://media.istockphoto.com/id/1444837874/ko/%EC%82%AC%EC%A7%84/%EC%85%80%ED%94%84-%EC%84%9C%EB%B9%84%EC%8A%A4-%EC%84%B8%EC%B0%A8%EC%9E%A5-%EC%9E%91%EC%97%85-%EC%A0%90%ED%94%84-%EC%8A%88%ED%8A%B8%EB%A5%BC-%EC%9E%85%EC%9D%80-%EB%82%A8%EC%9E%90%EA%B0%80-%ED%98%B8%EC%8A%A4%EC%97%90%EC%84%9C-%EC%B0%A8%EB%A5%BC-%EC%94%BB%EC%8A%B5%EB%8B%88%EB%8B%A4.jpg?s=2048x2048&w=is&k=20&c=NFY7-Iq5lOXWmC_gFt-ROxpHpI3mlhjClu88bV53jfs=">
					<img id="3"
						src="https://media.istockphoto.com/id/1629232839/ko/%EC%82%AC%EC%A7%84/%EC%9E%90%EB%8F%99-%EC%84%B8%EC%B2%99-%EB%B8%94%EB%A3%A8-%EB%B8%8C%EB%9F%AC%EC%8B%9C%EA%B0%80-%EC%9E%91%EB%8F%99%ED%95%98%EB%A9%B4-%ED%9D%B0%EC%83%89-%EC%9E%90%EB%8F%99%EC%B0%A8%EA%B0%80-%EA%B9%A8%EB%81%97%ED%95%98%EA%B2%8C-%EB%82%98%EC%98%B5%EB%8B%88%EB%8B%A4.jpg?s=2048x2048&w=is&k=20&c=McWmrACNY67aBmG2XpVaSAp111_Z7mf48voYFqkxKys=">
					<img id="4"
						src="https://cdn.pixabay.com/photo/2016/05/22/13/30/car-wash-1408492_1280.jpg">
					<img id="5"
						src="https://www.dasmotorsshop.com/data/editor/2006/thumb-cbcd35ad46aafbd22e0f5c6b540016ce_1591154858_4055_860x860.jpg">
				</div>
			</div>
			</div>
			</div>
			<script>
     		$(function(){
     		// 이미지배너

     	        $("#imgbanner").children().hover(function(){
     	            $(this).css("color","white")
     	        },function(){
     	            $(this).css("color","")
     	        })
     	        $("#1").show();
     	        let imgarr = $("#imgarea>img");
     	        // console.log(imgarr);
     	        for(let i=0;i<imgarr.length;i++){
     	            console.log(imgarr[i].src);
     	        }
     	        // transform: translate();
     	        $("#img_after").click(function(){
     	            
     	            if($("#1").css("display")=="inline"){
     	                $("#1").css("display","none")
     	                $("#2").show();
     	            }else if($("#2").css("display")=="inline"){
     	                $("#2").css("display","none")
     	                $("#3").show();
     	            }else if($("#3").css("display")=="inline"){
     	                $("#3").css("display","none")
     	                $("#4").show();
     	            }else if($("#4").css("display")=="inline"){
     	                $("#4").css("display","none")
     	                $("#5").show();
     	            }else if($("#5").css("display")=="inline"){
     	                $("#5").css("display","none")
     	                $("#1").show();
     	            }         
     	         })
     	         $("#img_before").click(function(){
     	            if($("#1").css("display")=="inline"){
     	                $("#1").css("display","none")
     	                $("#5").show();
     	            }else if($("#5").css("display")=="inline"){
     	                $("#5").css("display","none")
     	                $("#4").show();
     	            }else if($("#4").css("display")=="inline"){
     	                $("#4").css("display","none")
     	                $("#3").show();
     	            }else if($("#3").css("display")=="inline"){
     	                $("#3").css("display","none")
     	                $("#2").show();
     	            }else if($("#2").css("display")=="inline"){
     	                $("#2").css("display","none")
     	                $("#1").show();
     	            }   
     	                  
     	         })
     	        
     	       
     	        // 이미지배너 끝
     		})
     		
     	
        </script>

			<br> <br>


			<h2 align="center">카케어이벤트</h2>

			<h5 align="center">카케어의 다양한 이벤트를 만나보세요</h5>



			   <div class="btn">
				<a href="">최신순 | </a> <a href="">조회순</a>
			   </div>


			   <div class="tab-write-btn-wrapper">
				
				<!-- 글 작성 버튼 -->
				<a href="/path/to/your/event/create/page" class="write-btn">글 작성</a>
			   </div>
			<br>


			<div class="main">
			    <!-- 진행중인 이벤트 -->
				<input id="tab1" type="radio" name="tabs" checked="">
				<label for="tab1">진행중이벤트</label>
				<!-- 종료된 이벤트 -->
				 <input id="tab2" type="radio"name="tabs">
				  <label for="tab2">종료된이벤트</label>

				<section id="content1">
					<%if (list == null || list.size() == 0) { %>
					<p>진행중인 이벤트가 없습니다.</p>
					<%} else { %>

					<div class="list-area">

						<%for (Event event : list){ %>

						<div class="thumbnail" align="center"
							onclick="location.href='/SemiProject/eventdetail?evNo=<%= event.getEvNo()%>'">
							<img
								src="<%= contextPath %>/resources/thumbnail_upfiles/대표이미지파일명"
								width="200" height="150">
							<p>
								<%=event.getEvDate() %>
								~
								<%=event.getEvFin() %><br>
								<%=event.getEvTitle() %>
							</p>
						</div>
						<%} %>
						<%} %>
					</div>
                 


				</section>

				<section id="content2">
					<%if (listFin == null || listFin.size() == 0) { %>
					<p>종료된 이벤트가 없습니다.</p>
					<%} else { %>

					<div class="list-area">

						<%for (Event event : listFin){ %>

						<div class="thumbnail" align="center"
							onclick="location.href='/SemiProject/eventdetail?evNo=<%= event.getEvNo()%>'">
							<img
								src="<%= contextPath %>/resources/thumbnail_upfiles/대표이미지파일명"
								width="200" height="150">
							<p>
								<%=event.getEvDate() %>
								~
								<%=event.getEvFin() %><br>
								<%=event.getEvTitle() %>
							</p>
						</div>
						<%} %>
						<%} %>
					</div>
					
				</section>
				</div>
               <br><br><br>
                
			  <div class="hz">
					<a href="?page=1">&laquo;</a> <a href="?page=1">1</a> <a
						href="?page=2">2</a> <a href="?page=3">3</a> <a href="?page=4">4</a>
					<a href="?page=5">5</a> <a href="?page=6">&raquo;</a>
			  </div>

	<%@ include file="/views/common/footer.jsp"%>

</body>
</html>