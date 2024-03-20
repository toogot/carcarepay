package com.kh.semi.event.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.event.model.vo.Event;
import com.kh.semi.store.enrollController.model.vo.Application;

public class EventDao {
  private Properties prop = new Properties();

  public EventDao() {
    String filePath = Application.class.getResource("/db/sql/event-mapper.xml").getPath();
    try {
      prop.loadFromXML(new FileInputStream(filePath));
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }

  public int insert(Connection conn, Event o) {
    // 우리가 돌리려고 하는 쿼리는 insert문 => 처리된 행수 => 트랜젝션 처리
    int result = 0;

    PreparedStatement pstmt = null;
    PreparedStatement seqStmt = null;
    String sql = prop.getProperty("insert");

    try {

      Integer evNo = null;
      seqStmt = conn.prepareStatement("SELECT EVE_SEQ.NEXTVAL FROM DUAL");
      ResultSet seqRs = seqStmt.executeQuery();
      if (seqRs.next()) {
        evNo = seqRs.getInt(1);
      }

      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, evNo);
      pstmt.setString(2, o.getEvTitle());
      pstmt.setString(3, o.getEvDetail());
      pstmt.setDate(4, new Date(o.getEvFin().getTime()));

      result = pstmt.executeUpdate();
      o.setEvNo(evNo);

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
  }

  public int update(Connection conn, Event o) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("update");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, o.getEvTitle());
      pstmt.setString(2, o.getEvDetail());
      pstmt.setDate(3, new Date(o.getEvFin().getTime()));
      pstmt.setInt(4, o.getEvNo());

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;
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

  public ArrayList<Event> selectEventList(Connection conn, PageInfo pi, String orderType) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    ArrayList<Event> list = new ArrayList<Event>();

    String sql = "";
    sql = prop.getProperty("selectEventList");
    if("2".equals(orderType)) {
      sql = sql.replace("[ORDER TYPE]", "EV_COUNT desc, EV_DATE desc, EV_NO desc");
    } else {
      sql = sql.replace("[ORDER TYPE]", "EV_DATE desc, EV_NO desc");
    }

    try {
      pstmt = conn.prepareStatement(sql);

      int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
      int endRow = startRow + pi.getBoardLimit() - 1;

      pstmt.setInt(1, startRow);
      pstmt.setInt(2, endRow);

      rset = pstmt.executeQuery();

      while (rset.next()) {
        list.add(new Event(rset.getInt("ev_no"), rset.getString("ev_title"), rset.getString("ev_detail"),
            rset.getDate("ev_date"), rset.getDate("ev_fin")));
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

  public int selectFinListCount(Connection conn) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;

    String sql = prop.getProperty("selectFinListCount");

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

  public ArrayList<Event> selectFinEventList(Connection conn, PageInfo pi, String orderType) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    ArrayList<Event> list = new ArrayList<Event>();

    String sql = "";
    sql = prop.getProperty("selectFinEventList");
    if("2".equals(orderType)) {
      sql = sql.replace("[ORDER TYPE]", "EV_COUNT desc, EV_DATE desc, EV_NO desc");
    } else {
      sql = sql.replace("[ORDER TYPE]", "EV_DATE desc, EV_NO desc");
    }

    try {
      pstmt = conn.prepareStatement(sql);

      int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
      int endRow = startRow + pi.getBoardLimit() - 1;

      pstmt.setInt(1, startRow);
      pstmt.setInt(2, endRow);

      rset = pstmt.executeQuery();

      while (rset.next()) {
        list.add(new Event(rset.getInt("ev_no"), rset.getString("ev_title"), rset.getString("ev_detail"),
            rset.getDate("ev_date"), rset.getDate("ev_fin")));
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

  public Event selectEventDetail(Connection conn, int evNo) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    Event event = null;

    String sql = "";
    sql = prop.getProperty("selectEventDeail");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, evNo);
      rset = pstmt.executeQuery();

      if (rset.next()) {
        event = new Event(rset.getInt("ev_no"), rset.getString("ev_title"), rset.getString("ev_detail"),
            rset.getDate("ev_date"), rset.getDate("ev_fin"));
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      close(rset);
      close(pstmt);
    }

    return event;
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

  public int updateCount(Connection conn, int evNo) {
    int result = 0;

    PreparedStatement pstmt = null;
    String sql = prop.getProperty("updateCount");

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
