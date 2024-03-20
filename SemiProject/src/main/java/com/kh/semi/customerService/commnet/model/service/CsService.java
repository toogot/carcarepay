package com.kh.semi.customerService.commnet.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.customerService.commnet.model.dao.CsDao;
import com.kh.semi.customerService.commnet.model.vo.Cs;

public class CsService {

  public int insert(Cs cs) {
    Connection conn = getConnection();

    int result = new CsDao().insert(conn, cs);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

  public List<Cs> selectList(int page, Integer userNo, int cgNo) {
    Connection conn = getConnection();
    int rowsPerPage = 10;
    int startRow = (page - 1) * rowsPerPage + 1;
    int endRow = page * rowsPerPage;

    List<Cs> o = new CsDao().selectList(conn, userNo, cgNo, startRow, endRow);

    close(conn);
    return o;

  }

  public int selectListCount(Integer userNo, int cgNo) {

    Connection conn = getConnection();

    int count = new CsDao().selectListCount(conn, userNo, cgNo);

    close(conn);
    return count;
  }

  public Cs selectOne(int csNo) {
    Connection conn = getConnection();

    Cs cs = new CsDao().selectOne(conn, csNo);

    close(conn);
    return cs;
  }

  public int update(Cs cs) {
    Connection conn = getConnection();

    int result = new CsDao().update(conn, cs);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }
  public int delete(int csNo, int userNo) {
    Connection conn = getConnection();

    int result = new CsDao().delete(conn, csNo, userNo);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

}
