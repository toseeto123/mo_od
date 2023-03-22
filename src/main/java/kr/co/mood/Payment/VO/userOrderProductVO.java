package kr.co.mood.Payment.VO;


public class userOrderProductVO {
	public userOrderProductVO() {
		// TODO Auto-generated constructor stub
	}

	
	private int userno;
	
	//moodjoin
	private String id;
	private String name;
	private String phone;
	private String email;
	private String adr;
	
	
	//product
	private String pro_name;
	private String pro_price;
	private String pro_img1;
	private String pro_maindesctitle;
	private String pro_option;
	private int total;
	
	
	//moodorder 李몄“�궎
	private int orderId;
	private int partner_order_id;
	
	//product 李몄“�궎
	private int pro_number;
	private int count;
	private int amount;
	
	private int price;
	
	
	
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public userOrderProductVO(int orderId) {
	       this.orderId = orderId;
	       this.partner_order_id = orderId;
	   }
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
		this.partner_order_id = orderId;

	}
	public int getPartner_order_id() {
		return partner_order_id;
	}
	public void setPartner_order_id(int partner_order_id) {
		this.partner_order_id = partner_order_id;
		this.orderId = partner_order_id;
	}
	
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getPro_option() {
		return pro_option;
	}
	public void setPro_option(String pro_option) {
		this.pro_option = pro_option;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAdr() {
		return adr;
	}
	public void setAdr(String adr) {
		this.adr = adr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getPro_number() {
		return pro_number;
	}
	public void setPro_number(int pro_number) {
		this.pro_number = pro_number;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "userOrderProductVO [userno=" + userno + ", id=" + id + ", name=" + name + ", phone=" + phone
				+ ", email=" + email + ", adr=" + adr + ", pro_name=" + pro_name + ", pro_price=" + pro_price
				+ ", pro_img1=" + pro_img1 + ", pro_maindesctitle=" + pro_maindesctitle + ", pro_option=" + pro_option
				+ ", total=" + total + ", orderId=" + orderId + ", partner_order_id=" + partner_order_id
				+ ", pro_number=" + pro_number + ", count=" + count + ", price=" + price + "]";
	}
	
	
}
