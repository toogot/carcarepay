package com.kh.semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.store.model.service.StoreSearchService;
import com.kh.semi.store.model.vo.Store;

/**
 * Servlet implementation class adminStoreDetailController
 */
@WebServlet("/storeListDetail.bo")
public class adminStoreDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminStoreDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int storeNo = Integer.parseInt(request.getParameter("sno"));
		
		Store st = new StoreSearchService().selectStoreDetail(storeNo);
		
		if(st != null) {
			request.setAttribute("st", st);
			request.getRequestDispatcher("views/admin/admin_storeDetailView.jsp").forward(request, response);

		} else {
			request.setAttribute("errorMsg", "매장 조회에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorpage.jsp").forward(request, response);
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
