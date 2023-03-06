package kr.co.mood.Product.VO;

import java.sql.Date;

public class paymentVO {
	
	private String userId,payment_rec,user_Adr,phone;
	private int payment_id,pro_paycount;
	private Date orderDate;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPayment_rec() {
		return payment_rec;
	}
	public void setPayment_rec(String payment_rec) {
		this.payment_rec = payment_rec;
	}
	public String getUser_Adr() {
		return user_Adr;
	}
	public void setUser_Adr(String user_Adr) {
		this.user_Adr = user_Adr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public int getPro_paycount() {
		return pro_paycount;
	}
	public void setPro_paycount(int pro_paycount) {
		this.pro_paycount = pro_paycount;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	@Override
	public String toString() {
		return "paymentVO [userId=" + userId + ", payment_rec=" + payment_rec + ", user_Adr=" + user_Adr + ", phone="
				+ phone + ", payment_id=" + payment_id + ", pro_paycount=" + pro_paycount + ", orderDate=" + orderDate
				+ "]";
	}
	
	
	
}
