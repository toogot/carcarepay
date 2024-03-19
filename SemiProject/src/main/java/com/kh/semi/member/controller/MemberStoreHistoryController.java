package com.kh.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.store.enrollController.model.vo.Application;

/**
 * Servlet implementation class MemberStoreHistoryController
 */
@WebServlet("/storeHistory.me")
public class MemberStoreHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberStoreHistoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		ArrayList<Integer> arr = new MemberService().memberStoreHistory();
		
		if(arr.contains(userNo)) {
		Application app = new MemberService().selectStoreHistory(userNo);
		System.out.println(app);
		request.setAttribute("app",app);
		request.getRequestDispatcher("views/member/memberStoreHistory.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("views/member/memberStoreHistory.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
