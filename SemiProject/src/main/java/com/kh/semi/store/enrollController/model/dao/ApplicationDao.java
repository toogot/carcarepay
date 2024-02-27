package com.kh.semi.store.enrollController.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.store.enrollController.model.vo.AppStoreImage;
import com.kh.semi.store.enrollController.model.vo.Application;

public class ApplicationDao {
	private Properties prop=new Properties();
	public ApplicationDao() {
		String filePath = Application.class.getResource("/db/sql/application-store-mapper.xml").getPath();
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
		String sql = prop.getProperty("enrollStore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, st.getUserNo());
			pstmt.setString(2, st.getStoreType());
			pstmt.setString(3, st.getStoreName());
			pstmt.setString(4, st.getStoreAddress());
			pstmt.setString(5, st.getStorePhone());
			pstmt.setString(6, st.getStoreTime());
			pstmt.setString(7, st.getBusinessNo());
			pstmt.setString(8, st.getStorePrice());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int enrollStoreImg(Connection conn, ArrayList<AppStoreImage> list) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		return 0;
	}

}
