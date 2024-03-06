package com.kh.semi.event.model.vo;

import java.sql.Date;

public class Event {
	private int evNo;
	private String evTitle;
	private String evDetail;
	private Date evDate;
	private Date evFin;
	
	public Event() {
		// TODO Auto-generated constructor stub
	}

	public Event(int evNo, String evTitle, String evDetail, Date evDate, Date evFin) {
		super();
		this.evNo = evNo;
		this.evTitle = evTitle;
		this.evDetail = evDetail;
		this.evDate = evDate;
		this.evFin = evFin;
	}

	public int getEvNo() {
		return evNo;
	}

	public void setEvNo(int evNo) {
		this.evNo = evNo;
	}

	public String getEvTitle() {
		return evTitle;
	}

	public void setEvTitle(String evTitle) {
		this.evTitle = evTitle;
	}

	public String getEvDetail() {
		return evDetail;
	}

	public void setEvDetail(String evDetail) {
		this.evDetail = evDetail;
	}

	public Date getEvDate() {
		return evDate;
	}

	public void setEvDate(Date evDate) {
		this.evDate = evDate;
	}

	public Date getEvFin() {
		return evFin;
	}

	public void setEvFin(Date evFin) {
		this.evFin = evFin;
	}

	@Override
	public String toString() {
		return "Event [evNo=" + evNo + ", evTitle=" + evTitle + ", evDetail=" + evDetail + ", evDate=" + evDate
				+ ", evFin=" + evFin + "]";
	}
	
	
}
