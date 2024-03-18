package com.kh.semi.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.store.enrollController.model.vo.AppStoreImage;
import com.kh.semi.store.enrollController.model.vo.Application;
import com.kh.semi.store.model.service.StoreSearchService;
import com.kh.semi.store.model.vo.Store;

/**
 * Servlet implementation class adminStoreEnrollUpdateController
 */
@WebServlet("/storeEnrollComplete")
public class adminStoreEnrollUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminStoreEnrollUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int appNo = Integer.parseInt(request.getParameter("eno"));

		//Application ap = new AdminService().selectEnrollStoreDetail(appNo);
		//ArrayList<AppStoreImage> list = new AdminService().selectAppStoreImgAdmin(appNo);
		
		int result = new AdminService().insertStoreAndImage(appNo);
	
		if(result>0) { //성공
			request.setAttribute("appNo", appNo);
			response.sendRedirect(request.getContextPath()+"/storeEnrollDetail.bo?eno="+appNo);
		}else { //실패
			System.out.println("실패함");
			
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
