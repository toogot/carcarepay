<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <html lang="ko">
  <head>
      <meta charset="UTF-8">
      <title>자주묻는질문</title>
   <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

  <!-- jQuery library -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

  <!-- Popper JS -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>


  @font-face {
  font-family: 'KCC-Ganpan';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
  font-weight: normal;
  font-style: normal;
  }
  body *{
  font-family: 'KCC-Ganpan';
  }



  body {
  font-family: Arial, sans-serif;
  margin: auto;
  padding: 30px;
  display: flex;
  }

  .sidebar {
  width: 200px;
  height: 100vh; /* Full height */
  padding-top: 20px;
  }

  .sidebar a {
  padding: 10px 15px;
  text-decoration: none;
  font-size: 20px;
  color: black;
  display: block;
  }

  .sidebar a:hover {
  color:#87CEFA;
  }

  .main-content {
  flex-grow: 1;
  background-color: #ffffff;
  padding: 50px;
  margin: ce;
  }


  
</style>
</head>
<body>
 <div class="sidebar">
        
        <a href="#">공지사항</a>
        <a href="#">자주묻는질문</a>
        <a href="#">1:1문의</a>
        <!-- More links as needed -->
        
    </div>
    <br>
    <div class="main-content">
        <!-- Image tag added here -->
        <img src= alt="자주묻는질문" style="width: 600px; height: 200px; display: block;margin: auto; margin-bottom: 20px;">



    <div class="main-content">
        <h2>자주묻는질문</h2>
        <p>고객에게서 많이 묻는 질문입니다 </p>
        <select name="category" id="category">
            <option value="category1">[기타]</option>
            <option value="category2">[교환/환불]</option>
            <option value="category3">[상품/매장]</option>
          </select>
        
      
  <section class="notice">
  
    <div id="board-list">
          <div class="container">
              <table  class="table table-hover">
                  <thead>
                  <tr>
                      <th scope="col" class="th-num">번호</th>
                      <th scope="col" class="th-ctg">카테고리</th>
                      <th scope="col" class="th-title">제목</th>
                      <th scope="col" class="th-date">조회수</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                      <td>∨</td>
                      <th>[기타]</th>
                      <th>
                        <a style="color: black;">할인되는 카드는 없나요?</a>
                      </th>
                    <td>100</td>
                  </tr>
  
                  <tr>
                      <td>∨</td>
                      <th>[교환/환불]</th>
                      <th><a style="color: black;">카드 취소가능한가요?</a></th>
                      <td>101</td>
                  </tr>
  
                  <tr>
                      <td>∨</td>
                      <th>[상품/매장]</th>
                      <th><a style="color: black;">매장이 어디에있나요?</a></th>
                      <td>102</td>
                  </tr>
                  <tr>
                    <td>∨</td>
                    <th>[기타]</th>
                    <th>
                      <a style="color: black;">할인되는 카드는 없나요?</a>
                    </th>
                  <td>100</td>
                </tr>

                <tr>
                    <td>∨</td>
                    <th>[교환/환불]</th>
                    <th><a style="color: black;">카드 취소가능한가요?</a></th>
                    <td>101</td>
                </tr>

                <tr>
                    <td>∨</td>
                    <th>[상품/매장]</th>
                    <th><a style="color: black;">매장이 어디에있나요?</a></th>
                    <td>102</td>
                </tr>
                <tr>
                    <td>∨</td>
                    <th>[기타]</th>
                    <th>
                      <a style="color: black;">할인되는 카드는 없나요?</a>
                    </th>
                  <td>100</td>
                </tr>

                <tr>
                    <td>∨</td>
                    <th>[교환/환불]</th>
                    <th><a style="color: black;">카드 취소가능한가요?</a></th>
                    <td>101</td>
                </tr>

                <tr>
                    <td>∨</td>
                    <th>[상품/매장]</th>
                    <th><a style="color: black;">매장이 어디에있나요?</a></th>
                    <td>102</td>
                </tr>
                  </tbody>
              </table>
          </div>
      </div>
  
  </section>
          
    </div>
   

</body>
</html>