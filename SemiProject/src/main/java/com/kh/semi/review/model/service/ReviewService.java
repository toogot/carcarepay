package com.kh.semi.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.review.model.dao.ReviewDao;
import com.kh.semi.review.model.vo.Review;
import com.kh.semi.review.model.vo.ReviewAll;
import com.kh.semi.review.model.vo.ReviewImage;

public class ReviewService {

	public int insertReview(Review r, ArrayList<ReviewImage> list) {
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().insertReview(conn, r);
		int result2 = new ReviewDao().insertReviewImg(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
			return result1 * result2;
	}
	
	public ArrayList<ReviewAll> selectReview(int storeNo){
		Connection conn = getConnection();
		ArrayList<ReviewAll> rlist = new ReviewDao().selectReview(conn, storeNo);
		
		close(conn);
		
		return rlist;
	}
									
	public Review selectCountGrade(int storeNo) {
		
		Connection conn = getConnection();
		Review rv = new ReviewDao().selectCountGrade(conn, storeNo);

		close(conn);
		
		return rv;
	}
	
	public int deleteReview(int reviewNo) {
		
		Connection conn = getConnection();
		int result = new ReviewDao().deleteReview(conn, reviewNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	
	
									
									
									
									
}
