package kr.co.mood.module;

import org.springframework.stereotype.Repository;

@Repository
public class ModuleVO {
	private int startNo;
	private int endNo;
	private String searchId;
	private String searchName;
	private String phone;
	private int orderNo;
	private String date;
	
	

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSearchId() {
		return searchId;
	}
	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	@Override
	public String toString() {
		return "ModuleVO [startNo=" + startNo + ", endNo=" + endNo + ", searchId=" + searchId + ", searchName="
				+ searchName + ", phone=" + phone + ", orderNo=" + orderNo + ", date=" + date + "]";
	}
	
	
	
}
