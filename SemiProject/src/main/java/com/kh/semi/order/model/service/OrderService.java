package com.kh.semi.order.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.order.model.dao.OrderDao;
import com.kh.semi.order.model.vo.Order;

import static com.kh.semi.common.JDBCTemplate.*;

public class OrderService {
	
	public int orderInsert(Order o) {
		Connection conn = getConnection();
		
		int result = new OrderDao().orderInsert(conn,o);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	public Order orderDetailSelect(int userNo){
		Connection conn = getConnection();
		
		Order o = new OrderDao().orderDetailSelect(conn,userNo);
		
		close(conn);
		return o;
		
	}
	
	
	public Order orderGiftDetailSelect(int userNo){
		Connection conn = getConnection();
		
		Order o = new OrderDao().orderGiftDetailSelect(conn,userNo);
		
		close(conn);
		return o;
		
	}
	
	public int kakaopayOrderInsert(Order k) {
		Connection conn = getConnection();
		
		System.out.println("service까지오나? : " + k);
		
		int result = new OrderDao().kakaopayOrderInsert(conn,k);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		 close(conn);
		 
		 return result;
 	
	}
	
	
	public int orderMemberCashUpdate(int userNo) {
		Connection conn = getConnection();
		
		System.out.println("order캐시업데이트 서비스까지 오고있나?");
		int result = new OrderDao().orderMemberCashUpdate(conn,userNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		 close(conn);
		 
		 return result;
	}
	
	public int orderGiftInsert(Order o) {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().orderGiftInsert(conn,o);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	

}
