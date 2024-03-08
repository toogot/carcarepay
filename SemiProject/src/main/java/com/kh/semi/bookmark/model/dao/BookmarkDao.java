package com.kh.semi.bookmark.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.semi.common.JDBCTemplate.*;

public class BookmarkDao {

		private Properties prop = new Properties();

		public BookmarkDao() {
			String filePath = BookmarkDao.class.getResource("/db/sql/bookmark-mapper.xml").getPath();
			
			try {
				prop.loadFromXML(new FileInputStream(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
		public int bookmarkSelect(Connection conn, int userNo, int storeNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("bookmarkSelect");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				pstmt.setInt(2, storeNo);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					result = rset.getInt("bookmark_count");
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return result;
		}
	
		public int bookmarkInsert(Connection conn, int userNo, int storeNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("bookmarkInsert");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				pstmt.setInt(2, storeNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		public int bookmarkDelete(Connection conn, int userNo, int storeNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("bookmarkDelete");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				pstmt.setInt(2, storeNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		
	
	
	
	
	
}
