package com.kh.semi.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.admin.model.dao.AdminDao;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.store.model.vo.Store;

import static com.kh.semi.common.JDBCTemplate.*;

public class AdminService {
	
	public int selectStoreListCount() {
		Connection conn = getConnection();
		int listCount = new AdminDao().selectStoreListCount(conn);
		//조회이기 때문에 트랜젝션 필요없음
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Store> selectStoreList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Store> list = new AdminDao().selectStoreList(conn,pi);
		//셀렉문
		
		close(conn);
		System.out.println("AdminService : " + list);
		return list;
	}

}
