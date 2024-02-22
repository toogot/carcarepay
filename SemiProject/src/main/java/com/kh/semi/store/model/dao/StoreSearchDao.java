package com.kh.semi.store.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.store.model.vo.Store;

import static com.kh.semi.common.JDBCTemplate.*;

public class StoreSearchDao {
	
	public StoreSearchDao() {
		String filePath = StoreSearchDao.class.getResource("/db/sql/store-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private Properties prop = new Properties();

	public void searchStore(Connection conn) {
		
		
		
	}

	public int selectListCount(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		if(keyword==null) {
			sql = prop.getProperty("selectListCount");
		}else {
			sql = prop.getProperty("selectKeywordListCount");
		}
		
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			if(keyword != null) {
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
			}
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

	public ArrayList<Store> selectStoreList(Connection conn, PageInfo pi, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Store> list = new ArrayList<Store>();
		
		String sql = "";
		if(keyword == null) {
			 sql = prop.getProperty("selectStoreList");
		}else {
			sql = prop.getProperty("selectKeywordStoreList");
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
			int endRow = startRow+pi.getBoardLimit()-1;
			
			if(keyword != null) {
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}else {
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}
			
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Store(
						            rset.getInt("store_no")
						           ,rset.getString("store_name")
						           ,rset.getString("store_address")
						           ,rset.getString("store_phone")));
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

}
