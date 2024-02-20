package com.kh.semi.store.search.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.store.search.model.dao.StoreSearchDao;
import com.kh.semi.store.search.model.vo.Store;

public class StoreSearchService {


	public int selectListCount(String keyword) {
		Connection conn = getConnection();
		
		int count = new StoreSearchDao().selectListCount(conn,keyword);
		
		close(conn);
		return count;
	}

	public ArrayList<Store> selectStoreList(PageInfo pi, String keyword) {
		Connection conn = getConnection();
		ArrayList<Store> list = new StoreSearchDao().selectStoreList(conn,pi,keyword);
		close(conn);
		return list;
	}

}
