package kr.co.mood.Payment.VO;


public class AdminPaymentVO {	
	 private String category;
	 private int category_paycount;
	 private String pro_name;
	 private int pro_bucketcount;
	 
	 
	 
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_bucketcount() {
		return pro_bucketcount;
	}
	public void setPro_bucketcount(int pro_bucketcount) {
		this.pro_bucketcount = pro_bucketcount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCategory_paycount() {
		return category_paycount;
	}
	public void setCategory_paycount(int category_paycount) {
		this.category_paycount = category_paycount;
	}
	 
}
