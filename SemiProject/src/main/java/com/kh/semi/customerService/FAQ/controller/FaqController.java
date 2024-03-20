package com.kh.semi.customerService.FAQ.controller;

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
import com.kh.semi.customerService.FAQ.model.service.FaqService;
import com.kh.semi.customerService.FAQ.model.vo.Faq;
import com.kh.semi.event.model.service.EventService;
import com.kh.semi.event.model.vo.Event;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class StoreEnrollFormController
 */
@WebServlet(value = { //
    "/faq.if", //
    "/faqaddform.if", //
    "/faqadd.if", //
    "/faqview.if", //
    "/faqdel.if", //
    "/faqcount.if", //
})
public class FaqController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public FaqController() {
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
    case "/faq.if":
      list(request, response);
      break;
    case "/faqaddform.if":
      addform(request, response);
      break;
    case "/faqadd.if":
      add(request, response);
      break;
    case "/faqview.if":
      view(request, response);
      break;
    case "/faqdel.if":
      del(request, response);
      break;
    case "/faqcount.if":
      count(request, response);
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

    String strId = request.getParameter("id");
    Faq faq = new Faq();
    faq.setFaqTitle(request.getParameter("faqTitle"));
    faq.setFaqDetail(request.getParameter("faqDetail"));
    faq.setFaqCate(request.getParameter("faqCate"));

    if (strId == null || strId.isEmpty()) {
      if (new FaqService().insert(faq) == 1) {
        response.getWriter().print("ok");
      }
    } else {
      int faqNo = Integer.valueOf(strId);
      faq.setFaqNo(faqNo);
      if (new FaqService().update(faq) == 1) {
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
    int faqNo = Integer.valueOf(request.getParameter("id"));
    if (new FaqService().delete(faqNo) == 1) {
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
      int faqNo = Integer.valueOf(strId);
      FaqService faqService = new FaqService();
      Faq faq = faqService.selectOne(faqNo);
      request.setAttribute("faq", faq);
    }
    request.getRequestDispatcher("views/customerService/FAQ/faqAdd.jsp").forward(request, response);
  }

  private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String strPage = request.getParameter("page");
    String cate = request.getParameter("cate");
    int page = 1;
    if (strPage != null) {
      page = Integer.valueOf(strPage);
    }
    if(cate == null) {
      cate = "기타";
    }
    FaqService faqService = new FaqService();
    List<Faq> faqList = faqService.selectList(page, cate);
    int totalCount = faqService.selectListCount(cate);

    PageInfo pageInfo = new PageInfo();
    pageInfo.setCurrentPage(1);
    pageInfo.setBoardLimit(9);
    ArrayList<Event> eventList = new EventService().selectEventList(pageInfo, "1");
    request.setAttribute("eventList", eventList);

    request.setAttribute("faqList", faqList);
    request.setAttribute("totalCount", totalCount);
    request.setAttribute("pageNo", page);
    request.setAttribute("cate", cate);
    request.getRequestDispatcher("views/customerService/FAQ/faqform.jsp").forward(request, response);
  }

  private void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int faqNo = Integer.valueOf(request.getParameter("id"));
    FaqService faqService = new FaqService();
    faqService.updateFaqCount(faqNo);
    Faq faq = faqService.selectOne(faqNo);
    request.setAttribute("faq", faq);
    request.getRequestDispatcher("views/customerService/FAQ/faqView.jsp").forward(request, response);
  }


  private void count(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int faqNo = Integer.valueOf(request.getParameter("id"));
    FaqService faqService = new FaqService();
    faqService.updateFaqCount(faqNo);
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
