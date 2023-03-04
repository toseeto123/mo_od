package kr.co.mood.user.dao;

import java.util.Date;

public class UserVO {
   private String id;
   private int no;
   private String pwd;
   private String name;
   private int age;
   private String gender;
   private int lev;
   private String adr;
   private String email;
   private String phone;
   private Date day;
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
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
   public int getAge() {
      return age;
   }
   public void setAge(int age) {
      this.age = age;
   }
   public String getGender() {
      return gender;
   }
   public void setGender(String gender) {
      this.gender = gender;
   }
   public int getLev() {
      return lev;
   }
   public void setLev(int lev) {
      this.lev = lev;
   }
   public String getAdr() {
      return adr;
   }
   public void setAdr(String adr) {
      this.adr = adr;
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
   public Date getDay() {
      return day;
   }
   public void setDay(Date day) {
      this.day = day;
   }
   @Override
   public String toString() {
      return "UserVO [id=" + id + ", no=" + no + ", pwd=" + pwd + ", name=" + name + ", age=" + age + ", gender="
            + gender + ", lev=" + lev + ", adr=" + adr + ", email=" + email + ", phone=" + phone + ", day=" + day
            + "]";
   }
   
   
   
}