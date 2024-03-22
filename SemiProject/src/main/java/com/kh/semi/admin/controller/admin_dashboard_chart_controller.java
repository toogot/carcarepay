package com.kh.semi.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.order.model.vo.Order;

/**
 * Servlet implementation class admin_dashboard_chart_controller
 */
@WebServlet("/dashboardchart")
public class admin_dashboard_chart_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_dashboard_chart_controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	ArrayList<Order> pay = new AdminService().selectChartPayamount();
	
	response.setContentType("application/json; charset=utf-8");//내가 지금 보내려고하는건 ..?!0
	new Gson().toJson(pay, response.getWriter()); //(내가보내려고하는객체,통로를 만들어주는 출력스트림 출력용스트림) response.getWriter가 출력용스트림인거임?그냥 그자체?0

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
