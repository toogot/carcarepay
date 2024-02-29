<%@page import="com.kh.semi.order.model.vo.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        div{
            <!--border: 1px solid red;-->
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

       
        @font-face {
        font-family: 'NanumSquareNeo-Variable';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        }
        body {
        font-family: 'NewFont',NanumSquareNeo-Variable !important;
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
                충전하기
                </h1>
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
                <h3>사용자 정보</h3>
                <table>
                    <tr>
                        <th>이름</th>
                        <td class="product_info_bottom"><%= userName %></td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td class="product_info_bottom"><%=phone %></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><%= email %></td>
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
                    <!-- <ul class="payment_ul"> -->
                        <!-- <li> -->
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
                            
                            <!-- </li> -->
                            <!-- <li> -->

                            <!-- </li> -->
                            <!-- <li> -->

                            <!-- </li> -->
                            <!-- <li> -->

                            <!-- </li> -->
                        <!-- </ul> -->
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
                <h2 class="order_btn_red" style="border: 1px solid white;">결제하기</h2>
            </div>
            <p class="fixedpr_text">하기 필수약관을 확인하였으며 결제에 동의합니다.</p>

        </div>





    </div>
    
    <%@ include file="/views/common/footer.jsp" %>
    
    
    <script>
    let o;
    
        $(function(){
		
            $.ajax({
            	url:"orderdetail3.bo",
            	type:"post",
            	success:function(o){
            		console.log(o);
					 let price = o.price;
					 let qty = o.qty;
					 let totalPrice = o.totalPrice;
					 $("#price").html(price);
                     $("#totalPrice").html(totalPrice);
                     $("#qty").html(qty);
                     $("#totalPriceSpan").html(totalPrice);

                     // 다른 함수에서도 o를 사용할 수 있음
                     updatePageWithData(o);
            	},error:function(){
            		console.log("ajax 실패 ㅜㅜ")
            	}
            	
            })

        })
    
        // 전역 변수 o를 활용하여 페이지 업데이트
        function updatePageWithData(o) {
            console.log("전역변수 성공?? : " + o);
            console.log(o);
        }
        
    
    
    
    </script>
</body>
</html>