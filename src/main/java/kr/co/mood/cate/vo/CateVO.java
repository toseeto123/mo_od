package kr.co.mood.cate.vo;

public class CateVO {

	private int cate_id;
	private String pro_number;
	private int user_no;
	
	// product
	private String pro_name;
	private String pro_price;
	private String pro_img1;
	private String pro_maindesctitle;
	private String pro_serialnumber;
	
	
	//cate
	private int total;
	private int amount;
	private int cate_pro_price;
	private String pro_option;
	
	//user
	private String name;
	
	
	public String getPro_serialnumber() {
		return pro_serialnumber;
	}
	public void setPro_serialnumber(String pro_serialnumber) {
		this.pro_serialnumber = pro_serialnumber;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
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
	
	public String getPro_number() {
		return pro_number;
	}
	public void setPro_number(String pro_number) {
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
	@Override
	public String toString() {
		return "CateVO [cate_id=" + cate_id + ", pro_number=" + pro_number + ", user_no=" + user_no + ", pro_name="
				+ pro_name + ", pro_price=" + pro_price + ", pro_img1=" + pro_img1 + ", pro_maindesctitle="
				+ pro_maindesctitle + ", total=" + total + ", amount=" + amount + ", cate_pro_price=" + cate_pro_price
				+ ", pro_option=" + pro_option + ", getPro_option()=" + getPro_option() + ", getCate_pro_price()="
				+ getCate_pro_price() + ", getCate_id()=" + getCate_id() + ", getPro_number()=" + getPro_number()
				+ ", getUser_no()=" + getUser_no() + ", getPro_name()=" + getPro_name() + ", getPro_price()="
				+ getPro_price() + ", getPro_img1()=" + getPro_img1() + ", getPro_maindesctitle()="
				+ getPro_maindesctitle() + ", getTotal()=" + getTotal() + ", getAmount()=" + getAmount()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
