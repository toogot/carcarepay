package com.kh.semi.customerService.commnet.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.semi.customerService.commnet.model.dao.CsCommentDao;
import com.kh.semi.customerService.commnet.model.vo.CsComment;

public class CsCommentService {

  public int insert(CsComment csComment) {
    Connection conn = getConnection();

    int result = new CsCommentDao().insert(conn, csComment);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

  public int update(CsComment csComment) {
    Connection conn = getConnection();

    int result = new CsCommentDao().update(conn, csComment);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

  public int delete(int comNo) {
    Connection conn = getConnection();

    int result = new CsCommentDao().delete(conn, comNo);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

  public int save(int csNo, String comComment, int userNo) {

    Connection conn = getConnection();

    Integer comNo = new CsCommentDao().selectComNo(conn, csNo);
    int result = 0;
    CsComment csComment = new CsComment();
    csComment.setComComment(comComment);
    if (comNo != null) {
      csComment.setComNo(comNo);
      result = new CsCommentDao().update(conn, csComment);
    } else {
      csComment.setCsNo(csNo);
      csComment.setUserNo(userNo);
      result = new CsCommentDao().insert(conn, csComment);
    }

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);
    return result;
  }

}
