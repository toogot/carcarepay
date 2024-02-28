package com.kh.semi.order.model.service;

import java.sql.Connection;

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

}
