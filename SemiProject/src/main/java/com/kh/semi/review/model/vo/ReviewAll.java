package com.kh.semi.review.model.vo;

public class ReviewAll {

	  private int reviewNo;
	  private int storeNo;
	  private String userId;
	  private String content;
	  private String issueDate;
	  private double grade;
	  private String imgRoot;
	  
	  public ReviewAll() {}

	public ReviewAll(int reviewNo, int storeNo, String userId, String content, String issueDate, double grade,
			String imgRoot) {
		super();
		this.reviewNo = reviewNo;
		this.storeNo = storeNo;
		this.userId = userId;
		this.content = content;
		this.issueDate = issueDate;
		this.grade = grade;
		this.imgRoot = imgRoot;
	}

	
	
	
	public ReviewAll(int reviewNo, String userId, String content, String issueDate, double grade, String imgRoot) {
		super();
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.content = content;
		this.issueDate = issueDate;
		this.grade = grade;
		this.imgRoot = imgRoot;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public String getImgRoot() {
		return imgRoot;
	}

	public void setImgRoot(String imgRoot) {
		this.imgRoot = imgRoot;
	}

	@Override
	public String toString() {
		return "ReviewAll [reviewNo=" + reviewNo + ", storeNo=" + storeNo + ", userId=" + userId + ", content="
				+ content + ", issueDate=" + issueDate + ", grade=" + grade + ", imgRoot=" + imgRoot + "]";
	}
	 
}

