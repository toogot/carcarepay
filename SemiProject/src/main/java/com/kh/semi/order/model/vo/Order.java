package com.kh.semi.order.model.vo;

import java.sql.Date;

public class Order {
	
	private int userNo;  	// 회원번호
	private int orderNo; 	// 주문번호
	private int price;	 	// 선택한가격
	private int qty;	 	// 갯수
	private int totalPrice; // 총가격
	private String giftNy;  // 선물여부
	private Date orderDate; // 주문날짜
	
	public Order() {}

	public Order(int userNo, int orderNo, int price, int qty, int totalPrice, String giftNy, Date orderDate) {
		super();
		this.userNo = userNo;
		this.orderNo = orderNo;
		this.price = price;
		this.qty = qty;
		this.totalPrice = totalPrice;
		this.giftNy = giftNy;
		this.orderDate = orderDate;
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

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "Order [userNo=" + userNo + ", orderNo=" + orderNo + ", price=" + price + ", qty=" + qty
				+ ", totalPrice=" + totalPrice + ", giftNy=" + giftNy + ", orderDate=" + orderDate + "]";
	}
	
	

}
