package com.kh.semi.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.order.model.vo.Order;

/**
 * Servlet implementation class adminBuyHistoryListController
 */
@WebServlet("/buyhistory")
public class adminBuyHistoryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminBuyHistoryListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ------페이징처리-------
		// 게시글의 총 갯수 중요 몇개씩 보여줄건지 게시글 몇개고 총 몇개 보여줄건지
		int listCount;		// 현재 총 게시글의 개수
		int currentPage; 	// 현재 페이지(사용자 요청페이지)
		int pageLimit; 		// 페이지 하단에 보여질 페이징바의 페이지 최대 개수(몇개 단위씩)
		int boardLimit;		// 한 페이지내에 보여질 게시글의 최대 개수(몇개 단위씩)
		
		// 위의 4개를 가지고 아래 3개의 값을 구할거임
		int maxPage;		// 가장 마지막페이지(총페이지 수)
		int startPage;		// 페이징바의 시작 수 
		int endPage;		// 페이징바의 끝 수
		
		// * listCount : 총 게시글 개수
		listCount = new AdminService().orderListCount();
		
		// * currentPage : 현재 페이지 (사용자가 요청한 페이지)
		if(request.getParameter("opage") == null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("opage"));
		}
		
		
		
		// * pageLimit : 페이징바 최대 개수
		pageLimit = 5;
		
		// * boardLimit : 게시글 몇개씩 보여줄건지(단위)
		boardLimit = 10;
		
		// * maxPage : 제일 마지막 페이지 수 (총 페이지 수 )
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		// * startPage :  페이징바의 시작수
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 페이징바의 끝 수
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// * 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 boardLimit 수 만큼 조회해가기
		//boardLimit:한 페이지내에 보여질 게시글의 최대 개수(몇개 단위씩)
		ArrayList<Order> o = new AdminService().selectOrderList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("o", o);

		
		
		request.getRequestDispatcher("views/admin/admin_buyHistoryList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
