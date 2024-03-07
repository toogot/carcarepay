package com.kh.semi.customerService.notice.model.vo;

import javax.xml.crypto.Data;

public class Notice {
	
	private int notiCode;
	private String notiTitle;
	private String notiContent;
	private Data notDate;
	private int notiCount;
	private int userNo;

	public Notice() {}

	public int getNotiCode() {
		return notiCode;
	}

	public void setNotiCode(int notiCode) {
		this.notiCode = notiCode;
	}

	public String getNotiTitle() {
		return notiTitle;
	}

	public void setNotiTitle(String notiTitle) {
		this.notiTitle = notiTitle;
	}

	public String getNotiContent() {
		return notiContent;
	}

	public void setNotiContent(String notiContent) {
		this.notiContent = notiContent;
	}

	public Data getNotDate() {
		return notDate;
	}

	public void setNotDate(Data notDate) {
		this.notDate = notDate;
	}

	public int getNotiCount() {
		return notiCount;
	}

	public void setNotiCount(int notiCount) {
		this.notiCount = notiCount;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Notice(int notiCode, String notiTitle, String notiContent, Data notDate, int notiCount, int userNo) {
		super();
		this.notiCode = notiCode;
		this.notiTitle = notiTitle;
		this.notiContent = notiContent;
		this.notDate = notDate;
		this.notiCount = notiCount;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Notice [notiCode=" + notiCode + ", notiTitle=" + notiTitle + ", notiContent=" + notiContent
				+ ", notDate=" + notDate + ", notiCount=" + notiCount + ", userNo=" + userNo + "]";
	}
}
