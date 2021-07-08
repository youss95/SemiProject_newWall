package com.kh.dto;

public class tempMemberDTO {

	
	private int user_seq;
	private String user_id;
	private String user_password;
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
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
	public tempMemberDTO(int user_seq, String user_id, String user_password) {
		super();
		this.user_seq = user_seq;
		this.user_id = user_id;
		this.user_password = user_password;
	}
	public tempMemberDTO() {
		super();
	}
	
	
}
