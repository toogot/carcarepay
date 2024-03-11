<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div{
           /* border: 1px solid red; */
            box-sizing: border-box;
        }
        .outer{
            width: 1330px;
            margin: auto;
        }

        .titleArea{
            width: 1330px ;
            padding: 50px;
            border-bottom: 1px solid #b2b8bd;
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
            border-right: 1px solid #b2b8bd;
        }
        .orderStep2{

            padding: 0 18px;
        }
        .orderStep3{
            padding-right: 15px;
            background-color:#87CEFA;
            color: white;
            border: 1px solid #87CEFA;
            border-top-right-radius: 40px;
            border-bottom-right-radius: 40px;
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
        .order_content_wrap{
            width: 1330px ;
            height: 350px;
            /* background-color: aliceblue; */
        }
        .order_complete_txt{
            text-align: center;
            padding-bottom: 50px;
            padding-top: 50px;
            font-size: 30px;
            font-weight: bold;
        }
        .order_complete_img{
            text-align: center;

        }
        .order_complete_top{
            height: 100px;
        }
        .button_wrap{
            text-align: center;
            padding-bottom: 200px;
        }
        .order_bottom_area{
            padding-top: 60px;
        }
        .order_btn{
            font-size: 20px;
            padding: 10px;
            cursor: pointer;
            display: inline-block;
            height: 50px;
            width: 180px;
            border: 1px solid black;
            color: black;
        }
        .type2{
            margin-left: 20px;
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
    
    <div class="orderArea">
        <div class="titleArea">
            <div class="orderTitle">
                <h1>
                결제완료
                </h1>
            </div>
            <div class="orderStep">
                <ul class="orderStepUl">
                    <li class="orderStep1" style="color: #b2b8bd;">01상품선택</li> 
                    <li class="orderStep2" style="color: #b2b8bd;">02주문결제</li>
                    <li class="orderStep3">03결제완료</li>
                </ul>
            </div>
        </div>
        <div class="order_content_wrap">
            <div class="order_complete_top">

            </div>
            <div class="order_complete_img">
                <img src="resources/order/ico_ordercomplete.png" alt="결제완료이미지">

            </div>
            <div class="order_complete_txt">
            <p>감사합니다. 결제가 완료되었습니다.</p>
            </div>
        </div>
    </div>    

    <div class="order_bottom_area">
        <div class="button_wrap">
            <span class="order_btn" onclick="location.href='<%=contextPath%>'">홈으로</span>
            <span class="order_btn type2"  onclick="location.href='<%=contextPath%>'">마이페이지</span>
        </div>
    </div>




</div>

<%@ include file="/views/common/footer.jsp" %>


<script>
    $(function(){

        $.ajax({
            url:"memberCashUpdate",
            data:{userNo:<%=userNo%>},
            type:"post",
            success:function(result){
                if(result>0){
                    console.log("멤버캐시업데이트 성공!")
                }else{
                    console.log("먼가 실패함..")
                }
                
            },error:function(){
                console.log("ajax통신실패 ㅠㅠ")
            }

        })

    })

</script>
</body>
</html>