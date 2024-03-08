package com.kh.semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.store.enrollController.model.vo.Application;
import com.kh.semi.store.model.service.StoreSearchService;
import com.kh.semi.store.model.vo.Store;

/**
 * Servlet implementation class adminStoreEnrollDetail
 */
@WebServlet("/storeEnrollDetail.bo")
public class adminStoreEnrollDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminStoreEnrollDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int appNo = Integer.parseInt(request.getParameter("eno"));
		
		Application ap = new AdminService().selectEnrollStoreDetail(appNo);

			request.setAttribute("ap", ap);
			request.getRequestDispatcher("views/admin/admin_storeEnrollDetailView.jsp").forward(request, response);



	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
