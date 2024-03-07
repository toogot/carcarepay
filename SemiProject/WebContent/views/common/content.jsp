<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String con = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면2</title>
<style>
 /* 컨텐츠 부분 시작 */

        #content_wrap{
            width: 1000px;
            height: 1000px;
            margin: auto;
            border: 1px solid lightgrey;
            margin-top: 10px;
        }
        #content_wrap>*{
            width: 100%;
            height: 50%;
        }
        #content1>* ,#content2>*{
            width: 50%;
            height: 100%;
            float: left;
        }
        #content_help>*{
            width: 100%;
            height: 50%;
        }
        #content_wrap button{
            width: 70%;
            height: 70%;
            margin: 50px 70px;
            border-radius: 10px;
            border: 0px;
            font-size: 25px;
            font-weight: 800;
            color: white;
        }
        #content_charge>button{
            background-color: #87CEFA;
        }
        #content_mypage>button{
            background-color: #6495ED;
        }
        #content_search>button{
            background-color: #1E90FF;
        }
        #help1>button{
            background-color: #0000CD;
        }  
        #help2>button{
            background-color: #0000CD;
        }
        #content_help button{
            margin: 25px 70px;
        }
</style>
</head>
<body>
	    <!-- 선택 버튼 쪽 -->
        <div id="content_wrap">
            <div id="content1">
                <div id="content_charge">
                    <button onclick="location.href='<%= contextPath %>/product.bo'">충전하기</button>
                </div>
                <div id="content_mypage">
                    <button onclick="location.href='<%=con%>/myPage.me'">마이페이지</button>
                </div>
            </div>
            <div id="content2">
                <div id="content_search">
                    <button onclick="location.href='<%=con%>/search.st?page=1'">매장찾기</button>
                </div>
                <div id="content_help">
                    <div id="help1">
                        <button>이용방법</button>
                    </div>
                    <div id="help2">
                        <button onclick="location.href='<%=con%>/chargeInfo'">충전방법</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 컨텐츠부분 끝 -->
        <script>
        $(function(){
            

            // 컨텐츠부분
            $("#content_charge").children().hover(function(){
                $(this).css("backgroundColor","#00BFFF");
            },function(){
                $(this).css("backgroundColor","");
            })
            $("#content_mypage").children().hover(function(){
                $(this).css("backgroundColor","#4169E1")
            },function(){
                $(this).css("backgroundColor","")
            })
            $("#content_search").children().hover(function(){
                $(this).css("backgroundColor","#4169E1")
            },function(){
                $(this).css("backgroundColor","")
            })
            $("#content_help").children().children().hover(function(){
                $(this).css("backgroundColor","#4169E1")
            },function(){
                $(this).css("backgroundColor","")
            })
            // 컨텐츠부분 끝

         
        })
    </script>
</body>
</html>