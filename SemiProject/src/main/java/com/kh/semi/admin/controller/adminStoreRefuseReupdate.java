package com.kh.semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.model.service.AdminService;

/**
 * Servlet implementation class adminStoreRefuseReupdate
 */
@WebServlet("/storeRefuseReUpdate.bo")
public class adminStoreRefuseReupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminStoreRefuseReupdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String refuse = request.getParameter("refuse");
		int appNo = Integer.parseInt(request.getParameter("eno"));
		
		String refuse2 =new AdminService().updateEnrollReRefuse(refuse,appNo);
		
		
		
		response.setContentType("application/json; charset=utf-8");//내가 지금 보내려고하는건 ..?!0
		new Gson().toJson(refuse2, response.getWriter()); //(내가보내려고하는객체,통로를 만들어주는 출력스트림 출력용스트림) response.getWriter가 출력용스트림인거임?그냥 그자체?0
		
		//response.getWriter().print(refuse2);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
