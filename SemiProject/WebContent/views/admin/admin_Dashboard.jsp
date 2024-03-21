<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet" />
    
    <style>
      .container-fluid {
        padding-top: 20px;
      }
      i{
        cursor: pointer;
      }
      #DashboardID{
        padding: 20px 10px 0;
      }


    </style>
  </head>
  <body>
    <%@ include file="/views/admin/admin_header.jsp" %>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <!-- Main Content -->
      <div id="content">
        <!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- Page Heading -->
          <div
            class="d-sm-flex align-items-center justify-content-between mb-4"
          >
            <h1 id="DashboardID"class="h3 mb-0 text-gray-800">Dashboard</h1>
            <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
          </div>

          <!-- Content Row -->
          <div class="row">
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4" style="margin-bottom: 2rem;">
              <div class="card border-left-primary shadow h-100 py-2" >
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div
                        class="text-xs font-weight-bold text-primary text-uppercase mb-1"
                      >
                        상품권 판매(TODAY)
                      </div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                        ₩ <span id="totalPriceSum"></span>원
                      </div>
                    </div>
                    <div class="col-auto">
                      <i
                        class="fas fa-dollar-sign fa-2x text-gray-300"
                        onclick="location.href ='<%=contextPath %>/buyhistory'"
                      ></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div
                        class="text-xs font-weight-bold text-success text-uppercase mb-1"
                      >
                        상품권 결제수(TODAY)
                      </div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                        <span id="totalOrderCount"></span>건
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300" onclick="location.href ='<%=contextPath %>/buyhistory'"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div
                        class="text-xs font-weight-bold text-info text-uppercase mb-1"
                      >
                        입점된 매장수(TOTAL)
                      </div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div
                            class="h5 mb-0 mr-3 font-weight-bold text-gray-800"
                          >
                            <span id="totalStoreCount"></span>개
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"
                         onclick="location.href ='<%=contextPath %>/storeList'"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div
                        class="text-xs font-weight-bold text-warning text-uppercase mb-1"
                      >
                        입점신청 수(TOTAL) <!--대기상태인것만 표시-->
                      </div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                        <span id="enrollStoreCount">1</span>건
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"
                         onclick="location.href ='<%=contextPath %>/storeEnrollList'"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->

          
          <div>
            <!-- resources/js/demo/chart-area-demo.js  -->
            <!-- Area Chart -->
            <div >
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                  class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                >
                  <h6 class="m-0 font-weight-bold text-primary" style="width: 1000px;">
                    일주일 결제내역
                  </h6>

                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myAreaChart"></canvas>
                  </div>
                </div>
              </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

            


      </div>
      <!-- End of Main Content -->
    </div>

    <!-- Page level plugins -->
    <!-- <script src="resources/vendor/chart.js/Chart.min.js"></script>  -->

    <!-- Page level custom scripts -->
    <!-- <script src="resources/js/demo/chart-area-demo.js"></script> -->
    <!-- <script src="resources/js/demo/chart-pie-demo.js"></script>  -->

    <script>
            $(function(){
            $.ajax({
              url:"totalPriceSum",
              data:{},
              type:"post",
              success:function(totalPriceSum){
                      $("#totalPriceSum").html(totalPriceSum);


              },error:function(){
                console.log("ajax통신실패")
              }
                })
                  })
            
            $(function(){
              $.ajax({
              url:"totalOrderCount",
              data:{},
              type:"post",
              success:function(totalOrderCount){
            	  if(totalOrderCount!=null){
                	$("#totalOrderCount").html(totalOrderCount);
            	  }else{
            		$("#totalOrderCount").html(0)
            	  }
              },error:function(){
                console.log("ajax통신실패")
              }
              })
            })

            $(function(){
              $.ajax({
              url:"totalStoreCount",
              data:{},
              type:"post",
              success:function(totalStoreCount){
                $("#totalStoreCount").html(totalStoreCount);
              },error:function(){
                console.log("ajax통신실패")
              }
              })
            })

            $(function(){
              $.ajax({
              url:"enrollStoreCount",
              data:{},
              type:"post",
              success:function(enrollStoreCount){
                $("#enrollStoreCount").html(enrollStoreCount);
              },error:function(){
                console.log("ajax통신실패")
              }
              })
            })

            $(function(){
              $.ajax({
                url:"dashboardchart",
                data:{chart:1},
                type:"get",
                success:function(pay){
                              function number_format(number, decimals, dec_point, thousands_sep) {
                              // *     example: number_format(1234.56, 2, ',', ' ');
                              // *     return: '1 234,56'
                              number = (number + '').replace(',', '').replace(' ', '');
                              var n = !isFinite(+number) ? 0 : +number,
                                prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
                                sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
                                dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
                                s = '',
                                toFixedFix = function(n, prec) {
                                  var k = Math.pow(10, prec);
                                  return '' + Math.round(n * k) / k;
                                };
                              // Fix for IE parseFloat(0.55).toFixed(0) = 0;
                              s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
                              if (s[0].length > 3) {
                                s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
                              }
                              if ((s[1] || '').length < prec) {
                                s[1] = s[1] || '';
                                s[1] += new Array(prec - s[1].length + 1).join('0');
                              }
                              return s.join(dec);
                            }
                            
                            // Area Chart Example
                            var ctx = document.getElementById("myAreaChart");
                            
                            console.log(pay);	
                            
                            // pay 배열에서 payDateK와 payPriceK를 각각 가져와서 배열에 넣기
                            var labels = []; // 날짜를 담을 배열
                            var data = []; // 가격을 담을 배열

                            // pay 배열을 순회하면서 payDateK와 payPriceK를 추출하여 각각 labels와 data 배열에 추가
                            for (var i = 0; i < pay.length; i++) {
                                labels.push(pay[i].payDateK);  // payDateK 값을 labels 배열에 추가
                                data.push(pay[i].payPriceK);   // payPriceK 값을 data 배열에 추가
                            }

                            // labels 배열과 data 배열을 확인하기 위해 콘솔에 출력
                            console.log("라벨: ", labels);
                            console.log("데이터: ", data);
                            


                            
                            var myLineChart = new Chart(ctx, {
                              type: 'line',
                              data: {
                                // labels: ["1월", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
                                labels: labels, 
                                datasets: [{
                                  label: "결제금액",
                                  lineTension: 0.3,
                                  backgroundColor: "rgba(78, 115, 223, 0.05)",
                                  borderColor: "rgba(78, 115, 223, 1)",
                                  pointRadius: 3,
                                  pointBackgroundColor: "rgba(78, 115, 223, 1)",
                                  pointBorderColor: "rgba(78, 115, 223, 1)",
                                  pointHoverRadius: 3,
                                  pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                                  pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                                  pointHitRadius: 10,
                                  pointBorderWidth: 2,
                                  data: data,
                                }],
                              },
                              options: {
                                maintainAspectRatio: false,
                                layout: {
                                  padding: {
                                    left: 10,
                                    right: 25,
                                    top: 25,
                                    bottom: 0
                                  }
                                },
                                scales: {
                                  xAxes: [{
                                    time: {
                                      unit: 'date'
                                    },
                                    gridLines: {
                                      display: false,
                                      drawBorder: false
                                    },
                                    ticks: {
                                      maxTicksLimit: 7
                                    }
                                  }],
                                  yAxes: [{
                                    ticks: {
                                      maxTicksLimit: 5,
                                      padding: 10,
                                      // Include a dollar sign in the ticks
                                      callback: function(value, index, values) {
                                        return '$' + number_format(value);
                                      }
                                    },
                                  gridLines: {
                                                color: "rgb(234, 236, 244)",
                                                zeroLineColor: "rgb(234, 236, 244)",
                                                drawBorder: false,
                                                borderDash: [2],
                                                zeroLineBorderDash: [2]
                                              }
                                            }],
                                          },
                                legend: {
                                  display: false
                                },
                                tooltips: {
                                  backgroundColor: "rgb(255,255,255)",
                                  bodyFontColor: "#858796",
                                  titleMarginBottom: 10,
                                  titleFontColor: '#6e707e',
                                  titleFontSize: 14,
                                  borderColor: '#dddfeb',
                                  borderWidth: 1,
                                  xPadding: 15,
                                  yPadding: 15,
                                  displayColors: false,
                                  intersect: false,
                                  mode: 'index',
                                  caretPadding: 10,
                                  callbacks: {
                                    label: function(tooltipItem, chart) {
                                      var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                                      return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
                                    }
                                  }
                                }
                              }
                            });

                },error:function(){

                }
                
              })
            })


     </script>
  </body>
</html>
