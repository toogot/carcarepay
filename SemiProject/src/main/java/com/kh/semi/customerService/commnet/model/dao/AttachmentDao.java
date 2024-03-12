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

import com.kh.semi.customerService.commnet.model.vo.Attachment;

public class AttachmentDao {

  // 필드부 // 캡슐화 원칙
  private Properties prop = new Properties();

  public AttachmentDao() {
    try {// 읽어들이고자 하는 xml파일 경로
      prop.loadFromXML(new FileInputStream(AttachmentDao.class.getResource("/db/sql/attachment-mapper.xml").getPath()));
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public int insert(Connection conn, Attachment o) {
    // 우리가 돌리려고 하는 쿼리는 insert문 => 처리된 행수 => 트랜젝션 처리
    int result = 0;

    PreparedStatement pstmt = null;
    PreparedStatement seqStmt = null;
    String sql = prop.getProperty("insert");

    try {

      Integer attNo = null;
      seqStmt = conn.prepareStatement("SELECT SEQ_ATT_NO.NEXTVAL FROM DUAL");
      ResultSet seqRs = seqStmt.executeQuery();
      if (seqRs.next()) {
        attNo = seqRs.getInt(1);
      }

      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, attNo);
      pstmt.setString(2, o.getAttRoute());
      pstmt.setString(3, o.getAttTitle());

      result = pstmt.executeUpdate();
      o.setAttNo(attNo);
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(seqStmt);
      close(pstmt);
    }
    return result;
  }

  public ArrayList<Attachment> selectList(Connection conn, Integer userNo, int cgNo, int startRow, int endRow) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    ArrayList<Attachment> list = new ArrayList<Attachment>();

    String sql = userNo == null ? prop.getProperty("selectListForAdmin") : prop.getProperty("selectList");

    try {
      pstmt = conn.prepareStatement(sql);
      int parameterIndex = 1;
      pstmt.setInt(parameterIndex++, startRow);
      pstmt.setInt(parameterIndex++, endRow);

      rset = pstmt.executeQuery();

      while (rset.next()) {
        Attachment att = new Attachment();
        att.setAttNo(rset.getInt("att_no"));
        att.setAttTitle(rset.getString("att_title"));
        att.setAttRoute(rset.getString("att_route"));
        list.add(att);
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

  public Attachment selectOne(Connection conn, int attNo) {

    PreparedStatement pstmt = null;
    ResultSet rset = null;

    String sql = prop.getProperty("selectOne");

    Attachment att = null;

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, attNo);
      rset = pstmt.executeQuery();
      if (rset.next()) {
        att = new Attachment();
        att.setAttNo(rset.getInt("att_no"));
        att.setAttTitle(rset.getString("att_title"));
        att.setAttRoute(rset.getString("att_route"));
      }

    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      close(rset);
      close(pstmt);
    }
    return att;
  }

  public int update(Connection conn, Attachment o) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("update");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, o.getAttRoute());
      pstmt.setString(2, o.getAttTitle());
      pstmt.setInt(3, o.getAttNo());

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }

  public int delete(Connection conn, int attNo) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("delete");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, attNo);

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }
}
