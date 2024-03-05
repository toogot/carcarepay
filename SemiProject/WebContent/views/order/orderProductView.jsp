<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>

    html {/* 스크롤 부드럽게 */
    scroll-behavior: smooth;
    }

    div{box-sizing: border-box;
        /* border: 1px solid red;  */
        }
    
    ul{
        /* border: 1px solid blue; */
        margin: 0;
        padding: 0;
        text-align: center;
        height: 67px;
        list-style:none;
    }

    li{
        list-style:none;
    }

    .liClass{
        width: 200px;
        height: 66px;
        /* border: 1px solid green; */
        font-size: 20px;
        line-height: 67px;
        display: inline-block;
        cursor:pointer;
        text-align:center;
    }



    .wrap{
        
        margin: auto; 
        width: 1330px;

    } 

   
    .productOrder{
        margin-top: 60px;
		width: 1330px;
		height: 450px;
	}

    
    .productDetailImg{
        width: 1330px;
        height: 1500px;
        text-align: center;
    }
    
    .productfooter{
        width: 1330px;
        height: auto;
        /* background-color: lightgray; */
    }
    
    .productOrder>div{
        float: left;
    }
    
    .thumbnail{
        width: 50%;
        height: 100%;
        text-align: center;
    }
    
    .priceCheckTb{
        padding-left: 50px;
        padding-right: 50px;
        width: 50%;
        height: 100%;
        
    }
    
    .productPriceCheck{
        width: 100%;
        height: 36%;
        
    }
    
    .productRadioBtn{
        width: 100%;
        height:65%;
        
    }
    
    .productRadioBtn2{
        width: 100%;
        height: 35%;
        padding: 10px
    }
    
    
    .totalPrice{
        width: 100%;
        height: 60px;
        text-align: right;
        font-size: 30px;
        padding-right: 20px;
        color: rgb(85, 85, 85);
        
    }
    .totalPrice span{
        font-size: 36px;
        color: red;
        
        
    }
    
    .buyGiftBtn{
        width: 100%;
        height: 60px;
        
    }
    .productRadioBtn input{
        opacity: 0;
        position: absolute;
        
        
    }
    
    .radioBtn{
        float: left;
    }
    
    .radioBtn label{
        
        cursor: pointer;
        display : block;
        height: 100px;
        width: 122px;
        margin-right: 11px;
        font-size:20px ;
        text-align: center;
        line-height: 95px;
        color : rgb(85, 85, 85);
        border: 1px solid #D3D2D2;
        border-radius:5px;
        opacity: .5;
        
    }
    /* .radioBtn label:active{
        box-shadow: 5px 5px 10px 5px gray;
    } */
    
    .productRadioBtn input[type=radio]:checked+label{
        border: 2px solid #87CEFA;
        background-color: #87CEFA;
        color : white;
        
    }
    
    #radio05-1{
        border-radius:20px;
        border: 1px solid #D3D2D2;
        height: 35px;
        width: 230px;
        padding: 0px 20px;
        opacity: .5;
    }
    
    input[type="radio"]{
        margin: 0;
        width: 20px;
        height: 20px;
        vertical-align: middle;
        padding-top: 10px;
        
    }
    .radio05text{
        padding-right: 15px;
        
    }
    
    .radio05div{
        width: 130px;
        float: left;
    }
    input[type="text"]:focus{
        border: 2px solid #87CEFA;
        outline: 0;
        
    }
    
    #giftBtn, #buyBtn{
        width: 150px;
        height: 50px;
        border-radius:25px;
        font-size: 20px;
        background-color: white;
        border: 1px solid rgb(85, 85, 85);
        cursor: pointer;
        float: right;
        margin-right: 20px;
        margin-top: 3px;
        color: black;
    }
    
    .checkAmountQty{
        height: 60px
        /* font-size: 20px; */
        /* text-align: right; */
    }
    .checkAmountQty>div {
        display: flex;
        width: auto;
        float: right;
        box-sizing: border-box;
        
    }
    
    .checkAmountQty input[type="number"]{
        width: 28px;
        height: 25px;
        border : none;
        vertical-align: top;
        text-align : center;
    }
    
    .checkAmountQty input[type="button"]{
        /* line-height: 95px; */
        width: 30px;
        height: 30px;
        border: none;
        cursor: pointer;
        
        
    }
    
    .checkAmountQty-text{
        width: 50px;
        height: 100%;
        text-align: right;
        font-size: 20px;
        padding-top: 10px;
        padding-right: 10px;
        
    }
    
    .checkAmountQty-inputNum{
        padding-right: 20px;
        padding-top: 10px;
    }
    
    .plusBtn{
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
    }
    .minusBtn{
        border-top-left-radius: 10px;
        border-bottom-left-radius: 10px;
        
    }

    .productMenuBar{
        width: 1330px;
        height:70px;
        margin-bottom: 30px;
    }

    #productMenubar4{
        border-bottom: 3px solid #87CEFA;
    }
    #productMenubar1{
        border-bottom: 3px solid #87CEFA;
    }

    #productFooterTb{
        margin: auto;
        margin-bottom: 200px;
    }
    #productFooterTb th{
        background-color: #fafafa;
        text-align: center;
        font-size: 16px;
        color: #000;
        padding: 0;
        border-top: 1px solid #d5d5d5;
    }
    #productFooterTb td{
        border-top: 1px solid #d5d5d5;
        padding: 20px;
    }
    #productFooterTb li{
        margin-bottom: 8px;
        font-size: 12px;
    }
    #productFooterH2{
        padding: 20px;
        margin: 0;
    }


    .productRadioBtn2li{
        width: auto;
        float: right;
        padding-right: 15px;
    }
    
    #thumbnail_img{
        width: 80%;
        height: 100%;
    }

    
    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {   
        -webkit-appearance: none;
        margin: 0;}
        
    </style>

</head>
<body>
<%@ include file="/views/common/head.jsp" %>

    <div class="wrap">
            
				
                <div class="productOrder">
                    <div class="thumbnail">
                        <img id="thumbnail_img" src="resources/order/thum_payimg.png">
                    </div>
                    <div class="priceCheckTb">
                        <h3>금액선택</h3>
                        <div class="productPriceCheck">
                            <div class="productRadioBtn">
                                <div class="radioBtn">
                                    <input type="radio" id="radio01" name="radioPrice" class="radioPrice" value="50000" >
                                    <label for="radio01" style="border: 1px solid">50,000</label>
                                </div>
                                <div class="radioBtn">
                                    <input type="radio" id="radio02" name="radioPrice" class="radioPrice" value="30000">
                                    <label for="radio02" style="border: 1px solid">30,000</label>
                                </div>
                                <div class="radioBtn">
                                    <input type="radio" id="radio03" name="radioPrice" class="radioPrice" value="10000">
                                    <label for="radio03" style="border: 1px solid">10,000</label>
                                </div>
                            
                                <div class="radioBtn">
                                    <input type="radio" id="radio04" name="radioPrice" class="radioPrice" value="5000">
                                    <label for="radio04" style="border: 1px solid">5,000</label>
                                </div>
                            </div>
                            <div class="productRadioBtn2">
                                <!-- <div class="radio05div"> -->
                                <input type="radio" id="radio05" name="radioPrice" class="radioPrice" class="radioPriceBtn">
                                <label for="radio05" class="radio05text">직접 입력</label>
                                <!-- </div> -->
                                <label for="radio05"><input type="text" id="radio05-1" placeholder="구매(선물)금액 입력해주세요" maxlength="5" ></label>
                                
                                    <!-- <li class="productRadioBtn2li" style="font-size: 11px;">* 100원 단위로 입력가능 <br>* 1000원 이상 구매가능 </li> -->
                                
                            </div>
                        </div>
                    
                        <div class="checkAmountQty" >
                            <div class="checkAmountQty-inputNum" >
                                <input type="button" class="minusBtn" value="-" type="button">
                                <input type="number" class ="checkAmountQty-num" name="checkAmountQty-num" min="1" max="5" value="1" maxlength="1">
                                <input type="button" class="plusBtn" value="+" type="button">
                            </div>
                            <!-- style="border: 1px solid red;" -->
                            <div class="checkAmountQty-text">
                                <span style="color: rgb(85, 85, 85);">구매수량</span>
                            </div>

                        </div>
                        
                        <div class="totalPrice">
                            총 결제금액
                            <span id="totalPriceSpan" name="totalPriceSpan">0</span>
                            <input type="hidden" name="hiddenTotalPrice" id="hiddenTotalPrice">
                            <input type="hidden" name="hiddenRadioCheckPrice" id="hiddenRadioCheckPrice">
                            원
                        </div>
                        <div class="buyGiftBtn">
                            <!-- 로그인이 되어있을 경우 -->
                            <% if(loginUser != null) {%> 
                            <button onclick = "giftBtn()" id="giftBtn" type="submit">선물하기</button>
                            <% }else{%> 

                            <!-- 만약 로그인을 하지 않고 선물버튼 클릭시 -->
                            <button onclick = "buyGiftNotLogin()" id="buyBtn" type="submit">선물하기</button>
                            <% } %>


                            <!-- 로그인이 되어있을 경우 -->
                            <% if(loginUser != null) {%> 
                            <button onclick = "buyBtn()" id="buyBtn" type="button">충전하기</button>
                            
                            <!-- 만약 로그인을 하지 않고 충전버튼 클릭시 -->
                            <% }else{%> 
                            <button onclick = "buyGiftNotLogin()" id="buyBtn" type="submit">충전하기</button>
                        	<% } %>
                        </div>
                    </div>
                </div>
        


        <div class="productMenuBar">
            <ul>
                <li class="liClass" id="productMenubar1" onclick="location.href = '#productMenubar1'">상세보기</li>
                <li class="liClass" id="productMenubar2" onclick="location.href = '#productMenubar4'">유의사항</li>
            </ul>
        </div>


        <div id="detailImg"class="productDetailImg">
            <img src="resources/order/img_howtouse.png" alt="">
        </div>



        <div class="productMenuBar">
            <ul>
                <li class="liClass" id="productMenubar3" onclick="location.href = '#productMenubar1'">상세보기</li>
                <li class="liClass" id="productMenubar4" onclick="location.href = '#productMenubar4'" >유의사항</li>
            </ul>
        </div>
        <div id="productfooter" class="productfooter">
            <h2 id="productFooterH2">사용안내</h2>
            <table id="productFooterTb">
                <tr>
                    <th width="300px">사용시 유의사항</th>
                    <td width="1000px">
                        <li>본 상품은 분할 충전이 불가하며, 충전 시 액면 금액의 전액이 충전 됩니다.</li>
                        <li>불법적인 방법의 인증 및 도용 시도시 강력한 법적 제제를 받습니다.</li>
                        <li>잔액 범위 내에서 분할하여 사용 가능합니다. </li>
                        <li>사용여부 및 잔액조회는 홈페이지에서 확인 가능합니다.</li>
                        <li>추가 결제 금액에 대해서는 동일한 디지털상품권, 현금, 신용카드로 추가 결제 가능합니다.</li>
                    </td>
                </tr>
                <tr>
                    <th>
                        사용 가능 매장<br>
                        <a href="<%=contextPath%>/search.st?page=1">사용가능 매장조회>></a>
                    </th>
                    <td>
                        <li>제휴 맺은 매장 전국에서 사용가능</li>
                    </td>
                </tr>
                <tr>
                    <th>결제정보</th>
                    <td>
                        <li>개인신용카드 경우 월 100만원 한도 제한</li>
                        <li>할부거래 불가</li>
                        <li>소득공제 제외 대상 처리</li>
                        <li>법인카드 사용 불가 (간편결제 이슈)</li>
                    </td>
                </tr>
                <tr>
                    <th style="border-bottom: 1px solid #d5d5d5;">취소/환불 안내</th>
                    <td style="border-bottom: 1px solid #d5d5d5;">
                        <li>사용된 티켓 중 남은 잔액은 취소/환불이 불가한 상품입니다.</li>
                        <li>충전 등록 이후 취소 및 환불은 홈페이지 약관을 참고해 주시기 바랍니다.</li>
                    </td>
                </tr>
            </table>

            
        </div>
    </div>
    
    <%@ include file="/views/common/footer.jsp" %>

    <script>
        //-----------직접입력칸에 대한 함수----------------------------------------------------------------------
        $(function(){


            //직접입력칸에 숫자만 입력되게 하는 함수
            $("#radio05-1").on("input",function(){
                $(this).val($(this).val().replace(/[^0-9]+$/, ''));
            })

            //100원단위로 입력받게하는 함수
            $('#radio05-1').on('change', function() {
                let inputNum = Number($(this).val());
                if(!/00$/.test(inputNum)){ //$끝자리가 00이 아닌 경우 //03_JAVASCRIPT - 12_정규표현식
                    alert('100원 단위로 입력 가능합니다');
                    $("#radio05-1").val("");
                    $("#totalPriceSpan").text(0);
                }
                if(inputNum<1000){ //1000원 미만으로 값을 입력할 경우
                    alert('1000원이상 구매가능합니다');
                    $("#radio05-1").val("");
                    $("#totalPriceSpan").text(0);
                }

                
            })

        });
        //-----------------------------------------------------------------------------


        //------------------------수량증감버튼--------------------------------//
        $(function(){

            //직접입력칸 클릭시 직접입력 라디오버튼 체크되는 함수
            $("#radio05-1").click(function() {
            $("#radio05").prop("checked", true);
            $(".checkAmountQty-num").val(1);
                
            });
        

            //5000,10000,30000,50000원 클릭시 직접입력칸에 들어가있던 숫자 비워주는 함수
            $(".productRadioBtn label").click(function(){
                $("#radio05-1").val("");
                $(".checkAmountQty-num").val(1); //상품수량 1로 바꿔줌
            })

            // 선택된 라디오 버튼의 값을 가져와서 콘솔에 출력
            $('input[type="radio"]').change(function(){
            var selectedValue = $('input[type="radio"]:checked').val();
            $('#hiddenRadioCheckPrice').val(selectedValue);
            $('#hiddenTotalPrice').val(selectedValue);
            console.log("hidden토탈프라이스콘솔ㄱ"+($('#hiddenRadioCheckPrice').val()));
            });

            //직접입력칸에 숫자입력시 얼마인지 나오게하는 함수
            $("#radio05-1").keyup(function(){
                $('#totalPriceSpan').text(Number($('#radio05-1').val()));
                $('#hiddenTotalPrice').val(Number($('#radio05-1').val()));
                $('#radio05').val($('#radio05-1').val());
                $("#hiddenRadioCheckPrice").val($('#radio05').val());
                console.log("잘되고잇냐고ㅜㅜ"+($("#radio05").val()));
                console.log("hidden토탈프라이스콘솔ㅅ"+($('#hiddenTotalPrice').val()));
                
            })

            
            let checkAmountQty = 1;
            let totalPrice = 0;
            let inputNum = 0;
            
            // 플러스 버튼 클릭시
            $(".plusBtn").click(function(){

            if($("#radio05-1").val() == ""){ // empty 
                checkAmountQty = Number($(".checkAmountQty-num").val()) //수량에대한 val
                totalPrice = $('input[name="radioPrice"]:checked').val() //클릭한 라디오버튼에 대한 val

                if($('input[name="radioPrice"]').is(":checked") == true){ // 라디오버튼이 클릭 상태일때만
                    if(checkAmountQty > 0 && checkAmountQty<5){ //수량이 1개이상이고 5개 미만일때
                        checkAmountQty += 1; //수량을 추가해준다
                        $(".checkAmountQty-num").val(checkAmountQty); //class가 checkAmountQty-num요소에 추가된 수량을 입력해준다
                        $('#totalPriceSpan').text(totalPrice * checkAmountQty); // 아이디가 #totalPriceSpan인 요소에 라디오버튼 val값과 수량의 값을 곱해서 대입시켜준다 // span의 값이 변경되는 코드 // 수량과 금액을 곱해서 총금액을 알려주는 코드
                        $('#hiddenTotalPrice').val(totalPrice * checkAmountQty);
                        console.log("hidden토탈프라이스콘솔ㄴ"+($('#hiddenTotalPrice').val()));
                    }
                }
            }else { //직접입력했을때
                inputNum = Number($("#radio05-1").val());
                if(checkAmountQty > 0 && checkAmountQty<5){ //수량이 1개이상이고 5개 미만일때
                    checkAmountQty += 1; //수량을 추가해준다
                    $(".checkAmountQty-num").val(checkAmountQty); //class가 checkAmountQty-num요소에 추가된 수량을 입력해준다
                    $('#totalPriceSpan').text(inputNum * checkAmountQty); // 아이디가 #totalPriceSpan인 요소에 라디오버튼 val값과 수량의 값을 곱해서 대입시켜준다 // span의 값이 변경되는 코드 // 수량과 금액을 곱해서 총금액을 알려주는 코드
                    $('#hiddenTotalPrice').val(inputNum * checkAmountQty);
                    console.log("hidden토탈프라이스콘솔ㄷ"+($('#hiddenTotalPrice').val()));
                
                }
            }
            })

            // 마이너스 버튼 클릭시
            $(".minusBtn").click(function(){
                if($("#radio05-1").val() == ""){ // empty 
                    checkAmountQty = Number($(".checkAmountQty-num").val()) //수량에대한 val
                    totalPrice = $('input[name="radioPrice"]:checked').val() //클릭한 버튼에 대한 val

                    if($('input[name="radioPrice"]').is(":checked") == true){ // 라디오버튼이 클릭 상태일때만
                        if($(".checkAmountQty-num").val() > 1){
                            checkAmountQty -=1;
                            $(".checkAmountQty-num").val(checkAmountQty);
                            $('#totalPriceSpan').text(totalPrice * checkAmountQty);
                            $('#hiddenTotalPrice').val(totalPrice * checkAmountQty);
                            console.log("hidden토탈프라이스콘솔ㄹ"+$('#hiddenTotalPrice').val());
                        }
                    }
                }else{ //직접입력했을때
                    inputNum = Number($("#radio05-1").val());
                    if(checkAmountQty > 1){
                        checkAmountQty -=1;
                        $(".checkAmountQty-num").val(checkAmountQty);
                        $('#totalPriceSpan').text(inputNum * checkAmountQty);
                        $('#hiddenTotalPrice').val(inputNum * checkAmountQty);
                        console.log("hidden토탈프라이스콘솔ㅁ"+$('#hiddenTotalPrice').val());
                    }
                }
            })

            $('input[name="radioPrice"]').click(function() { //라디오버튼 클릭시 span에 들어가는 값
                checkAmountQty = Number($(".checkAmountQty-num").val()) //수량에대한 val
                totalPrice = $('input[name="radioPrice"]:checked').val() //클릭한 버튼에 대한 val
                $('#totalPriceSpan').text(checkAmountQty * totalPrice);
            });
            //------------------------수량증감버튼--------------------------------//
           

            



        });

	function buyGiftNotLogin(){ //로그인되어있지 않고 충전&선물버튼 클릭시
		alert("로그인이 필요한 서비스 입니다.");
		location.href = "<%=contextPath%>/loginForm.me"
	}
	

    
	
	function buyBtn(){ //로그인되어있고 충전버튼 클릭시
		if($('input[name="radioPrice"]:checked').val() !=null){ //금액설정시
            
            console.log($(".checkAmountQty-num").val());
            $.ajax({
            	url:"orderdetail.bo",
            	data:{
            		price:$("#hiddenRadioCheckPrice").val(),
            		totalprice:$('#hiddenTotalPrice').val(),
            		qty:$(".checkAmountQty-num").val()
            		
            	},
            	type:"post",
            	success:function(result){
            		if(result>0){
            			moveOrderDetail();
            		}
            	},error:function(){
            		console.log("ajax 실패 ㅜㅜ")
            	}
            	
            })

            
        }else{ //금액미설정시
            alert("금액을 선택해주세요.");
        }
	}

    function giftBtn(){ //로그인 되어있고 선물버튼 클릭시
        if($('input[name="radioPrice"]:checked').val() !=null){ //금액설정시
             
             location.href = "<%=contextPath%>/ordergiftdetail.bo"

        }else{ //금액미설정시
            alert("금액을 선택해주세요.");
        }
    }

    
    function moveOrderDetail(){    	
    	location.href = "<%=contextPath%>/orderdetail2.bo"

   }


   

    </script>
</body>
</html>