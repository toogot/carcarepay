package com.kh.semi.review.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.semi.common.JDBCTemplate.*;
import com.kh.semi.review.model.vo.Review;
import com.kh.semi.store.model.dao.StoreSearchDao;

public class ReviewDao {

	private Properties prop = new Properties();

	public ReviewDao() {
		String filePath = ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertReview(Connection conn, Review r) {
		// insert문
		int result = 0;
		PreparedStatement pstmt = null;
		String str = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(str);
			
			pstmt.setInt(1, r.getUserNo());
			pstmt.setInt(2, r.getStoreNo());
			pstmt.setString(3, r.getContent());
			pstmt.setDouble(4, r.getGrade());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Review> selectReview(Connection conn, int storeNo){
		// select문 => ResultSet 여러행 => ArrayList
		ArrayList<Review> rlist = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, storeNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				rlist.add(new Review(rset.getString("user_id"),
									 rset.getString("content"),
									 rset.getDouble("grade"),
									 rset.getString("issue_date")
									 ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rlist;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
