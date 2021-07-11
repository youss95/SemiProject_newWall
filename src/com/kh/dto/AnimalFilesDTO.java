package com.kh.dto;

import java.sql.Date;

public class AnimalFilesDTO {
	private int photo_seq;
	private String ori_name;
	private String sys_name;
	private Date reg_date;
	private String code_seq;
	
	public AnimalFilesDTO(){}
	
	public AnimalFilesDTO(int anfile_seq, String ori_name, String sys_name, Date reg_date, String code_seq) {
		super();
		this.photo_seq = photo_seq;
		this.ori_name = ori_name;
		this.sys_name = sys_name;
		this.reg_date = reg_date;
		this.code_seq = code_seq;
	}
	public int getPhoto_seq() {
		return photo_seq;
	}
	public void setPhoto_seq(int photo_seq) {
		this.photo_seq = photo_seq;
	}
	public String getOri_name() {
		return ori_name;
	}
	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
	}
	public String getSys_name() {
		return sys_name;
	}
	public void setSys_name(String sys_name) {
		this.sys_name = sys_name;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getCode_seq() {
		return code_seq;
	}
	public void setCode_seq(String code_seq) {
		this.code_seq = code_seq;
	}
	
	

}
