package com.kh.semi.event.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.event.model.service.EventService;
import com.kh.semi.event.model.vo.Event;

/**
 * Servlet implementation class LoginFormController
 */
@WebServlet("/eventdetail")
public class EventDetailPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventDetailPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int evNo = Integer.parseInt(request.getParameter("evNo"));
		int page = Integer.parseInt(request.getParameter("page"));
		String orderType = request.getParameter("orderType");
		String tab = request.getParameter("tab");

		EventService eventService = new EventService();

		Map<String, Object> map = eventService.selectPrevNext(evNo, page, orderType, tab);

    Event prev = (Event) map.get("prev");
    Event next = (Event) map.get("next");
    int prevPage = (int) map.get("prevPage");
    int nextPage = (int) map.get("nextPage");
    Event event = eventService.selectEventDetail(evNo);
    eventService.updateCount(evNo);

		request.setAttribute("event", event);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);
		request.setAttribute("prevPage", prevPage);
		request.setAttribute("nextPage", nextPage);
		request.getRequestDispatcher("views/event/eventDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
