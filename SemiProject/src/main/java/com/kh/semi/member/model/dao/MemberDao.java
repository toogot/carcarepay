package com.kh.semi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.semi.common.JDBCTemplate.*;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.store.enrollController.model.vo.Application;
import com.kh.semi.store.model.vo.Store;

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


	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertMember");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getAddress());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		System.out.println(count);
		return count;
	}
	public int kakaoInsertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int memberCashSelect(Connection conn, int userNo) {
		int memberCash = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("memberCashSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberCash = rset.getInt("balance");
			}
		 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}return memberCash;
		
	
	}

		public Member kakaoLoginMember(Connection conn, String userId, String userPwd) {
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
	
	public int deleteMember(Connection conn, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	public Member selectMember(Connection conn,String userId) {
		// select문 => ResultSet(한행) => Member 객체
		Member m = null;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMember");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("user_no"),
						   rset.getString("user_id"),
						   rset.getString("user_pwd"),
						   rset.getString("user_name"),
						   rset.getString("email"),
						   rset.getString("phone"),
						   rset.getString("address"),
						   rset.getString("user_level"),
						   rset.getDate("enroll_date"),
						   rset.getInt("balance"),
						   rset.getString("blacklist"),
						   rset.getString("status"));
				
			}
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	public int updatePwdMember(Connection conn, String userId, String userPwd, String updatePwd) {
		// update 문 => 처리된 행수 => 트랜젝션 처리
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int searchMemberPwd(Connection conn, String userName, String userId, String email) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchMemberPwd");
		int userNo = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userName);
			pstmt.setString(2, userId);
			pstmt.setString(3, email);
			rset = pstmt.executeQuery();
			
			
			
			if(rset.next()) {
				 userNo = rset.getInt("user_no");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return userNo;
	}
	public int updateNewPwdMember(Connection conn, int userNo, String updatePwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNewPwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updatePwd);
			pstmt.setInt(2, userNo);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
		
	}
	public int updateEmail(Connection conn, String userPwd, String updateEmail) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateEmail);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	public int updateAddress(Connection conn, String userPwd, String updateAddress) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateAddress);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println(updateAddress);
		System.out.println(userPwd);
		System.out.println(result);
		return result;
	}


	public ArrayList<Integer> memberStoreHistory(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		 ArrayList<Integer> arr = new ArrayList<>();
		String sql = prop.getProperty("memberStoreHistory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				arr.add(rset.getInt("user_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(arr);
		return arr;
		
	}


	public Application selectStoreHistory(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Application app = null;
		String sql =prop.getProperty("selectStoreHistory");
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				app = new Application(rset.getInt("app_no"),
							   rset.getInt("user_no"),
							   rset.getString("store_type"),
							   rset.getString("store_name"),
							   rset.getString("store_address"),
							   rset.getString("store_phone"),
							   rset.getString("store_time"),
							   rset.getString("business_no"),
							   rset.getString("store_price"),
							   rset.getString("app_date"),
							   rset.getString("app_yn"),
							   rset.getString("refuse"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return app;
	}


	public int selectBookMark(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("bookMark");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			result = rset.getInt("user_no");
					
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList getStoreInfo(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getStoreInfo");
		ArrayList<Store> arr = new ArrayList<Store>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				arr.add(new Store(rset.getInt("store_no"),
						   rset.getString("store_name"),
						   rset.getString("store_type"),
						   rset.getString("store_address"),
						   rset.getString("store_phone"),
						   rset.getString("store_time"),
						   rset.getString("business_no"),
						   rset.getString("store_price"),
						   rset.getString("store_status")));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return arr;
	}
	

}
