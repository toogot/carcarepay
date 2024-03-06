<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 포트원 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 포트원 결제 -->

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

<div class="order_btn">
    <h2 class="order_btn_red" onclick="requestPay()" style="border: 1px solid white;">결제하기</h2>
</div>



<script>


        function requestPay() {
        	var radioval = document.querySelector("input[type=radio]:checked") 
        	if(!radioval){
        		alert("결제방식을 선택해주세요");
        	}else if(radioval.id == "payment_kakaopay"){
                payment_kakaopay();
        		
        	}else{
                
            }
        	

                
            }
	
        
        
        
        
        var IMP = window.IMP; 
        IMP.init("imp21168814"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        
            function payment_kakaopay(){
                IMP.request_pay({
                    pg : 'kakaopay',
                    merchant_uid: "IMP"+makeMerchantUid, 
                    name : '당근 10kg',
                    amount : 1004,
                    buyer_email : 'Iamport@chai.finance',
                    buyer_name : '아임포트 기술지원팀',
                    buyer_tel : '010-1234-5678',
                // buyer_addr : '서울특별시 강남구 삼성동',
                //buyer_postcode : '123-456'
                }, function (rsp) { // callback
                    if (rsp.success) {
                         $.ajax({
                         type: "GET",
                         url: 'carcarepay_success',
                         data: {
                         amount: bookMoney,
                         imp_uid: rsp.imp_uid,
                         merchant_uid: rsp.merchant_uid
                         }
                         });
                    } else {
                        console.log(rsp);
                    }
                });
            }

     

</script>
</body>
</html>