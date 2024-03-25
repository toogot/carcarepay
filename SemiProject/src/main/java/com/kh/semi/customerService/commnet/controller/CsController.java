package com.kh.semi.customerService.commnet.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.customerService.commnet.model.service.AttachmentService;
import com.kh.semi.customerService.commnet.model.service.CategroyService;
import com.kh.semi.customerService.commnet.model.service.CsCommentService;
import com.kh.semi.customerService.commnet.model.service.CsService;
import com.kh.semi.customerService.commnet.model.vo.Attachment;
import com.kh.semi.customerService.commnet.model.vo.Category;
import com.kh.semi.customerService.commnet.model.vo.Cs;
import com.kh.semi.event.model.service.EventService;
import com.kh.semi.event.model.vo.Event;
import com.kh.semi.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class StoreEnrollFormController
 */
@WebServlet(value = { //
    "/cs.if", //
    "/csaddform.if", //
    "/csadd.if", //
    "/csview.if", //
    "/csdel.if", //
    "/csreply.if", //
    "/csdn.if" })
public class CsController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public CsController() {
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
    case "/cs.if":
      list(request, response);
      break;
    case "/csaddform.if":
      addform(request, response);
      break;
    case "/csadd.if":
      add(request, response);
      break;
    case "/csview.if":
      view(request, response);
      break;
    case "/csdel.if":
      del(request, response);
      break;
    case "/csreply.if":
      reply(request, response);
      break;
    case "/csdn.if":
      download(request, response);
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

    CsService csService = new CsService();

    Integer attNo = null;
    Cs cs = new Cs();
    String strId = null;
    if (ServletFileUpload.isMultipartContent(request)) {
      // 파일 용량 제한
      int maxSize = 10 * 1024 * 1024;

      // 저장시킬 폴더 경로
      String savePath = "/upload/cs";
      File file = new File(savePath);
      if (file.exists() == false) {
        file.mkdirs();
      }

      // 전달 파일 업로드
      MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8");
      String strAttNo = multiRequest.getParameter("attNo");
      if (strAttNo != null) {
        attNo = Integer.valueOf(strAttNo);
      }
      // 업로드된 파일에 대한 처리
      @SuppressWarnings("rawtypes")
      Enumeration files = multiRequest.getFileNames();
      while (files.hasMoreElements()) {
        String inputFileName = (String) files.nextElement();
        String uploadedFileName = multiRequest.getFilesystemName(inputFileName);
        String originalFilename = multiRequest.getOriginalFileName(inputFileName);
        if (uploadedFileName != null) {
          File uploadedFile = new File(savePath, uploadedFileName);
          String newFileName = UUID.randomUUID().toString().replaceAll("-", ""); // 새 파일명 지정
          File newFile = new File(savePath, newFileName);

          // 파일명 변경
          if (uploadedFile.renameTo(newFile)) {
            System.out.println("파일명이 성공적으로 변경되었습니다.");
            Attachment att = new Attachment();
            att.setAttTitle(originalFilename);
            att.setAttRoute("/upload/cs/" + newFileName);
            new AttachmentService().insert(att);
            attNo = att.getAttNo();
          } else {
            System.out.println("파일명 변경 실패.");
          }
        }
      }

      strId = multiRequest.getParameter("id");
      cs.setCsTitle(multiRequest.getParameter("csTitle"));
      cs.setCsDetail(multiRequest.getParameter("csDetail"));
      cs.setCgNo(Integer.valueOf(multiRequest.getParameter("cgNo")));
      cs.setUserNo(userNo);
      cs.setAttNo(attNo);
    } else {
      strId = request.getParameter("id");
      cs.setCsTitle(request.getParameter("csTitle"));
      cs.setCsDetail(request.getParameter("csDetail"));
      cs.setCgNo(Integer.valueOf(request.getParameter("cgNo")));
      cs.setUserNo(userNo);
    }

    if (strId == null || strId.isEmpty()) {
      if (csService.insert(cs) == 1) {
        response.getWriter().print("ok");
      }
    } else {
      int csNo = Integer.valueOf(strId);
      cs.setCsNo(csNo);
      if (csService.update(cs) == 1) {
        response.getWriter().print("ok");
      }
    }
  }

  private void reply(HttpServletRequest request, HttpServletResponse response) throws IOException {
    HttpSession session = request.getSession();
    Member sessionMember = (Member) session.getAttribute("loginUser");
    if (sessionMember == null || !"운영자".equals(sessionMember.getUserLevel())) {
      response.sendRedirect(request.getContextPath());
      return;
    }
    int csNo = Integer.valueOf(request.getParameter("csNo"));
    String comComment = request.getParameter("comComment");
    if (new CsCommentService().save(csNo, comComment, sessionMember.getUserNo()) == 1) {
      response.getWriter().print("ok");
    }
  }

  private void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
    HttpSession session = request.getSession();
    Member sessionMember = (Member) session.getAttribute("loginUser");
    if (sessionMember == null) {
      response.sendRedirect(request.getContextPath());
      return;
    }
    int csNo = Integer.valueOf(request.getParameter("id"));
    if (new CsService().delete(csNo, sessionMember.getUserNo()) == 1) {
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
      int csNo = Integer.valueOf(strId);
      CsService csService = new CsService();
      Cs cs = csService.selectOne(csNo);
      request.setAttribute("cs", cs);
    }

    List<Category> categoryList = new CategroyService().selectList();
    request.setAttribute("categoryList", categoryList);

    request.getRequestDispatcher("views/customerService/comment/csAdd.jsp").forward(request, response);
  }

  private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    Member sessionMember = (Member) session.getAttribute("loginUser");
    if (sessionMember == null) {
      response.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      response.getWriter().print("<script>alert('로그인이 필요한 서비스 입니다.'); location.href='loginForm.me';</script>");
      return;
    }
    boolean isAdmin = "운영자".equals(sessionMember.getUserLevel());
    int userNo = sessionMember.getUserNo();
    String strPage = request.getParameter("page");
    String cate = request.getParameter("cgNo");
    Integer cgNo = 1;
    int page = 1;
    if (strPage != null) {
      page = Integer.valueOf(strPage);
    }
    if (cate != null) {
      cgNo = Integer.valueOf(cate);
    }
    CsService csService = new CsService();
    List<Cs> csList = null;
    int totalCount = 0;
    if (isAdmin) {
      csList = csService.selectList(page, null, cgNo);
      totalCount = csService.selectListCount(null, cgNo);
    } else {
      csList = csService.selectList(page, userNo, cgNo);
      totalCount = csService.selectListCount(userNo, cgNo);
    }

    List<Category> categoryList = new CategroyService().selectList();

    PageInfo pageInfo = new PageInfo();
    pageInfo.setCurrentPage(1);
    pageInfo.setBoardLimit(9);
    ArrayList<Event> eventList = new EventService().selectEventList(pageInfo, "1");
    request.setAttribute("eventList", eventList);

    request.setAttribute("csList", csList);
    request.setAttribute("totalCount", totalCount);
    request.setAttribute("pageNo", page);
    request.setAttribute("cgNo", cgNo);
    request.setAttribute("categoryList", categoryList);
    
    request.getRequestDispatcher("views/customerService/comment/csform.jsp").forward(request, response);
  }

  private void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int csNo = Integer.valueOf(request.getParameter("id"));
    CsService csService = new CsService();
    Cs cs = csService.selectOne(csNo);
    Integer attNo = cs.getAttNo();
    if (attNo != null) {
      Attachment attachment = new AttachmentService().selectOne(attNo);
      if (attachment != null) {
        request.setAttribute("attTitle", attachment.getAttTitle());
      }
    }
    request.setAttribute("cs", cs);
    request.getRequestDispatcher("views/customerService/comment/csView.jsp?page=1&cgNo=3").forward(request, response);
  }

  private void download(HttpServletRequest request, HttpServletResponse response)
      throws FileNotFoundException, IOException {

    // 서버에 저장된 이미지 파일 경로
    String id = request.getParameter("id");
    int attNo = Integer.valueOf(id);
    Attachment attachment = new AttachmentService().selectOne(attNo);
    String filePath = attachment.getAttRoute();
    File downloadFile = new File(filePath);

    // MIME 타입 설정
    // response.setContentType("image/jpeg");

    // 파일 다운로드를 위한 헤더 설정
    response.setHeader("Content-Disposition",
        "attachment; filename=\"" + URLEncoder.encode(attachment.getAttTitle(), "UTF-8") + "\"");

    // 파일 길이 설정
    response.setContentLength((int) downloadFile.length());

    // 파일 전송
    try (BufferedInputStream inStream = new BufferedInputStream(new FileInputStream(downloadFile));
        BufferedOutputStream outStream = new BufferedOutputStream(response.getOutputStream())) {

      byte[] buffer = new byte[1024];
      int bytesRead = -1;
      while ((bytesRead = inStream.read(buffer)) != -1) {
        outStream.write(buffer, 0, bytesRead);
      }
    }
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
