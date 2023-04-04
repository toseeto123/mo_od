package kr.co.mood.Payment.VO;


public class AdminChartVO {	
	 private int payCount;
	 private int bucketCount;
	 private String serialNumber;
	 private String week;
	 private String month;
	 private int sales;
	 private int productCount;
	 private String categorySerial;
	 private String gender;
	 private String age;
	 
	 
	
	 
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public String getCategorySerial() {
		return categorySerial;
	}
	public void setCategorySerial(String categorySerial) {
		this.categorySerial = categorySerial;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getPayCount() {
		return payCount;
	}
	public void setPayCount(int payCount) {
		this.payCount = payCount;
	}
	public int getBucketCount() {
		return bucketCount;
	}
	public void setBucketCount(int bucketCount) {
		this.bucketCount = bucketCount;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	@Override
	public String toString() {
		return "AdminChartVO [payCount=" + payCount + ", bucketCount=" + bucketCount + ", serialNumber=" + serialNumber
				+ ", week=" + week + ", month=" + month + ", sales=" + sales + ", productCount=" + productCount
				+ ", categorySerial=" + categorySerial + ", gender=" + gender + ", age=" + age + "]";
	}
	

	
	



	 
	 
}
