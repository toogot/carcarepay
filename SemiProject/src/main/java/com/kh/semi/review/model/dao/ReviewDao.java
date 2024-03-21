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
import com.kh.semi.review.model.vo.ReviewAll;
import com.kh.semi.review.model.vo.ReviewImage;
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
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 리뷰등록 할 때 첨부사진이 있다면, 사진 insert 
	public int insertReviewImg(Connection conn, ArrayList<ReviewImage> list) {
		// insert문
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReviewImg");
		
		try {
			
			for(ReviewImage ri : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, ri.getImgRoot());
				pstmt.setString(2, ri.getOriginName());
				pstmt.setString(3, ri.getChangeName());
				pstmt.setInt(4, ri.getImgLevel());
				
				result = pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
	
	public ArrayList<ReviewAll> selectReview(Connection conn, int storeNo){
		// select문 => ResultSet 여러행 => ArrayList
		ArrayList<ReviewAll> rlist = new ArrayList<ReviewAll>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, storeNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {					
				rlist.add(new ReviewAll(rset.getInt("review_no"),
										rset.getString("user_id"),
									 	rset.getString("content"),
									 	rset.getString("issue_date"),
									 	rset.getDouble("grade"),
									 	rset.getString("images")
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
	
	
	public Review selectCountGrade(Connection conn, int storeNo) {
		// select문 -> 1행이라서 Review 객체에 담아주면 될듯
		Review rv = new Review();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCountGrade");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, storeNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				rv.setReviewCount(rset.getInt("count"));
				rv.setGrade(rset.getDouble("avg"));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rv;
	}
	
	
	public int deleteReview(Connection conn, int reviewNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
