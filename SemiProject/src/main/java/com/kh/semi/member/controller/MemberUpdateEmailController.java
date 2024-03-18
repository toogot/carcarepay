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
 * Servlet implementation class MemberUpdateEmailController
 */
@WebServlet("/updateEmail.me")
public class MemberUpdateEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateEmailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userPwd = request.getParameter("userPwd");
		String updateEmail = request.getParameter("updateEmail");
		
		int result = new MemberService().updateEmail(userPwd,updateEmail);
		HttpSession session = request.getSession();
			if(result > 0) {
				session.setAttribute("alertMsg", "이메일 변경완료");
				session.setAttribute("email", updateEmail);
			}else {
				session.setAttribute("alertMsg", "이메일 변경 실패");
			}
			request.getRequestDispatcher("views/member/memberMyPageForm.jsp").forward(request, response);
			
			
	}

		
		


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
