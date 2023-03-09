package kr.co.mood.cate.vo;

public class CateVO {

	private int cate_no;
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

	
	public String getPro_img1() {
		return pro_img1;
	}

	public void setPro_img1(String pro_img1) {
		this.pro_img1 = pro_img1;
	}

	public int getCate_no() {
		return cate_no;
	}

	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
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
