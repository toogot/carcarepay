<%@page import="com.kh.semi.event.model.vo.Event"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  List<Event> eventList = (List<Event>)request.getAttribute("eventList");
%>
<% if(eventList != null && eventList.size() > 0) { %>
<style>
.carousel-control-prev-icon,
.carousel-control-next-icon {
  filter: invert(100%); /* 전체 색상을 반전시킴 */
}
</style>
<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <% for(int i=0; i<eventList.size(); i++) { %>
    <div class="carousel-item <%= i==0?"active":"" %>" style="border:1px solid rgba(0,123,255,.25); border-radius: 10px;">
      <img
      src="eventdn.if?id=<%= eventList.get(i).getEvNo() %>"
      class="d-block w-100"
      style="height:300px; object-fit:contains;"
      alt="<%= eventList.get(i).getEvTitle() %>">
    </div>
    <% } %>

	  <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </button>
  </div>
</div>
<% } %>