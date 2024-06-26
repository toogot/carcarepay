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
import com.kh.semi.store.enrollController.model.vo.AppStoreImage;
import com.kh.semi.store.model.vo.Store;

import static com.kh.semi.common.JDBCTemplate.*;

public class StoreSearchDao {
	
	private Properties prop = new Properties();
	
	public StoreSearchDao() {
		String filePath = StoreSearchDao.class.getResource("/db/sql/store-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

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

	
	public Store selectStoreDetail(Connection conn, int storeNo) {
		// select문 => ResultSet => 1행
		
		Store st = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStoreDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, storeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				  st = new Store(rset.getInt("store_no"),
					             rset.getString("store_name"),
					             rset.getString("type_name"),
					             rset.getString("store_address"),
					             rset.getString("store_phone"),
					             rset.getString("store_time"),
					             rset.getString("business_no"),
					             rset.getString("store_price"),
					             rset.getString("store_status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return st;
		
	}
	
	public ArrayList<AppStoreImage> selectStoreImg(Connection conn, int storeNo) {
		ArrayList<AppStoreImage> list = new ArrayList<AppStoreImage>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStoreImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, storeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new AppStoreImage(rset.getInt("img_no"),
										   rset.getString("img_root"),
						                   rset.getString("origin_name"),
						                   rset.getString("change_name")
						                ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
