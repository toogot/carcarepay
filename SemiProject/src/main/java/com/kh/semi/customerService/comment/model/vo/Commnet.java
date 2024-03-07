package com.kh.semi.customerService.commnet.model.vo;

import java.sql.Date;

public class Commnet {
	private int comNo;
	private int csNo;
	private Date comDate;
	private String comComment;
	private int userNo;
	

	public Commnet() {}


	public Commnet(int comNo, int csNo, Date comDate, String comComment, int userNo) {
		super();
		this.comNo = comNo;
		this.csNo = csNo;
		this.comDate = comDate;
		this.comComment = comComment;
		this.userNo = userNo;
	}


	public int getComNo() {
		return comNo;
	}


	public void setComNo(int comNo) {
		this.comNo = comNo;
	}


	public int getCsNo() {
		return csNo;
	}


	public void setCsNo(int csNo) {
		this.csNo = csNo;
	}


	public Date getComDate() {
		return comDate;
	}


	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}


	public String getComComment() {
		return comComment;
	}


	public void setComComment(String comComment) {
		this.comComment = comComment;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	@Override
	public String toString() {
		return "Commnet [comNo=" + comNo + ", csNo=" + csNo + ", comDate=" + comDate + ", comComment=" + comComment
				+ ", userNo=" + userNo + "]";
	}
}
