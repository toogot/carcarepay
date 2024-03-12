package com.kh.semi.customerService.commnet.model.dao;

//JDBCTemplate가 가지고 있는 모든걸 static으로 올린다0
import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semi.customerService.commnet.model.vo.CsComment;

public class CsCommentDao {

  // 필드부 // 캡슐화 원칙
  private Properties prop = new Properties();

  public CsCommentDao() {
    try {// 읽어들이고자 하는 xml파일 경로
      prop.loadFromXML(new FileInputStream(CsCommentDao.class.getResource("/db/sql/cs-comment-mapper.xml").getPath()));
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public int insert(Connection conn, CsComment o) {
    // 우리가 돌리려고 하는 쿼리는 insert문 => 처리된 행수 => 트랜젝션 처리
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("insert");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, o.getCsNo());
      pstmt.setString(2, o.getComComment());
      pstmt.setInt(3, o.getUserNo());

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }

  public int updateCsCount(Connection conn, int csNo) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("updateCsCount");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, csNo);

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }

  public int update(Connection conn, CsComment o) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("update");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, o.getComComment());
      pstmt.setInt(2, o.getComNo());

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }

  public int delete(Connection conn, int comNo) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("delete");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, comNo);

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }

  public Integer selectComNo(Connection conn, int csNo) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;

    String sql =  prop.getProperty("selectComNo");

    Integer count = null;

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, csNo);

      rset = pstmt.executeQuery();
      if (rset.next()) {
        count = Integer.parseInt(rset.getString("com_no"));
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
}
