package com.kh.dto;

public class AdminDTO {
	private String admin_id;
	private String admin_password;
	
	public AdminDTO() {}

	public AdminDTO(String admin_id, String admin_password) {
		this.admin_id = admin_id;
		this.admin_password = admin_password;
	}
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
		
}
