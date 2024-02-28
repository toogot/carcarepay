package com.kh.semi.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.review.model.dao.ReviewDao;
import com.kh.semi.review.model.vo.Review;

public class ReviewService {

	public int insertReview(Review r) {
		Connection conn = getConnection();
		int result = new ReviewDao().insertReview(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public ArrayList<Review> selectReview(int storeNo){
		Connection conn = getConnection();
		ArrayList<Review> rlist = new ReviewDao().selectReview(conn, storeNo);
		
		close(conn);
		
		return rlist;
	}
	
	
	
	
	
	
}
