package com.kh.semi.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class LoginMemberController
 */
@WebServlet("/login.me")
public class LoginMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/member/LoginMemberController.jsp").forward(request, response);
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
			Member loginUser = new MemberService().loginMember(userId, userPwd);
			
			if(loginUser == null) {
		      
		         request.setAttribute("errorMsg", "로그인 실패했습니다!");
		        
		         RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
		         view.forward(request, response);  
		      }else {
		        
		    	 HttpSession session = request.getSession();
		    	  session.setAttribute("loginUser",loginUser);
		    	  
		 
		    	  response.sendRedirect(request.getContextPath());
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
