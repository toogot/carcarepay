package com.kh.semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class adminMemberUpdateController
 */
@WebServlet("/adminmemberupdate")
public class adminMemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminMemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); //인코딩

		
		
		int memberNo = Integer.parseInt(request.getParameter("mno"));
		
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		String userEmail = request.getParameter("userEmail");
		String userPhone = request.getParameter("userPhone");
		String userAddress = request.getParameter("userAddress");
		int userPrice = Integer.parseInt(request.getParameter("userPrice")) ;
		String userStatus = request.getParameter("userStatus");
		
		
		Member m = new Member();
		m.setUserNo(memberNo);
		m.setUserName(userName);
		m.setUserPwd(userPwd);
		m.setEmail(userEmail);
		m.setPhone(userPhone);
		m.setAddress(userAddress);
		m.setBalance(userPrice);
		m.setStatus(userStatus);
		
		int result = new AdminService().updateMember(m);
		
		if(result>0) {
			request.setAttribute("m", m);
			response.sendRedirect(request.getContextPath()+"/memberDetail.bo?mno="+m.getUserNo());
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
