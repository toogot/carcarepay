package com.kh.semi.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.review.model.service.ReviewService;
import com.kh.semi.review.model.vo.Review;

/**
 * Servlet implementation class ReviewCountGradeController
 */
@WebServlet("/countgrade.rv")
public class ReviewCountGradeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewCountGradeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("되냐?1");
		int storeNo = Integer.parseInt(request.getParameter("storeNo"));
		Review rv = new ReviewService().selectCountGrade(storeNo);
		System.out.println("되냐?2");
		
		if(rv != null) {
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(rv, response.getWriter());
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
