<%@page import="com.kh.semi.store.model.vo.Store"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Store> list = (ArrayList<Store>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    th,td{
        /* width: 10%; */
        text-align: center !important;
    }
    #store_detail_td{
        text-align: center;
    }
    #h1Title{
        padding-top: 30px;
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
                    <h1 id="h1Title" class="h3 mb-2 text-gray-800">매장목록</h1>
                    <p class="mb-4">제휴맺은 매장정보를 조회할수있습니다.

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Store List</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered list-area" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>매장이름</th>
                                            <th>매장유형</th>
                                            <th>매장번호</th>
                                            <th>매장상태</th>
                                            <th>매장관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>No.</th>
                                            <th>매장이름</th>
                                            <th>매장유형</th>
                                            <th>매장번호</th>
                                            <th>매장상태</th>
                                            <th>매장관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<!-- ----- 매장 리스트 ----- -->
                                    	<% for(Store s : list) { %>
                                        <tr>
                                            <td><%= s.getStoreNo() %></td>
                                            <td><%= s.getStoreName() %></td>
                                            <td><%= s.getTypeName() %></td>
                                            <td><%= s.getStorePhone() %></td>
                                            <td><%= s.getStoreStatus()%></td>
                                            <td id="store_detail_td" onclick="location.href='<%= contextPath %>/storeListDetail.bo?sno=<%=s.getStoreNo()%>'"><a class="btn btn-light">매장상세보기</a></td>
                                        </tr>
                                        <% } %>
                                        <!-- --------------------- -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
                
               <div class="paging-area" align="center"> <!-- 안의 디브들이 가운데 정렬될수있도록 -->
                	<!-- 이전 < 버튼 -->
                	<% if(currentPage != 1) { %> <!-- 1페이지면 이전 버튼이 안보임 -->
               	<button onclick="location.href='<%=contextPath%>/storeList?cpage=<%=currentPage -1%>'"> &lt;</button>
                	<% } %>
                	
                		<% for(int p = startPage; p<=endPage; p++) {%>
                			<%if(p == currentPage) { %>
                				<button disabled><%= p %></button>
                			<% } else { %>
                				<button onclick="location.href='<%=contextPath%>/storeList?cpage=<%=p%>'"><%= p %></button>
                			<% } %>
                		<% } %>	
                
                		
                	<!-- 다음 > 버튼 -->
                	<% if(currentPage != maxPage) {%>
                	<button onclick="location.href='<%=contextPath%>/storeList?cpage=<%= currentPage +1%>'"> &gt; </button>
                	<% } %>
                </div>
                

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; carcarepay 2024</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

</body>
</html>