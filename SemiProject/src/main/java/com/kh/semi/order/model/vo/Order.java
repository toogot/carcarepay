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
	
	
	public Order() {}

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




	public Order(int userNo, int orderNo, int totalPrice,String orderDate,  String giftNy,int qty, int price, String email, String phone) {
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

	@Override
	public String toString() {
		return "Order [userNo=" + userNo + ", orderNo=" + orderNo + ", price=" + price + ", qty=" + qty
				+ ", totalPrice=" + totalPrice + ", giftNy=" + giftNy + ", orderDate=" + orderDate + ", email=" + email
				+ ", phone=" + phone + "]";
	}




	
	

}
