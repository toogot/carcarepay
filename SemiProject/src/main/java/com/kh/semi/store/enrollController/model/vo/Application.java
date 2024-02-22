package com.kh.semi.store.enroll.model.vo;

import java.sql.Date;

public class Application {
	private int appNo;
	private int userNo;
	private String storeType;
	private String storeName;
	private String storeAddress;
	private String storePhone;
	private String storeTime;
	private String businessNo;
	private String storePrice;
	private Date appDate;
	private String appYN;
	private String refuse;
	
	public Application() {
		// TODO Auto-generated constructor stub
	}
	public Application(int appNo, int userNo, String storeType, String storeName, String storeAddress,
			String storePhone, String storeTime, String businessNo, String storePrice, Date appDate, String appYN,
			String refuse) {
		super();
		this.appNo = appNo;
		this.userNo = userNo;
		this.storeType = storeType;
		this.storeName = storeName;
		this.storeAddress = storeAddress;
		this.storePhone = storePhone;
		this.storeTime = storeTime;
		this.businessNo = businessNo;
		this.storePrice = storePrice;
		this.appDate = appDate;
		this.appYN = appYN;
		this.refuse = refuse;
	}
	public int getAppNo() {
		return appNo;
	}
	public void setAppNo(int appNo) {
		this.appNo = appNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getStoreType() {
		return storeType;
	}
	public void setStoreType(String storeType) {
		this.storeType = storeType;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	public String getStorePhone() {
		return storePhone;
	}
	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}
	public String getStoreTime() {
		return storeTime;
	}
	public void setStoreTime(String storeTime) {
		this.storeTime = storeTime;
	}
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}
	public String getStorePrice() {
		return storePrice;
	}
	public void setStorePrice(String storePrice) {
		this.storePrice = storePrice;
	}
	public Date getAppDate() {
		return appDate;
	}
	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}
	public String getAppYN() {
		return appYN;
	}
	public void setAppYN(String appYN) {
		this.appYN = appYN;
	}
	public String getRefuse() {
		return refuse;
	}
	public void setRefuse(String refuse) {
		this.refuse = refuse;
	}
	@Override
	public String toString() {
		return "Application [appNo=" + appNo + ", userNo=" + userNo + ", storeType=" + storeType + ", storeName="
				+ storeName + ", storeAddress=" + storeAddress + ", storePhone=" + storePhone + ", storeTime="
				+ storeTime + ", businessNo=" + businessNo + ", storePrice=" + storePrice + ", appDate=" + appDate
				+ ", appYN=" + appYN + ", refuse=" + refuse + "]";
	}
	
	
}