package com.kh.semi.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.store.model.vo.Store;

import static com.kh.semi.common.JDBCTemplate.*;

public class AdminDao {
	
	private Properties prop = new Properties(); // 필드부 필드부는 항상 캡슐화를 해야함
	
	public AdminDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(AdminDao.class.getResource("/db/sql/admin-mapper.xml").getPath()));
			//webcontent안에있는게 배포됨	
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int selectStoreListCount(Connection conn) {
		// select문 => ResultSet (한개) => int // 총 개시글 개수
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectStoreListCount");//키값이 맞아야 entry 쿼리를 가져올수있음
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { // 한행이라 if문 while까지 돌릴필요 x
				listCount = rset.getInt("count"); //COUNT(*)의 별칭인 count를 키값으로
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return listCount;	
		
	}
	
	public ArrayList<Store> selectStoreList(Connection conn, PageInfo pi){
		// select문 => ResultSet(여러행) => ArrayList<Store>
	    ArrayList<Store> list = new ArrayList<Store>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("selectStoreList");
		
		try {
			pstmt = conn.prepareStatement(sql);// 구멍이 2개 뚫린 미완성된 쿼리
			
			// 시작값 : (currentPage -1) * boardLimit + 1 // 현재페이지-1 (2-1) * 한 페이지내에 보여질 게시글의 최대 개수(몇개 단위씩)+1  (10)+1
			// 현재페이지가 3일때 보여져야할 페이지시작과 끝값
			// 3-1
			//  2 * 10
			//	  20 + 1 시작값 : 21
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Store(rset.getString("store_name"),
						           rset.getInt("store_no"),
						           rset.getString("store_phone"),
						           rset.getString("type_name")
						           ));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} 
		
		System.out.println("AdminDao : " + list);
		 return list;
		
		
	}

}
