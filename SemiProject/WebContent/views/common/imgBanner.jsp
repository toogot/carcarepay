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
                <img id="1" src="https://media.istockphoto.com/id/1476161689/ko/%EC%82%AC%EC%A7%84/%EB%8F%84%EC%8B%9C%EC%9D%98-%EA%B8%B8%EA%B0%80%EC%97%90-%ED%8F%AC%EC%8A%A4%ED%84%B0%EB%A5%BC-%EA%B1%B8%EA%B3%A0-%EA%B0%80%EB%A1%9C%EB%93%B1-%EA%B8%B0%EB%91%A5%EC%97%90-%EB%AC%B4%EC%84%B1%ED%95%9C-%EB%85%B9%EC%83%89-%EB%82%98%EB%AC%B4%EC%99%80-%EC%8B%9D%EB%AC%BC%EC%97%90-%EB%8C%80%ED%95%9C-%EB%B9%88-%EC%88%98%EC%A7%81-%EA%B4%91%EA%B3%A0-%EB%B0%B0%EB%84%88-ooh%EC%9D%98-%EA%B2%BD%EC%9A%B0-%EC%A7%91-%ED%85%9C%ED%94%8C%EB%A6%BF-%EB%AA%A8%ED%98%95.jpg?s=2048x2048&w=is&k=20&c=hJywO1MXtDuis1jSY_91mP55SikFbn6akEGS_pzRcl4=">
                <img id="2" src="https://cdn.pixabay.com/photo/2015/12/05/08/25/fantasy-1077863_640.jpg">
                <img id="3" src="https://cdn.pixabay.com/photo/2016/10/20/18/35/earth-1756274_640.jpg"> 
                <img id="4" src="https://cdn.pixabay.com/photo/2018/05/18/16/41/globe-3411506_640.jpg">
                <img id="5" src="https://cdn.pixabay.com/photo/2017/07/02/00/43/bundestag-2463236_640.jpg">
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