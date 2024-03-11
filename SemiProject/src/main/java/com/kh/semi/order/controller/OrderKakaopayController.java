package com.kh.semi.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.order.model.service.OrderService;
import com.kh.semi.order.model.vo.Order;

/**
 * Servlet implementation class OrderKakaopayController
 */
@WebServlet("/kakaopay_successInsert")
public class OrderKakaopayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderKakaopayController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("buyer_email");
		String userName = request.getParameter("buyer_name");
        String phone = request.getParameter("buyer_tel");
        int totalPrice = Integer.parseInt(request.getParameter("amount"));
        String imp_uid = request.getParameter("imp_uid"); //포트원 거래고유번호
        String merchant_uid = request.getParameter("merchant_uid") ; //가맹점 주문번호
        String pg_provider = request.getParameter("pg_provider");   // "kakaopay" 출력됨
        int orderNo = Integer.parseInt(request.getParameter("orderNo"));
        
        Order k = new Order();
        k.setEmail(email);
        k.setUserName(userName);
        k.setPhone(phone);
        k.setTotalPrice(totalPrice);
        k.setImpUid(imp_uid);
        k.setPgProvider(pg_provider);
        k.setMerchantUid(merchant_uid);
        k.setOrderNo(orderNo);
        
        System.out.println("주문번호 : " + orderNo);
        System.out.println("구매자 이메일 : " + email);
        System.out.println("구매자 이름 : " + userName);
        System.out.println("구매자 번호 : " + phone);
        System.out.println("구매 금액 : " + totalPrice);
        System.out.println("포트원 거래고유번호 : " + imp_uid);
        System.out.println("가맹점 주문번호 : " + merchant_uid);
        System.out.println("구매방법 : " + pg_provider);
        
        int result = new OrderService().kakaopayOrderInsert(k);
        
        System.out.println(k);
        
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
