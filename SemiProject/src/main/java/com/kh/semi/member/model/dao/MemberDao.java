package com.kh.semi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.semi.common.JDBCTemplate.*;
import com.kh.semi.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			
			e.printStackTrace();
		}
			
	}
	

	public Member loginMember(Connection conn, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("user_no")
							 , rset.getString("user_id")
							 , rset.getString("user_pwd")
							 , rset.getString("user_name")
							 , rset.getString("email")
							 , rset.getString("phone")
							 , rset.getString("address")
							 , rset.getString("user_level")
							 , rset.getDate("enroll_date")
							 , rset.getInt("balance")
							 , rset.getString("blacklist")
							 , rset.getString("status"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}
	public String searchMemberId(Connection conn, String userName, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String userId = null;
		String sql = prop.getProperty("searchMemberId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, email);

			rset = pstmt.executeQuery();
			if(rset.next()) {
				userId = rset.getString("user_id");
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return userId;
	}


	
}
