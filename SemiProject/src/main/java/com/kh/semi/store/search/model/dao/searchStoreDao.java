package com.kh.semi.store.search.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.semi.common.JDBCTemplate.*;

public class searchStoreDao {
	
	public searchStoreDao() {
		String filePath = searchStoreDao.class.getResource("/db/sql/store-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private Properties prop = new Properties();

	public void searchStore(Connection conn) {
		
		
		
	}

}
