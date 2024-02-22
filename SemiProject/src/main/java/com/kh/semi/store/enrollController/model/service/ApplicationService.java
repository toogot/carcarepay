package com.kh.semi.store.enrollController.model.service;

import java.sql.Connection;

import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.store.enrollController.model.dao.ApplicationDao;
import com.kh.semi.store.enrollController.model.vo.Application;

public class ApplicationService {

	public int enrollStore(Application st) {
		Connection conn = getConnection();
		
		int result = new ApplicationDao().enrollStore(conn,st);
		return 0;
	}

}
