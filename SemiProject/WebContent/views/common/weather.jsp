<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="resources/css/weather-icons.min.css">
<style>
    #weather{
                width: 700px;
                height: 200px;
                margin: auto;
                border: 2px solid #87CEFA;
                margin-top: 10px;
                background-color: #87CEFA;
            }
    #weather-icon{
        width: 30%;
        height: 100%;
        float: left;
    }
    #weather-icon>img{
        width: 80%;
        height: 80%;
        margin: 15px;
    }
    #weather-info{
        width: 70%;
        height: 100%;
        float: left;
        color: white;
    }
    #temp{
        width: 50%;
        height: 50%;
        font-size: 50px;
        font-weight: 800;
        text-align: center;
        line-height: 160px;
        float: left;
    }
    #temp>span{
    	font-size: 70px;
    }
    #tempMinMax{
        width: 50%;
        height: 50%;
        float: left;
    }
    #tempMax,#tempMin{
        width: 100%;
        height: 50%;
        font-size: 20px;
        text-align: center;
        line-height: 50px;
    }
    #tempMax>span,#tempMin>span{
        font-size: 15px;
        color: darkgrey;
        margin-right: 20px;
    }
    #country{
        width: 100%;
        height: 20%;
        float: left;
        font-size: 20px;
        text-align: right;
        padding-right: 50px;
    }
    #wind, #sunrise, #sunset{
        width: 33%;
        height: 30%;
        float: left;
    }
    #wind>span, #sunrise>span, #sunset>span{
        font-size: 12px;
        color: darkgrey;
        margin: 0px 5px;
        line-height: 50px;
    }
  
</style>
<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    
	<div id="weather">
    	<div id="weather-icon">
            <img>
        </div>
        <div id="weather-info">
            <div id="temp">
                
            </div>
            <div id="tempMinMax">
                <div id="tempMax"></div>
                <div id="tempMin"></div>
            </div>
            <div id="country"></div>
            <div id="wind"></div>
            <div id="sunrise"></div>
            <div id="sunset"></div>
        </div>
    </div>
    
        <script>
       	$(function(){
            weather();
            setInterval(weather,1000*60);
       	})
        
       	function weather(){
            let apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=Seoul&APPID=6a5ffef757194f752a3bf9ecfa203d6b';
            $.ajax({
                url:apiUrl,
                dataType:"json",
                success:function(result){
                    
                    $("#temp").html("<span>"+Math.round(result.main.temp-273.15)+"</span>"+' ℃');
                    $("#tempMax").html("<span>최고</span>" + Math.round(result.main.temp_max-273.18)+' ℃');
                    $("#tempMin").html("<span>최저</span>" + Math.round(result.main.temp_min-273.18)+' ℃');
                    $("#country").html(result.name+", "+result.sys.country);
                    $("#wind").html("<span>풍속</span>"+result.wind.speed);
                    let risetime = new Date(result.sys.sunrise*1000);
                    let settime = new Date(result.sys.sunset*1000);
                    $("#sunrise").html("<span>일출</span>"+ String(risetime.getHours()).padStart(2,"0")+":"+String(risetime.getMinutes()).padStart(2,"0"));
                    $("#sunset").html("<span>일몰</span>"+ String(settime.getHours()).padStart(2,"0")+":"+String(settime.getMinutes()).padStart(2,"0"));
  
                    var imgURL = "http://openweathermap.org/img/w/" + result.weather[0].icon + ".png";
                    
                    $("#weather-icon>img").attr("src", imgURL);
                }
            })
        }
       	
        	
        
        	
        </script>
</body>
</html>