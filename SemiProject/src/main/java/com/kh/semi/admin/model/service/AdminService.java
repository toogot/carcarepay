package com.kh.semi.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.admin.model.dao.AdminDao;
import com.kh.semi.admin.model.vo.Category;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.store.enrollController.model.vo.AppStoreImage;
import com.kh.semi.store.enrollController.model.vo.Application;
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
	
	public int selectEnrollListCount() {
		Connection conn = getConnection();
		int listCount = new AdminDao().selectEnrollListCount(conn);
		//조회이기 때문에 트랜젝션 필요없음
		
		close(conn);
		return listCount;
		
	}
	
	public int memberListCount() {
		Connection conn = getConnection();
		int listCount = new AdminDao().memberListCount(conn);
		//조회이기 때문에 트랜젝션 노필요
		
		close(conn);
		return listCount;
	}
	
	
	public ArrayList<Store> selectStoreList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Store> list = new AdminDao().selectStoreList(conn,pi);
		//셀렉문
		
		close(conn);
		return list;
	}
	
	public ArrayList<Application> selectEnrollList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Application> list = new AdminDao().selectEnrollList(conn,pi);
		//셀렉문
		
		close(conn);
		return list;
		
	}
	
	public ArrayList<Category> selectCategoryList(){
		
		Connection conn = getConnection();
		ArrayList<Category> ct = new AdminDao().selectCategoryList(conn);
		close(conn);
		return ct;
	}
	
	public ArrayList<Member> selectMemberList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Member> m = new AdminDao().selectMemberList(conn,pi);
		close(conn);
		return m;
		
	}
	
	public int updateStore(Store st) {
		Connection conn = getConnection();
		
		int result = new AdminDao().updateStore(conn,st);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int updateMember(Member m) {
		Connection conn = getConnection();
		
		int result = new AdminDao().updateMember(conn,m);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public Application selectEnrollStoreDetail(int appNo) {
		Connection conn = getConnection();
		
		Application ap = new AdminDao().selectEnrollStoreDetail(conn,appNo);
		
		close(conn);
		return ap;
	}
	
	public ArrayList<AppStoreImage> selectAppStoreImgAdmin(int appNo){
		Connection conn = getConnection();
		
		ArrayList<AppStoreImage> list = new AdminDao().selectAppStoreImgAdmin(conn, appNo);
		// select문이라 클로즈 컨 먼저
		
		close(conn);
		return list;
		
	}
	
	
	
	public Member selectMemberDetail(int memberNo) {
		Connection conn = getConnection();
		
		Member m = new AdminDao().selectMemberDetail(conn, memberNo);
		
		close(conn);

		return m;
	}
	
	public int insertStoreAndImage(int appNo) {
		Connection conn = getConnection();
		
		int result1 = new AdminDao().insertStore(conn,appNo);
		int result2 = new AdminDao().insertStoreImg(conn,appNo);
		int result3 = new AdminDao().updateAppTypeY(conn,appNo);
		
		if(result1>0 && result2>0 && result3>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2 * result3;
	}
	
	public int updateEnrollRefuseAppType(int appNo, String refuse) {
		Connection conn = getConnection();
		
		int result = new AdminDao().updateEnrollRefuseAppType(conn,appNo,refuse);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public String updateEnrollReRefuse(String refuse,int appNo) {
		
		
		Connection conn = getConnection();
		
		
		
		int result = new AdminDao().updateEnrollReRefuse(conn, refuse,appNo);
		
		
		String refuse2 = new AdminDao().selectEnrollReRefuse(conn,appNo);
		
		
		if(result>0 && (refuse2!=null)) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return refuse2;
		
	}

}
