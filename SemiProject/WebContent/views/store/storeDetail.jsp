<%@page import="com.kh.semi.store.model.vo.Store"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Store st = (Store)request.getAttribute("st");
	
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>매장상세페이지</title>

<!-- map api, 지코딩 관련 스크립트 -->
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=nfs99ero2h&submodules=geocoder"></script>
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script src="http://www.opinet.co.kr/api/aroundAll.do?code=XXXXXX&x=314681.8&y=544837&radius=5000&sort=1&prodcd=B027&out=json"></script>



<style>
    /*.outer div{border: 1px solid red;}*/
	.outer{
		/* border: 1px solid red; */
		width: 1900px;
		height: 4000px;
		box-sizing: border-box;
		margin: auto;
		margin-top: 10px;
	}
	.outer>div{
		/* border: 1px solid blue; */
		display: flex;
		justify-content: center;
	}

	/* 기본틀 나누기 */
	
	.store_img{height: 20%; width: 1900px; border-bottom: 2px solid rgb(135, 206, 250);}
	.store_info{
		height: 80%;

	}

	.store_info>div{height: 100%; float: left;}
	.store_info_1{width: 1000px; margin-right: 100px;}
	.store_info_2{width: 500px;}

	.store_info_1>div{width: 100%;}
	.store_info_1_1{height: 18%;}
	.store_info_1_2{height: 16%; border-top: 2px solid rgb(135, 206, 250);}
	.store_info_1_3{height: 22%; border-top: 2px solid rgb(135, 206, 250);}
	.store_allRev{height: 42%; border-top: 2px solid rgb(135, 206, 250);}

	.tb_store_name{
		margin-left: 50px;
		margin-top: 50px;
	}

	/* 최신리뷰 스타일 */
	.review_recent{
		background-color: rgb(135, 206, 250);
		width: 650px; 
		height: 300px;
		border-radius: 50px;
		margin: auto;
		border: 1px solid black;
	}

	.review_recent>div{
		width: 100%;
		box-sizing: border-box;
	}

	.review_recent_1{
		height: 30%;
		font-size: 25px;
		font-weight: bold;
		margin-top: 5px;
	}
	.review_recent_2{
		height: 50%;
		text-align: left;
	}
	.review_recent_3{
		height: 20%;
	}
	.review_recent_3>div{
		height: 100%;
		float: left;
	}
	.review_recent_3_1{
		width: 70%;
		text-align: right;
	}
	.review_recent_3_2{
		width: 30%;
	}


	/* 상세주소 및 매장지도 */
	
	.store_info_2>div{
		width: 100%;
		position: sticky;
		top: 0;
	}
	/* 지도 두개 들어가는 것 까지의 div */
	.store_info_2_1{
		height: 30%;
		text-align: center;
		padding-top: 20px;
		/* font-size: 22px; */
		font-weight: bold;
	}
	/* sticky 위한 여백 div */
	.store_info_2_2{height: 70%;}

	/* 매장 상세주소 지도, 유가정보 지도 쪽 텍스트들 */
	.store_info_2_1_1, .store_info_2_1_3{
		height: 7%;
		font-size: 22px;
		font-weight: bold;
		text-align: center;
		padding-top: 30px;
	}


	/* 매장소개 */
	.store_info_1_2>div{
		width: 92%;
		margin: auto;
		padding-left: 30px;
	}
	.store_info_1_2_1{
		height: 25%;
		font-size: 30px;
		font-weight: bold;
		padding-top: 10px;
		line-height: 90px;
	}
	.store_info_1_2_2{
		height: 75%;
		font-size: 21px;
		line-height: 50px;
	}


	/* 매장이용 정보 */

	.store_info_1_3>div{
		width: 92%;
		margin: auto;
		padding-left: 30px;
	}
	.store_info_1_3_1{
		height: 15%;
		font-size: 30px; 
		font-weight: bold;
		padding-top: 30px;
	}
	.store_info_1_3_2{
		height: 10%;
		font-size: 21px;
		font-weight: bold;
	}
	.store_info_1_3_3{height: 15%; font-size: 20px;}
	.store_info_1_3_4{
		height: 10%;
		font-size: 21px;
		font-weight: bold;
	}
	.store_info_1_3_5{height: 30%; font-size: 20px;}


	/* 모든리뷰 */
	
	.store_allRev>div{
		width : 92%;
		margin: auto;
	}
	.store_allRev_title{
		height: 5%;
		padding-left: 30px;
		padding-top: 30px;
		font-size: 30px;
		font-weight: bold;
	}
	.store_allRev_content{
		height: 95%;
	}
	
	/* 리뷰 작성 */
	.rev-write{
		height: 300px;
		border: 1px solid black;
		/* border-radius: 20px; */
	}
	.rev-write-id{
		height: 40px;
		padding-left: 15px;
		padding-top: 15px;
		font-size: 18px;
		font-weight: bold;
	}
	.rev-write-content{
		height: 180px;
		padding-left: 15px;
		padding-top: 20px;
	}
	.rev-write-content>div{
		height: 100%;
		float: left;
	}
	.rev-title-img{
		width: 150px;
		margin: 10px;
	}
	.rev-write-textarea{
		width: 700px;
		padding-left: 15px;
	}
	.rev-write-btn-area{
		height: 60px;
	}
	.rev-write-btn-area>button{
		height: 80%;
		width: 80px;
		float: right;
		background-color: rgb(135, 206, 250);
		color: black;
		border-radius: 20px;
	}

	/* 리뷰 리스트 */
	.rev-list{
		height: 250px;
		border: 1px solid rgb(135, 206, 250);
		border-radius: 20px;
	}
	.rev-list-id{
		height: 40px;
		padding-left: 15px;
		padding-top: 15px;
		font-size: 18px;
		font-weight: bold;
	}
	.rev-list-content{
		height: 130px;
		padding-left: 15px;
		padding-top: 25px;
	}
	.rev-list-date{
		height: 40px;
		padding-left: 15px;
	}
	.rev-list-grade{
		height: 40px;
		float: right;
		padding-right: 15px;
	}

	

	/* 모든리뷰 a태그 스타일 */
	#scrollRev{
		background-color: rgb(135, 206, 250);
		border: 1px solid black;
		border-radius: 20px;
	}

	#scrollRev:hover{
		cursor: pointer;
		background-color: darkblue;
		color: white;
	}
	

	/* map div 스타일 */
	#map, #map2{
		border: 1px solid rgb(135, 206, 250);
		border-radius: 20px;
	}

</style>

	


</head>
<body>
	<%@ include file="/views/common/head.jsp" %>
	
	<div class="outer">
		<div class="store_img">
			 <h1>매장사진이 들어갈 자리</h1>
		</div>

		<div class="store_info">
			<div class="store_info_1">
				<div class="store_info_1_1">
					<table border="0" class="tb_store_name">
						<tr style="height: 80px;">
							<th style="font-size: 25px; font-weight: bold;"> <%= st.getStoreName() %></th>
							<td colspan="3">
								<button type="button" id="bookmarkButton" class="toggle-button" style="margin-left: 50px;">즐겨찾기</button> 
							</td>
						</tr>
						<tr style="height: 40px;">
							<th style="font-size: 20px; font-weight: bold;">★ 10.0 156명 평가</th>
							<td></td>
							<td colspan="2" style="text-align: right; margin-right: 10px;"><a id="scrollRev" style="text-decoration: none;">모든 리뷰보기</a></td>
						</tr>
						<tr style="height: 350px;">
							<th></th>
							<th colspan="3">
								<div class="review_recent">
									<div class="review_recent_1">최신리뷰</div>
									<div class="review_recent_2" style="width: 90%; margin-left: 40px;">동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세</div>
									<div class="review_recent_3">
										<div class="review_recent_3_1">세차왕 이한기</div>
										<div class="review_recent_3_2">2024-02-19</div>
									</div>
								</div>
							</th>
						</tr>
						<tr>
							<th style="width: 260px;"></th>
							<th style="width: 260px;"></th>
							<th style="width: 260px;"></th>
							<th style="width: 260px;"></th>
						</tr>
					</table>
				</div>
				<div class="store_info_1_2">
					<div class="store_info_1_2_1"> 
						매장소개
					</div>
					<div class="store_info_1_2_2">
						우리 세차장은 최상의 서비스와 전문 기술로 고객 여러분의 자동차를 깨끗하게 만들어드리는 곳입니다.
						깔끔하고 넓은 공간과 최신식 설비, 전문가로 구성된 팀을 갖추고 있어 정확하고 신속한 서비스를 제공합니다.
						다양한 세차 프로그램과 친환경적인 세차용품을 제공하여 고객의 다양한 요구에 부응합니다.
						예약 시스템을 운영하여 편리한 예약이 가능하며 경제적인 가격 정책을 적용하고 있습니다.
						고객님의 소중한 자동차를 맡기실 때, 우리 세차장을 선택하시면 최상의 결과물과 만족을 얻으실 수 있습니다.
					</div>
				</div>
				<div class="store_info_1_3"> 
						<div class="store_info_1_3_1">매장 이용정보</div> 
						<div class="store_info_1_3_2">매장 상세주소</div> 
						<div class="store_info_1_3_3"> 
							<ul>
								<li><%= st.getStoreAddress() %></li>
							</ul>
						</div>
						<div class="store_info_1_3_4">매장 상세가격</div> 
						<div class="store_info_1_3_5"> 
							<ul>
								<li><%= st.getStorePrice() %></li>
							</ul>
						</div>
					

				</div>

				<div class="store_allRev">
					<div class="store_allRev_title">모든 리뷰</div>
					<br><br>
					<div class="store_allRev_content">
						<% if(loginUser != null){%>
							<div style="border: 0px; padding-left: 15px;">
								<span>작성하기</span>   <span>100</span>
							</div>
						<br>
						<div class="rev-write">
							<div class="rev-write-id">
								<%= loginUser.getUserId() %>
							</div>
							<div class="rev-write-content">
								<div class="rev_title_img"><img id="titleImg" src="" width="100px" height="100px"></div>
								<div class="rev-write-textarea">
								<textarea name="content" cols="90" rows="5" style="border: 1px; resize: none; font-size: 15px;" placeholder="주의: 작성자는 자신의 의견을 표현함에 있어서 다른 사람의 권리와 편견을 존중해야 합니다. 공격적이거나 혐오적인 언어, 인신공격, 비방, 혹은 불법적인 내용을 작성하지 않도록 주의해야 합니다."></textarea>
								</div>
							</div>
							<div class="rev-write-btn-area"> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;평점 ★
								<select class="grade">
									<option value="5.0">5.0</option>
									<option value="4.5">4.5</option>
									<option value="4.0">4.0</option>
									<option value="3.5">3.5</option>
									<option value="3.0">3.0</option>
									<option value="2.5">2.5</option>
									<option value="2.0">2.0</option>
									<option value="1.5">1.5</option>
									<option value="1.0">1.0</option>
									<option value="0.5">0.5</option>
									<option value="0">0</option>
								</select>
								&nbsp;<input type="file" id="file1" onchange="loadImg(this);">
									  <input type="file" id="file2">
									  <input type="file" id="file3">
								<button onclick="insertReview();">등록</button>
				
							</div>
				
						</div>
						<%} else {%>
						<div style="border: 0px; padding-left: 15px;">
							<span>로그인 후 작성해주세요</span>
						</div>
						<br>
						<div class="rev-write" style="height: 100px;">
							<div class="rev-write-content">댓글을 작성하려면 <a href="<%= contextPath %>/loginForm.me">로그인</a> 해주세요.</div>
						</div>
						<% } %>
						
						<br>
						<hr>
						<br><br>
						<%%>
						<div id="rev-list">
							
								<!-- <div class="rev-list-id">작성자 아이디</div>
								<div class="rev-list-content">
									<textarea cols="90" rows="5" style="border: 1px; resize: none; font-size: 15px;">작성내용</textarea>
								</div>
								<div class="rev-list-date">2024-02-26</div>
								<div class="rev-list-grade">★ 5.0</div> -->
					
							
						</div>
						<%%>


					</div>
				
				</div>
			
				<!-- =========================================== 화면 오른쪽 ========================================== -->

			</div>
			<div class="store_info_2">
				<div class="store_info_2_1"> 
						<div class="store_info_2_1_1">상세주소</div>

						<div id="map" style="width:100%; height:400px;"></div>
							<%= st.getStoreAddress() %>
						<div class="store_info_2_1_3"> 주변 유가정보 확인</div>
						<div id="map2" style="width:100%; height:300px;"></div>
						
				</div>
				<div class="store_info_2_2">
						<!-- sticky 하기 위한 여백 -->
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/views/common/footer.jsp" %>
	




	<script>
		/////////////////////////////////////////
		////////// 모든리뷰 보기 스크롤 //////////
		////////////////////////////////////////
		document.querySelector('td a').addEventListener('click', function(event) {
			event.preventDefault(); // 기본 동작 방지
		
			// 이동할 대상 div 요소 선택자
			var targetDiv = document.querySelector('.store_allRev');
		
			// 대상 div 요소로 스크롤 이동
			targetDiv.scrollIntoView({ behavior: 'smooth' });
	  	});

		//////////////////////////////////
		////////// 즐겨찾기 버튼 //////////
		//////////////////////////////////
	  	var bookmarkButton = document.getElementById('bookmarkButton');
		var isBookmarked = false; // 초기 상태: 즐겨찾기 되어있지 않음

		bookmarkButton.addEventListener('click', function() {
			if (isBookmarked) {
				bookmarkButton.textContent = '즐겨찾기'; // 버튼 내용 변경: 즐겨찾기
				// 즐겨찾기 해제 로직
			} else {
				bookmarkButton.textContent = '즐겨찾기 해제'; // 버튼 내용 변경: 즐겨찾기 해제
				// 즐겨찾기 추가 로직
			}
		
		isBookmarked = !isBookmarked; // 상태 변경 (토글)
	  	});


		/////////////////////////////
		////////// MAP API //////////
		/////////////////////////////
		naver.maps.Service.geocode({
       	query: "<%= st.getStoreAddress() %>"
   		}, function(status, response) {
	       	if (status !== naver.maps.Service.Status.OK) {
	        	   return alert('Something wrong!');
	      		}

			var result = response.v2, // 검색 결과의 컨테이너
				items = result.addresses; // 검색 결과의 배열
		// 성공 시의 response 처리
		// do Something
			var map = new naver.maps.Map('map', {
			center: new naver.maps.LatLng(items[0].y, items[0].x),
			zoom: 16
			});
			var marker = new naver.maps.Marker({
	   		position: new naver.maps.LatLng(items[0].y, items[0].x),
	   		map: map
			});
		
		});

		//////////////////////////////////////////
		//////////// ajax 리뷰 insert ////////////	
		/////////////////////////////////////////
		$(function(){
				selectReview();
				
		});	
		
		function insertReview(){
		$.ajax({
			url:"insert.rv",
			method:"post",
			data:{
				content: $(".rev-write textarea").val(),
				storeNo: <%= st.getStoreNo() %>,
				grade: $(".grade").val()},
				success:function(result){
					if(result > 0){
						$(".rev-write textarea").val("");
						selectReview();
						
					}
				},
				error:function(){
					alert("리뷰등록이 정상적으로 이루어지지 않았습니다.");
				}
		
			})
		}
		
		/////////////////////////////////////
		/////////// ajax 리뷰 select /////////
		/////////////////////////////////////
		function selectReview(){
		$.ajax({
			url:"select.rv",
			method:"post",
			data:{storeNo: <%= st.getStoreNo() %>},
			success:function(rlist){
					let value = "";
				if(rlist.length < 1){
					value += "<div>조회된 리뷰가 없습니다.</div>"
				} else{
					for(let i = 0; i < rlist.length; i++){
						value += "<div class='rev-list'>"
							   + "<div class='rev-list-id'>" + rlist[i].userId + "</div>"
						       + "<div class='rev-list-content'>"
						       + "<textarea cols='90' rows='5' style='border: 1px; resize: none; font-size: 15px;' disabled>" + rlist[i].content + "</textarea>"
						       + "</div>"
						       + "<div class='rev-list-date'>" + rlist[i].issueDate + "</div>"
						       + "<div class='rev-list-grade'>★" + rlist[i].grade + "</div>"
						       + "</div>"
						       + "<br><br>";
						       
					}
				}
						       $("#rev-list").html(value);
					
			},
			error:function(){
				
			}

		})
		}
		
		
		function loadImg(inputFile){
			
			if(inputFile.files.length == 1){ // 파일이 선택된 경우
				const reader = new FileReader();
			
				reader.readAsDataURL(inputFile.files[0]);
				
				reader.onload = function(e){
					
					$("#titleImg").attr("src",e.target.result);
					
				}
			} else { // 파일이 취소된 경우
				$("#titleImg").attr("src", null);			
			}
			
			
			
			
			
			
		}
		
		
		
		
		
		
	
		// 잠실 롯데월드를 중심으로 하는 지도
		//var map1 = new naver.maps.Map('map1', {
        //	center: new naver.maps.LatLng(37.5112, 127.0981), 
        //    zoom: 15
        //});

		//var marker1 = new naver.maps.Marker({
        //    position: new naver.maps.LatLng(37.5112, 127.0981),
        //    map: map1
        //});

		// 주변 유류정보를 보여주는 지도
		//var map2 = new naver.maps.Map('map2', {
        //	center: new naver.maps.LatLng(37.5112, 127.0981), 
         //   zoom: 15
        //});
//
		//var marker2 = new naver.maps.Marker({
        //    position: new naver.maps.LatLng(37.5112, 127.0981),
        //    map: map2
       //});

	</script>



</body>
</html>