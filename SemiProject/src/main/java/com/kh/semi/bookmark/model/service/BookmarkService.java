package com.kh.semi.bookmark.model.service;

import java.sql.Connection;

import com.kh.semi.bookmark.model.dao.BookmarkDao;

import static com.kh.semi.common.JDBCTemplate.*;

public class BookmarkService {

	public int bookmarkSelect(int userNo, int storeNo) {
		Connection conn = getConnection();
		int result = new BookmarkDao().bookmarkSelect(conn, userNo, storeNo);
		
		close(conn);
		
		return result;
	}
	
	public int bookmarkInsert(int userNo, int storeNo) {
		Connection conn = getConnection();
		int result = new BookmarkDao().bookmarkInsert(conn, userNo, storeNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int bookmarkDelete(int userNo, int storeNo) {
		Connection conn = getConnection();
		int result = new BookmarkDao().bookmarkDelete(conn, userNo, storeNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	
	
	
}