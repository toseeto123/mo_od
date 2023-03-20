package kr.co.mood.Payment.VO;

import java.sql.Date;

public class KakaoPayApprovalVO {
	
	
	public KakaoPayApprovalVO() {
	}
	 //response
    private String aid, tid, cid, sid;
    private String partner_order_id, partner_user_id, payment_method_type;
    private AmountVO amount;
    private CardVO card_info;
    private String item_name, item_code, payload;
    private Integer quantity, tax_free_amount, vat_amount;
    private Date created_at, approved_at;
    
    //결제확인용값들
    //product
    private String pro_img1,pro_name,pro_maindesctitle;
    private int pro_number,pro_price;
    //user
    private int userno;
    //order
    private int orderId;
    
    
    
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_maindesctitle() {
		return pro_maindesctitle;
	}
	public void setPro_maindesctitle(String pro_maindesctitle) {
		this.pro_maindesctitle = pro_maindesctitle;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_number() {
		return pro_number;
	}
	public void setPro_number(int pro_number) {
		this.pro_number = pro_number;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getPro_img1() {
		return pro_img1;
	}
	public void setPro_img1(String pro_img1) {
		this.pro_img1 = pro_img1;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getPartner_order_id() {
		return partner_order_id;
	}
	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	public String getPartner_user_id() {
		return partner_user_id;
	}
	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	
	public String getPayment_method_type() {
		return payment_method_type;
	}
	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}
	public AmountVO getAmount() {
		return amount;
	}
	public void setAmount(AmountVO amount) {
		this.amount = amount;
	}
	public CardVO getCard_info() {
		return card_info;
	}
	public void setCard_info(CardVO card_info) {
		this.card_info = card_info;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getPayload() {
		return payload;
	}
	public void setPayload(String payload) {
		this.payload = payload;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getTax_free_amount() {
		return tax_free_amount;
	}
	public void setTax_free_amount(Integer tax_free_amount) {
		this.tax_free_amount = tax_free_amount;
	}
	public Integer getVat_amount() {
		return vat_amount;
	}
	public void setVat_amount(Integer vat_amount) {
		this.vat_amount = vat_amount;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getApproved_at() {
		return approved_at;
	}
	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}
	
    
    
}

