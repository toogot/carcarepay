package com.kh.semi.store.search.model.service;

import static com.kh.semi.common.JDBCTemplate.*;
import com.kh.semi.store.search.model.dao.searchStoreDao;

public class StoreSearchService {

	public void searchStore() {
		Connection conn = getConnection();
		
		new searchStoreDao().searchStore();
	
		
	}

}
