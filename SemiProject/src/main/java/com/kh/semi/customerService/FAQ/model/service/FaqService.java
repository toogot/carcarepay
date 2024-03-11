package com.kh.semi.customerService.FAQ.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.customerService.FAQ.model.dao.FaqDao;
import com.kh.semi.customerService.FAQ.model.vo.Faq;

public class FaqService {

  public int insert(Faq faq) {
    Connection conn = getConnection();

    int result = new FaqDao().insert(conn, faq);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

  public List<Faq> selectList(int page, String faqCate) {
    Connection conn = getConnection();
    int rowsPerPage = 10;
    int startRow = (page - 1) * rowsPerPage + 1;
    int endRow = page * rowsPerPage;

    List<Faq> o = new FaqDao().selectList(conn, faqCate, startRow, endRow);

    close(conn);
    return o;

  }

  public int selectListCount(String faqCate) {

    Connection conn = getConnection();

    int count = new FaqDao().selectListCount(conn, faqCate);

    close(conn);
    return count;
  }

  public Faq selectOne(int faqNo) {
    Connection conn = getConnection();

    Faq faq = new FaqDao().selectOne(conn, faqNo);

    close(conn);
    return faq;
  }

  public int updateFaqCount(int faqNo) {

    Connection conn = getConnection();

    int result = new FaqDao().updateFaqCount(conn, faqNo);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

  public int update(Faq faq) {
    Connection conn = getConnection();

    int result = new FaqDao().update(conn, faq);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }
  public int delete(int faqNo) {
    Connection conn = getConnection();

    int result = new FaqDao().delete(conn, faqNo);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

}
