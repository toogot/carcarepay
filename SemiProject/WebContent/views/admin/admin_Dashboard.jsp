<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
    
    <style>
      .container-fluid {
        padding-top: 20px;
      }
      i{
        cursor: pointer;
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
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
          </div>

          <!-- Content Row -->
          <div class="row">
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
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

          
          <div class="row">
            <!-- resources/js/demo/chart-area-demo.js  -->
            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                  class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                >
                  <h6 class="m-0 font-weight-bold text-primary">
                    Earnings Overview
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

            
            


      </div>
      <!-- End of Main Content -->
    </div>

    <!-- Page level plugins -->
<!--     <script src="resources/vendor/chart.js/Chart.min.js"></script>  -->

    <!-- Page level custom scripts -->
    <script src="resources/js/demo/chart-area-demo.js"></script>
  <!--  <script src="resources/js/demo/chart-pie-demo.js"></script> --> 

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
                $("#totalOrderCount").html(totalOrderCount);
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


     </script>
  </body>
</html>
