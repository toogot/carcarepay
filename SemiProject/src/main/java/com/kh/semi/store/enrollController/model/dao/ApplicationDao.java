package com.kh.semi.store.enrollController.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semi.store.enrollController.model.vo.Application;

public class ApplicationDao {
	private Properties prop=new Properties();
	public ApplicationDao() {
		String filePath = Application.class.getResource("db/sql/application-store-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int enrollStore(Connection conn, Application st) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty(null);
		
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
