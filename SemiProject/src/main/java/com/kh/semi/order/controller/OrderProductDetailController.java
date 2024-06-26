package com.kh.semi.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.member.model.vo.Member;
import com.kh.semi.order.model.service.OrderService;
import com.kh.semi.order.model.vo.Order;

/**
 * Servlet implementation class OrderProductDetailController
 */
@WebServlet("/orderdetail.bo")
public class OrderProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int price = (Integer.parseInt(request.getParameter("price")));
		int qty = (Integer.parseInt(request.getParameter("qty")));
		
		HttpSession session = request.getSession(); //세션 객체 얻어옴
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		int totalPrice = (Integer.parseInt(request.getParameter("totalprice")));
		
		
		Order o = new Order();
		o.setPrice(price);
		o.setQty(qty);
		o.setUserNo(userNo);
		o.setTotalPrice(totalPrice);
		
		System.out.println("총가격 : " + totalPrice);
		System.out.println("라디오버튼 : " + price);
		System.out.println("상품수량 : " + qty);
		System.out.println("회원번호 : " + userNo);                                 
		int result = new OrderService().orderInsert(o);
		
		System.out.println(o);
		
		
		response.getWriter().print(result);		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
