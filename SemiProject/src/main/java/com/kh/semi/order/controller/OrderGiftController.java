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
 * Servlet implementation class OrderGiftController
 */
@WebServlet("/ordergiftdetail.bo")
public class OrderGiftController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderGiftController() {
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
		
		System.out.println("g총가격 : " + totalPrice);
		System.out.println("g라디오버튼 : " + price);
		System.out.println("g상품수량 : " + qty);
		System.out.println("g회원번호 : " + userNo);
		
		int result = new OrderService().orderGiftInsert(o);
		
		System.out.println("giftController : " + o);
		
		
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
