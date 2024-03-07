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
	
	
	
	
	
	
	
	
	
}
