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
	private int pro_price;
	private String pro_img1;
	private String pro_maindesctitle;
    //user 꺼
    private String adress;
    private int userNo;
    
    private Date createdDate;
    private Date updatedDate;
    
    /*만들어낼 데이터 총가격 */
    private int totalPrice;
   
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
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
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
	
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
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
				+ ", pro_price=" + pro_price + ", pro_img1=" + pro_img1 + ", pro_maindesctitle=" + pro_maindesctitle
				+ ", adress=" + adress + ", userNo=" + userNo + ", createdDate=" + createdDate + ", updatedDate="
				+ updatedDate + ", totalPrice=" + totalPrice + "]";
	}
	//총가격을 만들어내는데 필요한 initSaleTotal()
	public void initSaleTotal() {
		this.totalPrice = this.pro_price * this.orderCount;
	}

}
