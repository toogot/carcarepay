package com.kh.semi.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.order.model.service.OrderService;
import com.kh.semi.order.model.vo.Order;

/**
 * Servlet implementation class OrderProductControllerReal
 */
@WebServlet("/orderdetail3.bo")
public class OrderProductDetailController3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderProductDetailController3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();//세션영역에있는 로그인유저를 가져옴0
		
		Order o = new OrderService().orderDetailSelect(userNo);
		
		System.out.println("controller : " + o);
		//response.getWriter().print(o);	
		
		response.setContentType("application/json; charset=utf-8");//내가 지금 보내려고하는건 ..?!0
		new Gson().toJson(o, response.getWriter()); //(내가보내려고하는객체,통로를 만들어주는 출력스트림 출력용스트림) response.getWriter가 출력용스트림인거임?그냥 그자체?0
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
