package kr.co.mood.Product.VO;

public class ProVO {
	String pro_category1,pro_category2,pro_name,pro_desc1,pro_desc2,pro_option1,pro_option2,pro_option3,
	pro_img1,pro_img2,pro_img3;
	
	int pro_number,pro_paycount,pro_bucketcount,pro_price,pro_Soldout;

	public String getPro_category1() {
		return pro_category1;
	}

	public void setPro_category1(String pro_category1) {
		this.pro_category1 = pro_category1;
	}

	public String getPro_category2() {
		return pro_category2;
	}

	public void setPro_category2(String pro_category2) {
		this.pro_category2 = pro_category2;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
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

	public String getPro_option1() {
		return pro_option1;
	}

	public void setPro_option1(String pro_option1) {
		this.pro_option1 = pro_option1;
	}

	public String getPro_option2() {
		return pro_option2;
	}

	public void setPro_option2(String pro_option2) {
		this.pro_option2 = pro_option2;
	}

	public String getPro_option3() {
		return pro_option3;
	}

	public void setPro_option3(String pro_option3) {
		this.pro_option3 = pro_option3;
	}

	public String getPro_img1() {
		return pro_img1;
	}

	public void setPro_img1(String pro_img1) {
		this.pro_img1 = pro_img1;
	}

	public String getPro_img2() {
		return pro_img2;
	}

	public void setPro_img2(String pro_img2) {
		this.pro_img2 = pro_img2;
	}

	public String getPro_img3() {
		return pro_img3;
	}

	public void setPro_img3(String pro_img3) {
		this.pro_img3 = pro_img3;
	}

	public int getPro_number() {
		return pro_number;
	}

	public void setPro_number(int pro_number) {
		this.pro_number = pro_number;
	}

	public int getPro_paycount() {
		return pro_paycount;
	}

	public void setPro_paycount(int pro_paycount) {
		this.pro_paycount = pro_paycount;
	}

	public int getPro_bucketcount() {
		return pro_bucketcount;
	}

	public void setPro_bucketcount(int pro_bucketcount) {
		this.pro_bucketcount = pro_bucketcount;
	}

	public int getPro_price() {
		return pro_price;
	}

	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}

	public int getPro_Soldout() {
		return pro_Soldout;
	}

	public void setPro_Soldout(int pro_Soldout) {
		this.pro_Soldout = pro_Soldout;
	}

	@Override
	public String toString() {
		return "ProVO [pro_category1=" + pro_category1 + ", pro_category2=" + pro_category2 + ", pro_name=" + pro_name
				+ ", pro_desc1=" + pro_desc1 + ", pro_desc2=" + pro_desc2 + ", pro_option1=" + pro_option1
				+ ", pro_option2=" + pro_option2 + ", pro_option3=" + pro_option3 + ", pro_img1=" + pro_img1
				+ ", pro_img2=" + pro_img2 + ", pro_img3=" + pro_img3 + ", pro_number=" + pro_number + ", pro_paycount="
				+ pro_paycount + ", pro_bucketcount=" + pro_bucketcount + ", pro_price=" + pro_price + ", pro_Soldout="
				+ pro_Soldout + "]";
	}
	
	
}