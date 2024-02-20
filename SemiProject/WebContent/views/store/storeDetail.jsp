<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장상세페이지</title>
<style>
	/* .outer div{border: 1px solid red;} */
	.outer{
		/* border: 1px solid red; */
		width: 1800px;
		height: 4000px;
		box-sizing: border-box;
		margin: auto;
		margin-top: 10px;
	}
	.outer>div{
		width: 100%;
		/* border: 1px solid blue; */
	}

	/* 기본틀 나누기 */
	.content_1{height: 20%; border-bottom: 1px solid rgb(135, 206, 250);}
	.content_2{height: 80%;}

	.content_2>div{height: 100%; float: left;}
	.content_2_1{width: 65%;}
	.content_2_2{width: 35%;}

	.content_2_1>div{width: 100%;}
	.content_2_1_1{height: 18%;}
	.content_2_1_2{height: 16%; border-top: 1px solid rgb(135, 206, 250);}
	.content_2_1_3{height: 22%; border-top: 1px solid rgb(135, 206, 250);}
	.content_2_1_4{height: 44%; border-top: 1px solid rgb(135, 206, 250);}

	/* content_2 나누기 --------------------------------------------------------------------------------------*/
	.store_name{
		margin-left: 50px;
		margin-top: 50px;
	}

	/* 최신리뷰 스타일 */
	.review_recent{
		background-color: rgb(135, 206, 250);
		width: 790px; 
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
	
	.content_2_2>div{
		width: 100%;
		position: sticky;
		top: 0;
	}
	.content_2_2_1{
		height: 30%;
		text-align: center;
		padding-top: 65px;
		font-size: 25px;
		font-weight: bold;
	}
	/* .content_2_2_2{
		height: 15%;
		text-align: center;
		align-items: center;
		padding-top: 20px;
	} */
	.content_2_2_2{height: 70%;}
	#maptest{
		width: 500px;
		height: 350px;
	}

	/* 유가정보 지도 */
	.content_2_2_1_3{
		height: 10%;
		font-size: 22px;
		font-weight: bold;
		text-align: center;
		padding-top: 50px;
	}
	.content_2_2_1_4{
		height: 90%;
		text-align: center;
		align-items: center;
	}
	#maptest2{
		width: 500px;
		height: 350px;
	}

	/* content_3 나누기 --------------------------------------------------------------------------------------*/
	/* 매장소개 */
	.content_2_1_2>div{
		width: 92%;
		margin: auto;
		padding-left: 30px;
	}
	.content_2_1_2_1{
		height: 25%;
		font-size: 30px;
		font-weight: bold;
		padding-top: 10px;
		line-height: 90px;
	}
	.content_2_1_2_2{
		height: 75%;
		font-size: 21px;
		line-height: 30px;
	}

	


	/* 매장이용 정보 */

	.content_2_1_3>div{
		width: 92%;
		margin: auto;
		padding-left: 30px;
	}
	.content_2_1_3_1{
		height: 15%;
		font-size: 30px; 
		font-weight: bold;
		padding-top: 20px;
	}
	.content_2_1_3_2{
		height: 10%;
		font-size: 21px;
		font-weight: bold;
	}
	.content_2_1_3_3{height: 35%; font-size: 20px;}
	.content_2_1_3_4{
		height: 10%;
		font-size: 21px;
		font-weight: bold;
	}
	.content_2_1_3_5{height: 30%; font-size: 20px;}


	/* 모든리뷰 */
	.content_2_1_4>div{
		width: 100%;
	}
	



</style>
</head>
<body>
	<%@ include file="/views/common/head.jsp" %>
	
	<div class="outer">
		<div class="content_1">
		
		</div>
		
		<div class="content_2">
			<div class="content_2_1">
				<div class="content_2_1_1">
					<table border="0" class="store_name">
						<tr style="height: 80px;">
							<th style="font-size: 30px; font-weight: bold;"> 한기네 세차장</th>
							<td colspan="3">
								<button type="button" class="" style="margin-left: 50px;">즐겨찾기</button> 
							</td>
						</tr>
						<tr style="height: 40px;">
							<th style="font-size: 25px; font-weight: bold;">★ 10.0 156명 평가</th>
							<td></td>
							<td colspan="2" style="text-align: right; margin-right: 10px;"><a href="#">모든 리뷰보기</a></td>
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
				<div class="content_2_1_2">
					<div class="content_2_1_2_1">
						매장소개
					</div>
					<div class="content_2_1_2_2">
						동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
						동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
						동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
					</div>
				</div>
				<div class="content_2_1_3">
						<div class="content_2_1_3_1">매장 이용정보</div>
						<div class="content_2_1_3_2">상세가격</div>
						<div class="content_2_1_3_3">
							<ul>
								<li>상세가격 ~~~~~</li>
								<li>상세가격 ~~~~~</li>
								<li>상세가격 ~~~~~</li>
								<li>상세가격 ~~~~~</li>
								<li>상세가격 ~~~~~</li>
							</ul>
						</div>
						<div class="content_2_1_3_4">매장 이용시 주의사항</div>
						<div class="content_2_1_3_5">
							<ul>
								<li>매장이용시 주의사항~~~~~</li>
								<li>매장이용시 주의사항~~~~~</li>
								<li>매장이용시 주의사항~~~~~</li>
								<li>매장이용시 주의사항~~~~~</li>
								<li>매장이용시 주의사항~~~~~</li>
							</ul>
						</div>
					

				</div>
				<div class="content_2_1_4">


				</div>
			</div>
			<div class="content_2_2">
				<div class="content_2_2_1">
						<div class="content_2_2_1_1">
							상세주소
						</div>
						<div class="content_2_2_1_2">
							<img id="maptest" src="../../resources/maptest.png">
						</div>
						<div class="content_2_2_1_3">
							주변 유가정보 확인
						</div>
						<div class="content_2_2_1_4">
							<img id="maptest2" src="../../resources/maptest2.png">
						</div>
				</div>
				<div class="content_2_2_2">

				</div>
			</div>
		</div>

	</div>
	
	
	
	
	
	<%@ include file="/views/common/footer.jsp" %>
	
	



</body>
</html>