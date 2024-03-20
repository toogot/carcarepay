package com.kh.semi.customerService.commnet.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.customerService.commnet.model.dao.AttachmentDao;
import com.kh.semi.customerService.commnet.model.vo.Attachment;

public class AttachmentService {

  public int insert(Attachment att) {
    Connection conn = getConnection();

    int result = new AttachmentDao().insert(conn, att);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

  public List<Attachment> selectList(int page, Integer userNo, int cgNo) {
    Connection conn = getConnection();
    int rowsPerPage = 10;
    int startRow = (page - 1) * rowsPerPage + 1;
    int endRow = page * rowsPerPage;

    List<Attachment> o = new AttachmentDao().selectList(conn, userNo, cgNo, startRow, endRow);

    close(conn);
    return o;

  }

  public int selectListCount(Integer userNo, int cgNo) {

    Connection conn = getConnection();

    int count = new AttachmentDao().selectListCount(conn, userNo, cgNo);

    close(conn);
    return count;
  }

  public Attachment selectOne(int attNo) {
    Connection conn = getConnection();

    Attachment att = new AttachmentDao().selectOne(conn, attNo);

    close(conn);
    return att;
  }

  public int update(Attachment att) {
    Connection conn = getConnection();

    int result = new AttachmentDao().update(conn, att);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }
  public int delete(int attNo, int userNo) {
    Connection conn = getConnection();

    int result = new AttachmentDao().delete(conn, attNo);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

}
