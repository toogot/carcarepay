package com.kh.semi.store.enrollController.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.store.enrollController.model.dao.ApplicationDao;
import com.kh.semi.store.enrollController.model.vo.AppStoreImage;
import com.kh.semi.store.enrollController.model.vo.Application;

public class ApplicationService {

	public int enrollStore(Application st, ArrayList<AppStoreImage> list) {
		Connection conn = getConnection();
		
		int result1 = new ApplicationDao().enrollStore(conn,st);
		
		int result2 = new ApplicationDao().enrollStoreImg(conn,list);
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1*result2;
	}

}
