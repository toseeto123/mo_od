package kr.co.mood.cate.vo;

public class CateVO {

	private int cate_id;
	private int pro_number;
	private int user_no;
	
	// product
	private String pro_name;
	private String pro_price;
	private String pro_img1;
	private String pro_maindesctitle;
	
	//cate
	private int total;
	private int amount;
	private int cate_pro_price;
	
	private String pro_option;
	
	
	
	
	
	public String getPro_option() {
		return pro_option;
	}
	public void setPro_option(String pro_option) {
		this.pro_option = pro_option;
	}
	public int getCate_pro_price() {
		return cate_pro_price;
	}
	public void setCate_pro_price(int cate_pro_price) {
		this.cate_pro_price = cate_pro_price;
	}
	public int getCate_id() {
		return cate_id;
	}
	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}
	public int getPro_number() {
		return pro_number;
	}
	public void setPro_number(int pro_number) {
		this.pro_number = pro_number;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_price() {
		return pro_price;
	}
	public void setPro_price(String pro_price) {
		this.pro_price = pro_price;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

	
	
}
