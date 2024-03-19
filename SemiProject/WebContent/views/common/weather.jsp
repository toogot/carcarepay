<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link
      type="text/css"
      rel="stylesheet"
      href="resources/css/weather-icons.min.css"
    />

    <style>
      #weather {
        width: 700px;
        height: 200px;
        margin: auto;
        border: 2px solid #87cefa;
        margin-top: 10px;
        background-color: #87cefa;
        border-radius: 25px;
        box-shadow: 5px 5px rgb(0, 0, 0, 0.1);
        padding: 10px;
      }
      #weather-icon {
        width: 30%;
        height: 100%;
        float: left;
      }
      #weather-icon > img {
        width: 80%;
        height: 80%;
        margin: 15px;
      }
      #weather-info {
        width: 70%;
        height: 100%;
        float: left;
        color: white;
      }

      #temp {
        width: 50%;
        height: 50%;
        font-size: 50px;
        font-weight: 800;
        text-align: center;
        line-height: 110px;
        float: left;
      }
      #temp > span {
        font-size: 70px;
      }
      #tempMinMax {
        width: 50%;
        height: 50%;
        float: left;
      }
      #tempMax,
      #tempMin {
        width: 100%;
        height: 50%;
        font-size: 20px;
        text-align: center;
        line-height: 50px;
      }
      #tempMax > span,
      #tempMin > span {
        font-size: 15px;
        color: darkgrey;
        margin-right: 20px;
      }
      #country {
        width: 100%;
        height: 20%;
        float: left;
        font-size: 20px;
        text-align: right;
        padding-right: 50px;
      }
      #wind,
      #sunrise,
      #sunset {
        width: 33%;
        height: 30%;
        float: left;
      }
      #wind > span,
      #sunrise > span,
      #sunset > span {
        font-size: 12px;
        color: darkgrey;
        margin: 0px 5px;
        line-height: 50px;
      }
    </style>
    <!-- Latest compiled and minified CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    />

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
        <img />
      </div>
      <div id="weather-info">
        <div id="today"></div>
        <div id="temp"></div>
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
      $(function () {
        weather();
        setInterval(weather, 1000 * 60);
      });

      function weather() {
        let apiUrl =
          "https://api.openweathermap.org/data/2.5/weather?q=Seoul&APPID=6a5ffef757194f752a3bf9ecfa203d6b";
        $.ajax({
          url: apiUrl,
          dataType: "json",
          success: function (result) {
            let date = new Date();
            let today =
              date.getFullYear() +
              "-" +
              String(date.getMonth() + 1).padStart(2, "0") +
              "-" +
              String(date.getDay() + 17).padStart(2, "0") +
              " / " +
              String(date.getHours()).padStart(2, "0") +
              "시 " +
              String(date.getMinutes()).padStart(2, "0") +
              "분";
            $("#today").html("<span>" + today + "</span>");
            $("#temp").html(
              "<span>" +
                Math.round(result.main.temp - 273.15) +
                "</span>" +
                " ℃"
            );
            $("#tempMax").html(
              "<span>최고</span>" +
                Math.round(result.main.temp_max - 273.18) +
                " ℃"
            );
            $("#tempMin").html(
              "<span>최저</span>" +
                Math.round(result.main.temp_min - 273.18) +
                " ℃"
            );
            $("#country").html(result.name + ", " + result.sys.country);
            $("#wind").html("<span>풍속</span>" + result.wind.speed);
            let risetime = new Date(result.sys.sunrise * 1000);
            let settime = new Date(result.sys.sunset * 1000);
            $("#sunrise").html(
              "<span>일출</span>" +
                String(risetime.getHours()).padStart(2, "0") +
                ":" +
                String(risetime.getMinutes()).padStart(2, "0")
            );
            $("#sunset").html(
              "<span>일몰</span>" +
                String(settime.getHours()).padStart(2, "0") +
                ":" +
                String(settime.getMinutes()).padStart(2, "0")
            );
            var weatherNo = result.weather[0].icon.substr(0, 2);

            let weatherIcon = {
              "01": "https://cdn.pixabay.com/photo/2013/07/13/12/12/sun-159392_1280.png",
              "02": "https://cdn.pixabay.com/photo/2012/04/18/13/21/clouds-37009_1280.png",
              "03": "https://cdn.pixabay.com/photo/2012/04/18/13/22/cloud-37010_1280.png",
              "04": "https://cdn.pixabay.com/photo/2012/04/18/13/22/cloud-37010_1280.png",
              "09": "https://cdn.pixabay.com/photo/2016/01/27/04/42/umbrella-1163700_1280.png",
              10: "https://cdn.pixabay.com/photo/2016/01/27/04/42/umbrella-1163700_1280.png",
              11: "https://cdn.pixabay.com/photo/2013/04/01/09/22/thunderstorm-98541_1280.png",
              13: "https://cdn.pixabay.com/photo/2012/04/18/13/23/cloudy-37012_1280.png",
              50: "https://cdn.pixabay.com/photo/2016/03/18/15/06/fog-1265203_1280.png",
            };
            var imgURL =
              "http://openweathermap.org/img/w/" +
              result.weather[0].icon +
              ".png";
            $("#weather-icon>img").attr("src", weatherIcon[weatherNo]);
          },
        });
      }
    </script>
  </body>
</html>
