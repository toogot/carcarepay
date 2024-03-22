<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.store.enrollController.model.vo.AppStoreImage"%>
<%@page import="com.google.gson.Gson"%> 
<%@page import="com.kh.semi.store.model.vo.Store"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% Store st = (Store)request.getAttribute("st"); Gson gson = new Gson(); %>
<% ArrayList<AppStoreImage> list = (ArrayList<AppStoreImage>)request.getAttribute("list"); %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>매장상세페이지</title>

    <!-- map api, 지코딩 관련 스크립트 -->
    <script
      type="text/javascript"
      src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=nfs99ero2h&submodules=geocoder"
    ></script>
    <!-- ajax -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Proj4 라이브러리를 CDN을 통해 추가 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.6.2/proj4.js"></script>

    <style>
      .outer div {
        /* border: 1px solid red; */
      }
      .outer {
        /* border: 1px solid red; */
        width: 1900px;
        height: 4100px;
        box-sizing: border-box;
        margin: auto;
        margin-top: 10px;
      }

      .outer > div {
        /* border: 1px solid blue; */
        display: flex;
        justify-content: center;
      }

      /* 기본틀 나누기 */
      .store_img {
        height: 20%;
        width: 1900px;
        border-bottom: 2px solid rgb(135, 206, 250);
      }

      .store_info {
        height: 80%;
      }

      .store_info > div {
        height: 100%;
        float: left;
      }

      .store_info_1 {
        width: 1000px;
        margin-right: 100px;
      }

      .store_info_2 {
        width: 500px;
      }

      .store_info_1 > div {
        width: 100%;
      }

      .store_info_1_1 {
        height: 18%;
      }

      .store_info_1_2 {
        height: 16%;
        border-top: 2px solid rgb(135, 206, 250);
      }

      .store_info_1_3 {
        height: 22%;
        border-top: 2px solid rgb(135, 206, 250);
      }

      .store_allRev {
        height: 42%;
        border-top: 2px solid rgb(135, 206, 250);
      }

      .tb_store_name {
        margin-left: 50px;
        margin-top: 50px;
      }

      /* 최신리뷰 스타일 */
      .review_recent {
        background-color: rgb(135, 206, 250);
        width: 650px;
        height: 300px;
        border-radius: 50px;
        margin: auto;
        border: 1px solid black;
      }

      .review_recent > div {
        width: 100%;
        box-sizing: border-box;
      }

      .review_recent_1 {
        height: 30%;
        font-size: 25px;
        font-weight: bold;
        margin-top: 20px;
        padding-left: 40px;
      }

      .review_recent_2 {
        height: 50%;
        text-align: left;
      }

      .review_recent_3 {
        height: 20%;
      }

      .review_recent_3 > div {
        height: 100%;
        float: left;
      }

      .review_recent_3_1 {
        width: 70%;
        text-align: right;
      }

      .review_recent_3_2 {
        width: 30%;
      }

      /* 상세주소 및 매장지도 */
      .store_info_2 > div {
        width: 100%;
        position: sticky;
        top: 0;
      }
      /* 지도 두개 들어가는 것 까지의 div */
      .store_info_2_1 {
        height: 30%;
        text-align: center;
        padding-top: 20px;
        /* font-size: 22px; */
        font-weight: bold;
      }
      /* sticky 위한 여백 div */
      .store_info_2_2 {
        height: 70%;
      }

      /* 매장 상세주소 지도, 유가정보 지도 쪽 텍스트들 */
      .store_info_2_1_1,
      .store_info_2_1_3 {
        height: 7%;
        font-size: 22px;
        font-weight: bold;
        text-align: center;
        padding-top: 30px;
      }

      /* 매장소개 */
      .store_info_1_2 > div {
        width: 92%;
        margin: auto;
        padding-left: 30px;
      }

      .store_info_1_2_1 {
        height: 25%;
        font-size: 30px;
        font-weight: bold;
        padding-top: 10px;
        line-height: 90px;
      }

      .store_info_1_2_2 {
        height: 75%;
        font-size: 21px;
        line-height: 50px;
      }

      /* 매장이용 정보 */
      .store_info_1_3 > div {
        width: 92%;
        margin: auto;
        padding-left: 30px;
      }

      .store_info_1_3_1 {
        height: 15%;
        font-size: 30px;
        font-weight: bold;
        padding-top: 30px;
      }

      .store_info_1_3_2 {
        height: 10%;
        font-size: 21px;
        font-weight: bold;
      }

      .store_info_1_3_3 {
        height: 15%;
        font-size: 20px;
      }

      .store_info_1_3_4 {
        height: 10%;
        font-size: 21px;
        font-weight: bold;
      }

      .store_info_1_3_5 {
        height: 30%;
        font-size: 20px;
      }

      /* 모든리뷰 */
      .store_allRev > div {
        width: 92%;
        margin: auto;
      }

      .store_allRev_title {
        height: 5%;
        padding-left: 30px;
        padding-top: 30px;
        font-size: 30px;
        font-weight: bold;
      }

      .store_allRev_content {
        height: 1100px;
        overflow: auto;
      }

      /* 리뷰 작성 */
      .rev-write {
        height: 300px;
        border: 1px solid black;
        /* border-radius: 20px; */
      }

      .rev-write-id {
        height: 40px;
        padding-left: 15px;
        padding-top: 15px;
        font-size: 18px;
        font-weight: bold;
      }

      .rev-write-content {
        height: 180px;
        padding-left: 15px;
        padding-top: 20px;
      }

      .rev-write-content > div {
        height: 100%;
        float: left;
      }

      .rev-title-img {
        width: 150px;
        margin: 10px;
      }

      .rev-write-textarea {
        width: 700px;
        padding-left: 15px;
      }

      .rev-write-btn-area {
        height: 60px;
      }

      .rev-write-btn-area > button {
        height: 80%;
        width: 80px;
        float: right;
        background-color: rgb(135, 206, 250);
        color: black;
        border-radius: 20px;
      }

      /* 리뷰 리스트 */
      .rev-list {
        height: 250px;
        border: 1px solid rgb(135, 206, 250);
        border-radius: 20px;
        margin-bottom: 20px;
      }

      .rev-list-id {
        height: 40px;
        padding-left: 15px;
        padding-top: 15px;
        font-size: 18px;
        font-weight: bold;
      }

      .rev-list-content {
        height: 130px;
        padding-left: 15px;
        padding-top: 25px;
      }

      .rev-list-date {
        height: 40px;
        padding-left: 15px;
      }

      .rev-list-grade {
        height: 40px;
        float: right;
        padding-right: 15px;
      }

      /* 모든리뷰 a태그 스타일 */
      #scrollRev {
        background-color: rgb(135, 206, 250);
        border: 1px solid black;
        border-radius: 20px;
        height: 35px;
      }

      #scrollRev:hover {
        cursor: pointer;
        background-color: blue;
        color: white;
      }

      /* map div 스타일 */
      #map,
      #map2 {
        border: 1px solid rgb(135, 206, 250);
        border-radius: 20px;
      }

      /* 사진보기 a태그 */
      .rev-look {
        margin-left: 400px;
        color: rgb(135, 206, 250);
        cursor: pointer;
      }

      .rev-look:hover {
        text-decoration: none;
      }

      .rev-look-div {
        width: 100%;
        height: 150px;
        display: none;
        margin-bottom: 20px;
      }

      .rev-look-div img {
        width: 130px;
        height: 130px;
        margin-right: 10px;
        border-radius: 10px;
      }

      .deleteButton {
        float: right;
        border: none;
        border-radius: 10px;
        margin-right: 10px;
        height: 25px;
        width: 85px;
      }

      #review_recent_image > img {
        border-radius: 10px;
      }
      /* .storeImg_outer {
        width: 1000px;
        height: 750px;
        border: 1px solid blue;
      } */

      .slider {
        width: 1150px;
        height: 700px;
        overflow: hidden;
        position: relative;
        border-radius: 10px;
        border: 1px solid rgb(220, 220, 220);
        margin-top: 50px;
      }
      .slide {
        float: left;
        width: 100%;
        position: relative;
      }
      .stImg {
        width: 1150px;
        height: 700px;
      }

      .fade {
        animation-name: fadeEffect;
        animation-duration: 5s; /* fade 효과 지속 시간 */
      }

      @keyframes fadeEffect {
        from {
          opacity: 1;
        }
        to {
          opacity: 0;
        } 
      }

      /* .mapDiv{
        border: 1px solid blue;
        border-radius: 10px;
      } */
    </style>
    <!-- <link rel="stylesheet" href="styles.css" /> -->
  </head>
  <body>
    <%@ include file="/views/common/head.jsp"%>
    <div class="outer">
      <div class="store_img">
        <div class="slider">
	          <% for(AppStoreImage asi : list) { %>
	          <div class="slide">
	            <img
	              class="stImg"
	              src="<%= asi.getImgRoot()%><%= asi.getChangeName() %>"
	            />
	          </div>
	          <% } %>
          
          
          
        </div>
      </div>

      <script>
        let currentSlide = 0;
        const slides = document.querySelectorAll(".slide");
        const slideCount = slides.length;

        function showSlide(n) {
          slides.forEach((slide) => {
            slide.style.display = "none";
            slide.classList.remove("fade"); // fade 클래스 제거
          });
          slides[n].style.display = "block";
          slides[n].classList.add("fade"); // fade 클래스 추가
        }

        function nextSlide() {
          currentSlide = (currentSlide + 1) % slideCount;
          showSlide(currentSlide);
        }

        function prevSlide() {
          currentSlide = (currentSlide - 1 + slideCount) % slideCount;
          showSlide(currentSlide);
        }

        document.addEventListener("DOMContentLoaded", () => {
          showSlide(currentSlide);
          setInterval(nextSlide, 2000); // 3초마다 자동 슬라이드
        });
      </script>

      <div class="store_info">
        <div class="store_info_1">
          <div class="store_info_1_1">
            <table border="0" class="tb_store_name">
              <tr style="height: 80px">
                <th style="font-size: 25px; font-weight: bold">
                  <%= st.getStoreName() %>
                </th>
                <td colspan="3">
                  <% if(loginUser != null) { %>
                  <button
                    type="button"
                    id="bookmarkButton"
                    class="toggle-button"
                    style="
                      margin-left: 50px;
                      background-color: rgb(135, 206, 250);
                      color: white;
                      border-radius: 20px;
                    "
                  >
                    즐겨찾기
                  </button>
                  <% } %>
                </td>
              </tr>
              <tr style="height: 40px">
                <th id="countGrade" style="font-size: 20px; font-weight: bold">
                  ★ 10.0 156명 평가
                </th>
                <td></td>
                <td colspan="2" style="text-align: right; margin-right: 10px">
                  <button id="scrollRev" style="text-decoration: none">
                    모든 리뷰보기
                  </button>
                </td>
              </tr>
              <tr style="height: 350px">
                <th id="review_recent_image"></th>
                <th colspan="3">
                  <div class="review_recent">
                    <div class="review_recent_1">가장 최신리뷰</div>
                    <div
                      class="review_recent_2"
                      style="width: 90%; margin-left: 40px"
                    ></div>
                    <div class="review_recent_3">
                      <div
                        class="review_recent_3_1"
                        style="padding-right: 20px"
                      ></div>
                      <div class="review_recent_3_2"></div>
                    </div>
                  </div>
                </th>
              </tr>
              <tr>
                <th style="width: 260px"></th>
                <th style="width: 260px"></th>
                <th style="width: 260px"></th>
                <th style="width: 260px"></th>
              </tr>
            </table>
          </div>
          <div class="store_info_1_2">
            <div class="store_info_1_2_1">매장소개</div>
            <div class="store_info_1_2_2">
              우리 세차장은 최상의 서비스와 전문 기술로 고객 여러분의 자동차를
              깨끗하게 만들어드리는 곳입니다. 깔끔하고 넓은 공간과 최신식 설비,
              전문가로 구성된 팀을 갖추고 있어 정확하고 신속한 서비스를
              제공합니다. 다양한 세차 프로그램과 친환경적인 세차용품을 제공하여
              고객의 다양한 요구에 부응합니다. 예약 시스템을 운영하여 편리한
              예약이 가능하며 경제적인 가격 정책을 적용하고 있습니다. 고객님의
              소중한 자동차를 맡기실 때, 우리 세차장을 선택하시면 최상의
              결과물과 만족을 얻으실 수 있습니다.
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
            <br />
            <br />
            <div class="store_allRev_content">
              <% if(loginUser != null){%>
              <div style="border: 0px; padding-left: 15px">
                <span>작성하기</span> <span id="countReview">100</span>
              </div>
              <br />
              <div class="rev-write">
                <div class="rev-write-id"><%= loginUser.getUserId() %></div>
                <div class="rev-write-content">
                  <div class="rev_title_img">
                    <img id="titleImg" src="" width="100px" height="100px" />
                  </div>
                  <div class="rev-write-textarea">
                    <textarea
                      name="content"
                      cols="70"
                      rows="5"
                      style="border: 1px; resize: none; font-size: 15px"
                      placeholder="주의: 작성자는 자신의 의견을 표현함에 있어서 다른 사람의 권리와 편견을 존중해야 합니다. 공격적이거나 혐오적인 언어, 인신공격, 비방, 혹은 불법적인 내용을 작성하지 않도록 주의해야 합니다."
                    ></textarea>
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
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 대표이미지 :
                  <input
                    type="file"
                    id="file1"
                    onchange="loadImg(this);"
                    required
                  />
                  <br />
                  <div style="display: flex; flex-direction: row">
                    <input
                      type="file"
                      id="file2"
                      style="margin: 10px; margin-left: 25px"
                    /><input
                      type="file"
                      id="file3"
                      style="margin: 10px; margin-left: -180px"
                    />
                  </div>
                  <button onclick="insertReview();">등록</button>
                </div>
              </div>
              <%} else {%>
              <div style="border: 0px; padding-left: 15px">
                <span>로그인 후 작성해주세요</span>
              </div>
              <br />
              <div class="rev-write" style="height: 100px">
                <div class="rev-write-content">
                  댓글을 작성하려면
                  <a href="<%= contextPath %>/loginForm.me">로그인</a>
                  해주세요.
                </div>
              </div>
              <% } %>

              <br />
              <br />
              <hr />
              <br />
              <br />
              <div id="rev-list">
                <!--  <div>
                				<div class="rev-list-id">작성자 아이디</div>
								<div class="rev-list-content">
									<textarea cols="90" rows="5" style="border: 1px; resize: none; font-size: 15px;">작성내용</textarea>
								</div>
								<div class="rev-list-date">2024-02-26</div>
								<div class="rev-list-grade">★ 5.0</div>
						</div>		 -->
              </div>
              <!--  <div class="rev-look-div"></div> -->
              <!-- style="display:none" -->
            </div>
          </div>

          <!-- =========================================== 화면 오른쪽 ========================================== -->
        </div>
        <div class="store_info_2" style="height: auto">
          <div class="store_info_2_1">
            <div class="store_info_2_1_1">상세주소</div>

            <div id="map" style="width: 100%; height: 400px"></div>
            <%= st.getStoreAddress() %>
            <div class="store_info_2_1_3">주변 유가정보 확인</div>
            <div id="map2" style="width: 100%; height: 300px"></div>
          </div>
          <div class="store_info_2_2">
            <!-- sticky 하기 위한 여백 -->
          </div>
        </div>
      </div>
    </div>

    <%@ include file="/views/common/footer.jsp"%>

    <!-- /////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////SCRIPT///////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////// -->

    <script>

       // 리뷰사진 슬라이드 //
       function lookDiv(clickedElement) {
        const $look = $(clickedElement).closest('.rev-list').next('.rev-look-div');
        if ($look.css("display") == "none") {
          $look.slideDown();
        } else {
         $look.slideUp();
        }
      }


      $(function(){
           				selectReview();
           				selectCountGrade();
              <% if(loginUser != null) { %>
           				updateBookmarkButton();
           				checkIfBookmarked();
              <% } %>
      });


           		/////////////////////////////////////////
           		////////// 모든리뷰 보기 스크롤 //////////
           		////////////////////////////////////////
           		document.getElementById("scrollRev").addEventListener('click', function(event) {
           			event.preventDefault(); // 기본 동작 방지

           			// 이동할 대상 div 요소 선택자
           			var targetDiv = document.querySelector('.store_allRev');

           			// 대상 div 요소로 스크롤 이동
           			targetDiv.scrollIntoView({ behavior: 'smooth' });
           	  	});

           		//////////////////////////////////
           		////////// 즐겨찾기 버튼 //////////
           		//////////////////////////////////


              <% if(loginUser != null) { %>
           		var bookmarkButton = document.getElementById('bookmarkButton');
           		var isBookmarked = checkIfBookmarked(); // 초기 상태: 즐겨찾기 여부 확인



           		bookmarkButton.addEventListener('click', function() {
           			if (isBookmarked) {

           				// 즐겨찾기 해제 로직
           				$.ajax({
           					url:"bookmarkDelete.bm",
           					type:"post",
           					data:{storeNo: <%= st.getStoreNo() %>},
           					success:function(result){
           						if(result > 0){
           							bookmarkButton.textContent = '즐겨찾기';
           							alert("즐겨찾기 목록에서 삭제되었습니다.");
           						}
           					},
           					error:function(){
           						console.log("즐겨찾기 해제 ajax 통신 실패");
           					}
           				})

           			} else {
           				// 즐겨찾기 추가 로직
           				$.ajax({
           					url:"bookmarkInsert.bm",
           					type:"post",
           					data:{storeNo: <%= st.getStoreNo() %>},
           					success:function(result){
           						if(result > 0) {
           							bookmarkButton.textContent = '즐겨찾기 해제';
           							alert("즐겨찾기 목록에 추가되었습니다!");
           						}
           					},
           					error:function(){
           						console.log("즐겨찾기 추가 ajax 통신 실패");
           					}
           				})
           			}
           			isBookmarked = !isBookmarked; // 상태 변경 (토글)
           		});

           		function checkIfBookmarked() {
           			// 즐겨찾기 여부를 서버에서 확인하는 로직
           			// true or false 반환하기!
           			/////////////////////////////////////////////////
           		  return new Promise(function(resolve, reject) {
           			$.ajax({
           				url:"bookmarkSelect.bm",
           				type:"post",
           				data:{storeNo: <%= st.getStoreNo() %>},
           				success:function(result){
           					if (result === 1) {
           						console.log("즐겨찾기한 상태입니다.");
           						resolve(true);
           					} else {
           						console.log("즐겨찾기하지 않은 상태입니다.");
           						resolve(false);
           					}
           				},
           				error:function(){
           					console.log("즐겨찾기 여부 ajax 통신 실패");
           					reject(Error("즐겨찾기 여부 ajax 통신 실패"));
           				}
           			})
           		  })
           		}

           		function updateBookmarkButton() {
           			checkIfBookmarked()
           			.then(function(isBookmarked){
           				if (isBookmarked) {
           					bookmarkButton.textContent = '즐겨찾기 해제';
           				} else {
           					bookmarkButton.textContent = '즐겨찾기';
           				}
           			})
           			.catch(function(error){
           				console.log(error);
           			})
           		}

           		updateBookmarkButton(); // 버튼 초기 상태 설정 (true / false)

              <% } %>





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
                  //  console.log(items);
                  //  console.log(result);
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

                 var contentString = [
                    '<div>',
                    '   <h4>' + '<%= st.getStoreName() %>' +'</h4>',
                    '   <h6>' + '<%= st.getStoreAddress() %>' +'</h6>',
                    '</div>'
                ].join('');
                      
                var infowindow = new naver.maps.InfoWindow({
                    content: contentString,
                    maxWidth: 'auto',
                    backgroundColor: "rgb(135,206,250)",
                    borderColor: "black",
                    borderRadius: "10px",
                    anchorSize: new naver.maps.Size(20, 20),
                    anchorSkew: true,
                    anchorColor: "rgb(135,206,250)",

                    pixelOffset: new naver.maps.Point(20, -20)
                });
                

                naver.maps.Event.addListener(marker, "click", function(e) {
                    if (infowindow.getMap()) {
                        infowindow.close();
                    } else {
                        infowindow.open(map, marker);
                    }
                });


                // 유가정보 API를 사용하여 주변 주유소의 정보를 가져와 지도에 표시
                // (가정) fetchGasStations 함수는 유가정보 API를 호출하고 주유소 정보를 반환하는 함수라고 가정
                
                console.log(items[0].y, items[0].x);
                var gasStations = fetchGasStations(items[0].y, items[0].x); // 주유소 정보 가져오기
                

                var map2 = new naver.maps.Map('map2', {
           			center: new naver.maps.LatLng(items[0].y, items[0].x),
           			zoom: 16
           			});
           			var marker2 = new naver.maps.Marker({
           	   		position: new naver.maps.LatLng(items[0].y, items[0].x),
           	   		map: map2
           			});
                

                

              });

		
        // WGS84 좌표를 KATEC 좌표로 변환하는 함수
        function convertToKATEC(longitude, latitude) {
        // KATEC 좌표계 정의
        // proj4.defs("EPSG:5181", "+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=bessel +towgs84=-115.80,474.99,674.11,1.16,-2.31,-1.63,6.43 +units=m +no_defs");
        // proj4.defs("EPSG:5181", "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=GRS80 +units=m +no_defs");
         proj4.defs("EPSG:5181", "+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=bessel +towgs84=-146.43,507.89,681.46 +units=m +no_defs");
        


        // 변환 로직을 적용하여 KATEC 좌표를 얻는다.
        let wgs84Coord = [latitude, longitude]; // WGS84 좌표
        let katecCoord = proj4('EPSG:4326', 'EPSG:5181', wgs84Coord); // WGS84를 KATEC로 변환
        console.log(katecCoord); // 여기서 무한대가 되네..
        let katecX = katecCoord[0]; // KATEC X 좌표
        let katecY = katecCoord[1]; // KATEC Y 좌표

            return { x: katecX, y: katecY };
        }

        function fetchGasStations(longitude, latitude){
          let longitude1 = parseFloat(longitude);
          let latitude1 = parseFloat(latitude);
          console.log("asdf" + longitude1,latitude1)
          let katecCoord = convertToKATEC(longitude1, latitude1);
          let katecX = katecCoord.x;
          let katecY = katecCoord.y;

          var apiKey = "F240227050";
          // var baseUrl = 'https://cors.bridged.cc/http://www.opinet.co.kr/api/aroundAll.do';
          // var baseUrl = 'https://worker-solitary-snowflake-2c07.8q5nxfwfd5.workers.dev/';
          var baseUrl = 'https://cors-anywhere.herokuapp.com/http://www.opinet.co.kr/api/aroundAll.do';
          var xCoord = katecX;
          var yCoord = katecY;
          var radius = 10000; // 반경 0.5km 내 주유소 탐색
          var prodCode = 'B027'; // 휘발유 제품 코드
          var sort = 1; // 가격순으로 정렬
          
          // API 호출
          $.ajax({
            url: baseUrl,
            data: {
              code: apiKey,
              out: 'json',
              x: 315535.76499,
              y: 540150.38545,
              // x: katecX,
              // y: katecY,
              radius: radius,
              prodcd: prodCode,
              sort: sort
            },
            method: 'GET',
            success: function(response) {
              // API 응답 처리
              console.log(response);
              // 여기서 응답 데이터를 활용하여 필요한 정보를 가공하고 화면에 표시하거나 다른 작업을 수행할 수 있습니다.
            },
            error: function(error) {
              // 에러 처리
              console.error('API 호출 중 에러가 발생했습니다:',error);
            }
          });
        }

        


        //////////////////////////////////////
        ////////// 유가 정보 API /////////////
        /////////////////////////////////////
        //jQuery를 사용하여 opinet의 유가정보 API를 호출하는 예제
        
        
        









        // wgs84 좌표를 katec 좌표로 변환
        // function convertCoordinates(longitude, latitude) {
        // let wgs84Coord = [longitude, latitude]; // WGS84 좌표
        // let katecCoord = proj4('EPSG:4326', 'EPSG:5181', wgs84Coord); // WGS84를 KATEC로 변환
        // let x = katecCoord[0]; // KATEC X 좌표
        // let y = katecCoord[1]; // KATEC Y 좌표
        // console.log("변환된 좌표: ", x, y);

        // KATEC 좌표를 다시 WGS84로 역변환
    //     let reverseWgs84Coord = proj4('EPSG:5181', 'EPSG:4326', katecCoord);
    //     let reverseLongitude = reverseWgs84Coord[0]; // 역변환된 경도
    //     let reverseLatitude = reverseWgs84Coord[1]; // 역변환된 위도
    //     console.log("역변환된 좌표: ", reverseLongitude, reverseLatitude);
    // }
          
        


        //////////////////////////////////////////
        //////////// ajax 리뷰 insert ////////////
        /////////////////////////////////////////


           		function insertReview(){
           			var formData = new FormData();
           			formData.append('content', $(".rev-write textarea").val());
           			formData.append('storeNo', <%= st.getStoreNo() %>);
           			formData.append('grade', $(".grade").val());
           			formData.append('file1', $("#file1")[0].files[0]);
           			formData.append('file2', $("#file2")[0].files[0]);
           			formData.append('file3', $("#file3")[0].files[0]);

           			$.ajax({
           				url:"insert.rv",
           				type:"post",
           				data: formData,
           				processData: false,
           				contentType: false,
           				success:function(result){
           					if(result > 0){
           						$(".rev-write textarea").val("");
           						$("#titleImg").attr("src", null);
           						$("#file1").val("");
           						$("#file2").val("");
           						$("#file3").val("");
                      $(".grade").val("");

           						selectReview();
                      selectCountGrade();
           					} else{
                      alert("사진 및 내용을 입력해주세요.");
                    }
           				},
           				error:function(){
           					alert("리뷰등록이 정상적으로 이루어지지 않았습니다.");
           				}

           				})
           			}

           		/////////// 매장 평점 총 갯수 및 평균 /////////
           		function selectCountGrade(){
           			$.ajax({
           				url:"countgrade.rv",
           				type:"post",
           				data:{storeNo: <%= st.getStoreNo() %>},
           				success:function(rv){

           					let value = ""
                    let value2 = ""
           					if(rv != null){
           					value += "★" + rv.grade + "  " + rv.reviewCount + "명 평가";
                    value2 += "(" + rv.reviewCount + ")";
           					}

           					$("#countGrade").text(value);
                    $("#countReview").text(value2);
           				},
           				error:function(){
           					console.log("AJAX 통신 실패 ㅜㅜ");
           				}

           			})
           		}


           		/////////////////////////////////////
           		/////////// ajax 리뷰 select /////////
           		/////// 최근 리뷰 데이터 가져오기 /////
           		/////////////////////////////////////

           		function selectReview(){


           			$.ajax({
           				url:"select.rv",
           				method:"post",
           				data:{storeNo: <%= st.getStoreNo() %>},
           				success:function(rlist){

           						let value = "";
           						let recentUserId = "";
           						let recentContent = "";
           						let recentIssueDate = "";
           					if(rlist.length < 1){
           						value += "<div>조회된 리뷰가 없습니다.</div>"
           						recentContent += "조회된 리뷰가 없습니다."
           					} else{
           							recentUserId = rlist[0].userId;
           							recentContent = rlist[0].content;
           							recentIssueDate = rlist[0].issueDate;

           							for(let i=0; i<rlist.length; i++){
           							value += "<div class='rev-list'>"

           								     + "<div class='rev-list-id'>" + rlist[i].userId
                                if('<%= loginUser != null ? loginUser.getUserId() : "" %>' !== ''){
                                if('<%= loginUser != null ? loginUser.getUserId() : "" %>' === rlist[i].userId){
                        value += "<button onclick='deleteReview(" + rlist[i].reviewNo + ");' class='btn-warning text-danger deleteButton'>리뷰삭제</button>"
                                }}
                        value += "</div>"

           							       + "<div class='rev-list-content'>"
           							       + "<textarea cols='80' rows='5' style='border: 1px; resize: none; font-size: 15px; background-color: white;' disabled>" + rlist[i].content + "</textarea>"
           							       + "</div>"

           							       + "<div class='rev-list-date'>" + rlist[i].issueDate + "</div>"

           							       + "<a onclick='lookDiv(this);' class='rev-look'>↓리뷰사진↓</a>"

           							       + "<div class='rev-list-grade'>★" + rlist[i].grade + "</div>"
           								   + "</div>";

           							let images = "";
           							let recentImage = "";

           							if(rlist[i].imgRoot != null){
           								images = rlist[i].imgRoot;
           								imageArray = images.split(",");

           								recentImage = rlist[0].imgRoot;
           								recentImageArray = recentImage.split(",");

           								let value2 = "";

           								for(let j=0; j<imageArray.length; j++){
           						    	value2 += "<img class='rev-look-img' src='" + imageArray[j] + "'>";

           								}

           								value += "<div class='rev-look-div'>" + value2 + "</div>";
           							}


           							}
           						}
           							       $("#rev-list").html(value);
           								   $(".review_recent_2").text(recentContent);
           								   $(".review_recent_3_1").text(recentUserId);
           								   $(".review_recent_3_2").text(recentIssueDate);
           								   $("#review_recent_image").html("<img src='" + recentImageArray[0] +"' width='100%' height='220px'>");
           					},

           				error:function(){

           				}
           			})
           		}

              // 리뷰삭제 //
              function deleteReview(reviewNo){
                if(window.confirm("정말 리뷰를 삭제하시겠습니까?")){
                  $.ajax({
                     url:"delete.rv",
                     method:"post",
                     data:{reviewNo: reviewNo},
                     success:function(result){
                      if(result > 0){
                        selectReview();
                        selectCountGrade();
                      }
                    },
                    error:function(){
                      console.log("리뷰삭제 실패")
                    }
                  });
                }
            }


           		////////// 리뷰등록시 대표사진 첨부시 이미지 띄우기 ///////////
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
