package com.kh.semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.service.AdminService;

/**
 * Servlet implementation class adminStoreEnrollCancleController
 */
@WebServlet("/storeCancle")
public class adminStoreEnrollCancleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminStoreEnrollCancleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//인코딩
		
		int appNo = Integer.parseInt(request.getParameter("eno2"));
		String refuse = request.getParameter("storeNoForm");
		
		int result = new AdminService().updateEnrollRefuseAppType(appNo,refuse);
		
		if(result>0) {
			request.setAttribute("refuse", refuse);
			request.setAttribute("appNo", appNo);
			response.sendRedirect(request.getContextPath()+"/storeEnrollDetail.bo?eno="+appNo);
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
