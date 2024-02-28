package com.kh.semi.review.model.vo;

public class Review {

	private int reviewNo;
	private int userNo;
	private int storeNo;
	private String content;
	private double grade;
	private String issueDate;
	private String modifyDate;
	private int reportCount;
	private String reviewStatus;
	private String userId;
	
	public Review() {}

	public Review(int reviewNo, int userNo, int storeNo, String content, double grade, String issueDate,
			String modifyDate, int reportCount, String reviewStatus) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.storeNo = storeNo;
		this.content = content;
		this.grade = grade;
		this.issueDate = issueDate;
		this.modifyDate = modifyDate;
		this.reportCount = reportCount;
		this.reviewStatus = reviewStatus;
	}
	
	

	public Review(String userId, String content, double grade, String issueDate) {
		super();
		this.userId = userId;
		this.content = content;
		this.grade = grade;
		this.issueDate = issueDate;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public String getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", userNo=" + userNo + ", storeNo=" + storeNo + ", content=" + content
				+ ", grade=" + grade + ", issueDate=" + issueDate + ", modifyDate=" + modifyDate + ", reportCount="
				+ reportCount + ", reviewStatus=" + reviewStatus + "]";
	}
	
}
