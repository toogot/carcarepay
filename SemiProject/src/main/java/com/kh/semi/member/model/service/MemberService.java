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

		close(conn);
		return m;
	}
}
