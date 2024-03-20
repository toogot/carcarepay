package com.kh.semi.event.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.event.model.service.EventImageService;
import com.kh.semi.event.model.service.EventService;
import com.kh.semi.event.model.vo.Event;
import com.kh.semi.event.model.vo.EventImage;
import com.kh.semi.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class LoginFormController
 */
@WebServlet(value = { //
    "/eventaddform.if"//
    , "/eventadd.if"//
    , "/eventdel.if"//
    , "/eventdn.if"//
})
public class EventController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String servletPath = request.getServletPath();
    switch (servletPath) {
    case "/eventaddform.if":
      addform(request, response);
      break;
    case "/eventadd.if":
      try {
        add(request, response);
      } catch (Exception e) {
        e.printStackTrace();
      }
      break;
    case "/eventdel.if":
      del(request, response);
      break;
    case "/eventdn.if":
      download(request, response);
      break;
    }
  }

  private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
    HttpSession session = request.getSession();
    Member sessionMember = (Member) session.getAttribute("loginUser");
    if (sessionMember == null) {
      response.sendRedirect(request.getContextPath());
      return;
    }
    EventService eventService = new EventService();

    Event event = new Event();
    String strId = null;
    // 파일 용량 제한
    int maxSize = 10 * 1024 * 1024;

    // 저장시킬 폴더 경로
    String savePath = "/upload/event";
    File file = new File(savePath);
    if (file.exists() == false) {
      file.mkdirs();
    }

    // 전달 파일 업로드
    MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8");

    strId = multiRequest.getParameter("id");
    event.setEvTitle(multiRequest.getParameter("evTitle"));
    event.setEvDetail(multiRequest.getParameter("evDetail"));
    event.setEvFin(new SimpleDateFormat("yyyy-MM-dd").parse(multiRequest.getParameter("evFin")));

    if (strId == null || strId.isEmpty()) {
      if (eventService.insert(event) == 1) {
        saveImage(multiRequest, event.getEvNo(), savePath);
        response.getWriter().print("ok");
      }
    } else {
      int eventNo = Integer.valueOf(strId);
      event.setEvNo(eventNo);
      if (eventService.update(event) == 1) {
        saveImage(multiRequest, event.getEvNo(), savePath);
        response.getWriter().print("ok");
      }
    }
  }

  private void saveImage(MultipartRequest multiRequest, int evNo, String savePath) {
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
          EventImage eventImage = new EventImage();
          eventImage.setOriginName(originalFilename);
          eventImage.setImgRoot("/upload/event/" + newFileName);
          eventImage.setChangeName(newFileName);
          eventImage.setImgLevel(1);
          eventImage.setEvNo(evNo);
          EventImageService eventImageService = new EventImageService();
          eventImageService.delete(evNo);
          eventImageService.insert(eventImage);
        } else {
          System.out.println("파일명 변경 실패.");
        }
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
    int eventNo = Integer.valueOf(request.getParameter("id"));
    if (new EventService().delete(eventNo) == 1) {
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
      int eventNo = Integer.valueOf(strId);
      EventService eventService = new EventService();
      Event event = eventService.selectEventDetail(eventNo);
      request.setAttribute("event", event);

      EventImage eventImage = new EventImageService().selectOne(event.getEvNo());
      request.setAttribute("eventImage", eventImage);
    }

    request.getRequestDispatcher("views/event/eventAdd.jsp").forward(request, response);
  }

  private void download(HttpServletRequest request, HttpServletResponse response)
      throws FileNotFoundException, IOException {

    // 서버에 저장된 이미지 파일 경로
    String id = request.getParameter("id");
    int evNo = Integer.valueOf(id);
    EventImage attachment = new EventImageService().selectOne(evNo);
    String filePath = attachment.getImgRoot();
    File downloadFile = new File(filePath);

    // MIME 타입 설정
    // response.setContentType("image/jpeg");

    // 파일 다운로드를 위한 헤더 설정
    response.setHeader("Content-Disposition",
        "attachment; filename=\"" + URLEncoder.encode(attachment.getOriginName(), "UTF-8") + "\"");

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
