package com.kh.semi.store.enrollController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.store.enrollController.model.service.ApplicationService;
import com.kh.semi.store.enrollController.model.vo.Application;
import com.kh.semi.store.model.vo.Store;

/**
 * Servlet implementation class StoreEnrollController
 */
@WebServlet("/enroll.st")
public class StoreEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String storeName = request.getParameter("storeName");
		String storeType = request.getParameter("storeType");
		String storeAddress = request.getParameter("storeAddress");
		String storePhone = request.getParameter("storePhone");
		String storeTime = request.getParameter("storeTime");
		String businessNo = request.getParameter("businessNo");
		String storePrice = request.getParameter("storePrice");
		
		Application st = new Application(storeType,storeName,storeAddress,storePhone,storeTime,businessNo,storePrice);
		
		int result = new ApplicationService().enrollStore(st);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
