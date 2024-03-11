package com.kh.semi.customerService.notice.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.customerService.notice.model.dao.NoticeDao;
import com.kh.semi.customerService.notice.model.vo.Notice;

public class NoticeService {

  public int insert(Notice notice) {
    Connection conn = getConnection();

    int result = new NoticeDao().insert(conn, notice);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

  public List<Notice> selectList(int page) {
    Connection conn = getConnection();
    int rowsPerPage = 10;
    int startRow = (page - 1) * rowsPerPage + 1;
    int endRow = page * rowsPerPage;

    List<Notice> o = new NoticeDao().selectList(conn, startRow, endRow);

    close(conn);
    return o;

  }

  public int selectListCount() {

    Connection conn = getConnection();

    int count = new NoticeDao().selectListCount(conn);

    close(conn);
    return count;
  }

  public Notice selectOne(int notiCode) {
    Connection conn = getConnection();

    Notice notice = new NoticeDao().selectOne(conn, notiCode);

    close(conn);
    return notice;
  }

  public int updateNotiCount(int notiCode) {

    Connection conn = getConnection();

    int result = new NoticeDao().updateNotiCount(conn, notiCode);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

  public int update(Notice notice) {
    Connection conn = getConnection();

    int result = new NoticeDao().update(conn, notice);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }
  public int delete(int notiCode) {
    Connection conn = getConnection();

    int result = new NoticeDao().delete(conn, notiCode);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

}
