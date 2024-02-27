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
            border: 1px solid red;
            box-sizing: border-box;
        }
        .outer{
            width: 1330px;
            height: 1500px;
            margin: auto;
        }
        .info_section{
            margin: 120px 0;
            width: 1000px;
        }

        .titleArea{
            width: 1330px ;
            padding: 20px;
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
            line-height: 40px;
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
            font-size: 13px;
            
        }
        table td{
            height: 50px;

        }
        table th{
            width: 15%;
            height: 50px;
            
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
            
        }

        .totlaPrice_div2{
            text-align: right;
            padding-right: 20px;
            padding-bottom: 15px;
            font-size: 30px;
            font-weight: 500;
            color: white;
        }

        #totalPrice{
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
            border: 2px solid #87CEFA;
            border-radius: 10px;
            width: 100px;
            height: 50px;
            text-align: center;
            line-height: 50px;
            cursor: pointer;

            
        }
        #payment_h2{
            float: left;
            /* padding-top: 50px; */
            
        }
        /* #payment_type_div{
            padding-top: 52px;
        } */
        #payment_div{
            width: 1000px;
            height: 100px;
            border: 5px solid seagreen;
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

    </style>
</head>
<body>
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
                        <td class="product_info_bottom">조연정</td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td class="product_info_bottom">010-1111-1111</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>ddd@ddd.ddd</td>
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
                        <th class="product_info_tb_th">10000</th>
                        <th class="product_info_tb_th">1</th>
                        <th>10000</th>
                    </tr>
                </table>
            </div>

            <div class="info_section" id="payment_div">
                <h2 class="h2class" id="payment_h2">결제방법</h2>

                    <ul class="payment_ul">
                        <li><button>카카오페이</button></li>
                        <li><button>토스</button></li>
                        <li><button>네이버페이</button></li>
                        <li><button>신용카드</button></li>
                    </ul>

            </div>
        </div>

        <div class="fixedpr">
            <div class="totlaPrice_info" style="background-color: #87CEFA;">
                <div class="totlaPrice_div1">
                    <h2 class="h2class" style="color: white;">총 결제금액</h2>
                </div>
                <div class="totlaPrice_div2" style="border: 1px solid purple;">
                    <span id="totalPrice" >10000</span>
                    <span>원</span>
                </div>
            </div>
            
            <div class="order_btn">
                <h2>결제하기</h2>
            </div>
            <p class="fixedpr_text">하기 필수약관을 확인하였으며 결제에 동의합니다.</p>

        </div>





    </div>
</body>
</html>