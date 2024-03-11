package com.kh.semi.customerService.commnet.model.dao;

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

import com.kh.semi.customerService.commnet.model.vo.Cs;

public class CsDao {

  // 필드부 // 캡슐화 원칙
  private Properties prop = new Properties();

  public CsDao() {
    try {// 읽어들이고자 하는 xml파일 경로
      prop.loadFromXML(new FileInputStream(CsDao.class.getResource("/db/sql/cs-mapper.xml").getPath()));
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public int insert(Connection conn, Cs o) {
    // 우리가 돌리려고 하는 쿼리는 insert문 => 처리된 행수 => 트랜젝션 처리
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("insert");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, o.getUserNo());
      pstmt.setString(2, o.getCsTitle());
      pstmt.setString(3, o.getCsDetail());
      pstmt.setInt(4, o.getCgNo());
      pstmt.setObject(5, o.getAttNo());

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }

  public ArrayList<Cs> selectList(Connection conn, Integer userNo, int cgNo, int startRow, int endRow) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    ArrayList<Cs> list = new ArrayList<Cs>();

    String sql = userNo == null ? prop.getProperty("selectListForAdmin") : prop.getProperty("selectList");

    try {
      pstmt = conn.prepareStatement(sql);
      int parameterIndex = 1;
      if (userNo != null) {
        pstmt.setInt(parameterIndex++, userNo);
      }
      pstmt.setInt(parameterIndex++, cgNo);
      pstmt.setInt(parameterIndex++, startRow);
      pstmt.setInt(parameterIndex++, endRow);

      rset = pstmt.executeQuery();

      while (rset.next()) {
        Cs cs = new Cs();
        cs.setCsNo(rset.getInt("cs_no"));
        cs.setCsTitle(rset.getString("cs_title"));
        cs.setCsDetail(rset.getString("cs_detail"));
        cs.setCsDate(rset.getDate("cs_date"));
        cs.setCgNo(rset.getInt("cg_no"));
        cs.setComComment(rset.getString("com_comment"));
        cs.setCgType(rset.getString("cg_type"));
        cs.setComDate(rset.getDate("com_date"));
        cs.setAttNo(rset.getInt("att_no"));
        if (rset.wasNull()) {
          cs.setAttNo(null);
        }
        list.add(cs);
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

  public int selectListCount(Connection conn, Integer userNo, int cgNo) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;

    String sql = userNo == null ? prop.getProperty("selectListCountForAdmin") : prop.getProperty("selectListCount");

    int count = 0;

    try {
      pstmt = conn.prepareStatement(sql);

      int parameterIndex = 1;
      if (userNo != null) {
        pstmt.setInt(parameterIndex++, userNo);
      }
      pstmt.setInt(parameterIndex++, cgNo);

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

  public Cs selectOne(Connection conn, int csNo) {

    PreparedStatement pstmt = null;
    ResultSet rset = null;

    String sql = prop.getProperty("selectOne");

    Cs cs = null;

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, csNo);
      rset = pstmt.executeQuery();
      if (rset.next()) {
        cs = new Cs();
        cs.setCsNo(rset.getInt("cs_no"));
        cs.setCsTitle(rset.getString("cs_title"));
        cs.setCsDetail(rset.getString("cs_detail"));
        cs.setCsDate(rset.getDate("cs_date"));
        cs.setCgNo(rset.getInt("cg_no"));
        cs.setComComment(rset.getString("com_comment"));
        cs.setCgType(rset.getString("cg_type"));
        cs.setAttNo(rset.getInt("att_no"));
        if (rset.wasNull()) {
          cs.setAttNo(null);
        }
      }

    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      close(rset);
      close(pstmt);
    }
    return cs;
  }

  public int update(Connection conn, Cs o) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("update");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, o.getCsTitle());
      pstmt.setString(2, o.getCsDetail());
      pstmt.setInt(3, o.getCgNo());
      pstmt.setObject(4, o.getAttNo());
      pstmt.setInt(5, o.getCsNo());

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }

  public int delete(Connection conn, int csNo, int userNo) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("delete");

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
}
