package kr.co.mood.Payment.VO;

import java.sql.Date;

public class userOrderVO {

	//상품데이터를 전달받을 모델
	
	/* 뷰로부터 전달받을 값 */
    private int pro_number;
    /* 주문수량 */
    private int orderCount;
	/* DB로부터 꺼내올 값 :  product */
    private String pro_name;
	private int price;
	private String pro_img1;
	private String pro_maindesctitle;
    //user 꺼
    private String address;
    private int userNo;
    private String status;
    
    private Date createdDate;
    private Date updatedDate;
    
    /*만들어낼 데이터 총가격 */
    private int totalPrice;
   
    
    
    public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getPro_img1() {
		return pro_img1;
	}
	public void setPro_img1(String pro_img1) {
		this.pro_img1 = pro_img1;
	}
	public String getPro_maindesctitle() {
		return pro_maindesctitle;
	}
	public void setPro_maindesctitle(String pro_maindesctitle) {
		this.pro_maindesctitle = pro_maindesctitle;
	}
	public String getAdress() {
		return address;
	}
	public void setAdress(String adress) {
		this.address = adress;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	
	public int getPro_number() {
		return pro_number;
	}
	public void setPro_number(int pro_number) {
		this.pro_number = pro_number;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	
	
	
	
	@Override
	public String toString() {
		return "userOrderVO [pro_number=" + pro_number + ", orderCount=" + orderCount + ", pro_name=" + pro_name
				+ ", price=" + price + ", pro_img1=" + pro_img1 + ", pro_maindesctitle=" + pro_maindesctitle
				+ ", address=" + address + ", userNo=" + userNo + ", status=" + status + ", createdDate=" + createdDate
				+ ", updatedDate=" + updatedDate + ", totalPrice=" + totalPrice + "]";
	}
	//총가격을 만들어내는데 필요한 initSaleTotal()
	public void initSaleTotal() {
		this.totalPrice = this.price * this.orderCount;
	}

}
