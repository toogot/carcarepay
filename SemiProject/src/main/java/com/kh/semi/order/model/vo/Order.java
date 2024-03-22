package com.kh.semi.order.model.vo;

import java.sql.Date;

public class Order {
	
	private int userNo;  	// 회원번호
	private int orderNo; 	// 주문번호
	private int price;	 	// 선택한가격
	private int qty;	 	// 갯수
	private int totalPrice; // 총가격
	private String giftNy;  // 선물여부
	private String orderDate; // 주문날짜
	
	private String email;   // 주문한사람 이메일
	private String phone; 	//주문한사람 폰번호
	private String userName; //주문한사람이름
	
	private String impUid; //포트원 거래고유번호
	private String merchantUid; //가맹점 주문번호
	private String pgProvider; //"kakaopay" 출력됨
	private int payNo; //결제번호
	
	private int payNoK; //카카오페이 결제번호
	private String payDateK; //카카오페이 결제일
	private String payCompanyK; 
	private String userId;
	private String payPriceK;
	
	private String giftUserName;
	private String giftUserPhone;
	
	

	public Order() {}
	
	public Order(int userNo, int qty, int price, int totalPrice) {
		super();
		this.userNo = userNo;
		this.qty = qty;
		this.price = price;
		this.totalPrice = totalPrice;
	}

	public Order(int userNo, int orderNo, int price, int qty, int totalPrice, String giftNy, String orderDate) {
		super();
		this.userNo = userNo;
		this.orderNo = orderNo;
		this.price = price;
		this.qty = qty;
		this.totalPrice = totalPrice;
		this.giftNy = giftNy;
		this.orderDate = orderDate;
	}
	
	public Order(int userNo,int qty, int price, int totalPrice, String giftNy, int payNoK, String payDateK, String payCompanyK, String userId, String userName, String email, String phone) {
		super();
		this.userNo=userNo;
		this.qty = qty;
		this.price=price;
		this.totalPrice=totalPrice;
		this.giftNy=giftNy;
		this.payNoK=payNoK;
		this.payDateK=payDateK;
		this.payCompanyK=payCompanyK;
		this.userId=userId;
		this.userName=userName;
		this.email=email;
		this.phone=phone;
	}




	public Order(int userNo, int orderNo, int totalPrice,String orderDate,  String giftNy,int qty, int price, String email, String phone, String userName) {
		super();
		this.userNo = userNo;
		this.orderNo = orderNo;
		this.totalPrice = totalPrice;
		this.orderDate = orderDate;
		this.giftNy = giftNy;
		this.qty = qty;
		this.price = price;
		this.email = email;
		this.phone = phone;
		this.userName = userName;
	}
	
	



	public Order(String payDateK, String payPriceK) {
		super();
		this.payDateK = payDateK;
		this.payPriceK = payPriceK;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getGiftNy() {
		return giftNy;
	}

	public void setGiftNy(String giftNy) {
		this.giftNy = giftNy;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public String getPgProvider() {
		return pgProvider;
	}

	public void setPgProvider(String pgProvider) {
		this.pgProvider = pgProvider;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	
	public int getPayNoK() {
		return payNoK;
	}

	public void setPayNoK(int payNoK) {
		this.payNoK = payNoK;
	}

	public String getPayDateK() {
		return payDateK;
	}

	public void setPayDateK(String payDateK) {
		this.payDateK = payDateK;
	}

	public String getPayCompanyK() {
		return payCompanyK;
	}

	public void setPayCompanyK(String payCompanyK) {
		this.payCompanyK = payCompanyK;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	

	public String getGiftUserName() {
		return giftUserName;
	}

	public void setGiftUserName(String giftUserName) {
		this.giftUserName = giftUserName;
	}

	public String getGiftUserPhone() {
		return giftUserPhone;
	}

	public void setGiftUserPhone(String giftUserPhone) {
		this.giftUserPhone = giftUserPhone;
	}
	

	public String getPayPriceK() {
		return payPriceK;
	}

	public void setPayPriceK(String payPriceK) {
		this.payPriceK = payPriceK;
	}

	@Override
	public String toString() {
		return "Order [userNo=" + userNo + ", orderNo=" + orderNo + ", price=" + price + ", qty=" + qty
				+ ", totalPrice=" + totalPrice + ", giftNy=" + giftNy + ", orderDate=" + orderDate + ", email=" + email
				+ ", phone=" + phone + ", userName=" + userName + ", impUid=" + impUid + ", merchantUid=" + merchantUid
				+ ", pgProvider=" + pgProvider + ", payNo=" + payNo + ", payNoK=" + payNoK + ", payDateK=" + payDateK
				+ ", payCompanyK=" + payCompanyK + ", userId=" + userId + ", payPriceK=" + payPriceK + ", giftUserName="
				+ giftUserName + ", giftUserPhone=" + giftUserPhone + "]";
	}
















	
	

}
