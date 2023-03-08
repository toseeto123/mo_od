package kr.co.mood.cate.vo;

public class CateVO {

	private int cate_no;
	private int pro_number;
	private int user_no;
	
	// product
	private String pro_name;
	private String pro_price;
	private String pro_desc1;
	private String pro_desc2;
	
	//cate
	private int totalprice;

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

	public String getPro_desc1() {
		return pro_desc1;
	}

	public void setPro_desc1(String pro_desc1) {
		this.pro_desc1 = pro_desc1;
	}

	public String getPro_desc2() {
		return pro_desc2;
	}

	public void setPro_desc2(String pro_desc2) {
		this.pro_desc2 = pro_desc2;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	
}
