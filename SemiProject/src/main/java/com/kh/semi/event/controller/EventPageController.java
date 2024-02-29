package com.kh.semi.event.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.event.model.service.EventService;
import com.kh.semi.event.model.vo.Event;

/**
 * Servlet implementation class LoginFormController
 */
@WebServlet("/event")
public class EventPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; // 총 게시글 개수
		int currentPage; // 현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 개수( 몇개단위씩)
		int boardLimit; // 한 페이지내에 보여질 게시글 최대개수(몇개 단위씩)
		
		int maxPage; // 가장 마지막 페이지(총 페이지 수)
		int startPage; // 페이징바의 시작수
		int endPage; // 페이징바의 끝 수
		
		listCount = new EventService().selectListCount();
		
		if(request.getParameter("page") == null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		pageLimit = 5;
		boardLimit = 3;
		maxPage = (int)(Math.ceil((double)listCount/boardLimit));
	  
		startPage = (currentPage-1)/pageLimit*pageLimit+1;
		endPage = startPage + pageLimit -1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<Event> list = new EventService().selectEventList(pi);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		
		int listCountFin; // 총 게시글 개수
		int currentPageFin; // 현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimitFin; // 페이지 하단에 보여질 페이징바의 페이지 최대 개수( 몇개단위씩)
		int boardLimitFin; // 한 페이지내에 보여질 게시글 최대개수(몇개 단위씩)
		
		int maxPageFin; // 가장 마지막 페이지(총 페이지 수)
		int startPageFin; // 페이징바의 시작수
		int endPageFin; // 페이징바의 끝 수
		
		listCountFin = new EventService().selectListCount();
		
		if(request.getParameter("page") == null) {
			currentPageFin = 1;
		}else {
			currentPageFin = Integer.parseInt(request.getParameter("page"));
		}
		
		pageLimitFin = 5;
		boardLimitFin = 3;
		maxPageFin = (int)(Math.ceil((double)listCountFin/boardLimitFin));
	  
		startPageFin = (currentPageFin - 1) / pageLimitFin * pageLimitFin + 1;
		endPageFin = startPageFin + pageLimitFin -1;
		
		if (endPageFin > maxPageFin) {
			endPageFin = maxPageFin;
		}
		
		PageInfo piFin = new PageInfo(listCountFin, currentPageFin, pageLimitFin, boardLimitFin, maxPageFin, startPageFin, endPageFin);
		ArrayList<Event> listFin = new EventService().selectFinEventList(piFin);
		request.setAttribute("piFin", piFin);
		request.setAttribute("listFin", listFin);
		
		request.getRequestDispatcher("views/event/eventpage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
