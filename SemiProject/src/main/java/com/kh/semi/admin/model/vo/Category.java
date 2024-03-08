package com.kh.semi.admin.model.vo;

public class Category {
	
	private String storeType;
	private String typeName;
	
	public Category() {} //기본생성자

	public Category(String storeType, String typeName) {
		super();
		this.storeType = storeType;
		this.typeName = typeName;
	}

	public String getStoreType() {
		return storeType;
	}

	public void setStoreType(String storeType) {
		this.storeType = storeType;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return "Category [storeType=" + storeType + ", typeName=" + typeName + "]";
	}
	
	

}
