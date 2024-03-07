<%@page import="com.kh.semi.order.model.vo.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
<!-- 포트원 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 포트원 결제 -->
    
    <style>
        div{
            /* border: 1px solid red; */
            box-sizing: border-box;
        }
        .outer{
            width: 1330px;
            height: 1500px;
            margin: auto;
        }
        .info_section{
            margin: 60px 0;
            width: 1000px;
        }

        .titleArea{
            width: 1330px ;
            padding: 50px;
        }
        .orderTitle{
            display: inline-block;
        }
        .orderStep{
            float: right;
        }
        li{
            display: inline-block;
            padding: 0 10px;
        }
        .orderStep1{
            padding-left: 15px;
        }
        .orderStep2{
            border: 1px solid #87CEFA;
            padding: 0 18px;
            background-color:#87CEFA;
            color: white;
        }
        .orderStep3{
            padding-right: 15px;
        }

        .orderStepUl{
            /* line-height: 40px;  기존 */
            line-height: 50px;
            border: 1px solid #b2b8bd;
            border-radius: 40px;
        }
        ul,h1{
            padding: 0;
            margin: 0;
        }
        h1{
            /* border: 1px solid blue; */
        }

        #buyer{
            height: auto;
        }
        table{
            margin: 20px;
            border-top: 2px #959da6 solid;
            width: 100%;
            border-bottom: 1px #dfe2e6 solid;
            /* font-size: 13px; 기존*/
            font-size: 16px

            
        }
        table td{
            /* height: 50px; 기존 */
            height: 65px;
            

        }
        table th{
            width: 15%;
            /* height: 50px; 기존 */
            height: 70px;
            
        }
        h3{
            padding: 10px 0;
            padding-left: 20px;
        }
        .h2class{
            padding: 10px 0;
            padding-left: 20px;
        }
        .product_info_tb_th{
            border-right: 1px solid #dfe2e6;
        }
        .product_info_bottom{
            border-bottom: 1px #dfe2e6 solid;
        }
        .fixedpr{
            margin: 120px 0;
            width: 328px;
            top:0px;
            position: sticky;
            float: left;
            padding-left: 50px;
        }
        .fixedpr1{
            
            width: 1000px;
            box-sizing: border-box;
            float: left;
        }
        .order_btn{

            padding: 1px;
            background-color: #ff0038;
            color: white;
            text-align : center;
            margin-top: 20px;
            height: 60px;
            cursor: pointer;
            
        }

        .totlaPrice_div2{
            text-align: right;
            padding-right: 20px;
            padding-bottom: 15px;
            font-size: 30px;
            font-weight: 500;
            color: white;
        }

        #totalPriceSpan{
            font-size: 45px;
            font-weight: 500;
            color: white;
            border: 1px solid blue;
        }
        .fixedpr_text{
            font-size: 12px;
            color: #959da6;
        }
        .payment_ul{
            /* float: left; */
            border: 1px solid purple;
            padding-top: 10px;
            padding-left: 15px;
            /* width: auto; */
            
        }
        .payment_ul>li{
            /* border: 2px solid #87CEFA; */
            border-radius: 10px;
            width: 120px;
            height: 55px;
            text-align: center;
            line-height: 55px;
            cursor: pointer;  
        }

        label{

            /* border: 2px solid #87CEFA; */
            border-radius: 10px;
            width: 120px;
            height: 55px;
            line-height: 55px;
            cursor: pointer;  
            position: relative;
        }

        #payment_h2{
            /* float: left; */
            /* padding-top: 50px; */
            
        }
        /* #payment_type_div{
            padding-top: 52px;
        } */
        #payment_div{
            width: 1000px;
            height: 100px;
            /* border: 5px solid seagreen; */
            float: left;
            box-sizing: border-box;            
        }

        button {
        width: auto;
        border: 0;
        padding: 0;
        font-weight: normal;
        border: 0;
        background: transparent;
        cursor: pointer;
        outline: none;
        }
        th{
            text-align: center !important;

        }
        .order_btn_red{
            line-height: 60px;
            /* cursor: pointer; */
            
        }
        label{
            cursor: pointer;
        }
        
        /* input[type=radio]{
            position: relative;

        } */
        #payment_div2{
            float: left;
            /* display: flex; */
        }

        input[type=text]{
            width: 300px;
        }

        .gift_input_bottom_div{
            font-size: 10px;
            color: rgba(196, 5, 5, 0.823);
        }
        
        h6{
        	font-weight : bold;
        	color : red;
        }

       
        @font-face {
        font-family: 'NanumSquareNeo-Variable';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        }
        body {
        font-family: 'NewFont',NanumSquareNeo-Variable;
        }

    </style>
</head>
<body>

<%@ include file="/views/common/head.jsp" %>

<%
    	String userId = loginUser.getUserId();
    	String userName = loginUser.getUserName();
    	String phone = loginUser.getPhone(); 
    	String email = loginUser.getEmail();
    	int userNo = loginUser.getUserNo();
%>


    <div class="outer">
        
        <div class="titleArea">
            <div class="orderTitle">
                <h1>
                선물하기
                </h1>
                <h6>* 카카오톡으로 회원가입한 회원에게는 선물할 수 없습니다</h6>
            </div>
            <div class="orderStep">
                <ul class="orderStepUl">
                    <li class="orderStep1" style="color: #b2b8bd;">01상품선택</li> 
                    <li class="orderStep2">02주문결제</li>
                    <li class="orderStep3" style="color: #b2b8bd;">03결제완료</li>
                </ul>
            </div>
            
        </div>
        <div class="fixedpr1">
            <div class="info_section" id="buyer">
                <h3>선물받는 사용자 정보</h3>
                <table>
                    <tr>
                        <th>이름</th>
                        <td class="product_info_bottom"><input type="text" id="gift_name" placeholder="받으시는 분 성함을 입력해주세요" maxlength="4" required>
                            <br>
                            <div class="gift_input_bottom_div" id="gift_name_bottom_div"></div>
                        </td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td class="product_info_bottom"><input type="text" id="gift_phone" placeholder="000-0000-0000"  maxlength="13" required></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><input type="text" id="gift_email" placeholder="ID@email.com"></td>
                    </tr>
                </table>
            </div>
            
            <div class="info_section" id="product_info">
                <h3>주문 상품 정보</h3>
                <table>
                    <tr>
                        <th class="product_info_tb_th product_info_bottom">충전금액</th>
                        <th class="product_info_tb_th product_info_bottom">수량</th>
                        <th class="product_info_bottom">총 충전금액</th>
                    </tr>
                    <tr>
                        <th id="price" class="product_info_tb_th"></th>
                        <th id="qty" class="product_info_tb_th"></th>
                        <th id="totalPrice"></th>
                    </tr>
                </table>
            </div>

            <div class="info_section" id="payment_div">

                <h2 class="h2class" id="payment_h2">결제방법</h2>

                    <div id="payment_div2" > 
                        <table>
                            <tr>
                                <th>
                                    <div >
                                        <input type="radio" class="payment_radioGR" name="payment_type" id="payment_kakaopay">
                                        <label for="payment_kakaopay"><img src="resources/order/ico_kakaopay.png" alt="카카오페이"></label>
                                    </div>
                                </th>
                                <th>
                                    <div>
                                        <input type="radio" class="payment_radioGR" name="payment_type" id="payment_toss">
                                        <label for="payment_toss"><img src="resources/order/ico_tosspay.png" alt="토스"></label>
                                    </div>
                                </th>
                                <th>
                                    <div>
                                        <input type="radio" class="payment_radioGR" name="payment_type" id="payment_naverpay">
                                        <label for="payment_naverpay"><img src="resources/order/ico_naverpay.png" alt="네이버페이"></label>
                                    </div>
                                </th>
                                <th>
                                    <div>
                                        <input type="radio" class="payment_radioGR" name="payment_type" id="payment_credit_card">
                                        <label for="payment_credit_card">신용카드</label>
                                    </div>
                                </th>
                            </tr>
                        
                        </table>
                    </div>       
            </div>
        </div>

        <div class="fixedpr">
            <div class="totlaPrice_info" style="background-color: #87CEFA;">
                <div class="totlaPrice_div1">
                    <h2 class="h2class" style="color: white;">총 결제금액</h2>
                </div>
                <div class="totlaPrice_div2" style="border: 1px solid purple;">
                    <span id="totalPriceSpan" ></span>
                    <span>원</span>
                </div>
            </div>
            
            <div class="order_btn">
                <h2 class="order_btn_red"  style="border: 1px solid white;">결제하기</h2>
       gift_phone     </div>
            <p class="fixedpr_text">하기 필수약관을 확인하였으며 결제에 동의합니다.</p>

        </div>





    </div>
    
    <%@ include file="/views/common/footer.jsp" %>
    
    
    <script>
        let o;

        $(function(){
            $("#gift_phone").on("input", function(){
                var phoneNum = $(this).val().replace(/[^0-9]/g, ''); // 숫자만 남기고 다른 문자는 제거
                var formattedNum;

                // 핸드폰 번호 형식에 맞게 "-" 추가
                if (phoneNum.length >= 4 && phoneNum.length < 7) {
                    formattedNum = phoneNum.substr(0, 3) + '-' + phoneNum.substr(3);
                } else if (phoneNum.length >= 7 && phoneNum.length < 11) {
                    formattedNum = phoneNum.substr(0, 3) + '-' + phoneNum.substr(3, 4) + '-' + phoneNum.substr(7);
                } else if (phoneNum.length >= 11) {
                    formattedNum = phoneNum.substr(0, 3) + '-' + phoneNum.substr(3, 4) + '-' + phoneNum.substr(7, 4);
                } else {
                    formattedNum = phoneNum;
                }

                $(this).val(formattedNum);
            });
        });


            $(function(){
                $("#gift_phone").focus(function(){
                    if($("#gift_name").val() == ""){
                        $("#gift_name_bottom_div").text("* 이름을 입력해주세요");
                    }else{
                        $("#gift_name_bottom_div").text("");
                    }
                })
                
            })

        
            $(function(){
            
                $.ajax({
                    url:"ordergiftdetail3.bo",
                    type:"post",
                    success:function(o){
                        console.log(o);
                        let price = o.price;
                        let qty = o.qty;
                        let totalPrice = o.totalPrice;
                        let email = o.email;
                        let phone = o.phone;
                        let orderNo = o.orderNo;
                        $("#price").html(price);
                        $("#totalPrice").html(totalPrice);
                        $("#qty").html(qty);
                        $("#totalPriceSpan").html(totalPrice);

                        $(".order_btn_red").click(function(){//결제하기 버튼 클릭시

                            var radioval = document.querySelector("input[type=radio]:checked") //체크된 라디오버튼의 값을 넣어줌

                            if(!radioval){ // 아무것도 선택하지 않았을 시
                            alert("결제방식을 선택해주세요");

                            }else if(radioval.id == "payment_kakaopay"){ //카카오페이 선택
                                
                                payment_kakaopay(o);

                            }else if(radioval.id == "payment_toss"){ // 토스페이 선택
                                payment_toss(o);

                            }else if(radioval.id == "payment_naverpay"){ //네이버페이 선택
                                payment_naverpay(o);

                            }else if(radioval.id == "payment_credit_card"){ //신용카드 선택
                                payment_credit_card(o);
                            }

                            })
                        
                    },error:function(){
                        console.log("ajax 실패 ㅜㅜ")
                    }
                    
                })

            })




       
        
        
        
    </script>
</body>
</html>