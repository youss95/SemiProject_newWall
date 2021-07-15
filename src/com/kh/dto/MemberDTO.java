package com.kh.dto;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class MemberDTO {
	private String user_id;
	private String user_password;
	private String email;
	private String name;
	private Date birthday;
	private String contact;
	private char status;
	private String postcode;
	private String address1;
	private String address2;
	private boolean isBlack;
	
	public MemberDTO() {}
	public MemberDTO(String user_id, String user_password, String email, String name, Date birthday, String contact,
			char status, String postcode, String address1, String address2) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
		this.email = email;
		this.name = name;
		this.birthday = birthday;
		this.contact = contact;
		this.status = status;
		this.postcode = postcode;
		this.address1 = address1;
		this.address2 = address2;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		return sdf.format(this.birthday);
	}
	public boolean isBlack() {
		return isBlack;
	}
	public void setBlack(boolean isBlack) {
		this.isBlack = isBlack;
	}
}
