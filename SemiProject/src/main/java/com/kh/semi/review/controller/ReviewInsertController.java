package com.kh.semi.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolcy;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.review.model.service.ReviewService;
import com.kh.semi.review.model.vo.Review;
import com.kh.semi.review.model.vo.ReviewImage;
import com.oreilly.servlet.MultipartFilter;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insert.rv")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8"); // 인코딩
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 전송용량제한
			int maxSize = 10 * 1024 * 1024; 
			// 첨부파일 저장 경로
			String savePath = request.getSession().getServletContext().getRealPath("resources/review_upfiles/");
			// 전달된 파일 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolcy());
			
			// review 테이블 insert할 값 뽑기
			HttpSession session = request.getSession();
			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
			
			String content = multiRequest.getParameter("content");
			
			int storeNo = Integer.parseInt(multiRequest.getParameter("storeNo"));
			double grade = Double.parseDouble(multiRequest.getParameter("grade"));
			
			Review r = new Review();
			r.setUserNo(userNo);
			r.setContent(content);
			r.setStoreNo(storeNo);
			r.setGrade(grade);
			
			// reviewImage에 여러번 insert 할 데이터 뽑기
			ArrayList<ReviewImage> list = new ArrayList<ReviewImage>();
			
			for(int i = 1; i <= 3; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					ReviewImage ri = new ReviewImage();
					ri.setOriginName(multiRequest.getOriginalFileName(key));
					ri.setChangeName(multiRequest.getFilesystemName(key));
					ri.setImgRoot("resources/review_upfiles/");
					
					if(i == 1) {
						ri.setImgLevel(1);
					} else {
						ri.setImgLevel(2);
					}
					list.add(ri);
				}
			}
			
			int result = new ReviewService().insertReview(r, list);
			if(result > 0) {
				response.getWriter().print(result);
			}else {
				System.out.println("리뷰등록 실패 ㅜㅜ");
			}
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
