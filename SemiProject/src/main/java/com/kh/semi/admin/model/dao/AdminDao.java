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

import com.kh.semi.admin.model.vo.Category;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.order.model.vo.Order;
import com.kh.semi.store.enrollController.model.vo.AppStoreImage;
import com.kh.semi.store.enrollController.model.vo.Application;
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
	
	public int selectEnrollListCount(Connection conn) {
		
		// select문 => ResultSet (한개) => int // 총 개시글 개수
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectEnrollListCount");//키값이 맞아야 entry 쿼리를 가져올수있음
		
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
	
	public int memberListCount(Connection conn) {
		
		// select문 => ResultSet(한개) => int // 총 게시글 개수
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("memberListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return listCount;
		
	}
	
	public int orderListCount(Connection conn) {
		// select문 => ResultSet(한개) => int // 총 게시글 개수
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("orderListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
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
						           rset.getString("type_name"),
						           rset.getString("store_status")
						           ));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} 
		 return list;
		
		
	}
	
	
	public ArrayList<Application> selectEnrollList(Connection conn, PageInfo pi){
		// select문 => ResultSet(여러행) => ArrayList<Application>
	    ArrayList<Application> list = new ArrayList<Application>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("selectEnrollList");
	    
	    try {
			pstmt = conn.prepareStatement(sql);// 구멍이 2개 뚫린 미완성된 쿼리
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Application(  rset.getInt("app_no"),
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
								           rset.getString("refuse"),
								           rset.getString("user_name"),
								           rset.getString("type_name"),
								           rset.getString("app_typename")
								           ));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} 
	    return list;
	}
	
	
	public ArrayList<Member> selectMemberList(Connection conn,PageInfo pi){
		// select문 => ResultSet(여러행) => ArrayList<Member>
		
		ArrayList<Member> m = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		String sql = prop.getProperty("selectMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				m.add(new Member(rset.getInt("user_no"),
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
								 rset.getString("status")
								 ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return m;
		
	}
	
	public ArrayList<Order> selectOrderList(Connection conn,PageInfo pi){
		// select문 => ResultSet(여러행) => ArrayList<Member>
		
		ArrayList<Order> o = new ArrayList<Order>();
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		String sql = prop.getProperty("selectOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				o.add(new Order( rset.getInt("user_no"),
						         rset.getInt("order_qty"),
								 rset.getInt("order_price"),
								 rset.getInt("total_price"),
								 rset.getString("gift_yn"),
								 rset.getInt("pay_no_k"),
								 rset.getString("pay_date_k"),
								 rset.getString("pay_company_k"),
								 rset.getString("user_id"),
								 rset.getString("user_name"),
								 rset.getString("email"),
								 rset.getString("phone")
								 ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return o;
		
	}
	
	
	
	public ArrayList<Category> selectCategoryList(Connection conn){
		// select문 => ResultSet(여러행) => ArrayList<Category>
		
		ArrayList<Category> ct = new ArrayList<Category>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ct.add(new Category(rset.getString("store_type"),
						            rset.getString("type_name")
						            ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return ct;
		
	}
	
	
	
	

	
	
	public int updateStore(Connection conn, Store st) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateStore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,st.getStoreName());
			pstmt.setString(2, st.getBusinessNo());
			pstmt.setString(3, st.getStorePhone());
			pstmt.setString(4, st.getStoreAddress());
			pstmt.setString(5, st.getStoreType());
			pstmt.setString(6, st.getStoreTime());
			pstmt.setString(7, st.getStorePrice());
			pstmt.setString(8, st.getStoreStatus());
			pstmt.setInt(9, st.getStoreNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int updateMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getAddress());
			pstmt.setInt(6, m.getBalance());
			pstmt.setString(7, m.getStatus());
			pstmt.setInt(8, m.getUserNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
	}
	
	public Application selectEnrollStoreDetail(Connection conn, int appNo) {
		// select문 => ResultSet =>1행
		
		Application ap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEnrollStoreDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, appNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
							ap = new Application(rset.getInt("app_no"),
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
									             rset.getString("refuse"),
									             rset.getString("user_name"),
									             rset.getString("type_name"),
									             rset.getString("app_typename"),
									             rset.getString("Email"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return ap;
	
	}
	
	public ArrayList<AppStoreImage> selectAppStoreImgAdmin(Connection conn, int appNo){
		// select문 => ResultSet =>1행
		
		ArrayList<AppStoreImage> list = new ArrayList<AppStoreImage>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAppStoreImgAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, appNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				AppStoreImage apImg = new AppStoreImage();
				apImg.setImgNo(rset.getInt("img_no"));
				apImg.setAppNo(rset.getInt("app_no"));
				apImg.setImgRoot(rset.getString("img_root"));
				apImg.setOriginName(rset.getString("origin_name"));
				apImg.setChangeName(rset.getString("change_name"));
				apImg.setStatus(rset.getString("status"));
				
				list.add(apImg);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
		
	}
	
	public Member selectMemberDetail(Connection conn, int memberNo) {
		// select문 => ResultSet => 1행
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(  rset.getInt("user_no"),
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
		} finally {
			close(pstmt);
			close(rset);
		} 

		return m;
	}
	
	public int insertStore(Connection conn, int appNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAppToStore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, appNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertStoreImg(Connection conn, int appNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAppImgToStoreImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, appNo);
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		

	}
	
	public int updateAppTypeY(Connection conn, int appNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAppTypeY");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, appNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateEnrollRefuseAppType(Connection conn, int appNo, String refuse) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateEnrollRefuseAppType");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, refuse);
			pstmt.setInt(2, appNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateEnrollReRefuse(Connection conn, String refuse,int appNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateEnrollReRefuse");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, refuse);
			pstmt.setInt(2, appNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
		

		
	}
	
	public String selectEnrollReRefuse(Connection conn, int appNo) {
		String refuse2 = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEnrollReRefuse");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,appNo);
			
       	    rset = pstmt.executeQuery(); 
			
			if(rset.next()) { // 한행이라 if문 while까지 돌릴필요 x
				refuse2 = rset.getString("refuse"); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return refuse2;
		
	}
	
	public Order selectOrderListDetail(Connection conn, int realOrderNo) {
		Order o = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		String sql = prop.getProperty("selectOrderDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, realOrderNo);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				o = new Order(	 rset.getInt("user_no"),
								 rset.getInt("order_qty"),
								 rset.getInt("order_price"),
								 rset.getInt("total_price"),
								 rset.getString("gift_yn"),
								 rset.getInt("pay_no_k"),
								 rset.getString("pay_date_k"),
								 rset.getString("pay_company_k"),
								 rset.getString("user_id"),
								 rset.getString("user_name"),
								 rset.getString("email"),
								 rset.getString("phone")
								 );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} 
		return o;
	}
	
	public String selectTotalPriceSum(Connection conn) {
		String totalPriceSum = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTotalPriceSum");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				totalPriceSum=rset.getString("sum");
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return totalPriceSum;
	}
	
	public int selectOrderCount(Connection conn) {
		int totalOrderCount =0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOrderCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalOrderCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalOrderCount;
	}
	
	public int selectTotalStoreCount(Connection conn) {
		int totalStoreCount =0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTotalStoreCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalStoreCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalStoreCount;
	}
	
	public int selectEnrollStoreCount(Connection conn) {
		int enrollStoreCount =0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEnrollStoreCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				enrollStoreCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return enrollStoreCount;
		
	}
	
	public ArrayList<Order> selectChartPayamount(Connection conn){
		ArrayList<Order> pay = new ArrayList<Order>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectChartPayamount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				pay.add(new Order(rset.getString("pay_date"),
								  rset.getString("total_amount")
											 ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pay;
	}
	

}
