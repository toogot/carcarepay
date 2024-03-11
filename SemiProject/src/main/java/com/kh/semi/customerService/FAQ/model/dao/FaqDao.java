package com.kh.semi.customerService.FAQ.model.dao;

//JDBCTemplate가 가지고 있는 모든걸 static으로 올린다0
import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.customerService.FAQ.model.vo.Faq;

public class FaqDao {

  // 필드부 // 캡슐화 원칙
  private Properties prop = new Properties();

  public FaqDao() {
    try {// 읽어들이고자 하는 xml파일 경로
      prop.loadFromXML(new FileInputStream(FaqDao.class.getResource("/db/sql/faq-mapper.xml").getPath()));
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public int insert(Connection conn, Faq o) {
    // 우리가 돌리려고 하는 쿼리는 insert문 => 처리된 행수 => 트랜젝션 처리
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("insert");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, o.getFaqTitle());
      pstmt.setString(2, o.getFaqDetail());
      pstmt.setString(3, o.getFaqCate());

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }

  public ArrayList<Faq> selectList(Connection conn, String faqCate, int startRow, int endRow) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    ArrayList<Faq> list = new ArrayList<Faq>();

    String sql = prop.getProperty("selectList");

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, faqCate);
      pstmt.setInt(2, startRow);
      pstmt.setInt(3, endRow);

      rset = pstmt.executeQuery();

      while (rset.next()) {
        Faq faq = new Faq();
        faq.setFaqNo(rset.getInt("faq_no"));
        faq.setFaqTitle(rset.getString("faq_title"));
        faq.setFaqDetail(rset.getString("faq_detail"));
        faq.setFaqCate(rset.getString("faq_cate"));
        faq.setFaqCount(rset.getInt("faq_count"));
        list.add(faq);
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      close(rset);
      close(pstmt);
    }

    return list;
  }

  public int selectListCount(Connection conn, String faqCate) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;

    String sql = prop.getProperty("selectListCount");

    int count = 0;

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, faqCate);

      rset = pstmt.executeQuery();
      if (rset.next()) {
        count = Integer.parseInt(rset.getString("count"));
      }

    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      close(rset);
      close(pstmt);
    }
    return count;
  }

  public Faq selectOne(Connection conn, int faqNo) {

    PreparedStatement pstmt = null;
    ResultSet rset = null;

    String sql = prop.getProperty("selectOne");

    Faq faq = null;

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, faqNo);
      rset = pstmt.executeQuery();
      if (rset.next()) {
        faq = new Faq();
        faq.setFaqNo(rset.getInt("faq_no"));
        faq.setFaqTitle(rset.getString("faq_title"));
        faq.setFaqDetail(rset.getString("faq_detail"));
        faq.setFaqCate(rset.getString("faq_cate"));
        faq.setFaqCount(rset.getInt("faq_count"));
      }

    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      close(rset);
      close(pstmt);
    }
    return faq;
  }

  public int updateFaqCount(Connection conn, int faqNo) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("updateFaqCount");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, faqNo);

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }

  public int update(Connection conn, Faq o) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("update");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, o.getFaqTitle());
      pstmt.setString(2, o.getFaqDetail());
      pstmt.setString(3, o.getFaqCate());
      pstmt.setInt(4, o.getFaqNo());

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }

  public int delete(Connection conn, int faqNo) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("delete");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, faqNo);

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }
}
