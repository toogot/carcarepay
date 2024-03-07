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
import com.kh.semi.store.model.vo.Store;

/**
 * Servlet implementation class adminStoreListSelectController
 */
@WebServlet("/storeList")
public class adminStoreListSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminStoreListSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// -------페이징처리--------
		// 게시글의 총 갯수 중요 몇개씩 보여줄건지 게시글몇개고 총 몇개 보여줄건지?
		int listCount;		// 현재 총 게시글의 개수
		int currentPage;	// 현제 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit;		// 페이지 하단에 보여질 페이징바의 페이지 최대 개수(몇개 단위씩)
		int boardLimit;		// 한 페이지내에 보여질 게시글의 최대 개수(몇개 단위씩)
		
		// 위의 4개를 가지고 아래 3개의 값을 구할거임
		int maxPage;		// 가장 마지막 페이지(총 페이지 수)
		int startPage;		// 페이징바의 시작수
		int endPage;		// 페이징바의 끝 수
		
		// * listCount	: 총 게시글 개수
		listCount = new AdminService().selectStoreListCount();
		
		// * currentPage: 현재 페이지 (즉, 사용자가 요청한 페이지)
		if(request.getParameter("cpage") == null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("cpage"));
		}

		System.out.println("currentPage : " + currentPage);
		
		// * pageLimit : 페이징바 페이지 최대개수 ( 단위 => 페이징바를 몇개배치할건지)
		pageLimit = 5;
		
		// * boardLimit : 게시글 몇개씩 보여줄건지(단위)
		boardLimit = 10;
		
		
		// * maxPage : 제일 마지막 페이지 수 ( 총 페이지 수)
		/*
		 *  listCount와 boardLimit의 영향을 받는다 (총 게시글 개수, 게시글 몇개씩 보여줄건지의 영향을 받음)
		 */
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		//ex) 총 게시글 개수가 11개인데 10개씩 보여준다고 할때 1.1=> ceil로 인해 올림처리되면서 2가됨
		//	  그래서 maxPage인 총 페이지 수는 2페이지가 되는거임
		
		
		/*
		 * * startPage : 페이징바의 시작수
		 * 										//currentPage : 현재페이지
		 * pageLimit, currentPage의 영향을 받음	//pageLimit : 페이징바의 페이지 최대개수 (단위 => 페이징바를 몇개 배치할건지)
		 * 
		 * ex) 현재페이지가 2, pageLimit이 10일때 
		 * 	   현재페이지 - 1 / 10 => n 이고 
		 * 		2 - 1 / 10 => 0이다 그러므로 n = 0
		 * 		startPage 즉 페이징바의 시작수를 구하려면
		 * 		이 0에 * pageLimit + 1을 하면 된다
		 * 		0 * 10 -> 0
		 * 				  0 + 1 = 1 
		 * 		즉, 현재페이지가 2일때 페이징바의 시작수는 1이다
		 */
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		/*
		 *  * endPage : 페이징바의 끝 수
		 *  
		 *  startPage, pageLimit에 영향을 받음(단, maxPage 에도 영향을 받긴함) 
		 *  startPage : 페이징바의 시작 수
		 *  pageLimit : 페이징바의 페이지 최대개수(단위 => 페이징바를 몇개 배치할건지)
		 *  maxPage : 제일 마지막 페이지 수 ( 총 페이지 수)
		 *  ex) pageLimit : 10이라는 가정
		 *  페이징바의 시작수 1 => endPage : 10
		 *  페이징바시작수 11 => endPage : 20
		 *  
		 */
		endPage = startPage + pageLimit -1;
		//ex) 페이징바의 시작수 11 + 페이징바의 최대 개수 10 
		//										 21 - 1;
		
		// startPage가 11이라고 할 때 endPage가 20으로 됨 (근데 maxPage가 13까지라면?)
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// * 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 boardLimit 수 만큼 조회해가기 //boardLimit:한 페이지내에 보여질 게시글의 최대 개수(몇개 단위씩)
		ArrayList<Store> list = new AdminService().selectStoreList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		
		request.getRequestDispatcher("views/admin/admin_storeListView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
