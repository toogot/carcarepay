package com.kh.semi.store.enrollController.model.vo;

public class AppStoreImage {
	
	private int imgNo;
	private int appNo;
	private String imgRoot;
	private String originName;
	private String changeName;
	private int imgLevel;
	private String status;
	
	public AppStoreImage() {
		// TODO Auto-generated constructor stub
	}

	public AppStoreImage(int imgNo, int appNo, String imgRoot, String originName, String changeName, int imgLevel, String status) {
		super();
		this.imgNo = imgNo;
		this.appNo = appNo;
		this.imgRoot = imgRoot;
		this.originName = originName;
		this.changeName = changeName;
		this.imgLevel = imgLevel;
		this.status = status;
	}
	
	

	public AppStoreImage(int imgNo, String imgRoot, String originName, String changeName) {
		super();
		this.imgNo = imgNo;
		this.imgRoot = imgRoot;
		this.originName = originName;
		this.changeName = changeName;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "AppStoreImage [imgNo=" + imgNo + ", appNo=" + appNo + ", imgRoot=" + imgRoot + ", originName="
				+ originName + ", changeName=" + changeName + ", imgLevel=" + imgLevel + ", status=" + status + "]";
	}

	public int getAppNo() {
		return appNo;
	}

	public void setAppNo(int appNo) {
		this.appNo = appNo;
	}
	
	
}
