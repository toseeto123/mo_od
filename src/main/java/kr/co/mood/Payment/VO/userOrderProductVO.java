package kr.co.mood.Payment.VO;

import java.util.List;

public class userOrderProductVO {

	//product 참조키
	private int pro_number;
	//moodorder 참조키
	private int orderId;
	private int count;
	private int price;
	public int getPro_number() {
		return pro_number;
	}
	public void setPro_number(int pro_number) {
		this.pro_number = pro_number;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
