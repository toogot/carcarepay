package com.kh.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class NaverLoginMemberController
 */
@WebServlet("/naverLogin.me")
public class NaverLoginMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NaverLoginMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("id");
		
		
			Member loginUser = new MemberService().loginMember(userId, userPwd);
			
			if(loginUser == null) {
				
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
