package kr.co.mood.Payment.VO;


public class userOrderVO {

	//상품데이터를 전달받을 모델
	
	/* 뷰로부터 전달받을 값 */
    private int pro_number;
    /* 주문수량 */
    private int orderCount;
	/* DB로부터 꺼내올 값 */
    private String pro_name;
    /* 상품가격 */
    private int pro_price;
    /*만들어낼 데이터 총가격 */
    private int totalPrice;
    
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
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	//총가격을 만들어내는데 필요한 initSaleTotal()
	public void initSaleTotal() {
		this.totalPrice = this.pro_price * this.orderCount;
	}

}
