package com.kh.semi.store.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.store.search.model.service.StoreSearchService;
import com.kh.semi.store.search.model.vo.Store;

/**
 * Servlet implementation class StoreSearch
 */
@WebServlet("/search.st")
public class StoreSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//new StoreSearchService().searchStore();
		
		
		
		
		int listCount; // 총 게시글 개수
		int currentPage; // 현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 개수( 몇개단위씩)
		int boardLimit; // 한 페이지내에 보여질 게시글 최대개수(몇개 단위씩)
		
		
		// 위의 4개를 가지고 아래 3개의 값을 구해낸다.
		int maxPage; // 가장 마지막 페이지(총 페이지 수)
		int startPage; // 페이징바의 시작수
		int endPage; // 페이징바의 끝 수
		
		// *listCount : 총 게시글 개수
		listCount = new StoreSearchService().selectListCount();
		
		// currentPage : 현재 페이지 (즉 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("page"));
		
		// * pageLimit : 페이징 바의 페이지 최대 개수 (단위 => 페이징바를 몇개 배치할껀지)
		pageLimit = 5;
		
		// * boardLimit : 게시글 몇개씩 보여줄껀지(단위)
		boardLimit = 3;
		
		maxPage = (int)(Math.ceil((double)listCount/boardLimit));
	  
		startPage = (currentPage-1)/pageLimit*pageLimit+1;
	
		endPage = startPage + pageLimit -1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Store> list = new StoreSearchService().selectStoreList(pi);
		
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/store/storeSearch.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
