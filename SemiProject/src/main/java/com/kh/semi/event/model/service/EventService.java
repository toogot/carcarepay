package com.kh.semi.event.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.event.model.dao.EventDao;
import com.kh.semi.event.model.vo.Event;
import com.kh.semi.store.enrollController.model.dao.ApplicationDao;
import com.kh.semi.store.enrollController.model.vo.AppStoreImage;
import com.kh.semi.store.enrollController.model.vo.Application;
import com.kh.semi.store.model.dao.StoreSearchDao;
import com.kh.semi.store.model.vo.Store;

public class EventService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int count = new EventDao().selectListCount(conn);
		
		close(conn);
		return count;
	}

	public ArrayList<Event> selectEventList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Event> list = new EventDao().selectEventList(conn, pi);
		close(conn);
		return list;
	}
	
	public int selectFinListCount() {
		Connection conn = getConnection();
		
		int count = new EventDao().selectFinListCount(conn);
		
		close(conn);
		return count;
	}

	public ArrayList<Event> selectFinEventList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Event> list = new EventDao().selectFinEventList(conn, pi);
		close(conn);
		return list;
	}
	
	public Event selectEventDetail(int evNo) {
		Connection conn = getConnection();
		Event event = new EventDao().selectEventDetail(conn, evNo);
		close(conn);
		return event;
		
		
	}

}
