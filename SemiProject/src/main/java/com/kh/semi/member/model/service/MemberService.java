package com.kh.semi.member.model.service;

import java.net.ConnectException;
import java.sql.Connection;

import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Member;

import static com.kh.semi.common.JDBCTemplate.*;

public class MemberService {
	
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		System.out.println("dtd444");
		close(conn);
		
		return m;
	}
	public String searchMemberId(String userName, String email) {
		Connection conn = getConnection();
		
		String userId = new MemberDao().searchMemberId(conn, userName, email);
		
		close(conn);
		return userId;
	}
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn,m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		int count = new MemberDao().idCheck(conn, checkId);
		close(conn);
		return count;
	}
	
	public int deleteMember(String userId, String userPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteMember(conn, userId, userPwd);
		
		if(result > 0) {
			commit(conn);			
		}else {
			rollback(conn);
		}
		close(conn);
		System.out.println(result);
		return result;
		
		
	}
	public Member updatePwdMember(String userId, String userPwd, String updatePwd) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePwdMember(conn,userId, userPwd, updatePwd);
		
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, userId);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}

	

	public int kakaoInsertMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().kakaoInsertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	public Member kakaoLoginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().kakaoLoginMember(conn, userId, userPwd);

		close(conn);
		return m;
	}
	
	
	public int memberCashSelect(int userNo) {
		Connection conn = getConnection();
		int memberCash = new MemberDao().memberCashSelect(conn,userNo);
		
		close(conn);
		return memberCash;
	}
	
	public int searchMemberPwd(String userName, String userId, String email) {
		Connection conn = getConnection();
		int userNo = new MemberDao().searchMemberPwd(conn, userName, userId, email);
		close(conn);
		return userNo;
		
	}

	public int updateNewPwdMember(int userNo, String updatePwd) {
		Connection conn = getConnection();
		int result = new MemberDao().updateNewPwdMember(conn,userNo, updatePwd);
		
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int updateEmail(String userPwd, String updateEmail) {
		Connection conn = getConnection();
		int result = new MemberDao().updateEmail(conn, userPwd, updateEmail);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}	
	public int updateAddress(String userPwd, String updateAddress) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateAddress(conn, userPwd, updateAddress);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
