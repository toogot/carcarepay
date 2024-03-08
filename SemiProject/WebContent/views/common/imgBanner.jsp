<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<style>
	#imgbanner{
            width: 100%;
            height: 500px;
    		position: relative;
    		margin-top: 10px;
        }
        #imgarea{
            width: 100%;
            height: 100%;
        }
        #imgarea>img{
            width: 100%;
            height: 100%;;
            display: none;
            
        }
        #img_before,#img_after{
            width: 100px;
            height: 100px;
            background-color: transparent;
            border: 0px;
            position: absolute;
            margin-top: 200px;
            font-size: 50px;
            font-weight: 900;
            color: transparent;

        }
        #img_before{
            left: 0;
            
        }
        #img_after{
            right: 0;
            
        }

        /* 이미지배너 끝 */
	</style>
</head>
<body>

	<!-- 컨텐츠부분 -->
            <!--이미지 배너쪽  -->
		
        <div id="imgbanner">
            <button id="img_before"><</button>
            <button id="img_after">></button>
            <div id="imgarea">
                <img id="1" src="resources/images/처음.png">
                <img id="2" src="resources/images/두번째.png">
                <img id="3" src="resources/images/세번째.png"> 
                <img id="4" src="resources/images/네번째.png">
                <img id="5" src="resources/images/다섯번째.png">
            </div>  
        </div>
        <script >

     		$(function(){
     		// 이미지배너

     	        $("#imgbanner").children().hover(function(){
     	            $(this).css("color","white")
     	        },function(){
     	            $(this).css("color","")
     	        })
     	        $("#1").show();
     	        let imgarr = $("#imgarea>img");
     	        // console.log(imgarr);
     	        for(let i=0;i<imgarr.length;i++){
     	            console.log(imgarr[i].src);
     	        }
     	        // transform: translate();
     	        $("#img_after").click(function(){
     	            
     	            if($("#1").css("display")=="inline"){
     	                $("#1").css("display","none")
     	                $("#2").show();
     	            }else if($("#2").css("display")=="inline"){
     	                $("#2").css("display","none")
     	                $("#3").show();
     	            }else if($("#3").css("display")=="inline"){
     	                $("#3").css("display","none")
     	                $("#4").show();
     	            }else if($("#4").css("display")=="inline"){
     	                $("#4").css("display","none")
     	                $("#5").show();
     	            }else if($("#5").css("display")=="inline"){
     	                $("#5").css("display","none")
     	                $("#1").show();
     	            }         
     	         })
				 
     	         $("#img_before").click(function(){
     	            if($("#1").css("display")=="inline"){
     	                $("#1").css("display","none")
     	                $("#5").show();
     	            }else if($("#5").css("display")=="inline"){
     	                $("#5").css("display","none")
     	                $("#4").show();
     	            }else if($("#4").css("display")=="inline"){
     	                $("#4").css("display","none")
     	                $("#3").show();
     	            }else if($("#3").css("display")=="inline"){
     	                $("#3").css("display","none")
     	                $("#2").show();
     	            }else if($("#2").css("display")=="inline"){
     	                $("#2").css("display","none")
     	                $("#1").show();
     	            }   
     	                  
     	         })
     	        
     	       
     	        // 이미지배너 끝
     		})
        </script>
</body>
</html>