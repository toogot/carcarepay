package com.kh.semi.order.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	
	public Order orderDetailSelect(Connection conn, int userNo){
		// select문 => ResultSet(한행) => Order 객체에 담겠다!!!
		
		
		Order o = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("orderDetailSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				o = new Order(rset.getInt("user_no"),
							rset.getInt("order_no"),
							rset.getInt("total_price"),
							rset.getString("order_enroll"),
							rset.getString("gift_yn"),
							rset.getInt("order_qty"),
							rset.getInt("order_price"),
							rset.getString("email"),
							rset.getString("phone"),
							rset.getString("user_name")
							);
			}
			
			System.out.println("dao : " + o);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return o;
		
	}
	
	
	public Order orderGiftDetailSelect(Connection conn, int userNo){
		// select문 => ResultSet(한행) => Order 객체에 담겠다!!!
		
		
		Order o = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("orderGiftDetailSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				o = new Order(rset.getInt("user_no"),
							rset.getInt("order_no"),
							rset.getInt("total_price"),
							rset.getString("order_enroll"),
							rset.getString("gift_yn"),
							rset.getInt("order_qty"),
							rset.getInt("order_price"),
							rset.getString("email"),
							rset.getString("phone"),
							rset.getString("user_name")
							);
			}
			
			System.out.println("g dao : " + o);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return o;
		
	}
	
	
	public int kakaopayOrderInsert(Connection conn, Order k) {
		//우리가 돌리려고 하는 쿼리는 insert문 => 처리된 행수 => 트랜젝션 처리
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("kakaopayOrderInsert");
		System.out.println("dao까지오나? : " + k);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, k.getOrderNo());
			pstmt.setString(2, k.getPgProvider());
			pstmt.setInt(3, k.getTotalPrice());
			pstmt.setString(4, k.getImpUid());
			pstmt.setString(5, k.getMerchantUid());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int orderMemberCashUpdate(Connection conn, int userNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("memberCashUpdate");
		System.out.println("멤버업데이트 dao까지 오고잇나?");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int orderGiftInsert(Connection conn, Order o) {
		
		//우리가 돌리려고 하는 쿼리는 insert문 => 처리된 행수 => 트랜젝션 처리
		int result =0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertGiftOrder");
		
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
