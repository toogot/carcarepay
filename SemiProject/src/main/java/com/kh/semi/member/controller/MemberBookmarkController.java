package com.kh.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.store.model.vo.Store;

/**
 * Servlet implementation class MemberBookmarkController
 */
@WebServlet("/bookmark.me")
public class MemberBookmarkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberBookmarkController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		int result = new MemberService().selectBookMark(userNo);
			
		if(result > 0) {
				ArrayList<Store> arr = new MemberService().getStoreInfo(userNo);
				request.setAttribute("arr", arr);
			request.getRequestDispatcher("views/member/memberBookmark.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("views/member/memberBookmark.jsp").forward(request, response);
			
		}
		
		
		
		
		//request.getRequestDispatcher("views/member/memberBookmark.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
