package com.kh.semi.bookmark.model.vo;

public class Bookmark {

	private int userNo;
	private int storeNo;
	private int bookmarkCount; // 즐겨찾기가 되어있는지 확인할 때 쓴 변수
	
	public Bookmark() {}

	public Bookmark(int userNo, int storeNo) {
		super();
		this.userNo = userNo;
		this.storeNo = storeNo;
	}
	
	public int getBookmarkCount() {
		return bookmarkCount;
	}

	public void setBookmarkCount(int bookmarkCount) {
		this.bookmarkCount = bookmarkCount;
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

	@Override
	public String toString() {
		return "Bookmark [userNo=" + userNo + ", storeNo=" + storeNo + "]";
	}
	
}