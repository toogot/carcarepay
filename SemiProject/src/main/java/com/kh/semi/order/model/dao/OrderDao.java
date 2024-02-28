package com.kh.semi.order.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semi.order.model.vo.Order;

import static com.kh.semi.common.JDBCTemplate.*; //JDBCTemplate가 가지고 있는 모든걸 static으로 올린다0

public class OrderDao {
	
	//필드부 // 캡슐화 원칙
	private Properties prop = new Properties();
	
	public OrderDao() {
		try {//읽어들이고자 하는 xml파일 경로
			prop.loadFromXML(new FileInputStream(OrderDao.class.getResource("/db/sql/order-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int orderInsert(Connection conn, Order o) {
		//우리가 돌리려고 하는 쿼리는 insert문 => 처리된 행수 => 트랜젝션 처리
		int result =0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, o.getQty());
			pstmt.setInt(2, o.getPrice());
			pstmt.setInt(3, o.getUserNo());
			pstmt.setInt(4, o.getTotalPrice());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
