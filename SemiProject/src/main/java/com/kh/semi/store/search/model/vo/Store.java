package com.kh.semi.store.search.model.vo;

public class Store {
	
	private int storeNo;
	private String storeName;
	private String storeType;
	private String storeAddress;
	private String storePhone;
	private String storeTime;
	private String businessNo;
	private int storePrice;
	private String storeStatus;
	
	public Store() {
		// TODO Auto-generated constructor stub
	}

	public Store(int storeNo, String storeName, String storeType, String storeAddress, String storePhone,
			String storeTime, String businessNo, int storePrice, String storeStatus) {
		super();
		this.storeNo = storeNo;
		this.storeName = storeName;
		this.storeType = storeType;
		this.storeAddress = storeAddress;
		this.storePhone = storePhone;
		this.storeTime = storeTime;
		this.businessNo = businessNo;
		this.storePrice = storePrice;
		this.storeStatus = storeStatus;
	}
	
	

	public Store(int storeNo, String storeName, String storeAddress, String storePhone) {
		super();
		this.storeNo = storeNo;
		this.storeName = storeName;
		this.storeAddress = storeAddress;
		this.storePhone = storePhone;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreType() {
		return storeType;
	}

	public void setStoreType(String storeType) {
		this.storeType = storeType;
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

	public int getStorePrice() {
		return storePrice;
	}

	public void setStorePrice(int storePrice) {
		this.storePrice = storePrice;
	}

	public String getStoreStatus() {
		return storeStatus;
	}

	public void setStoreStatus(String storeStatus) {
		this.storeStatus = storeStatus;
	}

	@Override
	public String toString() {
		return "Store [storeNo=" + storeNo + ", storeName=" + storeName + ", storeType=" + storeType + ", storeAddress="
				+ storeAddress + ", storePhone=" + storePhone + ", storeTime=" + storeTime + ", businessNo="
				+ businessNo + ", storePrice=" + storePrice + ", storeStatus=" + storeStatus + "]";
	}
	
	
}
