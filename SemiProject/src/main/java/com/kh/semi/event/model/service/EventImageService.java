package com.kh.semi.event.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.event.model.dao.EventImageDao;
import com.kh.semi.event.model.vo.EventImage;

public class EventImageService {

  public int insert(EventImage cs) {
    Connection conn = getConnection();

    int result = new EventImageDao().insert(conn, cs);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

  public List<EventImage> selectList(int page, Integer userNo, int cgNo) {
    Connection conn = getConnection();
    int rowsPerPage = 10;
    int startRow = (page - 1) * rowsPerPage + 1;
    int endRow = page * rowsPerPage;

    List<EventImage> o = new EventImageDao().selectList(conn, userNo, cgNo, startRow, endRow);

    close(conn);
    return o;

  }

  public int selectListCount(Integer userNo, int cgNo) {

    Connection conn = getConnection();

    int count = new EventImageDao().selectListCount(conn, userNo, cgNo);

    close(conn);
    return count;
  }

  public EventImage selectOne(int evNo) {
    Connection conn = getConnection();

    EventImage cs = new EventImageDao().selectOne(conn, evNo);

    close(conn);
    return cs;
  }

  public int delete(int evNo) {
    Connection conn = getConnection();

    int result = new EventImageDao().delete(conn, evNo);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

}
