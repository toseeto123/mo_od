package kr.co.mood.user.dao;

import java.util.Date;

public class UserVO {
	public UserVO() {
		// TODO Auto-generated constructor stub
	}
	
   private int no;
   private Integer partner_user_id;
   private String id;
   private String pwd;
   private String name;
   private String age;
   private String gender;
   private String adr;
   private String adr2;
   private String adr3;
   private String email;
   private String phone;
   
   
public UserVO(int no) {
       this.no = no;
       this.partner_user_id = no;
   }
   
   
public int getPartner_user_id() {
	return partner_user_id;
}
public void setPartner_user_id(int partner_user_id) {
	this.partner_user_id = partner_user_id;
    this.no = partner_user_id;
}
public int getNo() {
   return no;
}
public void setNo(int no) {
	this.no = no;
    this.partner_user_id = no;
}
public String getId() {
   return id;
}
public void setId(String id) {
   this.id = id;
}
public String getPwd() {
   return pwd;
}
public void setPwd(String pwd) {
   this.pwd = pwd;
}
public String getName() {
   return name;
}
public void setName(String name) {
   this.name = name;
}
public String getAge() {
   return age;
}
public void setAge(String age) {
   this.age = age;
}
public String getGender() {
   return gender;
}
public void setGender(String gender) {
   this.gender = gender;
}
public String getAdr() {
   return adr;
}
public void setAdr(String adr) {
   this.adr = adr;
}
public String getAdr2() {
   return adr2;
}
public void setAdr2(String adr2) {
   this.adr2 = adr2;
}
public String getAdr3() {
   return adr3;
}
public void setAdr3(String adr3) {
   this.adr3 = adr3;
}
public String getEmail() {
   return email;
}
public void setEmail(String email) {
   this.email = email;
}
public String getPhone() {
   return phone;
}
public void setPhone(String phone) {
   this.phone = phone;
}
@Override
public String toString() {
   return "UserVO [no=" + no + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", age=" + age + ", gender=" + gender
         + ", adr=" + adr + ", adr2=" + adr2 + ", adr3=" + adr3 + ", email=" + email + ", phone=" + phone + "]";
}

   




  

}