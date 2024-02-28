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
                <img id="1" src="https://media.istockphoto.com/id/1576797009/ko/%EC%82%AC%EC%A7%84/%EC%A0%84%EB%AC%B8%EC%A0%81%EC%9C%BC%EB%A1%9C-%EA%B3%A0%EA%B0%9D%EC%9D%98-%EC%B0%A8%EB%A5%BC-%EC%84%B8%EC%B0%A8%ED%95%98%EB%8A%94-%EC%84%B8%EC%B0%A8-%EC%A7%81%EC%9B%90.jpg?s=2048x2048&w=is&k=20&c=pYKoPUXkKAWdVY3mNa-6oXN4Ia_C-DdEelIChKpMsaw=">
                <img id="2" src="https://media.istockphoto.com/id/1444837874/ko/%EC%82%AC%EC%A7%84/%EC%85%80%ED%94%84-%EC%84%9C%EB%B9%84%EC%8A%A4-%EC%84%B8%EC%B0%A8%EC%9E%A5-%EC%9E%91%EC%97%85-%EC%A0%90%ED%94%84-%EC%8A%88%ED%8A%B8%EB%A5%BC-%EC%9E%85%EC%9D%80-%EB%82%A8%EC%9E%90%EA%B0%80-%ED%98%B8%EC%8A%A4%EC%97%90%EC%84%9C-%EC%B0%A8%EB%A5%BC-%EC%94%BB%EC%8A%B5%EB%8B%88%EB%8B%A4.jpg?s=2048x2048&w=is&k=20&c=NFY7-Iq5lOXWmC_gFt-ROxpHpI3mlhjClu88bV53jfs=">
                <img id="3" src="https://media.istockphoto.com/id/1629232839/ko/%EC%82%AC%EC%A7%84/%EC%9E%90%EB%8F%99-%EC%84%B8%EC%B2%99-%EB%B8%94%EB%A3%A8-%EB%B8%8C%EB%9F%AC%EC%8B%9C%EA%B0%80-%EC%9E%91%EB%8F%99%ED%95%98%EB%A9%B4-%ED%9D%B0%EC%83%89-%EC%9E%90%EB%8F%99%EC%B0%A8%EA%B0%80-%EA%B9%A8%EB%81%97%ED%95%98%EA%B2%8C-%EB%82%98%EC%98%B5%EB%8B%88%EB%8B%A4.jpg?s=2048x2048&w=is&k=20&c=McWmrACNY67aBmG2XpVaSAp111_Z7mf48voYFqkxKys="> 
                <img id="4" src="https://cdn.pixabay.com/photo/2016/05/22/13/30/car-wash-1408492_1280.jpg">
                <img id="5" src="https://cdn.pixabay.com/photo/2016/11/14/02/34/auto-1822415_1280.jpg">
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