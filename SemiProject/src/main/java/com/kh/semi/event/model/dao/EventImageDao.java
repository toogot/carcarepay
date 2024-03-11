package com.kh.semi.event.model.dao;

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

import com.kh.semi.event.model.vo.EventImage;

public class EventImageDao {

  // 필드부 // 캡슐화 원칙
  private Properties prop = new Properties();

  public EventImageDao() {
    try {// 읽어들이고자 하는 xml파일 경로
      prop.loadFromXML(
          new FileInputStream(EventImageDao.class.getResource("/db/sql/event-image-mapper.xml").getPath()));
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public int insert(Connection conn, EventImage o) {
    // 우리가 돌리려고 하는 쿼리는 insert문 => 처리된 행수 => 트랜젝션 처리
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("insert");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, o.getImgRoot());
      pstmt.setString(2, o.getOriginName());
      pstmt.setString(3, o.getChangeName());
      pstmt.setInt(4, o.getImgLevel());
      pstmt.setInt(5, o.getEvNo());

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }

  public ArrayList<EventImage> selectList(Connection conn, Integer userNo, int cgNo, int startRow, int endRow) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    ArrayList<EventImage> list = new ArrayList<EventImage>();

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
        EventImage img = new EventImage();

        img.setImgNo(rset.getInt("img_no"));
        img.setImgRoot(rset.getString("img_root"));
        img.setOriginName(rset.getString("origin_name"));
        img.setChangeName(rset.getString("change_name"));
        img.setImgLevel(rset.getInt("img_level"));
        img.setStatus(rset.getString("status"));
        img.setEvNo(rset.getInt("ev_no"));
        list.add(img);
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

  public EventImage selectOne(Connection conn, int imgNo) {

    PreparedStatement pstmt = null;
    ResultSet rset = null;

    String sql = prop.getProperty("selectOne");

    EventImage img = null;

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, imgNo);
      rset = pstmt.executeQuery();
      if (rset.next()) {
        img = new EventImage();
        img.setImgNo(rset.getInt("img_no"));
        img.setImgRoot(rset.getString("img_root"));
        img.setOriginName(rset.getString("origin_name"));
        img.setChangeName(rset.getString("change_name"));
        img.setImgLevel(rset.getInt("img_level"));
        img.setStatus(rset.getString("status"));
        img.setEvNo(rset.getInt("ev_no"));
      }

    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      close(rset);
      close(pstmt);
    }
    return img;
  }

  public int delete(Connection conn, int evNo) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("delete");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, evNo);

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }
}
