package com.kh.semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.store.model.vo.Store;

/**
 * Servlet implementation class adminStoreUpdateController
 */
@WebServlet("/storeupdate.so")
public class adminStoreUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminStoreUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); //인코딩
		
		
		int storeNo = Integer.parseInt(request.getParameter("sno"));
		String storeName = request.getParameter("storeName");
		String businessNo = request.getParameter("storeBusinessNo");
		String storePhone = request.getParameter("storePhone");
		String storeAddress = request.getParameter("storeAddress");
		String storeType = request.getParameter("storeType");
		String storeTime = request.getParameter("storeTime");
		String storePrice = request.getParameter("storePrice");
		String storeStatus = request.getParameter("storeStatus");
		
		
		Store st = new Store();
		st.setStoreNo(storeNo);
		st.setStoreName(storeName);
		st.setBusinessNo(businessNo);
		st.setStorePhone(storePhone);
		st.setStoreAddress(storeAddress);
		st.setStoreType(storeType);
		st.setStoreTime(storeTime);
		st.setStorePrice(storePrice);
		st.setStoreStatus(storeStatus);
		
		
		System.out.println("update : " + st);
		
		int result = new AdminService().updateStore(st);
		
		if(result>0) {
			request.setAttribute("st", st);
			response.sendRedirect(request.getContextPath()+"/storeListDetail.bo?sno="+st.getStoreNo());
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
