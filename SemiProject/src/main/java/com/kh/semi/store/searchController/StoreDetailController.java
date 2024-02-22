package com.kh.semi.store.searchController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.store.model.service.StoreSearchService;
import com.kh.semi.store.model.vo.Store;

/**
 * Servlet implementation class StoreDetailController
 */
@WebServlet("/detail.st")
public class StoreDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int storeNo = Integer.parseInt(request.getParameter("storeNo"));
		Store st = new StoreSearchService().selectStoreDetail(storeNo);
		
		
//		 request.getRequestDispatcher("views/store/storeDetail.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
