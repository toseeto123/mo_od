package kr.co.mood.Payment.VO;

import java.sql.Date;

import java.sql.Date;

public class AdminPaymentVO {	
	
	private int orderNo;
	private String name;
	private String address;
	private String phone;
	private String productNo;
	private String productName;
	private int price;
	private int amount;
	private Date payDate;
	private int productCount;
	private String status;
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "AdminPaymentVO [orderNo=" + orderNo + ", name=" + name + ", address=" + address + ", phone=" + phone
				+ ", productNo=" + productNo + ", productName=" + productName + ", price=" + price + ", amount="
				+ amount + ", payDate=" + payDate + ", productCount=" + productCount + ", status=" + status + "]";
	}
	
	
	
	
}
