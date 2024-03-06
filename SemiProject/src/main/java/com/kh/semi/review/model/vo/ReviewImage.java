package com.kh.semi.review.model.vo;

public class ReviewImage {

	private int imgNo;
	private int reviewNo;
	private String imgRoot;
	private String originName;
	private String changeName;
	private int imgLevel;
	
	public ReviewImage() {}

	public ReviewImage(int imgNo, int reviewNo, String imgRoot, String originName, String changeName, int imgLevel) {
		super();
		this.imgNo = imgNo;
		this.reviewNo = reviewNo;
		this.imgRoot = imgRoot;
		this.originName = originName;
		this.changeName = changeName;
		this.imgLevel = imgLevel;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getImgRoot() {
		return imgRoot;
	}

	public void setImgRoot(String imgRoot) {
		this.imgRoot = imgRoot;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public int getImgLevel() {
		return imgLevel;
	}

	public void setImgLevel(int imgLevel) {
		this.imgLevel = imgLevel;
	}

	@Override
	public String toString() {
		return "ReviewImage [imgNo=" + imgNo + ", reviewNo=" + reviewNo + ", imgRoot=" + imgRoot + ", originName="
				+ originName + ", changeName=" + changeName + ", imgLevel=" + imgLevel + "]";
	}
	
}
