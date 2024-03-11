package com.kh.semi.customerService.notice.model.dao;

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

import com.kh.semi.customerService.notice.model.vo.Notice;

public class NoticeDao {

  // 필드부 // 캡슐화 원칙
  private Properties prop = new Properties();

  public NoticeDao() {
    try {// 읽어들이고자 하는 xml파일 경로
      prop.loadFromXML(new FileInputStream(NoticeDao.class.getResource("/db/sql/notice-mapper.xml").getPath()));
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public int insert(Connection conn, Notice o) {
    // 우리가 돌리려고 하는 쿼리는 insert문 => 처리된 행수 => 트랜젝션 처리
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("insert");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, o.getNotiTitle());
      pstmt.setString(2, o.getNotiContent());
      pstmt.setInt(3, o.getUserNo());

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }

  public ArrayList<Notice> selectList(Connection conn, int startRow, int endRow) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    ArrayList<Notice> list = new ArrayList<Notice>();

    String sql = prop.getProperty("selectList");

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, startRow);
      pstmt.setInt(2, endRow);

      rset = pstmt.executeQuery();

      while (rset.next()) {
        Notice notice = new Notice();
        notice.setNotiCode(rset.getInt("noti_code"));
        notice.setNotiTitle(rset.getString("noti_title"));
        notice.setNotiContent(rset.getString("noti_content"));
        notice.setNotiDate(rset.getDate("noti_date"));
        notice.setNotiCount(rset.getInt("noti_count"));
        notice.setUserNo(rset.getInt("user_no"));
        list.add(notice);
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

  public int selectListCount(Connection conn) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;

    String sql = prop.getProperty("selectListCount");

    int count = 0;

    try {
      pstmt = conn.prepareStatement(sql);
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

  public Notice selectOne(Connection conn, int notiCode) {

    PreparedStatement pstmt = null;
    ResultSet rset = null;

    String sql = prop.getProperty("selectOne");

    Notice notice = null;

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, notiCode);
      rset = pstmt.executeQuery();
      if (rset.next()) {
        notice = new Notice();
        notice.setNotiCode(rset.getInt("noti_code"));
        notice.setNotiTitle(rset.getString("noti_title"));
        notice.setNotiContent(rset.getString("noti_content"));
        notice.setNotiDate(rset.getDate("noti_date"));
        notice.setNotiCount(rset.getInt("noti_count"));
        notice.setUserNo(rset.getInt("user_no"));
      }

    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      close(rset);
      close(pstmt);
    }
    return notice;
  }

  public int updateNotiCount(Connection conn, int notiCode) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("updateNotiCount");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, notiCode);

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }

  public int update(Connection conn, Notice o) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("update");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, o.getNotiTitle());
      pstmt.setString(2, o.getNotiContent());
      pstmt.setInt(3, o.getNotiCode());

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }


  public int delete(Connection conn, int notiCode) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("delete");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, notiCode);

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }
}
