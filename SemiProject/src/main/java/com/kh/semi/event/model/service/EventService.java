package com.kh.semi.event.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.event.model.dao.EventDao;
import com.kh.semi.event.model.vo.Event;

public class EventService {

  public int insert(Event event) {
    Connection conn = getConnection();

    int result = new EventDao().insert(conn, event);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

  public int update(Event event) {
    Connection conn = getConnection();

    int result = new EventDao().update(conn, event);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

  public int delete(int evNo) {
    Connection conn = getConnection();

    int result = new EventDao().delete(conn, evNo);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

  public int selectListCount() {
    Connection conn = getConnection();

    int count = new EventDao().selectListCount(conn);

    close(conn);
    return count;
  }

  public ArrayList<Event> selectEventList(PageInfo pi, String orderType) {
    Connection conn = getConnection();
    ArrayList<Event> list = new EventDao().selectEventList(conn, pi, orderType);
    close(conn);
    return list;
  }

  public int selectFinListCount() {
    Connection conn = getConnection();

    int count = new EventDao().selectFinListCount(conn);

    close(conn);
    return count;
  }

  public ArrayList<Event> selectFinEventList(PageInfo pi, String orderType) {
    Connection conn = getConnection();
    ArrayList<Event> list = new EventDao().selectFinEventList(conn, pi, orderType);
    close(conn);
    return list;
  }

  public Event selectEventDetail(int evNo) {
    Connection conn = getConnection();
    Event event = new EventDao().selectEventDetail(conn, evNo);
    close(conn);
    return event;

  }

  public int updateCount(int evNo) {
    Connection conn = getConnection();

    int result = new EventDao().updateCount(conn, evNo);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);

    return result;
  }

  public Map<String, Object> selectPrevNext(int evNo, int page, String orderType, String tab) {
    ArrayList<Event> list = null;
    Map<String, Object> map = new HashMap<>();
    PageInfo pageInfo = null;
    if ("2".equals(tab)) {
      int listCount = new EventService().selectFinListCount(); // 총 게시글 개수
      pageInfo = createPageInfo(page, listCount, orderType);
      list = new EventService().selectFinEventList(pageInfo, orderType);
    } else {
      int listCount = new EventService().selectListCount(); // 총 게시글 개수
      pageInfo = createPageInfo(page, listCount, orderType);
      list = new EventService().selectEventList(pageInfo, orderType);
    }
    Event prev = null;
    Event next = null;
    for (int i = 0; i < list.size(); i++) {
      Event event = list.get(i);
      if (evNo == event.getEvNo()) {
        if (i + 1 < list.size()) {
          next = list.get(i + 1);
        }
        break;
      } else {
        prev = event;
      }
    }
    int prevPage = page;
    int nextPage = page;
    if (page > 1 && prev == null) {
      prevPage = page - 1;
      prev = selectLast(prevPage, orderType, tab);
    }
    if (page < pageInfo.getMaxPage() && next == null) {
      nextPage = page + 1;
      next = selectFirst(nextPage, orderType, tab);
    }
    map.put("prev", prev);
    map.put("prevPage", prevPage);
    map.put("next", next);
    map.put("nextPage", nextPage);
    return map;
  }

  public Event selectLast(int page, String orderType, String tab) {
    ArrayList<Event> list = null;
    if ("2".equals(tab)) {

      int listCount = new EventService().selectFinListCount(); // 총 게시글 개수
      list = new EventService().selectFinEventList(createPageInfo(page, listCount, orderType), orderType);

    } else {
      int listCount = new EventService().selectListCount(); // 총 게시글 개수
      list = new EventService().selectEventList(createPageInfo(page, listCount, orderType), orderType);
    }
    return list.get(list.size() - 1);
  }

  public Event selectFirst(int page, String orderType, String tab) {
    ArrayList<Event> list = null;
    if ("2".equals(tab)) {

      int listCount = new EventService().selectFinListCount(); // 총 게시글 개수
      list = new EventService().selectFinEventList(createPageInfo(page, listCount, orderType), orderType);

    } else {
      int listCount = new EventService().selectListCount(); // 총 게시글 개수
      list = new EventService().selectEventList(createPageInfo(page, listCount, orderType), orderType);
    }
    return list.get(0);
  }

  private PageInfo createPageInfo(int page, int listCount, String orderType) {
    int currentPage = page; // 현재 페이지(즉, 사용자가 요청한 페이지)
    int pageLimit = 5; // 페이지 하단에 보여질 페이징바의 페이지 최대 개수( 몇개단위씩)
    int boardLimit = 9; // 한 페이지내에 보여질 게시글 최대개수(몇개 단위씩)

    int maxPage = (int) (Math.ceil((double) listCount / boardLimit)); // 가장 마지막 페이지(총 페이지 수)
    int startPage = (currentPage - 1) / pageLimit * pageLimit + 1; // 페이징바의 시작수
    int endPage = startPage + pageLimit - 1; // 페이징바의 끝 수

    if (orderType == null) {
      orderType = "1";// 최신순
    }

    if (endPage > maxPage) {
      endPage = maxPage;
    }

    return new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

  }
}
