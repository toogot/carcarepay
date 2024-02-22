<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장상세페이지</title>

<!-- map api, 지코딩 관련 스크립트 -->
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=nfs99ero2h&submodules=geocoder"></script>


<style>
	/* .outer div{border: 1px solid red;} */
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
	.store_allRev{height: 44%; border-top: 2px solid rgb(135, 206, 250);}

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
	.store_info_2_1{
		height: 30%;
		text-align: center;
		padding-top: 65px;
		font-size: 22px;
		font-weight: bold;
	}
	.store_info_2_2{height: 70%;}
	#maptest{
		width: 500px;
		height: 350px;
	}

	/* 유가정보 지도 */
	.store_info_2_1_3{
		height: 10%;
		font-size: 22px;
		font-weight: bold;
		text-align: center;
		padding-top: 60px;
	}
	.store_info_2_1_4{
		height: 90%;
		text-align: center;
		align-items: center;
	}
	#maptest2{
		width: 500px;
		height: 350px;
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
	.store_info_1_3_3{height: 35%; font-size: 20px;}
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

	/* a태그 스타일 */
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
	#map1, #map2{
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
					<table border="1" class="tb_store_name">
						<tr style="height: 80px;">
							<th style="font-size: 30px; font-weight: bold;"> 한기네 세차장</th>
							<td colspan="3">
								<button type="button" id="bookmarkButton" class="toggle-button" style="margin-left: 50px;">즐겨찾기</button> 
							</td>
						</tr>
						<tr style="height: 40px;">
							<th style="font-size: 25px; font-weight: bold;">★ 10.0 156명 평가</th>
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
						<div class="store_info_1_3_2">상세가격</div> 
						<div class="store_info_1_3_3"> 
							<ul>
								<li>상세가격 ~~~~~</li>
								<li>상세가격 ~~~~~</li>
								<li>상세가격 ~~~~~</li>
								<li>상세가격 ~~~~~</li>
								<li>상세가격 ~~~~~</li>
							</ul>
						</div>
						<div class="store_info_1_3_4">매장 이용시 주의사항</div> 
						<div class="store_info_1_3_5"> 
							<ul>
								<li>매장이용시 주의사항~~~~~</li>
								<li>매장이용시 주의사항~~~~~</li>
								<li>매장이용시 주의사항~~~~~</li>
								<li>매장이용시 주의사항~~~~~</li>
								<li>매장이용시 주의사항~~~~~</li>
							</ul>
						</div>
					

				</div>

				<div class="store_allRev">
					<div class="store_allRev_title">모든 리뷰</div>
					<div class="store_allRev_content">
						

						
					</div>
				
				</div>
			
				<!-- =========================================== 화면 오른쪽 ========================================== -->

			</div>
			<div class="store_info_2">
				<div class="store_info_2_1"> 
						<div class="store_info_2_1_1"> 
							상세주소
						</div>
						<div id="map1" style="width:100%; height:400px;"></div>
						<!-- <div class="store_info_2_1_2">  -->
							<!-- <img id="maptest" src="../../resources/maptest.png"> -->
						<!-- </div> -->
						<div class="store_info_2_1_3"> 
							주변 유가정보 확인
						</div>
						<div id="map2" style="width:100%; height:300px;"></div>
						<!-- <div class="store_info_2_1_4">  -->
							<!-- <img id="maptest2" src="../../resources/maptest2.png"> -->
						<!-- </div> -->
				</div>
				<div class="store_info_2_2">

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
				// 즐겨찾기 해제 로직 추가
			} else {
				bookmarkButton.textContent = '즐겨찾기 해제'; // 버튼 내용 변경: 즐겨찾기 해제
				// 즐겨찾기 추가 로직 추가
			}
		
		isBookmarked = !isBookmarked; // 상태 변경 (토글)
	  	});


		/////////////////////////////
		////////// MAP API //////////
		/////////////////////////////

		// 잠실 롯데월드를 중심으로 하는 지도
		var map1 = new naver.maps.Map('map1', {
        	center: new naver.maps.LatLng(37.5112, 127.0981), 
            zoom: 15
        });

		var marker1 = new naver.maps.Marker({
            position: new naver.maps.LatLng(37.5112, 127.0981),
            map: map1
        });

		// 주변 유류정보를 보여주는 지도
		var map2 = new naver.maps.Map('map2', {
        	center: new naver.maps.LatLng(37.5112, 127.0981), 
            zoom: 15
        });

		var marker2 = new naver.maps.Marker({
            position: new naver.maps.LatLng(37.5112, 127.0981),
            map: map2
        });

	</script>



</body>
</html>