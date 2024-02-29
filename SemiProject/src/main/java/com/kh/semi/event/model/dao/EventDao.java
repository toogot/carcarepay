package com.kh.semi.event.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.event.model.vo.Event;
import com.kh.semi.store.enrollController.model.vo.AppStoreImage;
import com.kh.semi.store.enrollController.model.vo.Application;
import com.kh.semi.store.model.vo.Store;

public class EventDao {
	private Properties prop=new Properties();
	
	public EventDao() {
		String filePath = Application.class.getResource("/db/sql/event-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = Integer.parseInt(rset.getString("count"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	public ArrayList<Event> selectEventList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Event> list = new ArrayList<Event>();
		
		String sql = "";
		sql = prop.getProperty("selectEventList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit()-1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Event(
						            rset.getInt("ev_no")
						           ,rset.getString("ev_title")
						           ,rset.getString("ev_detail")
						           ,rset.getDate("ev_date")
						           ,rset.getDate("ev_fin")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	

	public int selectFinListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFinListCount");
		
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = Integer.parseInt(rset.getString("count"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	public ArrayList<Event> selectFinEventList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Event> list = new ArrayList<Event>();
		
		String sql = "";
		sql = prop.getProperty("selectFinEventList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit()-1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Event(
						            rset.getInt("ev_no")
						           ,rset.getString("ev_title")
						           ,rset.getString("ev_detail")
						           ,rset.getDate("ev_date")
						           ,rset.getDate("ev_fin")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public Event selectEventDetail(Connection conn, int evNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Event event = null;
		
		String sql = "";
		sql = prop.getProperty("selectEventDeail");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, evNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				event = new Event(
			            rset.getInt("ev_no")
			           ,rset.getString("ev_title")
			           ,rset.getString("ev_detail")
			           ,rset.getDate("ev_date")
			           ,rset.getDate("ev_fin"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return event;
	}
	

}
