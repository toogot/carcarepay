package com.kh.semi.bookmark.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.semi.bookmark.model.service.BookmarkService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class BookmarkSelectController
 */
@WebServlet("/bookmarkSelect.bm")
public class BookmarkSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookmarkSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		int storeNo = Integer.parseInt(request.getParameter("storeNo"));
		
		int result = new BookmarkService().bookmarkSelect(userNo, storeNo);
		
		System.out.println(result);
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(result, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
