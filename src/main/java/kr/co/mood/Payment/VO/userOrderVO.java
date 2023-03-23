package kr.co.mood.Payment.VO;

import java.sql.Date;

public class userOrderVO {

	//�긽�뭹�뜲�씠�꽣瑜� �쟾�떖諛쏆쓣 紐⑤뜽
	
	/* 酉곕줈遺��꽣 �쟾�떖諛쏆쓣 媛� */
    private String pro_number;
    /* 二쇰Ц�닔�웾 */
    private int orderCount;
	/* DB濡쒕��꽣 爰쇰궡�삱 媛� :  product */
    private String pro_name;
	private int price;
	private String pro_img1;
	private String pro_maindesctitle;
	private String address;
    //user 爰�
    private int userNo;
    private String status;
    
    private int orderId;
    private Date createdDate;
    private Date updatedDate;
    
    /*留뚮뱾�뼱�궪 �뜲�씠�꽣 珥앷�寃� */
    private int totalPrice;
   
    
    public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
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
	
	public String getPro_number() {
		return pro_number;
	}
	public void setPro_number(String pro_number) {
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
				+ ", address=" + address + ", userNo=" + userNo + ", status=" + status + ", orderId=" + orderId
				+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", totalPrice=" + totalPrice
				+ ", getAddress()=" + getAddress() + ", getOrderId()=" + getOrderId() + ", getStatus()=" + getStatus()
				+ ", getPrice()=" + getPrice() + ", getTotalPrice()=" + getTotalPrice() + ", getPro_img1()="
				+ getPro_img1() + ", getPro_maindesctitle()=" + getPro_maindesctitle() + ", getUserNo()=" + getUserNo()
				+ ", getCreatedDate()=" + getCreatedDate() + ", getUpdatedDate()=" + getUpdatedDate()
				+ ", getPro_number()=" + getPro_number() + ", getOrderCount()=" + getOrderCount() + ", getPro_name()="
				+ getPro_name() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	//珥앷�寃⑹쓣 留뚮뱾�뼱�궡�뒗�뜲 �븘�슂�븳 initSaleTotal()
	public void initSaleTotal() {
		this.totalPrice = this.price * this.orderCount;
	}

}
