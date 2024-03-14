package com.kh.semi.customerService.notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.customerService.notice.model.service.NoticeService;
import com.kh.semi.customerService.notice.model.vo.Notice;
import com.kh.semi.event.model.service.EventService;
import com.kh.semi.event.model.vo.Event;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class StoreEnrollFormController
 */
@WebServlet(value = { //
    "/notice.if", //
    "/noticeaddform.if", //
    "/noticeadd.if", //
    "/noticeview.if", //
    "/noticedel.if", //
})
public class noticeformcontroller extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public noticeformcontroller() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String servletPath = request.getServletPath();
    switch (servletPath) {
    case "/notice.if":
      list(request, response);
      break;
    case "/noticeaddform.if":
      addform(request, response);
      break;
    case "/noticeadd.if":
      add(request, response);
      break;
    case "/noticeview.if":
      view(request, response);
      break;
    case "/noticedel.if":
      del(request, response);
      break;
    }
  }

  private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
    HttpSession session = request.getSession();
    Member sessionMember = (Member) session.getAttribute("loginUser");
    if (sessionMember == null) {
      response.sendRedirect(request.getContextPath());
      return;
    }
    int userNo = sessionMember.getUserNo();

    String strId = request.getParameter("id");
    Notice notice = new Notice();
    notice.setNotiTitle(request.getParameter("notiTitle"));
    notice.setNotiContent(request.getParameter("notiContent"));
    notice.setUserNo(userNo);

    if (strId == null || strId.isEmpty()) {
      if (new NoticeService().insert(notice) == 1) {
        response.getWriter().print("ok");
      }
    } else {
      int notiCode = Integer.valueOf(strId);
      notice.setNotiCode(notiCode);
      if (new NoticeService().update(notice) == 1) {
        response.getWriter().print("ok");
      }
    }
  }

  private void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
    HttpSession session = request.getSession();
    Member sessionMember = (Member) session.getAttribute("loginUser");
    if (sessionMember == null) {
      response.sendRedirect(request.getContextPath());
      return;
    }
    int notiCode = Integer.valueOf(request.getParameter("id"));
    if (new NoticeService().delete(notiCode) == 1) {
      response.getWriter().print("ok");
    }
  }

  private void addform(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    Member sessionMember = (Member) session.getAttribute("loginUser");
    if (sessionMember == null) {
      response.sendRedirect(request.getContextPath());
      return;
    }
    String strId = request.getParameter("id");
    if (strId != null) {
      int notiCode = Integer.valueOf(strId);
      NoticeService noticeService = new NoticeService();
      Notice notice = noticeService.selectOne(notiCode);
      request.setAttribute("notice", notice);
    }
    request.getRequestDispatcher("views/customerService/notice/noticeAdd.jsp").forward(request, response);
  }

  private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String strPage = request.getParameter("page");
    int page = 1;
    if (strPage != null) {
      page = Integer.valueOf(strPage);
    }
    NoticeService noticeService = new NoticeService();
    List<Notice> noticeList = noticeService.selectList(page);
    int totalCount = noticeService.selectListCount();

    PageInfo pageInfo = new PageInfo();
    pageInfo.setCurrentPage(1);
    pageInfo.setBoardLimit(9);
    ArrayList<Event> eventList = new EventService().selectEventList(pageInfo, "1");
    request.setAttribute("eventList", eventList);
    request.setAttribute("noticeList", noticeList);
    request.setAttribute("totalCount", totalCount);
    request.setAttribute("pageNo", page);
    request.getRequestDispatcher("views/customerService/notice/noticeform.jsp").forward(request, response);
  }

  private void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int notiCode = Integer.valueOf(request.getParameter("id"));
    NoticeService noticeService = new NoticeService();
    noticeService.updateNotiCount(notiCode);
    Notice notice = noticeService.selectOne(notiCode);
    request.setAttribute("notice", notice);
    request.getRequestDispatcher("views/customerService/notice/noticeView.jsp").forward(request, response);
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    doGet(request, response);
  }

}
